

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "aws_region" {
    type = string
    default = "ap-southeast-1"
}

variable "key_name" {
  type = string 
   default = "jenkins"
  }

  #user data
  variable "jenkins_master_script" {
  type = string
   default = "./scripts/jenkins_master.sh" // ./scripts/web.sh
  }

  variable "jenkins_slave_script" {
  type = string
   default = "./scripts/jenkins_slave.sh" // ./scripts/web.sh
  }

  variable "jenkins_master_tags" {
    type = map(string)
    default = {
      "Name" = "jenkins master"
      "Env"  = "Dev"
      "Owner" = "Rnstech"
    }
  }
  variable "jenkins_slave_tags" {
    type = map(string)
    default = {
      "Name" = "jenkins master"
      "Env"  = "Dev"
      "Owner" = "Rnstech"
    }
  }

# sg 
variable "Sg_ports" {
    type = list(number)
    default = [ 22, 80, 8080  ]
}
variable "sg_cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}
variable "sg_tags" {
    type = map(string)  #map data type for tags
    default = {
      "Name" = "Jenkins Server"
      "Env"  = "Dev"
      "Owner" = "Rnstech"
    }
} //sg