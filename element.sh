#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

if [[ -z $1 ]]
  then
  echo "Please provide an element as an argument."
  else 
  #check if it is a number
    if [[ "$1" =~ ^[0-9]+$ ]]; then 
      # check if this element number exists 
      ATOMIC_NUMBER_RESULT=$($PSQL "select atomic_number, symbol, name from elements where atomic_number = $1")
      #10|Ne|Neon
      if [[ -z $ATOMIC_NUMBER_RESULT ]] 
        then
        echo "This element number is not in the database."
      else 
        INFORMATION_QUERY_RESULT=$($PSQL "select * from elements FULL JOIN properties USING(atomic_number) where atomic_number = $1")
        echo "$INFORMATION_QUERY_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE BAR TYPE_ID
          do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        done
      fi
      else # if is not a number
      #check if is valid symbol or name
       ATOMIC_VARCHAR_RESULT=$($PSQL "select * from elements where symbol = '$1' OR name = '$1")
       echo "$ATOMIC_VARCHAR_RESULT"


    fi
  #check type of parameter? 
  # no.  input is one of atomic_number, symbol or name. 
  # 
fi