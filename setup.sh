#!/bin/sh

dir=$HOME/.dotfiles
[ -d "$dir" ] && echo "$dir is already exists" && exit 1
git clone https://github.com/m4kvn/dotfiles.git $dir
sh $dir/symboliclink.sh
