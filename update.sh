#!/bin/bash

export pwd="$(pwd)"

cd "${pwd}/config/cheat/cheatsheets/personal"
git pull

cd "${pwd}/config/cheat/cheatsheets/community"
git pull

cd "${pwd}/config/nvim"
git pull

rm -rf ~/.config/cheat
cp -r "${pwd}/config/cheat" ~/.config/cheat

rm -rf ~/.config/nvim
cp -r "${pwd}/config/nvim" ~/.config/nvim
