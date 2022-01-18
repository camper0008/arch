#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\u \W\n└ \$ '

# aliases
alias pacman="sudo pacman"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
