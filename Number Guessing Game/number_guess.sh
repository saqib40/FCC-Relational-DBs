<<-COMMENT
CREATE TABLE user_data(
    username VARCHAR(22) NOT NULL, 
    games_played INT NOT NULL DEFAULT(0), 
    best_game INT NOT NULL DEFAULT(0)
);
COMMENT

#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

LENGTH=${#USERNAME}
if [[ $LENGTH -lt 22 ]]
then
  USER_LOOKUP=$($PSQL "SELECT username FROM user_data WHERE username='$USERNAME'")
  #if no user is found, implies a new user
  if [[ -z $USER_LOOKUP ]]
  then
    # add to DB
    USER_INSERT=$($PSQL "INSERT INTO user_data(username) VALUES('$USERNAME')")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  else
    DATA_LOOKUP=$($PSQL "SELECT games_played, best_game FROM user_data WHERE username='$USERNAME'")
    IFS='|' read -r GAMES_PLAYED BEST_GAME <<< "$DATA_LOOKUP"
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  NUMBER_OF_GUESSES=0;
  #generate a random number
  RANDOM_NUMBER=$((RANDOM%1001 + 1))
  echo "for testing $RANDOM_NUMBER"
  #ask user for random number
  echo -e "\nGuess the secret number between 1 and 1000:\n"
  read GUESSED_NUMBER
  ((NUMBER_OF_GUESSES++))
  #now compare using a loop
  until [[ $GUESSED_NUMBER -eq $RANDOM_NUMBER ]]
  do
    #if it isn't an Integer
    if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "That is not an integer, guess again:"
      read GUESSED_NUMBER
      ((NUMBER_OF_GUESSES++))
      continue
    elif [[ $GUESSED_NUMBER -lt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      read GUESSED_NUMBER
      ((NUMBER_OF_GUESSES++))
      continue
    else
      echo -e "\nIt's higher than that, guess again:"
      read GUESSED_NUMBER
      ((NUMBER_OF_GUESSES++))
      continue
    fi
  done
  #when you hit it right
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE user_data SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
  fi
  UPDATE_GAME_PLAYED=$($PSQL "UPDATE user_data SET games_played = $GAMES_PLAYED + 1 WHERE username = '$USERNAME'")
fi