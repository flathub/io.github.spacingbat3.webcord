#!/bin/bash
FLAGS='--enable-gpu-rasterization --enable-zero-copy --enable-gpu-compositing --enable-native-gpu-memory-buffers --enable-oop-rasterization --enable-features=UseSkiaRenderer --enable-wayland-ime'

WAYLAND_SOCKET=${WAYLAND_DISPLAY:-"wayland-0"}

if [[ -e "$XDG_RUNTIME_DIR/${WAYLAND_SOCKET}" ]]
then
    FLAGS="$FLAGS --ozone-platform-hint=auto"

    if [[ $XDG_SESSION_TYPE == "wayland" && $XDG_CURRENT_DESKTOP == *"GNOME"* ]]
    then
            FLAGS="$FLAGS --enable-features=WaylandWindowDecorations"
    fi

    if [[ $XDG_SESSION_TYPE =~ "[Ww]ayland" ]] && [ -c /dev/nvidia0 ]
    then
        FLAGS="$FLAGS --disable-gpu-sandbox"
    fi
fi

# This deletes the windowState file when it contains 0 bytes.
# Works around https://github.com/flathub/io.github.spacingbat3.webcord/issues/37
WINDOWSTATE="$XDG_CONFIG_HOME/WebCord/windowState"
if [[ -f "$WINDOWSTATE" ]]; then
    if [[ $(wc -c "$WINDOWSTATE" | cut -d' ' -f1) == 0 ]]; then
        rm "$WINDOWSTATE"
    fi
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-io.github.spacingbat3.webcord}" zypak-wrapper /app/bin/webcord/usr/bin/webcord $FLAGS "$@"
