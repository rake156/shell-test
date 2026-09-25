#!/bin/bash

USERID=$(id -u)

# Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

echo "Installing MySQL"

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing MySQL is ... FAILED"
    exit 1
else
    echo "Installing MySQL is ... SUCCESS"
fi