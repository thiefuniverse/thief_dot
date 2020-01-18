#!/bin/bash

# setup install command
incc="sudo apt install -y "
incc_ppa="sudo add-apt-repostitory "
update_cc="sudo apt update"

# basic
# git : repo management tool
# jq  : json parser
# tig : good git tool
$incc git jq tig

# basic edit tool
$incc vim vi

# media tool
$incc ffmpeg

# basic net tools
$incc curl wget

# command: add-apt-repository
$incc software-properties-common
# command: sudo
$incc sudo

# zsh
# zsh : a wonderful command line interpreter
$incc zsh openssh-server sshpass

# sudo /etc/init.d/ssh start

# fasd, emacs
# fasd : jump directory tool
# install dep: add-apt-repository
$incc_ppa ppa:aacebedo/fasd -y
$incc_ppa ppa:kelleyk/emacs -y
$update_cc
$incc fasd emacs26

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# doom emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install


$incc tmux clang-format

# file statics tool
$incc ncdu

# install hyper terminal and set it as default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 60
sudo update-alternatives --config x-terminal-emulator 

# beyond grep
$incc ack
