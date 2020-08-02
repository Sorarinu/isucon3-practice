#!/bin/bash

# count
redis-cli set count 20540

# recent
redis-cli del recent
sql="select id from memos where is_private = 0 order by created_at desc;"

result=$(mysql -u isucon -p'isucon' isucon -B -N -e "${sql}")
if [[ $? -eq 0 ]]; then
  echo "${result}" | while read data
  do
    column=(`echo "$data"`)
    redis-cli RPUSH recent ${column[0]} > /dev/null
  done
else
  echo "db error."
  exit 1
fi

exit 0