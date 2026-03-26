#!/bin/bash

source 01-common.sh

LOGFILE=/tmp/mongodb.log

echo "Installing MongoDB..."

dnf install mongodb-org -y &>>$LOGFILE

systemctl enable mongod &>>$LOGFILE
systemctl start mongod &>>$LOGFILE

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOGFILE

systemctl restart mongod &>>$LOGFILE

echo "MongoDB setup completed"

print_total_time
