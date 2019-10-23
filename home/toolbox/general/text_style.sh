#!/bin/bash 

# use tput to set terminal style.
# if you want to support more style, just add tput setting and corresponding function.
function line_t(){
    echo "$(tput smul)${@}$(tput sgr0)"
}
function bold_t(){
    echo "$(tput smso)${@}$(tput sgr0)"
}
function green_t(){
    echo "$(tput setaf 2)${@}$(tput sgr0)"
}
function blue_t(){
    echo "$(tput setaf 4)${@}$(tput sgr0)"
}
function yellow_t(){
    echo "$(tput setaf 3)${@}$(tput sgr0)"
}
function red_t() {
    echo "$(tput setaf 1)${@}$(tput sgr0)"
}

text_style_help(){
    echo "======================== **Introduction** ====================="
    echo "$(yellow_t this) $(red_t is) $(yellow_t a) $(green_t echo_color shell lib) $(yellow_t for) *$(blue_t $(line_t thief plan))*."
    echo "$(yellow_t It\'s) $(blue_t created by)" "$(green_t $(bold_t thiefuniverse) )" "."
    echo "======================== **Introduction** ====================="

    echo "$(yellow_t current avaiable functions:)"
    echo "[blue_t, yellow_t, green_t, red_t, line_t, bold_t]"
    echo "you use: echo \$(blue_t help)"
    echo "you will get: ""$(blue_t help)"
}

