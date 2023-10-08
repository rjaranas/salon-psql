#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
# rebuild db 
# echo $(psql -U postgres < salon.sql)
# echo $($PSQL "TRUNCATE appointments, services, customers RESTART IDENTITY")
# echo $($PSQL "INSERT INTO services(name) VALUES('Haircut'), ('Dye'), ('Style')")

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"
  echo -e "\n1) Haircut \n2) Dye \n3) Style"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) DYE ;;
    3) STYLE ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CUT() {

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  FIND_CUSTOMER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
  FIND_SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id='$SERVICE_ID_SELECTED'")

  if [[ -z $FIND_CUSTOMER_PHONE ]]
  then
    echo -e "\nI could not find a record for that phone number.\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    echo -e "\nWhat time would you like your $FIND_SERVICE_NAME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    FIND_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM CUSTOMERS WHERE name='$CUSTOMER_NAME'")
    echo -e "\nI have put you down for a $(echo $FIND_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($FIND_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $FIND_SERVICE_NAME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    FIND_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nI have put you down for a $(echo $FIND_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($FIND_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
}

DYE() {

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  FIND_CUSTOMER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
  FIND_SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id='$SERVICE_ID_SELECTED'")

  if [[ -z $FIND_CUSTOMER_PHONE ]]
  then
    echo -e "\nI could not find a record for that phone number.\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    echo -e "\nWhat time would you like your $FIND_SERVICE_NAME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    FIND_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM CUSTOMERS WHERE name='$CUSTOMER_NAME'")
    echo -e "\nI have put you down for a $(echo $FIND_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($FIND_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $FIND_SERVICE_NAME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    FIND_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nI have put you down for a $(echo $FIND_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($FIND_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
}

STYLE() {

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  FIND_CUSTOMER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
  FIND_SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id='$SERVICE_ID_SELECTED'")

  if [[ -z $FIND_CUSTOMER_PHONE ]]
  then
    echo -e "\nI could not find a record for that phone number.\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    echo -e "\nWhat time would you like your $FIND_SERVICE_NAME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    FIND_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM CUSTOMERS WHERE name='$CUSTOMER_NAME'")
    echo -e "\nI have put you down for a $(echo $FIND_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($FIND_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $FIND_SERVICE_NAME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    FIND_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nI have put you down for a $(echo $FIND_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($FIND_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
}

# EXIT() {
#   echo -e "\nThank you for visiting.\n"
# }


MAIN_MENU