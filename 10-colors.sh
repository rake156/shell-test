#!/bin/bash

USERID=$(id -u)
OGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
 
R="\E[32m"
G="\E[32m"
B="\E[34m"
Y="\E[33m"
M="\E[35m"
C="\E[36m"
W="\E[37m"

#check root access or not


if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are you trying to install
# second arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo -e"$TIMESTAMP [ERROR]: Installing $1 is ... $R FAILED $W"
        exit 1
    else
        echo -e"$TIMESTAMP [INFO]: Installing $1 is ... $G SUCCESS $W"
    fi
}

for package in $@
do
    echo "$TIMESTAMP [INFO]: Installing $package"
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo -e"$TIMESTAMP [INFO]: $package already installed ... $Y SKIPPING"
    fi
done