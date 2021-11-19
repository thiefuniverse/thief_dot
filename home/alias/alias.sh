#!/bin/bash

#config alias command
function __ac() {
    if [ "$THIEF_ALIAS_ON" = "on" ]; then
        alias $@
    fi
}

# setup script
__ac setup='$THIEF_HOME_PATH/../setup'

# load some shell script
. $THIEF_HOME_PATH/toolbox/general/h.sh
# vim
__ac vim='vim -u $THIEF_HOME_PATH/vim/vimrc'
__ac vimrc='vim -u $THIEF_HOME_PATH/vim/vimrc $THIEF_HOME_PATH/vim/vimrc'

# config bd, fast script for go back to parent directory
__ac b='. $THIEF_HOME_PATH/toolbox/general/bd -si'

# pass content to clipboard
__ac c='$THIEF_HOME_PATH/toolbox/general/c'
# copy current path to clipboard
__ac pd='c pwd'

# open file explorer with file selected.
__ac o='$THIEF_HOME_PATH/toolbox/general/xpf'

__ac ts=setup.sh
__ac sz='source ~/.zshrc'
__ac sbp='source ~/.bash_profile'

# config a good projet manager emake
__ac emm=$THIEF_HOME_PATH/toolbox/general/emake.py
__ac emm1='$THIEF_HOME_PATH/toolbox/general/emake.py --ini=$THIEF_HOME_PATH/config/emake/emake_cplusplus11.ini'
__ac emm4='$THIEF_HOME_PATH/toolbox/general/emake.py --ini=$THIEF_HOME_PATH/config/emake/emake_cplusplus14.ini'
__ac emm7='$THIEF_HOME_PATH/toolbox/general/emake.py --ini=$THIEF_HOME_PATH/config/emake/emake_cplusplus17.ini'


### jump
__ac cdn='cd ~/Downloads'

__ac ssh='ssh -F $THIEF_HOME_PATH/config/ssh_config'

# config jump directory tool
__ac j='fasd_cd -d -i'

# install command for ubuntu
__ac si='sudo apt-get install'

# adb short cut command
__ac asl='adb shell'
__ac lc='adb logcat -c;adb logcat | grep '
__ac ads='adb root;adb remount;'
__ac adbscreen="adb shell /system/bin/screencap -p /sdcard/screenshot.png"


# git short cut
function gsp(){ git stash pop stash@{$1}; }
function gp(){ git push origin HEAD:$1; }
__ac gsl='git stash list'
__ac gch='git checkout'
__ac gst='git status'
__ac gss='git stash save '
__ac gcm='git commit -m'
__ac ga='git add'
__ac grt='git reset'
__ac grtt='git reset --hard'
__ac gau='git add -u'
__ac gf='git fetch'
__ac gr='git rebase'
__ac gm='git branch -m'

# jump to git root directory
__ac gg='cd $(git rev-parse --show-toplevel)'
__ac gd='git diff'
__ac gca='git commit --amend'
__ac gl='git pull'
__ac gb='git blame'
__ac t='tig'

# emacs
__ac em='emacs'
__ac ec=emacsclient
__ac dos='~/.emacs.d/bin/doom sync'


# file statics
__ac size_here=ncdu

#compare directory
__ac diffdir='meld'

# find executable files
__ac findexe="$THIEF_HOME_PATH/toolbox/general/findexe"

# tmux
__ac tmux='tmux -f $THIEF_HOME_PATH/config/tmux.conf'

# for kitty terminal
__ac icat='kitty +kitten icat'

__ac m='make -j`nproc`'

# view memory info by process name
function mem_pid(){
    cat /proc/$1/status | grep VmRSS
}

# for nixos
is_nixos=$(uname -a | grep "nixos")
if [ ! "$is_nixos" = "" ]; then
    __ac rs="sudo nixos-rebuild switch "
    __ac ns="nix search "
    __ac ni="nix-env -i "
fi
