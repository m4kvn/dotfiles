
# scripts
if [ -s $HOME/.scripts ]; then
    export PATH=$HOME/.scripts/bin:$PATH
fi

# adb
if [ -s ~/Library/Android/sdk/platform-tools ]; then
    export PATH=~/Library/Android/sdk/platform-tools:$PATH
fi

# rbenv
if [ -s ~/.rbenv ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# pyenv
if [ -s ~/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

# nvm
if [ -s $HOME/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi
