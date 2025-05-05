#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Demander le nom d'utilisateur
echo "Enter your username:"
read USERNAME
USERNAME=$(echo "$USERNAME" | sed 's/^ *//;s/ *$//')

# Rechercher l'utilisateur
USER_RESULT=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")
USER_RESULT=$(echo "$USER_RESULT" | sed 's/^ *//;s/ *$//')

if [[ -z $USER_RESULT ]]; then
  # Nouvel utilisateur
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=0
else
  # Utilisateur existant
  IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_RESULT"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Générer un nombre aléatoire entre 1 et 1000
SECRET_NUMBER=$((1 + RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0

# Boucle de jeu
while true; do
  read GUESS
  ((NUMBER_OF_GUESSES++))

  # Vérifier si c'est un entier
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

# Mettre à jour les stats
NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))

if [[ $BEST_GAME -eq 0 || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
  $PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID" > /dev/null
else
  $PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE user_id=$USER_ID" > /dev/null
fi
