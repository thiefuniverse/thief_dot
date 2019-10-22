#!/bin/bash

# some functions for alias
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

