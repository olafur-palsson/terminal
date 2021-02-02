#!/bin/awk -f
BEGIN {
  true = 1
  false = 0
  last_is_comment = 0
  last_line = ""
  is_comment = 0
  is_alias = 0
  is_function = 0
}

/alias/ {
  is_alias = 1
}

/[a-zA-Z_]\(\)/ {
  is_function = 1
}

/^#[^#]/ {
  is_comment = 1
}

/^##/ {
  print ""
  print ""
  print ""
  print $0
  print ""
}

# Main
{

  if (last_is_comment == 1) {
    if (is_alias == 1) {
      after_alias = substr($0, 7)
      match(after_alias, /[a-zA-Z_]+/, m)
      print "    "m[0]
    } else if (is_function == 1) {
      print "    "$0" ... }"
    }
  }

  if (is_alias == 1 || is_function == 1) {
    if (last_is_comment == 1) {
      match(last_line, /[a-zA-Z].*/, m)
      print "        "m[0]
      print ""
    }
  }

  last_line = $0
  last_is_comment = is_comment
  is_comment = 0
  is_alias = 0
  is_function = 0
}