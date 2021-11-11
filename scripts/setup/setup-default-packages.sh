#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
-green='\e[0;32m'

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


PACKAGES=(
    # Tools
    "ranger"
    "ripgrep"
    "xclip"
    "exa"
    "timeshift"
    "deja-dup"
    "neofetch"
    "openssh-server"
    "tree"
    "code"
	"cifs-utils"
    "nmap"
    # NTFS
    "fuse"
    "ntfs-3g"
    # Media
    "ffmpeg"
    "beets"
    "deluge"
    # Archives
    "zip"
    "unzip"
    # Theming
    "gtk2-engines-murrine"
    "gnome-tweaks"
    # build dependencie for generating themes
    "sassc"
    # Fonts
    "fonts-powerline"
    "fonts-firacode"
    # Easy VM
    "gnome-boxes"
    # Nvim prerequisites
    "ninja-build"
    "gettext"
    "libtool"
    "libtool-bin"
    "autoconf"
    "automake"
    "cmake"
    "g++" 
    "pkg-config"
)

for package in "${PACKAGES[@]}"
do
  command="sudo apt install ${package} -y"
  execute_command "$command"
done
