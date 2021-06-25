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
#      "ranger"          # file manager
#      "ripgrep"         # Recursively searches directories for a regex pattern
#      "bottom"          # A cross-platform graphical process/system monitor
#      "xclip"           # command line interface to X selections  
#      "timeshift"       # System restore utility
#      "neofetch"        # Shows Linux System Information 
#      "tree"            # Shows folder structure in tree form
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
#      "fonts-firacode"       # font for nvim


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
    "openssh-server"
    "tree"
    "code"
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
    # Audio
    "pulseaudio"
    "pulseeffects"
    # Theming
    "gtk2-engines-murrine"
    "gnome-tweaks"
    # Fonts
    "fonts-powerline"
    "fonts-firacode"
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
  'public'
  'scripts'
  'templates'
  'videos'
  'vms'
  'development'
)

# Create directories in $HOME
for directory in "${HOMEDIRECTORYS[*]}"
do
  mkdir $HOME/$directory
  if [ $? = 0 ]
  then
    echo -e "${green}OK${NC}: creating base $directory"
  else
        echo -e "${red}Fail${NC}: creating $directory"
  fi
done

# Remove capital directories in $HOME
rm -r $HOME/Desktop $HOME/Documents  $HOME/Downloads $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

# Update ~ structure to lower case
xdg-user-dirs-update

    if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: Updated xdg-user-dirs"
    else
        echo -e "${red}Fail${NC}: xdg-user-dirs updating"
    fi


# Install all Packages which are not available in package repository.

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

# Setup Audio files audio configuration, pulseeffects
# sudo cat ./default-configurations/default-audio-daemon/daemon.conf > /etc/pulse/daemon.conf
   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: /etc/pulse/daemon.conf successfully configured"
    else
        echo -e "${red}Fail${NC}: updating /etc/pulse/daemon.conf"
    fi

# Fonts
sudo cp ~/scripts/setup/fonts/* /usr/share/fonts
   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: fonts copied into /usr/share/fonts"
    else
        echo -e "${red}Fail${NC}: fonts not setup"
    fi

# youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: youtube-dl succesfully installed /usr/local/bin/youtube-dl, add execute permission"
    else
        echo -e "${red}Fail${NC}: youtube-dl install"
    fi

sudo chmod a+rx /usr/local/bin/youtube-dl
   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: youtube-dl can now be executed"
    else
        echo -e "${red}Fail${NC}: youtube-dl does not have execution permission"
    fi

#########################################################################
# Development Setup
#########################################################################

#########################################################################
# NODE.JS 
#########################################################################

# Install Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: curled nvm install script"
    else
        echo -e "${red}Fail${NC}: curl nvm install script"
    fi

# Install NVM from curled script
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: nvm is ready and added to .profile"
    else
        echo -e "${red}Fail${NC}: failed installing nvm"
    fi

# Install Node
nvm install node

   if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: node successfully installed"
    else
        echo -e "${red}Fail${NC}: node not installed"
    fi

# Install npm packages
NODE_PACKAGES=(

)


# Loop over Array of packages and output it to console
for package in "${NODE_PACKAGES[*]}";
do
    npm install -g $package -y
    if [ $? = 0 ]
    then
        echo -e "${green}OK${NC}: $package successfully installed"
    else
        echo -e "${red}Fail${NC}: $package installation failed"
    fi
done

#########################################################################
# PYTHON 
#########################################################################
sudo add-apt-repository ppa:deadsnakes/ppa

if [ $? = 0 ]
then
        echo -e "${green}OK${NC}: added deadsnakes python repository"
else
        echo -e "${red}Fail${NC}: could not add deadsnakes python repository"
fi

sudo apt update

sudo apt install python3.10

if [ $? = 0 ]
then
        echo -e "${green}OK${NC}: installing python call with python3"
else
        echo -e "${red}Fail${NC}: installing python"
fi

sudo ln -s /usr/bin/python3.10 /usr/bin/python

if [ $? = 0 ]
then
        echo -e "${green}OK${NC}: symlink for python 3.10 setup"
else
        echo -e "${red}Fail${NC}: symlink for python3.10"
fi

