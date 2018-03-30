#!/bin/sh

if [ ! -n "$DOTFILES_ROOT" ]; then
    printf '[dotfiles]\e[31m $DOTFILES_ROOT is not exists.\n\e[m'
    exit 1
fi

if [ ! -s $DOTFILES_ROOT ]; then
    printf "[dotfiles]\e[31m $DOTFILES_ROOT is not exists.\n\e[m"
    exit 1
fi

cd $DOTFILES_ROOT && git fetch
