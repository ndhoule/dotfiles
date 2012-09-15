#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

PS1='[\u@\h \W]\$ '
PATH=$PATH:$HOME/bin
EDITOR=vim
PAGER=less
SVN_EDITOR=vim
export PS1
export PATH
export EDITOR
export PAGER
export SVN_EDITOR

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias lll='ls -al --color=auto'
alias webup='sudo rc.d start nginx ; sudo rc.d start mysqld ; sudo rc.d start php-fpm'
alias webdown='sudo rc.d stop nginx ; sudo rc.d stop mysqld ; sudo rc.d stop php-fpm'
