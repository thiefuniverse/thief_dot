#!/bin/bash

# some functions for alias
apply_alias() {
    alias_file=$1
    if [ ! -f "$alias_file" ]; then
        echo "apply alias: this file doesn't exist: $alias_file"
    else
	while read l
	do
		# remove spaces
		remove_lead_space=$(sed 's/^[[:space:]]*//' <<< $l)
		if [[ ! "$remove_lead_space" == "#*" ]] ; then
	    	alias_name=$(echo $remove_lead_space | cut -d'=' -f1)
	    	command=$(echo $remove_lead_space | cut -d'=' -f2)

			# apply alias
            if [ "$alias_name" != "" ]; then
	        	alias $alias_name="$command"
	    	fi
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

