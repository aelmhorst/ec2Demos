#!/bin/bash

# Install Apache 2.4
yum update -y
yum install httpd24 -y
service httpd start
chkconfig httpd on

# Retrieve the EC2 instance ID and add it to the default httpd doc
EC2ID=$(./ec2metadata --instance-id)
echo "<html><body><h1>Welcome to version 0 of EC2 Demo running on $EC2ID</h1></body></html>" > /var/www/html/index.html
