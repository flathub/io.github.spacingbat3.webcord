#!/bin/bash
FLAGS='--enable-gpu-rasterization --enable-zero-copy --enable-gpu-compositing --enable-native-gpu-memory-buffers --enable-oop-rasterization --enable-features=UseSkiaRenderer'

if [[ $XDG_SESSION_TYPE =~ "[Ww]ayland" ]] && [ -c /dev/nvidia0 ]
then
    FLAGS="$FLAGS --disable-gpu-sandbox"
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-io.github.spacingbat3.webcord}" zypak-wrapper /app/bin/webcord/usr/bin/webcord $FLAGS "$@"
