

output "jenkins_master_publicIP_address" {
    value = aws_instance.jenkins_master.public_ip
}

output "jenkins_master_privateIP_address" {
    value = aws_instance.jenkins_master.private_ip
}

output "jenkins_slave_publicIP_address" {
    value = aws_instance.jenkins_slave.public_ip
}

output "jenkins_slave_privateIP_address" {
    value = aws_instance.jenkins_slave.private_ip
}

output "jenkins_instance_master_instance_status" {
    value = aws_instance.jenkins_master.instance_state
}

output "jenkins_instance_slave_instance_status" {
    value = aws_instance.jenkins_slave.instance_state
}