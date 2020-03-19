  # ~/.bashrc
  # Only called by bash for shells that are interactive and non-login
  #
  # From man bash:
  # "... When  an  interactive  shell  that  is not a login shell is started, bash
  # reads and executes commands from /etc/bash.bashrc and ~/.bashrc, if these
  # files exist.  This may be inhibited by using the --norc option.  The
  # --rcfile file option will force bash to read and execute  commands
  # from  file instead of /etc/bash.bashrc and ~/.bashrc."

  ### START-Keychain ###
  # use the ssh agent and the tp2_home key
  # Keychain will re-use ssh-agent between logins
  eval $(/usr/bin/keychain --eval --agents ssh /home/jcsheeron/.ring/EngrLt_id)
  
  ### End-Keychain ###

  # user defined aliase -- put them in .bash_aliases
  # This is already in /etc/bash.bashrc, so commented out here
  #  if [ -f ~/.bash_aliases ]; then
  #    . ~/.bash_aliases
  #  fi
  
