#!/usr/bin/env bash

if [ $# -lt 3 ]; then
  echo "usage: ./demo_log_maker.sh username service token"
  exit 1
fi

username=$1
service=$2
token=$3

IDC=("tc" "jx" "db")

while true; do
  idx=$[${RANDOM}%${#IDC[@]}]
  idc=${IDC[${idx}]}

  # HD http collector
  curl -H "token: ${token}" -X POST -d "message={\"username\" : \"${username}\", \"service\": \"${service}\", \"idc\": \"${idc}\"}" http://10.202.6.20/publish
  #curl -H "token: ${token}" -X POST -d "message={\"username\" : \"${username}\", \"service\": \"${service}\", \"idc\": \"${idc}\"}" http://yf-aqueducts-chart00.yf01.baidu.com:8090/publish

  sleep 0.75s
done
