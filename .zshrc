
export ZSH="/home/zettlrobert/.oh-my-zsh"
ZSH_THEME="garyblessington"
ZSH_THEME="afowler"
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
alias lexa='exa --icons --long -a --group --header --bytes'

# Copy current path to clipboard (xclip) required
alias ypp='pwd | xclip -selection clipboard'

######################################################################################################################
# Git Aliases
######################################################################################################################
alias pretty-git-log='git log --pretty=oneline --graph --decorate --all'
alias gdiff='git diff | batcat'

######################################################################################################################
# Projects
#######################################################################################################################
alias eventprofil='cd $HOME/development/web/eventprofil'
alias fsc-lib='cd /media/zettlrobert/348467f7-b4c5-4602-b597-1c32fbd953ba/home/robertzettl/Development/FSC/component-library'
alias eiga='cd $HOME/development/web/eiga'
alias eigafe='cd $HOME/development/web/eigafe'
alias mobilehead='cd $HOME/development/web/mobileheads'
alias zr-printing='cd $HOME/development/web/zr-expense-printing'
alias cuf='cd $HOME/development/web/cleanundfrisch'


#######################################################################################################################
# Navigation
#######################################################################################################################
alias webdev="cd $HOME/development/web"
alias godev="cd $HOME/development/go/src/github.com/zettlrobert/"
alias notes="cd $HOME/documents/notes"


#######################################################################################################################
# Applications
#######################################################################################################################
alias bitwarden="cd $HOME/bin/Bitwarden/ && ./Bitwarden-*.AppImage &"
alias obsidian="cd $HOME/bin/Obsidian/ && ./Obsidian-*.AppImage &"
alias postman="cd $HOME/bin/Postman/ && ./Postman &"
alias burniso="cd $HOME/bin/BalenaEtcher/ && ./balenaEtcher-*.AppImage &"


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


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
