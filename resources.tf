
data "aws_ami" "jenkins_instance" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#security groups
resource "aws_security_group" "jenkins_sg"{
    name = "jenkins sg"
    description = "Allow SSH & HTTP Inbound traffic and all outbound traffic"
    
     dynamic "ingress" {
      for_each = var.Sg_ports
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol         = "tcp"
        cidr_blocks      = var.sg_cidr_block  
      }
    }

     egress {
        from_port        = 0   //0
        to_port          = 0   //0
        protocol         = "-1"
        cidr_blocks      = var.sg_cidr_block
    }
    
    tags = var.sg_tags
}

#instances 
resource "aws_instance" "jenkins_master"{
    ami           = data.aws_ami.jenkins_instance.id //var.image_id  // "ami-08a0d1e16fc3f61ea"
    instance_type = var.instance_type  //"t3.micro"
    key_name = var.key_name  //"jenkins"
    vpc_security_group_ids = [ aws_security_group.jenkins_sg.id ]
    user_data = file(var.jenkins_master_script)   //("/scripts/jenkins_master.sh")
    
    tags = var.jenkins_master_tags
}

resource "aws_instance" "jenkins_slave"{
    ami           = data.aws_ami.jenkins_instance.id //var.image_id  // "ami-08a0d1e16fc3f61ea"
    instance_type = var.instance_type  //"t3.micro"
    key_name = var.key_name  //jenkins
    vpc_security_group_ids = [ aws_security_group.jenkins_sg.id ]
    user_data = file(var.jenkins_slave_script)    //./scripts/jenkins_slave.sh
    
    tags = var.jenkins_slave_tags
}
