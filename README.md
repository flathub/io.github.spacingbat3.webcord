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

## Recommendations

Running the app in a native Wayland context:
```
flatpak run --branch=stable --arch=x86_64 io.github.spacingbat3.webcord --ignore-gpu-blocklist --enable-features=UseOzonePlatform,VaapiVideoDecoder,WebRTCPipeWireCapturer,smooth-scrolling,gpu-rasterization,zero-copy --ozone-platform=wayland
```

> This will make use of the Ozone Platform setting, which comes with a Wayland mode by default.
> Also added in `WebRTCPipeWireCapturer` to screenshare stuff using Pipewire Web RTC. Just make sure you have the xdg-portals installed properly.
