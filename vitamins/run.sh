#!/bin/bash
if [[ $XDG_SESSION_TYPE == "Wayland" ]] && [ -c /dev/nvidia0 ]
then
    FLAGS="--disable-gpu-sandbox"
fi

env TMPDIR=$XDG_CACHE_HOME zypak-wrapper /app/bin/webcord/usr/bin/webcord $FLAGS "$@"
