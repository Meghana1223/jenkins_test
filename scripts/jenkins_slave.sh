
#!/bin/bash

hostnamectl set-hostname jenkins-slave

yum update -y

echo "welcome" | passwd --stdin ec2-user

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config


yum install fontconfig java-17-amazon-corretto-devel git -y

sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
