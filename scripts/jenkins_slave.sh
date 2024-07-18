
#!/bin/bash

hostnamectl set-hostname jenkins-slave

yum update -y

echo "welcome" | passwd --stdin ec2-user

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config


yum install fontconfig java-17-amazon-corretto-devel git -y
yum install gcc libffi-devel python3-devel openssl-devel -y #B crypt module system depen


sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

su - ec2-user -c "curl https://pyenv.run | bash"  #automatic pyenv installation 

cat << 'EOF' >> /home/ec2-user/.bashrc
echo "export PYENV_ROOT='$HOME/.pyenv'
[[ -d $PYENV_ROOT/bin ]] && export PATH='$PYENV_ROOT/bin:$PATH'
eval '$(pyenv init -)'" >> /home/ec2-user/.bashrc
EOF #adding the content to the file [~/.bash_profile ]

su - ec2-user -c "source /home/ec2-user/.bashrc"   #excution of bashrc
su - ec2-user -c "pyenv install pypy3.8-7.3.11"   #version

