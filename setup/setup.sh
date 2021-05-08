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
#      "ranger"          # Filemanager
#      "ripgrep"         # Recursively searches directories for a regex pattern
#      "bottom"          # A cross-platform graphical process/system monitor
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


# What the Script is doing
# Installing all packages
# Updating default terminal to kitty


PACKAGES=(
    # Tools
    "zsh"
    "kitty"
    "ranger"
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
    if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: $package successfully installed"
    else
        echo -e "${red}Fail${NC}: $package installation failed"
    fi
done

# Create directorys in $HOME
mkdir $HOME/bin $HOME/desktop $HOME/documents $HOME/downloads $HOME/music $HOME/pictures $HOME/public $HOME/templates $HOME/videos $HOME/development

    if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: create base $HOME folder structure"
    else
        echo -e "${red}Fail${NC}: failed creating directorys in $HOME"
    fi

# Remove capital directorys in $HOME
rm -r $HOME/Desktop $HOME/Documents  $HOME/Downloads $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

# Update ~ structure to lower case
xdg-user-dirs-update

    if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: Updated xdg-user-dirs"
    else
        echo -e "${red}Fail${NC}: xdg-user-dirs updating"
    fi


# Intall all Packages which are not availalbe in package repository.

## Bottom Resource Monitor
function install_bottom () {
  sudo curl -LO https://github.com/ClementTsang/bottom/releases/download/0.5.7/bottom_0.5.7_amd64.deb
  sudo dpkg -i bottom_0.5.7_amd64.deb
  rm bottom_0.5.7_amd64.deb
}

install_bottom

    if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: bottom installed"
    else
        echo -e "${red}Fail${NC}: installing bottom"
    fi

# Update Default Terminal to Kitty
sudo update-alternatives --config x-terminal-emulator

# Setup Audofiles audio configuration, pulseeffect
# sudo cat ./default-configurations/default-audio-daemon/daemon.conf > /etc/pulse/daemon.conf
   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: /etc/pulse/daemon.conf successfully configured"
    else
        echo -e "${red}Fail${NC}: updating /etc/pulse/daemon.conf"
    fi
