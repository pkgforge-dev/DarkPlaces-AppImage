#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q darkplaces-git | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/72x72/apps/darkplaces.png
export DESKTOP=/usr/share/applications/darkplaces-git.desktop

# Deploy dependencies
quick-sharun /usr/bin/darkplaces-sdl

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
