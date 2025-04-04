#!/bin/bash

GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
RESET="\e[0m"

echo "This script is designed to help the creator of these dotfiles to update and fast setup his config on a new computer"
echo -e "\tYou have to execute it in the repertory you found it"
echo -e "\tIt will install packages needed for the config"
echo -e "\tIt will delete concurent config files"
echo -e "\tMake sure to$RED execute as a new user$RESET or$RED know what you do$RESET before executing this"
echo -ne "$YELLOW"
echo -e "If you don't want consequences you can just browse my config files and copy the one you like$RESET"
echo -ne "$RED"
read -p "DO YOU REALLY WANT TO EXECUTE IT ? [y/N] " answer
echo -ne "$RESET"


if [ -z $answer ] || [ $answer != "y" ]; then
	exit 0
fi

dir=$PWD

read -p "Install yay ? [y/N] " answer

if [ -z $answer ]; then
	answer="n"
fi

if [ $answer = "y" ]; then
	echo -e "Installing yay"
	sudo pacman -S --needed git base-devel

	cd ~/

	if [ ! -d git ]; then
		mkdir git
	fi

	cd git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	echo "Yay installed"
fi

read -p "Install packages used by these dotfiles (installing with yay) ? [y/N] : " answer

if [ -z $answer ]; then
	answer="n"
fi

if [ $answer = "y" ]; then
	yay -S fish starship hyprland-git hyprutils-git hyprland-protocols-git hypridle-git hyprlock-git hyprshot-git hyprpaper-git kitty uwsm qt5ct gtk4 gtk3 papirus-icon-theme waybar-cava-git udiskie fuzzel mako ttf-hack-nerd noto-fonts-cjk noto-fonts-emoji
fi

read -p "Set default shell to fish [y/N] : " answer

if [ -z $answer ]; then
	answer="n"
fi

if [ $answer = "y" ]; then
	chsh -s /usr/bin/fish
fi

echo "Installing config files"

cd $dir/home

# Get hidden files
shopt -s dotglob

for i in *; do
	echo $i
	if [ $i = "config" ]; then
		cd config
		for j in *; do
			if [ -f ~/.config/$j ] || [ -d ~/.config/$j ]; then
				rm -r ~/.config/$j
				echo "Deleting link to $j"
			fi

			ln -s $PWD/$j ~/.config/$j
			echo "Link to $j added in ~/.config"
		done
		cd ../
	else
		if [ -f ~/$i ] || [ -d ~/$i ]; then
			rm -r ~/$i
			echo "Deleting link to $i"
		fi

		ln -s $PWD/$i ~/$i
		echo "Link to $i added in ~/"
	fi
done

shopt -u dotglob

echo "Setting up Papirus icons"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
echo "Setting up Tokyonight dark storm gtk theme"
gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Dark-Storm"

systemctl --user enable --now hyprpaper
systemctl --user enable --now hypridle
