#!/bin/sh
set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
bin_dir=${HOME}/.local/bin
autostart_dir=${HOME}/.config/autostart

mkdir -p "$bin_dir" "$autostart_dir"
install -m 0755 "$project_dir/enable-devcontainer-gui" "$bin_dir/enable-devcontainer-gui"
install -m 0644 "$project_dir/devcontainer-gui.desktop" "$autostart_dir/devcontainer-gui.desktop"

printf '%s\n' "Installed. It will run automatically on the next desktop login."
