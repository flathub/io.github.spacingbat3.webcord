# WebCord
A Discord and Fosscord client implemented directly without Discord API. Made in poland with the Electron framework.

## Use global menu
To make WebCord work with the global menu you have to give the flatpak access to `com.canonical.AppMenu.Registrar`, this can be done with
```
flatpak override --talk-name=com.canonical.AppMenu.Registrar io.github.spacingbat3.webcord
```
or using flatseal

## Fix tray icon
Since WebCord release 3.10.1, electron uses a different way to display the tray icon, which requires this flatpak to have the `--own-name=org.kde.StatusNotifierItem-3-1` permission, this command adds the permission:
```
flatpak override --own-name=org.kde.StatusNotifierItem-3-1 io.github.spacingbat3.webcord
```
## Run under XWayland
If using wayland, WebCord will automatically run under wayland. If this is not desired, WebCord can be forced to use XWayland by revoking the Wayland permissions:
```
flatpak override --user --nosocket=wayland --nosocket=fallback-x11 --socket=x11 io.github.spacingbat3.webcord
```
