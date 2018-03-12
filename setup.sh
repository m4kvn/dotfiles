#!/bin/sh

dir=$HOME/.dotfiles

if [ -d "$dir" ]; then
    cd $dir && git fetch && git pull origin master
else
    git clone https://github.com/m4kvn/dotfiles.git $dir
fi
sh $dir/symboliclink.sh
