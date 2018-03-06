
if [[ -s ~/Library/Android/sdk/platform-tools ]]; then
    export PATH=~/Library/Android/sdk/platform-tools:$PATH
fi

# Auto setting by github.com/m4kvn/scripts
if [ -s /Users/m4kvn/git/m4kvn/scripts ]; then
    source /Users/m4kvn/git/m4kvn/scripts/profile
fi

# rbenv settings
if [ -s ~/.rbenv ]; then
    export PATH=${HOME}/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi
