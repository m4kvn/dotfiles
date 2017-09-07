# is_exists returns true if executable $1 exists in $PATH
is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

# has is wrapper function
has() {
    is_exists "$@"
}

# Homebrew
if ! has "brew"; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Python
if ! has "pyenv"; then
    brew install pyenv

    if has "python -V"; then
        brew uninstall --ignore-dependencies python
    fi

    pyenv install 2.7.10
    pyenv global system 2.7.10
    pip install --upgrade pip

    pyenv install 3.5.0
fi

# AWS
if ! has "aws"; then
    pip install awscli
fi

# Ruby
if ! has "rbenv"; then
    brew install rbenv
fi

# tmux
if ! has "tmux"; then
    brew install tmux
fi

# Go
if ! has "go"; then
    brew install go
fi

# lessに色付け用
if ! has "source-highlight"; then
    brew install source-highlight
fi

# Powerline
if ! has "powerline-daemon -h"; then
    echo "Installing powerline-status"
    pip install powerline-status
fi

# npm
if ! has "npm"; then
    echo "Installing npm"
    brew install npm
fi

# jsonlint
if ! has "jsonlint"; then
    echo "Installing jsonlint"
    npm install jsonlint -g
fi

# jq
if ! has "jq"; then
    echo "Installing jq"
    brew install jq
fi

# Docker for Mac
if ! has "docker"; then
    echo "Installing docker"
    brew cask install docker
fi
