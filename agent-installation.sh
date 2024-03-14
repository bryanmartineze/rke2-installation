#Download RKE2 installator
curl -sfL https://get.rke2.io --output install.sh
chmod +x install.sh

#Setup env variables and install RKE2
INSTALL_RKE2_TYPE=agent INSTALL_RKE2_CHANNEL=v1.24 ./install.sh

#Create rke2 config
mkdir -p /etc/rancher/rke2/

cat > /etc/rancher/rke2/config.yaml << EOF
server: https://cluster01.example.com:9345
token: myrke2cluster01
EOF

#Enable rke2-server.service
systemctl enable --now rke2-server.service

#Test kubectl in any of the server nodes
kubectl get nodes