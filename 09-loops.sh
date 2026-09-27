#!/bin/bash

USERID=$(id -u)
OGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

R="\E[31m"
G="\E[32m"
Y="\E[33m"
N="\E[0m"


#check root access or not


if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are you trying to install
# second arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo -e"$TIMESTAMP [ERROR]: Installing $1 is ... $R FAILED $W" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e"$TIMESTAMP [INFO]: Installing $1 is ... $G SUCCESS $W" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    echo -e"$TIMESTAMP [INFO]: Installing $package" | tee -a $LOGS_FILE
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo -e"$TIMESTAMP [INFO]: $package already installed ... $Y SKIPPING $W" | tee -a $LOGS_FILE
    fi
done