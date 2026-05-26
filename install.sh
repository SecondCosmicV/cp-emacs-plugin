#!/usr/bin/env bash

set -ex
install -m644 cp-mode.el ~/.emacs.d/
rm -rf ~/.local/share/cp-mode
mkdir -p ~/.local/share/cp-mode
cp -r template ~/.local/share/cp-mode/

