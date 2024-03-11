#!/bin/bash

cd config

for i in *; do
	if [ -d ~/.config/$i ]; then
		rm ~/.config/$i
		echo "delete : $i"
	fi

	ln -s $PWD/$i ~/.config/$i
	echo "$i added in ~/.config"

done
