# WebCord
A Discord and Fosscord client implemented directly without Discord API. Made in poland with the Electron framework.

## Quick run
Installing it using flathub:
```
flatpak install io.github.spacingbat3.webcord
```

## Building it from sources
Install the build deps:
```
flatpak install flathub org.freedesktop.Platform//23.08 org.freedesktop.Sdk//23.08
flatpak install flathub org.electronjs.Electron2.BaseApp
```

Build and install:
```
flatpak-builder --user --install --force-clean build_dir io.github.spacingbat3.webcord.yml
```

## Use global menu
To make WebCord work with the global menu you have to give the flatpak access to `com.canonical.AppMenu.Registrar`, this can be done with
```
flatpak override --talk-name=com.canonical.AppMenu.Registrar io.github.spacingbat3.webcord
```
or using flatseal

## Run under XWayland
If using wayland, WebCord will automatically run under wayland. If this is not desired, WebCord can be forced to use XWayland by revoking the Wayland permissions:
```
flatpak override --user --nosocket=wayland --nosocket=fallback-x11 --socket=x11 io.github.spacingbat3.webcord
```
