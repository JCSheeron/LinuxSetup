# ~/.bash_functions
# called by /etc/bash.bashrc
# Intended for more complicated functions beyond what would be used for an alias

# see if the passed in parameter is a function
# output and return 0 (true) if it is, or 1 (false) if it is not
function isFunction() {
  declare -F $1 > /dev/null
  if [[ $? -eq 0 ]]; then
    echo 0
    return 0
  else
    echo 1
    return 1
  fi
}

# add (prepend) the first parameter to the $PATH variable
# if "after" is used as the second parameter, the first
# parameter is appended to the end
pathappend () {
  if ! echo "$PATH" | /bin/grep -Eq "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH="$PATH:$1"
    else
      PATH="$1:$PATH"
    fi
  fi
}
