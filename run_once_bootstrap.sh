#! /usr/bin/bash

sudo pacman -S git ansible --needed --noconfirm

cd ~/.local/share/chezmoi/ansible

ansible-playbook bootstrap.yml -K



