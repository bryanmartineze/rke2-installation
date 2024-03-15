#Disable RKE2 on server nodes, use 'rke2-agent.service' if uninstalling in agent node
systemctl disable --now rke2-server.service

#Backup the config
cp /etc/rancher/rke2/config.yaml ~/

#Kill all rke2 processes
rke2-killall.sh

#Uninstall rke2
rke2-uninstall.sh
