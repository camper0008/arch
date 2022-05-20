#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='\u $(prompt-shortener) \$ '

# aliases
alias pacman="sudo pacman"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"

export PATH="$PATH
:$HOME/.yarn/bin
:$HOME/.local/share/gem/ruby/3.0.0/bin
:$HOME/.cargo/bin"

export EDITOR="nvim"
