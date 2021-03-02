# installawscli quickly installs aws cli, ansible, credstash, packer and terraform on centos/redhat or ubuntu
Instructions
1. sudo yum -y install git or sudo apt-get -y install git
2. mkdir repos; cd repos
3. git clone https://github.com/amandakwong898/devops.git
4. cd devops/setupvm
5. ./runfirst.sh
6. ./centos.sh or ./ubuntu.sh
7. sudo shutdown -r now
8. aws configure
9. credstash setup
