#!/bin/bash


# current volume and mute status
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "\[MUTED\]")


if ["$MUTE" == "[MUTED]" ]; then
    notify-send -e -h string:x-canonical-private-synchronous:volume_notif -u low "󰝟 Muted"

else
    # -h ensures notification repalces the old one isntead of stacking
    notify-send -e -h string:x-canonical-private-synchronous:volume_notif -h int:value:"$VOLUME" -u low "󰕾 Volume: ${VOLUME}%"
fi
