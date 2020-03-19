# command aliases -- called by .bashrc
# Dispite the name, use functions in most cases instead of aliases for more robustness 

# list 
# long (l)ist, (A)lmost all (exclude . and ..), classify (F), (h)uman readable file sizes
function lsl { ls -lAFh --color=auto $1; }
function ll { ls -lAFh --color=auto $1; }
# sort by size
function lss { ls -lAFhS --color=auto $1; }
function lls { ls -lAFhS --color=auto $1; }

# file and directgory related
function copy { cp $1; }

# directory related
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

# make a directory and change to it
function mcd () { mkdir -p $1; cd $1; }

