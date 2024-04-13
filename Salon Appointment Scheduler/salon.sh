<<-COMMENT
CREATE TABLE 
customers(
    customer_id SERIAL PRIMARY KEY, 
    name VARCHAR(30),
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE 
services(
    service_id SERIAL PRIMARY KEY, 
    name VARCHAR(30)
);

CREATE TABLE 
appointments(  
    appointment_id SERIAL PRIMARY KEY,
    time VARCHAR(20), 
    customer_id INT, 
    service_id INT, 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id), 
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);
COMMENT

#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICES() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICE_LIST=$($PSQL "SELECT * FROM services ORDER BY service_id")
  #echo "$SERVICE_LIST" | sed 's/ |/)/'
  echo -e "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE
  do
    ID=$(echo $SERVICE_ID | sed 's/ //g')
    NAME=$(echo $SERVICE | sed 's/ //g')
    echo "$ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  if [[ -z $SERVICE_ID_SELECTED || ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICES "I could not find that service. What would you like today?"
  else
    REQUESTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    if [[ -z $REQUESTED_SERVICE ]]
  then
    SERVICES "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # see if it's previous user
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # if not
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $REQUESTED_SERVICE, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')"
    read SERVICE_TIME
    #NEW_SERVICE=$($PSQL "INSERT INTO services(name) VALUES('$CUSTOMER_NAME')")
    #SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$REQUES'")
    NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
    if [[ $NEW_APPOINTMENT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $(echo $REQUESTED_SERVICE | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    fi
  fi
  fi
}
SERVICES