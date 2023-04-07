#!/bin/bash

## Hubstaff
var HUBSTAFF_ID 308837

# Open reports
hubstaffreport() {
  today=$(date '+%Y-%m-%d')
  day=$(date --date="$1" '+%Y-%m-%d')

  base='https://app.hubstaff.com/reports/308837/team/apps_and_urls?date='
  date_end='&date_end='
  end_of_string='%5Binclude_archived%5D=true&filters%5Bitem_type%5D=apps_and_urls'

  firefox "$base$day$date_end$today$end_of_string"
}

# Open weekly overview
hubstaffweek() {
  a_week_ago=$(date --date="7 days ago" '+%Y-%m-%d')
  hubstaffreport "7 days ago"
}

# Open overview for today
hubstafftoday() {
  today=$(date '+%Y-%m-%d')
  a_day_ago=
  hubstaffreport today
}

# Yesterdays report
hubstaffyesterday() {
  yesterday=$(date --date="yesterday" '+%Y-%m-%d')
  hubstaffreport yesterday
}