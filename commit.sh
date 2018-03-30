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

if [ -n "$(git status | grep -w 'working tree clean')" ]; then
    printf "[dotfiles]\e[36 working tree is clean.\n\e[m"
    exit 0
fi

git add -A
git commit -m "Update at $(date "+%Y-%m-%d %T")" || true
git push origin master
