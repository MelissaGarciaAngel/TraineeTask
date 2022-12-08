#!/bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo yum install -y jq
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo echo “Hello World!” > /var/www/html/index.html