#!/bin/bash

# Updated starter script that uses systemd

# Install Apache
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Install the ec2-metadata tool
wget http://s3.amazonaws.com/ec2metadata/ec2-metadata
chmod u+x ec2-metadata

# Retrieve the EC2 instance ID and add it to the default httpd doc
EC2ID=$(./ec2-metadata --instance-id)
EC2OS=$(cat /etc/system-release)
echo "<html><body><h1>Welcome to version 0 of EC2 Demo running on $EC2OS, $EC2ID</h1></body></html>" > /var/www/html/index.html
