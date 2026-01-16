#!/usr/bin/env bash

mic_icon=""
vol=0
low=33
high=66
was_muted=false

# The loop keeps the script running
while true; do
  get_vol=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
  vol=$(echo "$get_vol" | awk '{print $2 * 100}')
  muted=$(echo "$get_vol" | awk '{print $3}')

  if [[ "$muted" == '[MUTED]' ]]; then
    was_muted=true
    eww update mic-icon="󰍭"
  elif [[ "$was_muted" == true ]]; then
    was_muted=false
    eww update mic-icon="$mic_icon"
  fi
  
  echo $vol
done