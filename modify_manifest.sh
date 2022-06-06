#!/usr/bin/bash
wget https://github.com/SpacingBat3/WebCord/releases/latest
wget https://github.com$(cat latest | grep tar.gz | grep href | awk 'BEGIN { FS = "\"" }; { print $2 }')
NEW_URL=$(cat latest | grep tar.gz | grep href | awk 'BEGIN { FS = "\"" }; { print $2 }')
NEW_SHASUM=$(sha256sum v3.2.0.tar.gz | awk 'BEGIN { FS = " " }; { print $1 }') 
sed -i "s\.*url: https://github.com/vega-d.*\        url: https://github.com${NEW_URL}\g" io.github.spacingbat3.webcord.yml
sed -i "s\.*sha256:.*\        sha256: ${NEW_SHASUM}\g" io.github.spacingbat3.webcord.yml
rm latest
rm ls | find -- *.tar.gz | grep v
