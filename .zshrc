# Path to your oh-my-zsh installation.
export ZSH="/home/zettlrobert/.oh-my-zsh"
ZSH_THEME="garyblessington"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias bat='batcat'

#######################################################################################################################
# Navigation
#######################################################################################################################
alias webdev="cd $HOME/development/web"
alias godev="cs $HOME/development/go/src/github.com/zettlrobert/"


#######################################################################################################################
# Applications
#######################################################################################################################
alias bitwarden="cd $HOME/bin/Bitwarden/ && ./Bitwarden-*.AppImage &"


#######################################################################################################################
# Dotfiles in Git bare repository
#######################################################################################################################
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


#######################################################################################################################
# NVIM - NODE
#######################################################################################################################
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


#######################################################################################################################
# Android
#######################################################################################################################
export ANDROID_SDK_ROOT=$HOME/bin/Android/Sdk 
export ANDROID_HOME=$HOME/bin/Android/Sdk

# avdmanager, sdkmanager
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin

# adb, logcat
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

#######################################################################################################################
# GO
#######################################################################################################################
export PATH=$PATH:/usr/local/go/bin

export GOROOT=/usr/local/go
export GOPATH=$HOME/development/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin




