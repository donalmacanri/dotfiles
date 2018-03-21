#!/bin/zsh

set -o emacs

export ZSH=$HOME/.dotfiles/zsh

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($ZSH/*.zsh)

# load the path files
for file in ${(M)config_files}
do
  source $file
done

if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source `brew --prefix`/etc/grc.bashrc
fi

# NVM config
if brew ls --versions nvm > /dev/null; then
  export NVM_DIR="$HOME/.nvm"
  source "$(brew --prefix nvm)/nvm.sh"
  nvm use --lts
fi
