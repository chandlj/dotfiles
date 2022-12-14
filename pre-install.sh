#!/bin/bash

# Install oh-my-zsh if it does not exist
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo 'Installing oh-my-zsh'
  /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# # Change default shell
# if [ ! $0 = "-zsh" ]; then
#   echo 'Changing default shell to zsh'
#   chsh -s /bin/zsh
# else
#   echo 'Already using zsh'
# fi