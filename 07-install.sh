#!/bin/bash

userid=$(id -u)
#check root access or not
if [ $userid -ne 0 ]; then

echo "Please run as root access"
  exit 1
fi





##### install script #####
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi


dnf list installed mysql
if [ $? -eq 0 ]; then
  echo "mysql is already installed....skipping installation"
  else
    echo "installing mysql"
  
  dnf install mysql -y
 if [ $? -ne 0 ]; then
    echo "mysql installation failed"
else
    echo "mysql installation successful"
  fi 
  
  exit
fi
