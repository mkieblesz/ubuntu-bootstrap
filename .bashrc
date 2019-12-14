# quit if used in shell in non-interactive mode
case $- in
    *i*) ;;
      *) return;;
esac

# expand config with additional files
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
if [ -f ~/.bash_functions ]; then
    . ~/.bash_languages
fi

# TERMINAL
# set prompt string
PS1='$(pwd | sed "s|^$HOME|~|g")$ '
# make terminal tab title same as prompt string
case "$TERM" in
    xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
    *) ;;
esac

# command history
shopt -s histappend  # overrite latest history file entries on shell exit
export HISTCONTROL=ignoreboth:erasedups  # no duplicate history entries or those starting with space and erase duplicates
export HISTSIZE=10000  # allowed history entries during bash session
export HISTFILESIZE=10000  # allowed history entries in persistent storage

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"


# COMMANDS & PROGRAMS
# less - friendly output for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# rg - ripgrep - improved grep
# ranger - command line file explorer

# skim - fuzzy finder
# fuzzy search for files in current directory with preview and if found open in vim
bind '"\C-p": "\C-avim $(sk -e --preview \"bat --color=always {}\") \C-j"'
# fuzzy search for text recrusiviely in all files in current directory and if found open in vim at correct line and column
bind '"\C-o": "\C-avim $(sk --ansi -i -c \"rg --no-ignore --hidden --color=always --line-number \\\"{}\\\"\" | cut -f 1-2 -d : | sed \"s/:/ +/g\") \C-j"'

# hstr - reverse history search
export HSTR_CONFIG=hicolor,raw-history-view,regexp-matching,static-favorites,skip-favorites-comments
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# history search chronological
bind '"\C-r": "\C-ahstr -- \C-j"'
# history search rated
bind '"\C-t": "\C-aHSTR_CONFIG=hicolor,regexp-matching,static-favorites,skip-favorites-comments hstr -- \C-j"'
# history search favourites (save in ~/.hstr_favorites)
bind '"\C-f": "\C-ahstr -f \C-j"'

# docker & docker-compose
alias d="docker"
alias dc="docker-compose"

# gcloud
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-sdk/completion.bash.inc'; fi

# ALIASES
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls='LC_COLLATE=C ls -l --group-directories-first --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# clear without removing scrollback
alias clear="printf '\33[H\33[2J'"

# LANGUAGES
# Node
export NVM_ROOT="${HOME}/.nvm"
if [ -d "${NVM_ROOT}" ]; then
    . "${NVM_ROOT}/.nvm_load.sh"
fi

# Ruby
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
    export PATH="${RBENV_ROOT}/bin:${PATH}"
    eval "$(rbenv init -)"
fi

# Python
export PYTHONDONTWRITEBYTECODE=0
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Erlang
export EVM_ROOT="${HOME}/.evm"
if [ -d "${EVM_ROOT}" ]; then
    . "${EVM_ROOT}/scripts/evm"
fi

# Go
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# Elixir (via .asdf plugin)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
