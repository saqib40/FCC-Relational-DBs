<<-COMMENT

#You should capitalize the first letter of all the symbol values in the elements table. 
#Be careful to only capitalize the letter and not change any others
UPDATE elements SET symbol = CONCAT(UPPER(LEFT(symbol,1)), RIGHT(symbol, LENGTH(symbol) - 1)) WHERE LEFT(symbol,1) != UPPER(LEFT(symbol,1));

# to remove trailing zeroes
UPDATE properties 
SET atomic_mass = TRIM(TRAILING '0' FROM atomic_mass::text)::numeric 
WHERE atomic_mass::text ~ '\.\d*0+$';

COMMENT

#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#if there's no argument
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if it's a number; atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    RESULT=$($PSQL "SELECT symbol, name, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number='$1'")
  # if it's a word of length 1 or 2; symbol
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then
    RESULT=$($PSQL "SELECT symbol, name, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
  # if it's a word; name
  else
    RESULT=$($PSQL "SELECT symbol, name, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
  fi
  # if nothing is found
  if [[ -z $RESULT ]]
  then
    echo "I could not find that element in the database."
  # if something is found
  else
    # you gotta format the result
    echo $RESULT | while IFS="|" read SYMBOL NAME AN AM MP BP type
    do
      echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $type, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
fi