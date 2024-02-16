#!/bin/bash

export pwd="$(pwd)"

cd "${pwd}/config/cheat/cheatsheets/personal"
git pull origin main

cd "${pwd}/config/cheat/cheatsheets/community"
git pull origin master

cd "${pwd}/config/nvim"
git pull origin main

rm -rf ~/.config/cheat
cp -r "${pwd}/config/cheat" ~/.config/cheat

rm -rf ~/.config/nvim
cp -r "${pwd}/config/nvim" ~/.config/nvim
