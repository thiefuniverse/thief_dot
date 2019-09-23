#!/bin/bash

# clean content within file between start flag and end flag
clean_file_between_flags() {
    file_name=$1
    start_flag=$2
    end_flag=$3
    if [ "$(uname)" == "Linux" ]; then
        sed  -i  "/$start_flag/,/$end_flag/d" $file_name 
    else
        sed  -i '' "/$start_flag/,/$end_flag/d" $file_name 
    fi
}
