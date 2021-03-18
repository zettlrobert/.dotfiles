#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m' # No Color

# Introduction to the setup script
echo -e "Setup Script starting...\n"




# Array of Packages
# TOOLS
#####################################################
#      "zsh"             # Shell with lots of features
#      "kitty"           # GPU based Terminal
#      "ripgrep"         # Recursively searches directories for a regex pattern
#      "xclip"           # command line interface to X selections  
#      "timeshift"       # System restore utility
#      "neofetch"        # Shows Linux System Information 
# Media
#####################################################
#      "cifs-utils"      # Transcoding, streaming and playing of multimedia files [universe] 
#      "beets"           # music tagger and library organizer [universe] 
#      "deluge"          # bittorrent client written in Python/PyGTK [universe] 
# Archives
#####################################################
#      "zip"             # Archiver for .zip files 
#      "unzip"           # De-archiver for .zip files 
# Audio
#####################################################
#      "pulseaudio"      # PulseAudio sound server 
#      "pulseeffects"    # GStreamer adapter plugin [universe] 
# Theming
#####################################################
#      "gtk2-engines-murrine" # cairo-based gtk+-2.0 theme engine
#      "gnome-tweaks"         # configuration settings for GNOME 
# Fonts
#####################################################
#      "fonts-powerline"      # prompt and statusline utility




PACKAGES=(
    # Tools
    "zsh"
    "kitty"
    "ripgrep"
    "xclip"
    "timeshift"
    "neofetch"
    # Media
    "ffmpeg"
    "beets"
    "deluge"
    # Archives
    "zip"
    "unzip"
    # Audio
    "pulseaudio"
    "pulseeffects"
    # Theming
    "gtk2-engines-murrine"
    "gnome-tweaks"
)

# Loop over Array of packages and output it to console
for package in "${PACKAGES[*]}";
do
    sudo apt install $package -y
    echo -e "Installing $package...\n"
    if [ $? = 0 ]
    then
        echo -e "${green}$1${NC}"
    else
        echo -e "${red}$1${NC}"
    fi
done

# Update Default Terminal to Kitty
sudo update-alternatives --config x-terminal-emulator


# TODO
# Setup Audofiles audio configuration, pulseeffect

