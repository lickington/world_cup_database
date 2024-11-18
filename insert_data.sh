#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams");
echo $($PSQL "INSERT INTO teams (name) VALUES('France')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Croatia')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Belgium')");
echo $($PSQL "INSERT INTO teams (name) VALUES('England')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Russia')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Sweden')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Brazil')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Uruguay')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Colombia')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Switzerland')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Japan')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Mexico')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Denmark')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Spain')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Portugal')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Argentina')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Germany')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Netherlands')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Costa Rica')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Chile')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Nigeria')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Algeria')");
echo $($PSQL "INSERT INTO teams (name) VALUES('Greece')");
echo $($PSQL "INSERT INTO teams (name) VALUES('United States')");

CSV_FILE="games.csv"

while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  if [ "$year" != "year" ]; then

   
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")

   

    echo $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals)");

   
  fi
done < "$CSV_FILE"