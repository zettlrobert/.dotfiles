#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'

# Introduction to the setup script
echo -e "Setup kitty, zsh and oh-my-zsh...\n"

# echo success of failure depending on command result
function execute_command {
  eval "$1"
  
  if [ $? = 0 ]
  then
    echo -e "${green}OK${NC}: "$1" successfully executed"
  else
    echo -e "${red}Fail${NC}: "$1""
  fi
}

INSTALL_KITTY="sudo apt install kitty -y"
execute_command "$INSTALL_KITTY"

UPDATE_DEFAULT_TERMINAL="sudo update-alternatives --config x-terminal-emulator"
execute_command "$UPDATE_DEFAULT_TERMINAL"

UPDATE_REPOSITORYS="sudo apt update"
execute_command "$UPDATE_REPOSITORYS"

INSTALL_ZSH="sudo apt install zsh"
exectue_command "$INSTALL_ZSH"

DEFAULT_ZSH="chsh -s $(which zsh)"
execute_command "$DEFAULT_ZSH"

INSTALL_OH_MY_ZSH="sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""
execute_command "$INSTALL_OH_MY_ZSH"
