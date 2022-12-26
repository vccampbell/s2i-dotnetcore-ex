#!/bin/bash

oc login -u kubeadmin -p "Ahb3t-TeaFn-f5vfs-semRo" https://api.crc.testing:6443
oc new-project cicd --display-name 'CI/CD'
oc new-project delta --display-name 'Delta'

oc project cicd
oc create -f pipeline-svc.yml
oc create -f pipeline-source-pvc.yml
oc create -f docker-io-secret.yml
oc create -f github-ssh-private-key.yml
oc create -f pipeline-delta-cm.yml
oc create -f pipeline-dc.yml
oc create -f pipeline.yml
