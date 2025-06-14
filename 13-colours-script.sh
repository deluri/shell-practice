#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run this script with root user $N"
    exit 1
else
    echo "You are running with root user"
fi

VALIDATE(){
   if [ $1 -eq 0 ]
   then
       echo -e "Installing $2 is....$G SUCCESS $N"
   else
       echo -e "Installing $2 is....$R FAILURE $N"
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
    echo -e "nothing to do MYSQL...$Y already installed $N"
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install python3"
dnf install Python3 -y
VALIDATE $? "python3"
else
    echo -e "nothing to do python...$Y already installed $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install nginx"
dnf install nginx -y
VALIDATE $? "nginx"
else
    echo -e "nothing to do nginx...$Y already installed $N"
fi