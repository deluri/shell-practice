#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script execution started at :: $(date)" | tea -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run this script with root user $N" | tea -a $LOG_FILE
    exit 1
else
    echo "You are running with root user" | tea -a  $LOG_FILE
fi

VALIDATE(){
   if [ $1 -eq 0 ]
   then
       echo -e "Installing $2 is....$G SUCCESS $N" | tea -a $LOG_FILE
   else
       echo -e "Installing $2 is....$R FAILURE $N" | tea -a $LOG_FILE
       exit 1
   fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed...going to install MySQl" | tea -a $LOG_FILE
dnf install mysql -y &>>$LOG_FILE
VALIDATE $? "mysql"
else
    echo -e "nothing to do MYSQL...$Y already installed $N" | tea -a $LOG_FILE
fi
dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install python3" | tea -a $LOG_FILE
dnf install Python3 -y &>>$LOG_FILE
VALIDATE $? "python3"
else
    echo -e "nothing to do python...$Y already installed $N" | tea -a $LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install nginx" | tea -a $LOG_FILE
dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "nginx"
else
    echo -e "nothing to do nginx...$Y already installed $N" | tea -a $LOG_FILE
fi