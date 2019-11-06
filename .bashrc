#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Use z script to navigate 
. /home/judith/z/z.sh

alias   ga='git add'
alias   gs='git status'
alias   gb='git branch'
alias   gc='git commit'
alias   gd='git diff'
alias  gdc='git diff --cached'
alias   ge='git checkout'
alias   gl='git log'
alias  glh='git --no-pager log -n 1'
alias   gf='git fetch'
alias   gp='git pull'
alias  grh='git reset --hard'
alias  gup='git submodule update'
alias  gpu='git push'
