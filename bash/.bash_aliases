# ~/.bash_aliases
# command aliases -- called by /etc/bash.bashrc
# Dispite the name, use functions in most cases instead of aliases for more robustness 

# list 
# long (l)ist, (A)lmost all (exclude . and ..), classify (F), (h)uman readable file sizes
# use $@ instead of $1 in case additional command line options are specified
# i.e. lsl -d ba* is equivelent of ls -lAFH --color=auto -d ba*   (list directories that start with 'ba')

function lsl { ls -lAFh --color=auto "$@"; }
function ll { ls -lAFh --color=auto "$@"; }
# sort by size
function lss { ls -lAFhS --color=auto "$@"; }
function lls { ls -lAFhS --color=auto "$@"; }

# file and directgory related
function copy { cp "$@"; }

# directory related
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

# make a directory and change to it
function mcd () { mkdir -p $1; cd $1; }

# python related
alias pip=pip3

