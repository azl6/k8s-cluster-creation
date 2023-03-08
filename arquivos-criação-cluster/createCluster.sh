#!/bin/bash

echo "Starting instalation script..."

NodeEhMaster=0
ipMasterNode=$(cat ../ips.txt | head -1)

while read line; do

    echo "Installation started on node $line..."

    ipMaquina=$line

    echo "Starting script commonNodeConfig.sh to install the required dependencies..."

    ssh -i chaveClusterKubernetes ec2-user@$ipMaquina 'bash -s ' < ./commonNodeConfig.sh $NodeEhMaster $ipMasterNode

    echo "Finalizou a configuração do node $line."

    NodeEhMaster=$((NodeEhMaster+1))

done < ${1}

NodeEhMaster=0

ssh -i chaveClusterKubernetes ec2-user@$ipMasterNode "kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml"
