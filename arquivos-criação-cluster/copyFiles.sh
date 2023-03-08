#!/bin/bash

while read line; do

    ipMaquina=${line}

    echo "File copying started for IP $line"

    echo "Copying config files via scp..."

    scp -i chaveClusterKubernetes ./k8s.conf1 ec2-user@$ipMaquina:/tmp/k8s.conf1
    scp -i chaveClusterKubernetes ./k8s.conf2 ec2-user@$ipMaquina:/tmp/k8s.conf2

    echo "Copying was sucessful... Moving..."

    ssh -n -i chaveClusterKubernetes ec2-user@$ipMaquina "sudo mv /tmp/k8s.conf1 /etc/modules-load.d/k8s.conf; sudo mv /tmp/k8s.conf2 /etc/sysctl.d/k8s.conf"

    echo "mv was successful!"

done < $1