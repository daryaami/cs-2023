#!/bin/bash
export LANG=en_US.UTF-8

build_tree()
{
	local dir=$1
	local indent=$2
	
	children=("$dir"/*)
	child_count=${#children[@]}
	
	
	for item in ${children[@]}; do
		echo -n "$indent"
		printf "\u251c\u2500\u2500\u0020"
		echo "$(basename $item)"
		if [ -d "$item" ]; then
			build_tree "$item" $'\u2502\u00A0\u00A0\u0020'$indent
			((count_dirs++))
		elif [ -f "$item" ]; then
			((count_files++))
		fi
	done
}

path=$1
echo "$path"
count_dirs=0
count_files=0
build_tree $1 ""
echo
echo "$count_dirs diretories, $count_files files"
