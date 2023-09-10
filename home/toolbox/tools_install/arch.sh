#!/bin/bash

# install yay
yes| sudo pacman -S yay

# setup install command
function incc() {
    yes | yay -S $@
}

incc fakeroot usbutils xsel

# proxy
incc v2raya
# basic
# git : repo management tool
# jq  : json parser
# tig : good git tool
incc git jq tig google-chrome netease-cloud-music

# basic edit tool
incc vim

# media tool
incc ffmpeg

# basic net tools
incc curl wget

# command: add-apt-repository
incc software-properties-common

# zsh
incc zsh openssh-server sshpass

incc fasd emacs

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

incc tmux

# compress tool
incc ark

# file statics tool
incc ncdu

# beyond grep
incc ack

# directory compare tool
incc meld

# for shell
incc fzf zsh-syntax-highlighting zsh-autosuggestions kitty
incc llvm clang ripgrep

# for proxy
incc openbsd-netcat

# for font
incc ttf-fira-code

# input method
incc fcitx5 fcitx5-configtool  fcitx5-gtk fcitx5-qt  fcitx5-rime

# emacs config
git clone https://github.com/thiefuniverse/emacs.d_2022 ~/.emacs.d
