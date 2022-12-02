# WebCord
A Discord and Fosscord client implemented directly without Discord API. Made in poland with the Electron framework.

## Use global menu
To make WebCord work with the global menu you have to give the flatpak access to `com.canonical.AppMenu.Registrar`, this can be done with
```
flatpak override --talk-name=com.canonical.AppMenu.Registrar io.github.spacingbat3.webcord
```
or using flatseal
