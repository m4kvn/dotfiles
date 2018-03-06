# Created by newuser for 5.4.2

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug load

PROMPT='%F{white}%* '$PROMPT

# nvm settings
if [ -s "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi