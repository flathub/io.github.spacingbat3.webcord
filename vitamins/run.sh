#!/bin/bash
FLAGS='--enable-gpu-rasterization --enable-zero-copy --enable-gpu-compositing --enable-native-gpu-memory-buffers --enable-oop-rasterization --enable-features=UseSkiaRenderer'

if [[ $XDG_SESSION_TYPE == "Wayland" ]] && [ -c /dev/nvidia0 ]
then
    FLAGS="$FLAGS --disable-gpu-sandbox"
fi

env TMPDIR=$XDG_CACHE_HOME zypak-wrapper /app/bin/webcord/usr/bin/webcord $FLAGS "$@"
