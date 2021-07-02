#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'

# Introduction to the setup script
echo -e "Setup neovim...\n"

cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
git clone https://github.com/zettlrobert/zr-nvim.git ~/.config/nvim
