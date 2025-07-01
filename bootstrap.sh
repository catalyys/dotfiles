#! /usr/bin/bash

#mkdir ~/git

cd ~

sudo pacman -S git ansible stow --needed --noconfirm

git clone -b notebook https://github.com/catalyys/dotfiles.git .dotfiles

cd ~/.dotfiles/ansible

ansible-playbook bootstrap.yml -K


