#!/bin/bash

if [ ! -d $HOME/.passwd ]; then
	mkdir $HOME/.passwd
fi

rsync -avu $HOME/.passwd/Passwords.kdbx e6436u@webetu.iutnc.univ-lorraine.fr:.passwd/Password.kdbx
rsync -avu e6436u@webetu.iutnc.univ-lorraine.fr:.passwd/Password.kdbx $HOME/.passwd/Passwords.kdbx
