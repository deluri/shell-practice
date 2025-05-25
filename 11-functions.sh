#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root user"
    exit 1
else
    echo "You are running with root user"
fi

VALIDATE(){
   if [ $1 -eq 0 ]
   then
       echo "Installing $2 is....SUCCESS"
   else
       echo "Installing $2 is....FAILURE"
       exit 1
   fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed...going to install MySQl"
dnf install mysql -y
VALIDATE $? "mysql"
else
    echo "MYSQL is already installed..nothing to do"
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install python3"
dnf install Python3 -y
VALIDATE $? "python3"
else
    echo "python3 is already installed..nothing to do"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install nginx"
dnf install nginx -y
VALIDATE $? "nginx"
else
    echo "nginx is already installed..nothing to do"
fi