#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'

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

# 1. Update and upgrade
UPDATE_AND_UPGRADE="sudo apt update && sudo apt upgrade -y"
execute_command "$UPDATE_AND_UPGRADE"

# 
