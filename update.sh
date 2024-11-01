#!/bin/bash

export PWD="$(pwd)"

git checkout main
git pull origin main
git submodule update --init --recursive

cp -r "${PWD}/config/bat" ~/.config/bat
cp -r "${PWD}/config/cheat" ~/.config/cheat
cp -r "${PWD}/config/gh-changelog" ~/.config/gh-changelog
cp -r "${PWD}/config/gh-dash" ~/.config/gh-dash
cp -r "${PWD}/config/lazygit" ~/.config/lazygit
cp -r "${PWD}/config/starship.toml" ~/.config/starship.toml
cp -r "${PWD}/config/nvim" ~/.config/nvim
cp -r "${PWD}/config/tmux" ~/.config/tmux

./generate_tmux.sh
