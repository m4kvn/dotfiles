# Created by newuser for 5.4.2

source ~/.zplug/init.zsh
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting"
zplug load

# prompt
PROMPT='%F{white}%* '$PROMPT

# import path from bash
setopt no_global_rcs
if [ -s $HOME/.bash_profile ]; then
    . $HOME/.bash_profile
fi
typeset -U path PATH
