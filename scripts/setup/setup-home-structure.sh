#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'

# Introduction to the setup script
echo -e "Creating Home Directory Structure...\n"

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


# Directories to create in $HOME
# TODO - maybe add them to user-dirs.dirs in ~/.config
HOMEDIRECTORYS=(
  'audiobooks'
  'bin'
  'containers'
  'desktop'
  'documents'
  'downloads'
  'music'
  'pictures'
  'projects'
  'public'
  'scripts'
  'templates'
  'videos'
  'vms'
  'development'
)

# Create directories in $HOME
for directory in "${HOMEDIRECTORYS[@]}"
do
  command="mkdir $HOME/${directory}"
  execute_command "$command"
done

DEFAULTDIRECTORYS=(
  'Desktop'
  'Documents'
  'Downloads'
  'Music'
  'Pictures'
  'Public'
  'Templates'
  'Videos'
)

# Remove capital directories in $HOME
for directory in "${DEFAULTDIRECTORYS[@]}"
do
  command="rm -r $HOME/${directory}"
  execute_command "$command"
done

# Update ~ structure to lower case
XDG_USER_DIRS_UPDATE="xdg-user-dirs-update"
execute_command "$XG_USER_DIRS_UPDATE"
