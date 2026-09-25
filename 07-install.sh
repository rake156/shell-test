#!/bin/bash

USERID=$(id -u)

# Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

echo "Installing MySQL"

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Installing MySQL is ... SUCCESS"
else
    echo "Installing MySQL is ... FAILED"
    exit 1
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "Nginx is already installed"
else
    echo "Installing Nginx"
    dnf install nginx -y

    if [ $? -eq 0 ]; then
        echo "Installing Nginx is ... SUCCESS"
    else
        echo "Installing Nginx is ... FAILED"
        exit 1
    fi
fi