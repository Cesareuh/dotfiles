#!/bin/bash

cd ~/

if [ ! -d ./mnt ]; then
	mkdir mnt
fi

cd ./mnt

if [ ! -d ./iutnc ]; then
	mkdir iutnc
fi

cat $HOME/.passwd/passwd | sshfs -o password_stdin e6436u@webetu.iutnc.univ-lorraine.fr: $HOME/mnt/iutnc
