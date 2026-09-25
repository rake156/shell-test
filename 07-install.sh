#!/bin/bash

USERID=$(id -u)
#check root access or not
if [ $USERID -ne 0 ]; then
echo "Please run this script as root access"
  exit 1
fi
#echo "im continuing" 





##### install script #####

 dnf install mysql -y
 if [ $? -eq 0 ]; then
    echo "mysql installation failed"
    exit 1
    else
    echo "mysql installation successful"
  fi
