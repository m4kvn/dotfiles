# Created by newuser for 5.4.2

# zplug
source ~/.zplug/init.zsh

# theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# completion
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# etc
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi, on:junegunn/fzf-bin
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
zplug "b4b4r07/enhancd", use:init.sh, on:junegunn/fzf-bin

# highlight
zplug "zsh-users/zsh-syntax-highlighting", defer:2

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

# for b4b4r07/enhancd
export ENHANCD_FILTER="fzf"
export EMOJI_CLI_FILTER="fzf"
