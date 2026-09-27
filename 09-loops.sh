#!/bin/bash

USERID=$(id -u)
OGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")


#check root access or not


if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are you trying to install
# second arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [ERROR]: Installing $1 is ... FAILED"
        exit 1
    else
        echo "$TIMESTAMP [INFO]: Installing $1 is ... SUCCESS"
    fi
}

for package in $@
do
    echo "Installing $package"
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo "$TIMESTAMP [INFO]: $package already installed ... SKIPPING"
    fi
done