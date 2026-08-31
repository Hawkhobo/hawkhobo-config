#!/bin/sh
# fnott play-sound helper.
#
# fnott passes the urgency's `sound-file` value as $1 (via ${filename} in the
# play-sound command).  We overload that value: point it at a *directory* and a
# random .wav from it is played.  A plain file is played as-is.  Urgencies with
# no sound-file set never reach this script, so they stay silent.
#
# Nothing is played while audio is playing, so notifications never bark over
# music -- this is also what keeps Strawberry's own track-change notifications
# quiet, since those only fire while it is playing.
target=$1

# Which MPRIS players silence us.  Empty = any player that is playing;
# otherwise a space separated list, e.g. players="strawberry".
players=

if command -v playerctl >/dev/null 2>&1; then
    if [ -z "$players" ]; then
        playerctl -a status 2>/dev/null | grep -qx Playing && exit 0
    else
        for p in $players; do
            [ "$(playerctl -p "$p" status 2>/dev/null)" = Playing ] && exit 0
        done
    fi
fi

if [ -d "$target" ]; then
    file=$(find "$target" -type f -name '*.wav' | shuf -n 1)
elif [ -f "$target" ]; then
    file=$target
else
    exit 0
fi

[ -n "$file" ] || exit 0
exec aplay -q "$file"
