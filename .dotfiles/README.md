# Dotfiles and System Setup

## Setup Bare Git Repository

* Create .dotfiles folder in $HOME direcotry.

    git init --bare $HOME/.dotfiles

* Create an alias 'dotfiles' instead of the regular git,
  for interacting with the dotfiles repository.

    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

* We need to set the flag -local to the .dotfiles repository
  Files which are not explicitly tracked will be ignored

    dotfiles config --local status.showUntrackedFiles no

* Add the dotfiles alias to .zshrc

    echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc

