#!/bin/bash

apply_alias() {
    alias_file=$1
    if [ ! -f "$alias_file" ]; then
        echo "apply alias: this file doesn't exist: $alias_file"
    else
	while read l
	do
	    alias_name=$(echo $l | cut -d'=' -f1)
	    command=$(echo $l | cut -d'=' -f2)

            if [ "$alias_name" != "" ]; then
	        alias $alias_name=$command 
	    fi
	done < $alias_file
    fi
}

remove_alias() {
    alias_file=$1
    if [ ! -f "$alias_file" ]; then
        echo "apply alias: this file doesn't exist: $alias_file"
    else
	while read l
	do
	    alias_name=$(echo $l | cut -d'=' -f1)
	    command=$(echo $l | cut -d'=' -f2)
	    if [ "$alias_name" != "" ] && [ "$(alias | grep "^$alias_name=" -c)" != 0 ]; then 
                unalias $alias_name
	    fi
	done < $alias_file
    fi
}


THIEF_HOME_PATH=$1
export thief_status=$(cat $THIEF_HOME_PATH/.thief_status)
echo "current status: $thief_status"
alias_config_file=$THIEF_HOME_PATH/.alias.config
alias_config_file_bak=$THIEF_HOME_PATH/.alias.config.sh.bak

# replace some variable name in .alias.config file
sed  "s|\$THIEF_HOME_PATH|$THIEF_HOME_PATH|g"  ${alias_config_file} >  ${alias_config_file_bak}
if [ "$thief_status" = "on" ]; then
    apply_alias ${alias_config_file_bak}
    echo "apply alias done."
else
    remove_alias ${alias_config_file_bak}
    echo "remove alias done."
fi



