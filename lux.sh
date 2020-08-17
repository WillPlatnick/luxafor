#!/bin/bash

# Seconds to sleep in between checks
SLEEP=5

ison=0

while [ true ]; do
  busy=0

  # Check if Zoom is running
  if ps -ef | grep -v grep | grep zoom.us | grep cpthost > /dev/null; then
    busy=1
    if [[ ison -eq 0 ]]; then
      slack status edit --text Meeting --emoji :slack_call:
    fi
  fi

  # Check if Slack is in a call
  slack=$(/usr/bin/python3 lswin.py | grep -i slack | wc -l)
  if [[ $slack -gt 1 ]]; then
    busy=1
  fi

  status=$(/usr/local/bin/do-not-disturb status)
  if [[ "$status" == "on" ]]; then
    busy=1
    if [[ ison -eq 0 ]]; then
      slack snooze start 120
      slack status edit --text Focus Time --emoji :dart:
    fi
  fi

  if [[ $busy -eq 1 ]]; then
    luxcli -rgb=#FF0000
    ison=1
  else
    luxcli -rgb=#00FF00
    if [[ $ison -eq 1 ]]; then
      slack status clear
      slack snooze end
      ison=0
    fi
  fi

 sleep $SLEEP
done
