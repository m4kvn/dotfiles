# Created by newuser for 5.4.2

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# highlight
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# history
zplug "zsh-users/zsh-history-substring-search"

# completion
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# etc
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, frozen:1
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi, on:junegunn/fzf-bin

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# prompt
PROMPT='%F{white}%* '$PROMPT

# alias
alias ls="ls -G"
alias ll="ls -lh"
alias la="ls -la"

# import path from bash
setopt no_global_rcs
if [ -s $HOME/.bash_profile ]; then
    . $HOME/.bash_profile
fi
typeset -U path PATH
