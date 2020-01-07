#!/bin/bash

# please transfer your home path as first argument
THIEF_HOME_PATH=$1

# get current status of manager
export thief_status=$(cat $THIEF_HOME_PATH/.thief_status)

# here we know we should change alias by modifying alias/alias.config
alias_config_file=$THIEF_HOME_PATH/alias/alias.config.sh

if [ "$thief_status" = "on" ]; then
    . ${alias_config_file} $THIEF_HOME_PATH 1
else
    . ${alias_config_file} $THIEF_HOME_PATH 0
fi
