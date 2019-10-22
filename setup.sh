#!/bin/bash

current_file_name=$(basename "$0")
current_path=$(pwd)
config_home_path=$current_path

# ******config area******

# you can config your self command name
config_tool=${current_file_name}
# update and enable your .bashrc* file
source_sh=sz

# if you don't use bash or zsh, please add it by yourself.
# add to .bash_profile for mac
config_list=(~/.zshrc
            ~/.bashrc
            ~/.bash_profile
            )

# these two lines will be added to your bash file (like .bashrc, .zshrc) to make a flag.
config_start_line="#******thief plan settings begin******"
config_start_flag="thief plan settings begin"
config_end_line="#******thief plan settings end******"
config_end_flag="thief plan settings end"
# ******config area******


introduction(){
    echo "Introduction: Thief Plan"
    echo "Use all config files of this project to manage my terminal working environment."
    echo "It will contain all shell scripts I (maybe you) need."
}

help(){
   introduction
   echo "Usage: $config_tool  [option]"
   echo "option:"
   echo "       -h/--help    print help info."
   echo "       set          add config tool alias to your dot file, such as .bashrc, .zshrc, etc."
   echo "       on           open your personal terminal environment."
   echo "       off          close your personal terminal environment."
   echo "       update       update your personal termial environment."
   echo "       clean        clean your personal termial environment."
   echo "       status       show current config tool status."
   exit 0 
}

# Help: THIEF PLAN
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ]; then
    help
    exit 0
fi

# judge environment variable THIEF_HOME_PATH exists or not.
has_set=0
target_config_file=
for f in ${config_list[@]}; do
    if [ -f $f ]; then
        alias_existed=`grep "alias $config_tool" $f -c 2> /dev/null`
	if [ "$alias_existed" = "" ]; then
            alias_existed=0
        fi
	if [ ! $alias_existed = 0 ]; then
            target_config_file=$f
            has_set=1    
	fi
    fi
done

# if command is set or force_set, we add variable THIEF_HOME_PATH;
# else we return error.
if [ "$1" == "set" ] || [ "$1" == "force_set" ]; then
    # we add THIEF_HOME_PATH to your dot init file.
    THIEF_HOME_PATH=$config_home_path/home
elif [ $has_set = 0 ]; then
    echo "you didn't set THIEF_HOME_PATH environment variable, please set it."
    echo "you can try to run '$current_file_name -h ' to know how to add this environment variable to your bashrc file."
    exit 1
fi

# config some path by THIEF_HOME_PATH
config_utils_path=$THIEF_HOME_PATH/utils/utils.sh
config_alias_path=$THIEF_HOME_PATH/alias/alias.sh
config_status_path=$THIEF_HOME_PATH/.thief_status

# set THIEF_HOME_PATH variable
if [ "$1" == "set" ] || [ "$1" == "force_set" ]; then
    # export common shell script
    . $config_utils_path

    for f in ${config_list[@]}; do
	    # judge alias exists or not.
        alias_existed=`grep "alias $config_tool" $f -c 2> /dev/null`
	    if [ "$alias_existed" = "" ]; then
            alias_existed=0
        fi

	    # if file exists and has no $config_tool alias, we will add it to this file.
        if [ -f $f ]; then
	    if [ "$1" == "force_set" ] && [ $alias_existed != 0 ]; then
		    echo "force reset... remove old settings..."
            clean_file_between_flags $f "$config_start_flag" "$config_end_flag"
		    echo "remove completedly"
		    alias_existed=0
        fi
	    if [ $alias_existed = 0 ]; then
		    echo "$config_start_line" >> $f
		    echo "export THIEF_HOME_PATH=$THIEF_HOME_PATH" >> $f
            echo "alias $config_tool=$config_home_path/$current_file_name" >> $f
		    echo ". $config_alias_path $THIEF_HOME_PATH " >> $f 
		    echo "$config_end_line" >> $f
	        echo "add alias $config_tool to $f"
        else
		    echo "$f has alias $config_tool, dont't set again."
        fi
        fi
    done
fi

# export common shell script
. $config_utils_path

if [ "$1" == "on" ]; then
     echo "on" > $config_status_path
     echo "You start personal terminal environment, activate it by running 'source $target_config_file'"
     exit 0       
elif [ "$1" == "off" ]; then
     echo "off" > $config_status_path
     echo "You shut down personal terminal environment, deactivate it by running 'source $target_config_file'"
     exit 0
elif [ "$1" == "update" ]; then
     echo "on" > $config_status_path
     echo "You start personal terminal environment, activate it by running 'source $target_config_file'"
     exit 0
elif [ "$1" == "clean" ]; then
    for f in ${config_list[@]}; do
        if [ -f $f ]; then
            clean_file_between_flags $f "$config_start_flag" "$config_end_flag"
	fi
    done
    echo "You have cleanned your personal terminal environment. welcome to back again! :)"
elif [ "$1" == "status" ]; then
    echo "Your personal terminal environment's current status:" $(cat $config_status_path)
fi

