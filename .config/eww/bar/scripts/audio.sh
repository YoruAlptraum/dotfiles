#!/usr/bin/env bash

vol_icon=""
vol=0
low=33
high=66
was_muted=false

# The loop keeps the script running
while true; do
  prev_vol=$vol
  get_vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  vol=$(echo "$get_vol" | awk '{print $2 * 100}')
  muted=$(echo "$get_vol" | awk '{print $3}')

  if [[ "$muted" == '[MUTED]' ]]; then
    was_muted=true
    eww update audio-icon=""  
  elif (( vol != prev_vol )) || [[ "$was_muted" == true ]]; then
    was_muted=false
    if (( vol < low)); then
      vol_icon=""
    elif (( vol < high )); then
      vol_icon=""
    else
      vol_icon=""
    fi
    eww update audio-icon="$vol_icon"
  fi
  
  echo $vol
done