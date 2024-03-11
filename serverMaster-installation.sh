#Download RKE2 installator
curl -sfL https://get.rke2.io --output install.sh | chmod +x install.sh

#Setup env variables
INSTALL_RKE2_TYPE=server INSTALL_RKE2_CHANNEL=v1.24 ./install.sh

#Create rke2 config
mkdir -p /etc/rancher/rke2/

vi /etc/rancher/rke2/config.yaml

cat > /etc/rancher/rke2/config.yaml << EOF
token: myrke2cluster01
tls-san:
  - cluster01.example.com
cni: canal
EOF

#Enable rke2-server.service
systemctl enable --now rke2-server.service

#Create kubeconfig for our nodes
mkdir ~/.kube
ln -s /etc/rancher/rke2/rke2.yaml ~/.kube/config
ln -s /var/lib/rancher/rke2/bin/kubectl /usr/local/bin

#Test kubectl
kubectl get nodes