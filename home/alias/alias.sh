#!/bin/bash

# please transfer your home path as first argument
THIEF_HOME_PATH=$1

# import remove_alias, apply_alias function
. $THIEF_HOME_PATH/alias/alias.utils.sh

# get current status of manager
export thief_status=$(cat $THIEF_HOME_PATH/.thief_status)

# here we know we should change alias by modifying alias/alias.config
alias_config_template=$THIEF_HOME_PATH/alias/alias.config
alias_config_file_real=$THIEF_HOME_PATH/alias/alias.config.sh

sed  "s|\$THIEF_HOME_PATH|$THIEF_HOME_PATH|g"  ${alias_config_template} >  ${alias_config_file_real}
if [ "$thief_status" = "on" ]; then
    apply_alias ${alias_config_file_real}
else
    remove_alias ${alias_config_file_real}
fi

# remove generated intermidiate file
rm -rf ${alias_config_file_real}



