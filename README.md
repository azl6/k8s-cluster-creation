To run:

Clone the project

Init the directory with `terraform init`

Run `terraform plan -auto-approve`

This project also assumes that the SSH key that will be used for the 3 nodes is already created, with the name **d**

If you don't have that, I suggest creating an aws_key_pair resource in Terraform and link it with your EC2 instance resources, or manually create a SSH key in AWS

