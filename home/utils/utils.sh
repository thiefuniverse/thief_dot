#!/bin/bash

# **********************************************************
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

# example:
# file content like this:
# file's name is test.txt which contains content below:
# 1. cmd 1
# 2. cmd 2
# 3. cmd 3
# AAA start flag
# 4. cmd 4
# 5. cmd 5
# BBB end flag


# if we invoke this function: `clean_file_between_flags ./test.txt AAA BBB`,
# you will get this content now:
# 1. cmd 1
# 2. cmd 2
# 3. cmd 3

# you can see that 4 and 5 are deleted.
# **********************************************************
