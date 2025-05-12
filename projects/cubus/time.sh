hours_stats() {
  export NODE_NO_WARNINGS=1 
  uptime -s | xargs node "$CUBUS/harvest/stats.js"
}

hours_to_work_per_week() {
  local days=`weekdays_current_month`
  local result=`echo -e "import math \nprint(str(math.floor(600 / $days)) + ':' + str(round((600 / $days - 5) * 60)))" | python3` 
  echo $result | cut -c-5
}

hours_to_work_per_day() {
  local days=`weekdays_current_month`
  echo -e "import math \nprint(str(math.floor(120 / $days)) + ':' + str(round((120 / $days - 5) * 60) % 60))" | python3
}

hours_remaining() {
  export NODE_NO_WARNINGS=1 
  uptime -s | xargs node "$CUBUS/harvest/hoursWorkedHarvest.js"
}

log_time() {
  uptime -s | xargs node "$CUBUS/harvest/logTimeToHarvest.js" 
  local timestamp=`uptime -s`
  local array=(${timestamp//;/ })
  local time `echo ${array[1]}`
  node "$TERMINAL/scripts/project-logger.js" "====== End of session @ $time ======" "" >> ~/project-log.txt
}

commit() {
  local path=`git rev-parse --show-toplevel`
  local repo=`basename $path`
  local command="git commit $@"
  git commit $@ && node "$TERMINAL/scripts/project-logger.js" "$repo" "$command" >> ~/project-log.txt
}


rework() {
  echo "Logging time..."
  export NODE_NO_WARNINGS=1 
  log_time && sleep 0.5 && systemctl reboot
}

endwork() {
  killall "surfshark"
  local DAYOFWEEK=`date +%u`
  if [ "$DAYOFWEEK" == 5 ]
  then
    echo "Friday!"
    mrkrab
    sleep 25
  else
    echo ""
  fi
  echo "Logging time..."
  export NODE_NO_WARNINGS=1 
  log_time && sleep 0.5 && systemctl poweroff
}

alias day_of_the_week="date +%u -d"
weekdays_current_month() {
  local startdate=`date +%Y-%m-01`
  local enddate=`date -d "$startdate +1 month" +%Y-%m-01`
  local count=0

  while [ "$startdate" != "$enddate" ]; do 
    local dow=`day_of_the_week $startdate`
    if [ "$dow" -lt 6 ]; then
      count=$(($count + 1))
    fi
    startdate=$(date -I -d "$startdate + 1 day")
  done
  echo $count
}
