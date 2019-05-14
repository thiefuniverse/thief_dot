#!/bin/bash

# setup install command
incc="sudo apt install -y "
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
$incc zsh

# fasd
# fasd : jump directory tool
# install dep: add-apt-repository
sudo add-apt-repository ppa:aacebedo/fasd -y
$update_cc
$incc fasd
