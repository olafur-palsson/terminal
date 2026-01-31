
alias whisper-cli="/home/oli/projects/whisper.cpp/build/bin/whisper-cli"
alias whisper-server="/home/oli/projects/whisper.cpp/build/bin/whisper-server"

WHISPER_PORT=8080
WHISPER_MODEL="/home/oli/projects/whisper.cpp/models/ggml-base.en-q5_0.bin"

ensure_whisper_server() {
  if ! curl -s "http://localhost:$WHISPER_PORT/health" >/dev/null 2>&1; then
    echo "Starting whisper server..."
    /home/oli/projects/whisper.cpp/build/bin/whisper-server -m "$WHISPER_MODEL" --port "$WHISPER_PORT" -t $(nproc) >/dev/null 2>&1 &
    # Wait for server to be ready
    while ! curl -s "http://localhost:$WHISPER_PORT/health" >/dev/null 2>&1; do
      sleep 0.5
    done
    echo "Whisper server ready"
  fi
}

dictate() {
  ensure_whisper_server
  konsole -e bash -c '
    source ~/.bashrc

    tmp_audio="/home/oli/dictate_recording.wav"
    converted_audio="/home/oli/dictate_converted.wav"

    echo "Recording... Press Enter to stop"

    # Start recording in background
    arecord -f S16_LE -r 16000 -c 1 "$tmp_audio" 2>/dev/null &
    rec_pid=$!

    # Wait for Enter
    read

    # Stop recording
    kill $rec_pid 2>/dev/null
    wait $rec_pid 2>/dev/null

    echo "Transcribing..."

    # Convert audio to 16kHz mono for whisper compatibility
    ffmpeg -y -i "$tmp_audio" -ar 16000 -ac 1 -c:a pcm_s16le "$converted_audio" 2>/dev/null

    # Send to whisper server and copy to clipboard
    curl -s -X POST "http://localhost:8080/inference" \
      -F "file=@$converted_audio" \
      -F "response_format=text" \
      | wl-copy

    # Cleanup
    rm -f "$tmp_audio" "$converted_audio"
    sleep 5
  '
}
