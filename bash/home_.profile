# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
#
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# From man bash:
# "... When bash is invoked as an interactive login shell, or as a
# non-interactive
# shell with the --login option, it first  reads  and  executes  commands
# from  the  file  /etc/profile,  if that file exists.  After reading that
# file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that
# order, and reads and executes commands from the first one that exists and is readable.  
# The --noprofile option  may  be  used when  the  shell  is started to inhibit
# this behavior. "

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
# use the pathappend function if it exists as it will only
# appen dthe path if it is not already in the path
if [ -d "$HOME/bin" ] ; then
  # see if pathappend function exitst
  declare -F pathappend > /dev/null
  if [[ $? -eq 0 ]] ; then
    # pathappend exists, so use it
    pathappend "$HOME/bin"
  else
    # path append does not exits, so prepend manually
    PATH=$HOME/bin:$PATH
  fi
fi
