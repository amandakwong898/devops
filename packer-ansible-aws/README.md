cd ~/repos

git clone https://github.com/amandakwong898/devops.git

cd devops/packer-ansible-aws/packer

packer build -machine-readable packer-centos7-pci-dss.json | tee ~/packer-centos7-pci-dss.json.out
