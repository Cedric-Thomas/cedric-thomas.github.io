#!/bin/bash

trap 'printf "\e[0m\n" && exit 1' 2

if [ "$1" == "" ]; then
	printf "\e[95m> Hi there, what is your\n"
	while [ "$msg" == "" ]; do
		read -p "commit message: " msg
	done
	printf "\e[0m"
else
	msg=$1
fi

# building the site...
printf "\e[94m> Building the website ⌛\n"

# creating the commit
printf "\e[93m> Commiting\e[0m « $msg »\e[93m\nand update site ?\n\e[92m"
while true; do
    read -p "[Y/n]: " yn
    case $yn in
        [Yy]* ) printf "\e[0m"; break;;
        [Nn]* ) printf "\e[0m"; exit;;
        * ) printf "\e[91m Please answer yes or no.\e[0m\n";;
    esac
done

git commit -m $msg &&
git subtree push --prefix public origin gh-pages
git push origin master