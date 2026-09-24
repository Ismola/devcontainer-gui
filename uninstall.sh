#!/bin/sh
set -eu

rm "${HOME}/.local/bin/enable-devcontainer-gui" "${HOME}/.config/autostart/devcontainer-gui.desktop"
printf '%s\n' "Removed. Log out to discard the current xhost authorization."
