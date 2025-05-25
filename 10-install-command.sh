#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root user"
    exit 1
else
    echo "You are running with root user"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing MySql is....SUCCESS"
else
    echo "Installing MySql is....FAILURE"
fi