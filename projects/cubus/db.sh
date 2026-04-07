db() {
  local cmd="${1}"
  case "$cmd" in
    log)
      cat "$CUBUS_PROJECTS/logquery.sql" | wl-copy
      ;;
    cpu)
      cat "$CUBUS_PROJECTS/cpu.sql" | wl-copy
      ;;
    index)
      cat "$CUBUS_PROJECTS/index.sql" | wl-copy
      ;;
    req)
      cat "$CUBUS_PROJECTS/req.sql" | wl-copy
      ;;
    table)
      cat "$CUBUS_PROJECTS/table.sql" | wl-copy
      ;;
    *)
      echo "Select which SQL query to copy to clipboard: db <query>"
      echo ""
      echo "  log         Application log entries around a given time window"
      echo "  cpu         Top 25 queries ranked by total CPU time"
      echo "  index       Missing index recommendations with an impact score"
      echo "  req         Currently executing requests ordered by CPU time"
      echo "  table       Tables ordered by used space"
      ;;
  esac
}
