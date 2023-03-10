# Instructions to run the project

Clone the project.

Init the directory with `terraform init`

Run `chmod 400 arquivos-criação-cluster/chaveClusterKubernetes`

Run the script called **completelyCreateAndConfigureCluster.sh**. 

Keep in mind that the script takes about 10 minutes to finish all the configuration, so don't freak out if it takes about this time to finish.

This script will create a cluster with 3 nodes: 1 Master-node and 2 Worker-nodes in AWS EC2 instances of t2.micro size. The joins will already be done and there will already be Weave-net installed working as a CNI for the cluster.

This project also assumes that the SSH key that will be used for the 3 nodes is already created, with the name **chaveClusterKubernetes**. If you don't have that, I suggest creating an aws_key_pair resource in Terraform and link it with your EC2 instance resources, or manually create a SSH key in AWS.

Also, the project also assumes that you have your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEYS env variables setted up. The easiest way to do so is to use the `export` command, however, if you prefer, you can also use `aws configure`.

Have fun! That was a pretty fun project to do.

