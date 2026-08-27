#!/bin/bash
STATE_FILE="/tmp/hyprland-toggle-screen"

if [ ! -f "$STATE_FILE" ]; then
    touch "$STATE_FILE"
    hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'
else
    rm "$STATE_FILE"
        hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'
fi
