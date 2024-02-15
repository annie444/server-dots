#!/bin/bash

export PWD="$(pwd)"

cp -R "${PWD}/config/bat" ~/.config/bat
cp -R "${PWD}/config/cheat" ~/.config/cheat
cp -R "${PWD}/config/gh-changelog" ~/.config/gh-changelog
cp -R "${PWD}/config/gh-dash" ~/.config/gh-dash
cp -R "${PWD}/config/lazygit" ~/.config/lazygit
cp -R "${PWD}/config/starship.toml" ~/.config/starship.toml

git clone git@github.com:annie444/nvim-dots.git ~/.config/nvim
mkdir -p ~/.local/share/nvim/lazy
git clone --filter=blob:none git@github.com:folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
