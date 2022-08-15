start_rust() {
  cargo watch  -s ". ~/projects/terminal/apps/audio-feedback.bashrc" -s "cargo check && cargo build && pass && cargo run || fail"
}