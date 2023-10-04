#!/bin/bash
export LANG=en_US.UTF-8

dirs_count=0
files_count=0

vertical=$'\u2502\u00A0\u00A0\u0020'
last_line=$'\u2514\u2500\u2500\u0020'
middle_line=$'\u251c\u2500\u2500\u0020'
parent=$'\u2502\u00A0\u00A0\u0020'
space=$'\u00A0\u00A0\u00A0\u0020'

build_tree()
{
	cd $1
	local subdirs=($(ls)) #создаем массив с вложенными директориями

	for idx in ${!subdirs[@]}; do #проход циклом по индексам массива
		item=${subdirs[$idx]}
		if [[ $idx -eq $((${#subdirs[@]}-1)) ]]; then
			echo "$2$last_line$item"
		else
			echo "$2$middle_line$item"
		fi
		
		if [ -d $item ]; then
			((dirs_count++))
			if [[ $idx -eq $((${#subdirs[@]}-1)) ]]; then
				build_tree $item "$2$space"
			else
				build_tree $item "$2$vertical"
			fi
		else
			((files_count++))
		fi
	done
	
	cd ..
}

echo $1
build_tree $1 ""
echo
echo "$dirs_count diretories, $files_count files"
