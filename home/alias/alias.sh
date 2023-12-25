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
#. $THIEF_HOME_PATH/toolbox/general/test.sh

__ac w='which '

# vim
__ac vim='vim -u $THIEF_HOME_PATH/vim/vimrc'
__ac vimrc='vim -u $THIEF_HOME_PATH/vim/vimrc $THIEF_HOME_PATH/vim/vimrc'
__ac v='vim '
fs() {
    local file
    file=$(fasd -Rfl | fzf --height 50% --reverse) && ${EDITOR:-vim} -u $THIEF_HOME_PATH/vim/vimrc "$file"
}


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
# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
function j() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

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
__ac gg='cd "$(git rev-parse --show-toplevel)"'
__ac gd='git diff'
__ac gca='git commit --amend'
__ac gl='git pull'
__ac gb='git blame'
__ac t='tig'
__ac glo='git clone '

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

__ac z='shutdown now'
__ac mk='mkdir '
__ac df='df -lh '

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

# package management
is_arch=$(uname -a | grep "arch")
if [ ! "$is_arch" = "" ]; then
    __ac i="sudo pacman -S " # install
    __ac ir="sudo pacman -R " # uninstall
    __ac is="sudo pacman -Ss " # search
    __ac iu="sudo pacman -Syy " # update source
fi

# fzf
# h - repeat history
h() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
ff() {
  files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}


# Engine/Build/BatchFiles/Linux/Build.sh
function up() {
	# 获取仓库根目录
    repo_root=$(git rev-parse --show-toplevel)
    # 获取包含uproject后缀的文件并循环处理
    find "${repo_root}" -maxdepth 2 -name '*.uproject' -type f | while IFS= read -r project_file; do
        # 获取文件的绝对路径名
        project_dir=$(dirname "${project_file}")
        project_name=$(basename "${project_file}" .uproject)

        # 输出文件的绝对路径名
        echo "File path: ${project_file}"
        # 执行 cat 和 make 操作
        cat "${project_file}"
		Build.sh  -projectfiles -project="${project_dir}/${project_name}.uproject" -game -rocket -progress -Makefile
   done
}

function mm() {
	# 获取仓库根目录
    repo_root=$(git rev-parse --show-toplevel)
    # 获取包含uproject后缀的文件并循环处理
    find "${repo_root}" -maxdepth 2 -name '*.uproject' -type f | while IFS= read -r project_file; do
        # 获取文件的绝对路径名
        project_dir=$(dirname "${project_file}")
        project_name=$(basename "${project_file}" .uproject)

        # 输出文件的绝对路径名
        echo "File path: ${project_file}"
        # 执行 cat 和 make 操作
        cd "${project_dir}"
        make "$project_name"
    done
}
function setup_cpp_format() {
	# 获取仓库根目录
    repo_root=$(git rev-parse --show-toplevel)
    cp $THIEF_HOME_PATH/.clang-format "${repo_root}/"
}

# 当输入已知命令时，按下空格之后直接回车，避免额外的enter
# 定义已知命令列表
known_command=("l" "date" "j" "ff" "fs" "n" "h")

check_known_command() {
    # 已知的字符串列表

    # 要判断的字符串
    local current_word
    current_word=${BUFFER}

    # 判断输入的字符串是否在已知的字符串列表中
    found=false
    for item in "${known_command[@]}"; do
        if [[ "$item" == "$current_word" ]]; then
            found=true
            break
        fi
    done

    # 输出结果
    if $found; then
        BUFFER=$BUFFER$'\n'
        zle accept-line
    else
        zle self-insert
    fi
}

zle -N check_known_command
# 绑定空格键到自定义函数
bindkey " " check_known_command


