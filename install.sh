#!/bin/bash

rm -rf ~/.emacs.d/plugins/cp-emacs-plugin
mkdir -p ~/.emacs.d/plugins
cp -r src ~/.emacs.d/plugins/cp-emacs-plugin
rm -rf ~/.local/share/cp-emacs-plugin
mkdir -p ~/.local/share/cp-emacs-plugin
cp -r template ~/.local/share/cp-emacs-plugin/

