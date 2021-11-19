current_file_name=$(basename0:00:00  "$0")
current_path=$(pwd)

# second run this script, you can run setup at anywhere, then
# we should set current_path by THIEF_HOME_PATH
if [ ! "$THIEF_HOME_PATH" == "" ]; then
    current_path=$( cd $THIEF_HOME_PATH/../ ; pwd)
fi

introduction(){
    echo "Introduction: Thief Plan"
    echo "Use all config files of this project to manage my linux(unix) working environment."
    echo "It will contain all shell scripts I (maybe you) need."
}

help(){
   #introduction
   echo "Usage: ${current_file_name}  [option]"
   echo "option:"
   echo "       -h/--help    print help info."
   echo "       set          add config tool alias to your dot file, now only zsh supported."
   echo "       recover      recover your personal environment to original status."
   echo "       update       update zsh config only."
   exit 0
}

# Help: THIEF PLAN
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ]; then
    help
    exit 0
fi

# environment variable script
env_script=${HOME}/.thief_path.sh
old_zshrc_file=${HOME}/.thief_old_zshrc

if [ "$1" == "set" ] || [ "$1" == "update" ] ; then
    # backup zshrc file
    if [ -f ${HOME}/.zshrc ]; then
        mv ${HOME}/.zshrc ${old_zshrc_file}
    fi
    cp ${current_path}/home/config/zshrc ${HOME}/.zshrc

    # set kitty terminal
    mkdir -p ${HOME}/.config/kitty
    ln ${current_path}/home/config/kitty.conf ${HOME}/.config/kitty/kitty.conf

    if [ "$1" == "set" ]; then
    # set default env path file
     echo -e "\
# builtin config\n\
export THIEF_HOME_PATH=${current_path}/home\n\
# control whether use thief alias or not.\n\
export THIEF_ALIAS_ON=on  # on or off\n \
# config for git ssh using socks proxy\n\
export GIT_SSH_COMMAND='ssh -o ProxyCommand=\"connect -S 127.0.0.1:10808 %h %p\"'\n\
# config for terminal use http proxy\n\
export https_proxy=http://127.0.0.1:10809\n\
export http_proxy=http://127.0.0.1:10809\n\
" > ${env_script}
     fi
     echo "You $1 your personal terminal environment, activate it by running 'source ~/.zshrc'"
     exit 0
elif [ "$1" == "recover" ]; then
    mv ${env_script} ${current_path}
    if [ -f ${old_zshrc_file} ]; then
        mv ${old_zshrc_file} ${HOME}/.zshrc
    fi
    rm -rf ${env_script}
    echo "You have recover your personal environment. welcome to back again! :)"
fi
