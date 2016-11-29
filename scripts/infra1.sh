#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl start flanneld
sudo systemctl start kubelet
sudo systemctl enable flanneld
sudo systemctl enable kubelet