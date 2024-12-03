#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align --tuples-only -c"

if [[ -z $1 ]]
  then
  echo "Please provide an element as an argument."
  else 
  #check if it is a number
    if [[ "$1" =~ ^[0-9]+$ ]]; then
    # check if this element number exists 
    echo "this is a number"
    fi
  #check type of parameter? 
  # no.  input is one of atomic_number, symbol or name. 
  # 
fi