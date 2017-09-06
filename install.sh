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

    if has "python"; then
        brew uninstall --ignore-dependencies python
    fi

    pyenv install 2.7.10
    pyenv global system 2.7.10
    pip install --upgrade pip
fi

# Ruby
if ! has "rbenv"; then
    brew install rbenv
fi


