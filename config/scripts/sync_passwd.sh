#!/bin/bash

if [ ! -d $HOME/.passwd ]; then
	mkdir $HOME/.passwd
fi

rsync -avu $HOME/.passwd/Passwords.kdbx mathieu@20.19.88.144:.passwd/Passwords.kdbx
rsync -avu mathieu@20.19.88.144:.passwd/Passwords.kdbx $HOME/.passwd/Passwords.kdbx
