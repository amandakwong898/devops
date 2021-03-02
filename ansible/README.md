ansible-inventory -i aws_ec2.yml --graph

ansible-playbook -i aws_ec2.yml yum-update.yml

Add bastion host to /etc/hosts
For example, 
56.88.138.85 bastion

Add bastion host and private IPs to ~/.ssh/config using your own user and pem file
Host bastion
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    AddKeysToAgent yes
    User centos
    IdentityFile ~/.ssh/Centos.pem
    IdentitiesOnly yes
    ForwardAgent yes
Host ip-10-10*
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    AddKeysToAgent yes
    User centos
    IdentityFile ~/.ssh/Centos.pem
    IdentitiesOnly yes
    ForwardAgent yes
    ProxyCommand ssh -W %h:%p bastion

Test ssh
ssh bastion
ssh ip-10-10-10-47.ec2.internal

Get EC2 inventory
ansible-inventory -i aws_ec2.yml --graph

Run yum-update.yml on all EC2 instances
ansible-playbook -i aws_ec2.yml yum-update.yml -l aws_ec2

