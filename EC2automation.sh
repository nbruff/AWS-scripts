#!/bin/bash
read -p "Security Group Name:" SG
IP=$(curl -s icanhazip.com)
aws --region us-east-1 ec2 create-security-group --group-name $SG --description "My security group"
aws --region us-east-1 ec2 run-instances --image-id ami-0a313d6098716f372 --count 1 --instance-type t2.micro --key-name keyname --security-group-ids $SG --user-data file://kickstart.sh
aws --region us-east-1 ec2 authorize-security-group-ingress --group-name $SG --protocol tcp --port 22 --port 443 --cidr $IP/32
aws --region us-east-1 ec2 authorize-security-group-ingress --group-name $SG --protocol tcp --port 443 --cidr $IP/32

