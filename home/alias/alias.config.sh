#!/bin/bash

# **************
# THIEF_HOME_PATH is your dot file root path.
# **************
THIEF_HOME_PATH=$1
alias_on_off=$2

#config alias command
function __ac() {
    if [ "$alias_on_off" = "1" ]; then
        alias $@
    fi
}

# vim
__ac vim='vim -u $THIEF_HOME_PATH/vim/vimrc'
__ac vimrc='vim -u $THIEF_HOME_PATH/vim/vimrc $THIEF_HOME_PATH/vim/vimrc'


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

# jump to git root directory
__ac gg='cd $(git rev-parse --show-toplevel)'
__ac gd='git diff'
__ac gca='git commit --amend'
__ac gl='git pull'
__ac t='tig'

# emacs
__ac em='emacs'
__ac ec=emacsclient
__ac dof='~/.emacs.d/bin/doom refresh'


# file statics
__ac size_here=ncdu