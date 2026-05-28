#!/bin/bash
sudo apt  update  && sudo apt upgrade -y
sudo apt install docker.io -y 
sudo systemctl  enable docker 
sudo systemctl start docker 
sudo usermod -aG docker ubuntu 

