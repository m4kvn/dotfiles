#!/bin/sh

if [ ! -n "$DOTFILES_ROOT" ]; then
    printf '[dotfiles]\e[31m $DOTFILES_ROOT is not found.\n\e[m'
    exit 1
fi

if [ -s $DOTFILES_ROOT ]; then
    printf "[dotfiles]\e[31m $DOTFILES_ROOT is already exists.\n\e[m"
    exit 1
fi

git clone https://github.com/m4kvn/dotfiles.git $DOTFILES_ROOT
. $DOTFILES_ROOT/symboliclink.sh
