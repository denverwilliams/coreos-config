#!/bin/bash
sudo systemctl daemon-reload
curl -X PUT -d "value={\"Network\":\"10.2.0.0/16\",\"Backend\":{\"Type\":\"vxlan\"}}" "http://192.168.1.171:2379/v2/keys/coreos.com/network/config"
sudo systemctl start flanneld
sudo systemctl enable flanneld
sudo systemctl start kubelet
sudo systemctl enable kubelet
sleep 600
curl -H "Content-Type: application/json" -XPOST -d'{"apiVersion":"v1","kind":"Namespace","metadata":{"name":"kube-system"}}' "http://127.0.0.1:8080/api/v1/namespaces"
curl -H "Content-Type: application/json" -XPOST -d'{"apiVersion":"v1","kind":"Namespace","metadata":{"name":"calico-system"}}' "http://127.0.0.1:8080/api/v1/namespaces"