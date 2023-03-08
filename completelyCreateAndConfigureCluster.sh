#!/bin/bash

if [[ -f ./ips.txt ]]; then rm ips.txt && touch ips.txt; fi

terraform apply -auto-approve

cd ./arquivos-criação-cluster/

./copyFiles.sh ../ips.txt

./createCluster.sh ../ips.txt
