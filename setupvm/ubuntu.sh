#!/bin/bash
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install python3 python3-distutils wget netcat-openbsd unzip curl virtualenv make git sshpass
sudo apt-get -y install python3-pip
pip3 install --upgrade pip
pip3 install --user virtualenv
mkdir ~/venv
virtualenv -p python3 ~/venv
source ~/venv/bin/activate
echo "source venv/bin/activate" >> ~/.bash_profile
pip3 install boto
pip3 install boto3
pip3 install awscli
pip3 install -I ansible
pip3 install credstash
sudo curl -o /usr/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
sudo curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator
sudo chmod +x /usr/bin/kubectl /usr/bin/aws-iam-authenticator
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/bin
curl https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip --output terraform_0.14.7_linux_amd64.zip
sudo unzip terraform_0.14.7_linux_amd64.zip -d /usr/bin
curl https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip --output packer_1.7.0_linux_amd64.zip
sudo unzip packer_1.7.0_linux_amd64.zip -d /usr/bin
sudo cp -p terraform-provider-credstash /usr/bin
cat << EOF > ~/.terraformrc
providers {
     credstash = "/usr/bin/terraform-provider-credstash"
}
EOF
mkdir ~/repos
cd ~/repos
git clone https://github.com/uriagassi/sash.git
cd sash
make install
echo "source ~/.local/bin/sash.sh" >> ~/.bashrc
source ~/.bashrc
sudo apt-get -y update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce
sudo systemctl start docker && sudo systemctl enable docker
sudo usermod -aG docker $LOGNAME
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
curl https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz --output helm-v3.5.2-linux-amd64.tar.gz
tar -zxvf helm-v3.5.2-linux-amd64.tar.gz
chmod +x linux-amd64/helm
sudo mv linux-amd64/helm /usr/bin/helm
sudo chown root: /usr/bin/helm
