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

# make a alias to run a specific python version without
# changing symbolic links (dangerous)
#alias python2='/usr/bin/python2.7'
alias python3='/usr/bin/python3.6'
#alias python='/usr/bin/python3.6' -- normally causes problems
#alias pip='/usr/bin/pip3'

# list block devices
alias lsblk='lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,LABEL,FSTYPE,MOUNTPOINT,UUID'

# ip in place of ifconfig, and intercept windows ipconfig command
function ifconfig { echo '**** ifconfig is deprecated. Use ip instead.****'; echo; ip -d address; }
function ipconfig { echo '**** ipconfig is a MS Windows command. Using ip instead.'; echo; ip -d address; }

