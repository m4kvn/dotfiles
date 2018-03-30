#!/bin/sh

if [ ! -n "$DOTFILES_ROOT" ]; then
    printf '[dotfiles]\e[31m $DOTFILES_ROOT is not found.\n\e[m'
    exit 1
fi

if [ ! -s $DOTFILES_ROOT ]; then
    printf "[dotfiles]\e[31m $DOTFILES_ROOT is not exists.\n\e[m"
    exit 1
fi

cd $DOTFILES_ROOT

if [ ! -n "$(git status | grep -w 'working tree clean')" ]; then
    printf "[dotfiles]\e[31m working tree is not clean.\n\e[m"
    exit 1
fi

. $DOTFILES_ROOT/fetch.sh
git pull origin master
. $DOTFILES_ROOT/symboliclink.sh
