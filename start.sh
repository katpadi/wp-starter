#!/bin/sh
export MYSQL_ROOT_PASSWORD=password # change to whatever password
#export MYSQL_DATABASE=password # change_me to whatever DB name
fig up -d mysql
echo "Waiting for 5 seconds for DB to start up";
sleep 5
fig up -d --no-deps wordpress
echo "######################";
echo "\nWoot! We're done!\n";
echo "######################";