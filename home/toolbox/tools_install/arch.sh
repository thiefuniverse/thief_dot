#!/bin/bash

# install yay
yes| sudo pacman -S yay

# setup install command
function incc() {
    yes | yay -S $@
}

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
incc curl wget connect

# command: add-apt-repository
incc software-properties-common

# zsh
incc zsh openssh-server sshpass

incc fasd emacs

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

incc tmux

# file statics tool
incc ncdu

# beyond grep
incc ack

# directory compare tool
incc meld

# doom emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
yes | ~/.emacs.d/bin/doom install