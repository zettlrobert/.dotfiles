# Source ZAP
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Example install plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Example install completion
plug "esc/conda-zsh-completion"

# My Prompt
plug "zettlrobert/simple-prompt"

# Defaults
export EDITOR=nvim

# User configuration
alias bat='batcat'
alias ll='exa --icons --long -a --group --header --bytes'

# Pretty file output
alias lexa='exa --icons --long -a --group --header --bytes'

# Copy current path to clipboard (xclip) required
alias ypp='pwd | xclip -selection clipboard'

# Git Aliases
alias pretty-git-log='git log --pretty=oneline --graph --decorate --all'
alias gdiff='git diff | batcat'

# Fzf with preview
alias fzfp="fzf --preview 'bat --color=always {}'"

# Projects
alias eventprofil='cd $HOME/development/web/eventprofil'
alias fsc-lib='cd /media/zettlrobert/348467f7-b4c5-4602-b597-1c32fbd953ba/home/robertzettl/Development/FSC/component-library'
alias eiga='cd $HOME/development/web/eiga'
alias eigafe='cd $HOME/development/web/eigafe'
alias mobilehead='cd $HOME/development/web/mobileheads'
alias zr-printing='cd $HOME/development/web/zr-expense-printing'
alias cuf='cd $HOME/development/web/cleanundfrisch'
alias zeronvim='cd $HOME/development/zeronvim'

# Navigation
alias webdev="cd $HOME/development/web"
alias development="cd $HOME/development"
alias godev="cd $HOME/development/go/src/github.com/zettlrobert/"
alias notes="cd $HOME/documents/notes"

# Applications
alias bitwarden="cd $HOME/bin/Bitwarden/ && ./Bitwarden-*.AppImage &"
alias obsidian="cd $HOME/bin/Obsidian/ && ./Obsidian-*.AppImage &"
alias postman="cd $HOME/bin/Postman/ && ./Postman &"
alias burniso="cd $HOME/bin/BalenaEtcher/ && ./balenaEtcher-*.AppImage &"

# Dotfiles Git bare Repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# NVIM - NODE
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Android
export ANDROID_SDK_ROOT=$HOME/bin/Android/Sdk 
export ANDROID_HOME=$HOME/bin/Android/Sdk

# avdmanager, sdkmanager
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin

# adb, logcat
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

# GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/development/go

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
