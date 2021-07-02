#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'

# Introduction to the setup script
echo -e "Installing packages...\n"

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

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash


