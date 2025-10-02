#!/bin/bash

source ./common.sh

check_root

dnf install mysql-server -y &>>LOG_FILE
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld &>>LOG_FILE
VALIDATE $? "Enabling MYSQL Server"

systemctl start mysqld  &>>LOG_FILE
VALIDATE $? "Starting MYSQL Server"

mysql_secure_installation --set-root-pass RoboShop@1 &>>LOG_FILE
VALIDATE $? "Setting up Root password"

print_total_time