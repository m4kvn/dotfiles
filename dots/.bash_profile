
# scripts
if [ -s ~/.scripts ]; then
    export PATH=~/.scripts/bin:$PATH
fi

# adb
if [ -s ~/Library/Android/sdk/platform-tools ]; then
    export PATH=~/Library/Android/sdk/platform-tools:$PATH
fi

# rbenv
if [ -s ~/.rbenv ]; then
    export PATH=~/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# pyenv
if [ -s ~/.pyenv ]; then
    export PYENV_ROOT=~/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

# nvm
if [ -s ~/.nvm ]; then
    export NVM_DIR="~/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
