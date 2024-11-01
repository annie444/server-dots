#!/bin/bash

export PWD="$(pwd)"

git submodule update --init --recursive

wget -q https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -o - | tar xz
cp -r "${PWD}/nvim-linux64/*" ~/.local/

echo "export PATH=$HOME/.local/bin:$PATH" >> .bashrc
echo "export path=$HOME/.local/bin:$PATH" >> .zshrc

cp -r "${PWD}/config/bat" ~/.config/bat
cp -r "${PWD}/config/cheat" ~/.config/cheat
cp -r "${PWD}/config/gh-changelog" ~/.config/gh-changelog
cp -r "${PWD}/config/gh-dash" ~/.config/gh-dash
cp -r "${PWD}/config/lazygit" ~/.config/lazygit
cp -r "${PWD}/config/starship.toml" ~/.config/starship.toml
cp -r "${PWD}/config/nvim" ~/.config/nvim
cp -r "${PWD}/config/tmux" ~/.config/tmux
mkdir -p ~/.tmux

./generate_tmux.sh
./generate_options.sh

mkdir -p ~/.local/share/nvim/lazy
git clone --filter=blob:none git@github.com:folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
