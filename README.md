To run:

Clone the project

Init the directory with `terraform init`

Run the script called **completelyCreateAndConfigureCluster.sh**. 

This script will create a cluster with 3 nodes: 1 Master-node and 2 Worker-nodes. The joins will already be done and there will already be Weave-net installed working as a CNI for the cluster.

This project also assumes that the SSH key that will be used for the 3 nodes is already created, with the name **chaveClusterKubernetes**

If you don't have that, I suggest creating an aws_key_pair resource in Terraform and link it with your EC2 instance resources, or manually create a SSH key in AWS

Have fun! That was a pretty fun project to do.

