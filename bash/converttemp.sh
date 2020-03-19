#!/bin/bash

# CONVERTATEMP - Temperature conversion script that lets the user enter
#   a temperature in any of Fahrenheit, Celsius, Kelvin, or Rankine and receive the
#   equivalent temperature in the other units as the output.  If no unit
#   is given, then the temperature is converted to/from all units.

# in case of error, print out the usage instructions
function usage {
  cat << EOF >&2
Usage: $0 temperature [F|C|K|R]
where the suffix (not case sensitive) :
   F  indicates input is in Fahrenheit 
   C  indicates input is in Celsius
   K  indicates input is in Kelvin
   R  indicates input is in Rankine
EOF
}

if [ $# -lt 1 -o $# -gt 2 ] ; then
  # Error ... no arguments or greater than two.
  # Show usage and get out
 usage
 exit 1
elif [ $# -eq 1 ] ; then
  # temp and unit all in the same argument (no space)
  # temp is the possibly floating point value at the beginning
  temp="$(echo $1 | grep -E -o '^[+-]?([0-9]*[\.])?[0-9]+' )" 
  # if the temperature is not at the beginning of the 1st parameter, then
  # the input is faulty
  if [[ -z "${temp// }" ]] ; then
    # if temp is empty, or only spaces then print usage and exit
   usage
   exit 2
  fi
  # unit is the correct letter at the end. Read at most one, and make it upper case
  unit="$(echo $1 | grep -E -o '[cfkrCFKR]' | tr '[:lower:]' '[:upper:]' )"
  # if a unit was not specified, then the below case statement will
  # fall thru, and all conversions will be done
elif [ $# -eq 2 ] ; then
  # temp in argument 1 and unit in argument 2 separated by white space
  # temp is a possibly floating point 
  # if the temperature is not at the beginning of the 1st parameter, then
  # the input is faulty
  temp="$(echo $1 | grep -E -o '^[+-]?([0-9]*[\.])?[0-9]+' )" 
  if [[ -z "${temp// }" ]] ; then
    # if temp is empty, or only spaces then print usage and exit
   usage
   exit 4
  fi
  # unit is read as one correct character, and then converted to upper case
  unit="$(echo $2 | grep -E -o '^[cfkrCFKR]?' | tr '[:lower:]' '[:upper:]' )"
  if [[ -z "${unit// }" ]] ; then
    # if unit is empty, or only spaces then print usage and exit
   usage
   exit 5
  fi
else
  # Can't get here...included for completeness and just in case
  # Show usage and get out
 usage
 exit 6
fi

case $unit
in
  F ) # Fahrenheit to Celsius formula:  Tc = (F -32 ) / 1.8
  echo "Convert from $temp degrees Fahrenheit"
  farn="$temp"
  cels="$(echo "scale=2; ($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2; $cels + 273.15" | bc)"
  rank="$(echo "scale=2; $farn + 459.67" | bc)"
  echo "Celsius    = $cels"
  echo "Kelvin     = $kelv"
  echo "Rankine    = $rank"
  ;;

  C ) # Celsius to Fahrenheit formula: Tf = (9/5)*Tc+32
  echo "Convert from $temp degrees Celsius"
  cels=$temp
  kelv="$(echo "scale=2; $cels + 273.15" | bc)"
  farn="$(echo "scale=2; ((9/5) * $cels) + 32" | bc)"
  rank="$(echo "scale=2; $farn + 459.67" | bc)"
  echo "Fahrenheit = $farn"
  echo "Kelvin     = $kelv"
  echo "Rankine    = $rank"
  ;;

  K ) # Celsius = Kelvin + 273.15, then use Cels -> Fahr formula
  echo "Convert from $temp Kelvin"
  kelv=$temp
  cels="$(echo "scale=2; $kelv - 273.15" | bc)"
  farn="$(echo "scale=2; ((9/5) * $cels) + 32" | bc)"
  rank="$(echo "scale=2; $farn + 459.67" | bc)"
  echo "Fahrenheit = $farn"
  echo "Celsius    = $cels"
  echo "Rankine    = $rank"
  ;;

 R ) # Rankine = Fahrenheit + 459.67
  echo "Convert from $temp Renkine"
  rank=$temp
  farn="$(echo "scale=2; $rank - 459.67" | bc)"
  cels="$(echo "scale=2; ($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2; $cels + 273.15" | bc)"
  echo "Fahrenheit = $farn"
  echo "Celsius    = $cels"
  echo "Kelvin     = $kelv"
  ;;

  *) # no unit given. Do all conversions, one at a time
  echo "No units given"
  echo "Convert from $temp degrees Fahrenheit"
  farn="$temp"
  cels="$(echo "scale=2;($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  rank="$(echo "scale=2; $farn + 459.67" | bc)"
  echo "Celsius    = $cels"
  echo "Kelvin     = $kelv"
  echo "Rankine    = $rank"
  echo
  echo "Convert from $temp degrees Celsius"
  cels=$temp
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  farn="$(echo "scale=2;((9/5) * $cels) + 32" | bc)"
  rank="$(echo "scale=2; $farn + 459.67" | bc)"
  echo "Fahrenheit = $farn"
  echo "Kelvin     = $kelv"
  echo "Rankine    = $rank"
  echo
  echo "Convert from $temp Kelvin"
  kelv=$temp
  cels="$(echo "scale=2; $kelv - 273.15" | bc)"
  farn="$(echo "scale=2; ((9/5) * $cels) + 32" | bc)"
  rank="$(echo "scale=2; $farn + 459.67" | bc)"
  echo "Fahrenheit = $farn"
  echo "Celsius    = $cels"
  echo "Rankine    = $rank"
  echo
  echo "Convert from $temp Rankine"
  rank=$temp
  farn="$(echo "scale=2; $rank - 459.67" | bc)"
  cels="$(echo "scale=2; ($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2; $cels + 273.15" | bc)"
  echo "Fahrenheit = $farn"
  echo "Celsius    = $cels"
  echo "Kelvin     = $kelv"
  ;;
esac  


exit 0