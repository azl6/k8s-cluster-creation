resource "aws_instance" "master" {
  ami           = "ami-08f74c738bf3f5a45"
  instance_type = "t2.micro"
  key_name      = "chaveClusterKubernetes"

  tags = {
    "Name" = "Master"
  }

  provisioner "local-exec" {
    command = "sleep 10; echo ${aws_instance.master.public_ip} >> ips.txt && scp -i ./arquivos-criação-cluster/chaveClusterKubernetes ./arquivos-criação-cluster/chaveClusterKubernetes ec2-user@${self.public_ip}:/tmp/chaveClusterKubernetes"
  }

}

resource "aws_instance" "worker1" {
  ami           = "ami-08f74c738bf3f5a45"
  instance_type = "t2.micro"
  key_name      = "chaveClusterKubernetes"
  depends_on = [
    aws_instance.master
  ]

  tags = {
    "Name" = "Worker 1"
  }

  provisioner "local-exec" {
    command = "sleep 10; echo ${aws_instance.worker1.public_ip} >> ips.txt && scp -i ./arquivos-criação-cluster/chaveClusterKubernetes ./arquivos-criação-cluster/chaveClusterKubernetes ec2-user@${self.public_ip}:/tmp/chaveClusterKubernetes"
  }

}

resource "aws_instance" "worker2" {
  ami           = "ami-08f74c738bf3f5a45"
  instance_type = "t2.micro"
  key_name      = "chaveClusterKubernetes"
  depends_on = [
    aws_instance.master
  ]

  tags = {
    "Name" = "Worker 2"
  }

  provisioner "local-exec" {
    command = "sleep 10; echo ${aws_instance.worker2.public_ip} >> ips.txt && scp -i ./arquivos-criação-cluster/chaveClusterKubernetes ./arquivos-criação-cluster/chaveClusterKubernetes ec2-user@${self.public_ip}:/tmp/chaveClusterKubernetes"
  }

}