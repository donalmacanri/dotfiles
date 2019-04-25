#!/bin/zsh

set -o emacs

export ZSH=${HOME}/.zsh

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

if [[ $TILIX_ID ]]; then
  source /etc/profile.d/vte-2.91.sh
fi

# all of our zsh files
typeset -U config_files
config_files=($ZSH/*.zsh)

# load the path files
for file in ${(M)config_files}
do
  source $file
done
