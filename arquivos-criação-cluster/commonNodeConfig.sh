#!/bin/bash

NodeEhMaster=$1
ipMasterNode=$2

sudo yum upgrade -y

sudo amazon-linux-extras install -y docker;

sudo service docker start

sudo chmod a+rwx /var/run/docker.sock

echo "*************************************************"
echo "chmod rodado com sucesso no /var/run/docker.sock!"
echo "*************************************************"

sleep 3

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

sudo setenforce 0

sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet

sudo swapoff -a

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Se a variável NodeEhMaster for 0, então trata-se do Master Node. 
# Daí, executamos esse trecho.
if [[ $NodeEhMaster -eq 0 ]]; then

    sudo kubeadm config images pull --cri-socket /run/containerd/containerd.sock

    sudo kubeadm init --ignore-preflight-errors=NumCPU --ignore-preflight-errors=Mem

    sudo kubeadm token create --print-join-command > /tmp/k8sjoinCommand.txt

    sudo mkdir -p $HOME/.kube

    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

    sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Se a variável NodeEhMaster não for 0, executamos os joins
else

    sudo ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -i /tmp/chaveClusterKubernetes ec2-user@$ipMasterNode "cat /tmp/k8sjoinCommand.txt" > /tmp/k8sjoinCommand.txt

    sudo bash -c "$(cat /tmp/k8sjoinCommand.txt)"  

fi