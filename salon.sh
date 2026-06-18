#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c"

echo -e "Welcome to my Salon, how can I help you?"

while [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
do
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"

  echo -e "\nPlease Enter your service:"
  read SERVICE_ID_SELECTED
done

echo -e "\nPlease Enter your Phone no:"
read CUSTOMER_PHONE

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE';")

if [[ -z $CUSTOMER_ID ]]
then
  echo -e "\nI don't have a record for that phone number, Please Enter your name:"
  read CUSTOMER_NAME

  INSERT_CUSTOMER=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
  

  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE';")
else
  CUSTOMER_NAME=$($PSQL "select name from customers where customer_id = $CUSTOMER_ID;")
fi

SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED;")

echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

INSERT_APPOINTMENT=$($PSQL "insert into appointments(time, service_id, customer_id) values('$SERVICE_TIME', $SERVICE_ID_SELECTED, $CUSTOMER_ID);")

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
