#!/bin/bash

export pwd="$(pwd)"

wget -q https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -o - | tar xz
cp -r "${pwd}/nvim-linux64/*" ~/.local/

echo "export path=$home/.local/bin:$path" >> .bashrc
echo "export path=$home/.local/bin:$path" >> .zshrc

cp -r "${pwd}/config/bat" ~/.config/bat
cp -r "${pwd}/config/cheat" ~/.config/cheat
cp -r "${pwd}/config/gh-changelog" ~/.config/gh-changelog
cp -r "${pwd}/config/gh-dash" ~/.config/gh-dash
cp -r "${pwd}/config/lazygit" ~/.config/lazygit
cp -r "${pwd}/config/starship.toml" ~/.config/starship.toml
cp -r "${pwd}/config/nvim" ~/.config/nvim

mkdir -p ~/.local/share/nvim/lazy
git clone --filter=blob:none git@github.com:folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
