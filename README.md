# Instructions to run the project

Clone the project.

Run `aws configure` and configure your AWS credentials and region

Init the directory with `terraform init`

Create a key-pair in AWS named **chaveClusterKubernetes**, and insert the private-key in the `arquivos-criação-cluster` folder

Run `chmod 400 arquivos-criação-cluster/chaveClusterKubernetes`

Run the script called **completelyCreateAndConfigureCluster.sh**. 

---------------------------------------------------------------------------

# Project description 

This script will create a cluster with 3 nodes: 1 Master-node and 2 Worker-nodes in AWS EC2 instances of t2.micro size. The joins will already be done and there will already be Weave-net installed working as a CNI for the cluster.

Keep in mind that the script takes about 10 minutes to finish all the configuration, so don't be surprised out if it takes about this time to finish.

Also, the project also assumes that you have your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEYS env variables setted up. The easiest way to do so is to use the `export` command, however, if you prefer, you can also use `aws configure`.

Have fun! That was a pretty fun project to do.

