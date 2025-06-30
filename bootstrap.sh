#! /usr/bin/bash

mkdir ~/gitcd 

cd ~/git

sudo pacman -S git ansible stow --needed --noconfirm

git clone https://github.com/catalyys/dotfiles.git dotfiles

cd dotfiles/ansible

ansible-playbook bootstrap.yml -K


