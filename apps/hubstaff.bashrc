
hubstaffreport() {
  today=$(date '+%Y-%m-%d')
  day=$(date --date="$1" '+%Y-%m-%d')

  base='https://app.hubstaff.com/reports/308837/team/apps_and_urls?date='
  date_end='&date_end='
  end_of_string='%5Binclude_archived%5D=true&filters%5Bitem_type%5D=apps_and_urls'

  firefox "$base$day$date_end$today$end_of_string"
}

hubstaffweek() {
  a_week_ago=$(date --date="7 days ago" '+%Y-%m-%d')
  hubstaffreport "7 days ago"
}

hubstafftoday() {
  today=$(date '+%Y-%m-%d')
  a_day_ago=
  hubstaffreport today
}


hubstaffyesterday() {
  yesterday=$(date --date="yesterday" '+%Y-%m-%d')
  hubstaffreport yesterday
}

hubstaffyesterday() {
  a_day_ago=$(date --date="1 day ago" '+%Y-%m-%d')
  hubstaffreport $a_week_ago
}