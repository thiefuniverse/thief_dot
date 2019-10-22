#!/bin/bash

# check number
# todo



# run one command for n times
# example: run_n_times 4 ls : run command "ls" for 4 times.
function run_n_times() {
	number=$1
	shift
	for n in $(seq $number); do
		$@
	done
}
