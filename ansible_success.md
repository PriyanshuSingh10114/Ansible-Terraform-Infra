ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd ~/Ansible-Terraform-Infra

cat ansible/inventories/dev/hosts.yml
---
all:
  children:
    webservers:
      hosts:
        web-dev-01:
          ansible_host: 10.0.10.15
        web-dev-02:
          ansible_host: 10.0.20.15
    bastion:
      hosts:
        bastion-dev:
          ansible_host: 54.210.10.5
          ansible_user: ubuntu
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra/ansible

ansible all \
  -i inventories/dev/hosts.yml \
  -m ping
[WARNING]: Found variable using reserved name 'environment'.
Origin: /home/ubuntu/Ansible-Terraform-Infra/ansible/group_vars/all.yml:4:1

2 aws_region: ap-south-1
3 timezone: UTC
4 environment: dev
  ^ column 1

[ERROR]: Task failed: Failed to connect to the host via ssh: ssh: connect to host 54.210.10.5 port 22: Connection timed out

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: ssh: connect to host 54.210.10.5 port 22: Connection timed out

bastion-dev | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: ssh: connect to host 54.210.10.5 port 22: Connection timed out",
    "unreachable": true
}
[ERROR]: Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.10.15 port 22: Connection timed out

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: ssh: connect to host 10.0.10.15 port 22: Connection timed out

web-dev-01 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.10.15 port 22: Connection timed out",
    "unreachable": true
}
[ERROR]: Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.20.15 port 22: Connection timed out

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: ssh: connect to host 10.0.20.15 port 22: Connection timed out

web-dev-02 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.20.15 port 22: Connection timed out",
    "unreachable": true
}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev

terraform output

echo "===== TERRAFORM EC2 STATE ====="
terraform state list | grep -E 'instance|eip'
cloudwatch_system_log_group = "/aws/ec2/dev-system-logs"
ec2_instance_id = "i-0a4e5c0ffbd790910"
ec2_public_ip = "13.205.92.122"
public_subnet_ids = [
  "subnet-0437bd180a210fbc0",
  "subnet-0464e9ef42b415ae6",
]
s3_bucket_name = "aws-dev-app-assets-storage-unique-12345"
vpc_id = "vpc-02bbd8bdd83126d09"
===== TERRAFORM EC2 STATE =====
module.ec2.aws_eip.bastion
module.ec2.aws_instance.bastion
module.iam.aws_iam_instance_profile.ec2_profile
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ aws ec2 describe-instances \
  --region ap-south-1 \
  --filters "Name=tag:Environment,Values=dev" \
  --query 'Reservations[].Instances[?State.Name!=`terminated`].{Name:Tags[?Key==`Name`]|[0].Value,ID:InstanceId,State:State.Name,PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,AZ:Placement.AvailabilityZone,Key:KeyName}' \
  --output table
-----------------------------------------------------------------------------------------------------------------------------------------------------
|                                                                 DescribeInstances                                                                 |
+-------------+----------------------+-----------------------------------------------+-------------------+-------------+----------------+-----------+
|     AZ      |         ID           |                      Key                      |       Name        |  PrivateIP  |   PublicIP     |   State   |
+-------------+----------------------+-----------------------------------------------+-------------------+-------------+----------------+-----------+
|  ap-south-1a|  i-0a4e5c0ffbd790910 |  terraform-ansible-automation-infrastructure  |  dev-bastion-host |  10.0.1.222 |  13.205.92.122 |  running  |
+-------------+----------------------+-----------------------------------------------+-------------------+-------------+----------------+-----------+
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev
terraform output
cloudwatch_system_log_group = "/aws/ec2/dev-system-logs"
ec2_instance_id = "i-0a4e5c0ffbd790910"
ec2_public_ip = "13.205.92.122"
public_subnet_ids = [
  "subnet-0437bd180a210fbc0",
  "subnet-0464e9ef42b415ae6",
]
s3_bucket_name = "aws-dev-app-assets-storage-unique-12345"
vpc_id = "vpc-02bbd8bdd83126d09"
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cat outputs.tf
cat ../../modules/ec2/outputs.tf
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.subnets.public_subnet_ids
}

output "ec2_public_ip" {
  description = "EC2 Instance Public Elastic IP"
  value       = module.ec2.public_ip
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = module.ec2.instance_id
}

output "s3_bucket_name" {
  description = "Application S3 Storage Bucket"
  value       = module.s3.bucket_id
}

output "cloudwatch_system_log_group" {
  description = "CloudWatch System Log Group Name"
  value       = module.cloudwatch.system_log_group_name
}
output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.bastion.id
}

output "public_ip" {
  description = "Elastic IP attached to EC2 instance"
  value       = aws_eip.bastion.public_ip
}

output "private_ip" {
  description = "Private IP address of EC2 instance"
  value       = aws_instance.bastion.private_ip
}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ NEW_IP=$(aws ec2 describe-instances \
  --region ap-south-1 \
  --filters \
  "Name=tag:Name,Values=dev-bastion-host" \
  "Name=instance-state-name,Values=running" \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

echo "$NEW_IP"
13.205.92.122
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ nc -vz "$NEW_IP" 22
Connection to 13.205.92.122 22 port [tcp/ssh] succeeded!
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ ansible/group_vars/all.yml
-bash: ansible/group_vars/all.yml: No such file or directory
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd
ubuntu@ip-172-31-3-226:~$ tree
.
└── Ansible-Terraform-Infra
    ├── Makefile
    ├── README.md
    ├── ansible
    │   ├── ansible.cfg
    │   ├── group_vars
    │   │   ├── all.yml
    │   │   ├── db.yml
    │   │   └── webservers.yml
    │   ├── inventories
    │   │   ├── dev
    │   │   │   └── hosts.yml
    │   │   └── prod
    │   │       └── hosts.yml
    │   ├── roles
    │   │   ├── application
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   └── main.yml
    │   │   │   └── templates
    │   │   │       └── docker-compose.yml.j2
    │   │   ├── backup
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   └── main.yml
    │   │   │   └── templates
    │   │   │       └── backup.sh.j2
    │   │   ├── common
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── handlers
    │   │   │   │   └── main.yml
    │   │   │   └── tasks
    │   │   │       └── main.yml
    │   │   ├── docker
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── handlers
    │   │   │   │   └── main.yml
    │   │   │   └── tasks
    │   │   │       └── main.yml
    │   │   ├── monitoring
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── handlers
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   └── main.yml
    │   │   │   └── templates
    │   │   │       ├── amazon-cloudwatch-agent.json.j2
    │   │   │       └── prometheus.yml.j2
    │   │   ├── nginx
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── handlers
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   └── main.yml
    │   │   │   └── templates
    │   │   │       └── app.conf.j2
    │   │   ├── security
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── handlers
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   └── main.yml
    │   │   │   └── templates
    │   │   │       └── jail.local.j2
    │   │   └── users
    │   │       ├── defaults
    │   │       │   └── main.yml
    │   │       └── tasks
    │   │           └── main.yml
    │   └── site.yml
    ├── app
    │   ├── Dockerfile
    │   ├── docker-compose.yml
    │   ├── package.json
    │   └── server.js
    ├── bootstrap
    │   └── remote-state
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── providers.tf
    │       ├── terraform.tfstate
    │       ├── terraform.tfstate.backup
    │       ├── terraform.tfvars
    │       ├── terraform.tfvars.example
    │       ├── variables.tf
    │       └── versions.tf
    ├── monitoring
    │   ├── amazon-cloudwatch-agent.json
    │   ├── dashboards
    │   │   └── system-overview.json
    │   ├── docker-compose.yml
    │   └── prometheus.yml
    ├── scripts
    │   ├── bootstrap.sh
    │   ├── cleanup.sh
    │   ├── deploy.sh
    │   ├── destroy.sh
    │   ├── install.sh
    │   ├── validate.sh
    │   └── verify.sh
    └── terraform
        ├── environments
        │   ├── dev
        │   │   ├── backend.tf
        │   │   ├── locals.tf
        │   │   ├── main.tf
        │   │   ├── outputs.tf
        │   │   ├── providers.tf
        │   │   ├── terraform.tfvars
        │   │   ├── terraform.tfvars.example
        │   │   ├── tfplan
        │   │   ├── variables.tf
        │   │   └── versions.tf
        │   └── prod
        │       ├── backend.tf
        │       ├── locals.tf
        │       ├── main.tf
        │       ├── outputs.tf
        │       ├── providers.tf
        │       ├── terraform.tfvars.example
        │       ├── variables.tf
        │       └── versions.tf
        └── modules
            ├── cloudwatch
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── ec2
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── iam
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── internet_gateway
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── route_tables
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── s3
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── security_group
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            ├── subnets
            │   ├── main.tf
            │   ├── outputs.tf
            │   └── variables.tf
            └── vpc
                ├── main.tf
                ├── outputs.tf
                └── variables.tf

62 directories, 105 files
ubuntu@ip-172-31-3-226:~$ cat ansible/group_vars/all.yml
cat: ansible/group_vars/all.yml: No such file or directory
ubuntu@ip-172-31-3-226:~$ ls
Ansible-Terraform-Infra
ubuntu@ip-172-31-3-226:~$ cd Ansible-Terraform-Infra
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cat ansible/group_vars/all.yml
---
aws_region: ap-south-1
timezone: UTC
environment: dev
admin_email: admin@example.com
prometheus_version: "2.47.0"
node_exporter_version: "1.6.1"
grafana_version: "10.1.2"
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ vim ansible/group_vars/all.yml
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra

grep -R \
  --exclude-dir=.git \
  -nE '\benvironment\b' ansible/
ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2:12:            "log_group_name": "/aws/ec2/{{ environment }}-system-logs",
ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2:17:            "log_group_name": "/aws/ec2/{{ environment }}-system-logs",
ansible/roles/application/templates/docker-compose.yml.j2:12:    environment:
ansible/roles/application/templates/docker-compose.yml.j2:13:      - NODE_ENV={{ environment }}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ vim ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ vim ansible/roles/application/templates/docker-compose.yml.j2
"ansible/roles/application/templates/docker-compose.yml.j2" 20L, 453B written
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra

grep -R \
  --exclude-dir=.git \
  -n '{{ *environment *}}' ansible/
ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2:12:            "log_group_name": "/aws/ec2/{{ environment }}-system-logs",
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ vim ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2
"ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2" 46L, 1262B written
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra

grep -R \
  --exclude-dir=.git \
  -n '{{ *environment *}}' ansible/
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ grep -R \
  --exclude-dir=.git \
  -n 'deployment_environment' ansible/
ansible/group_vars/all.yml:4:deployment_environment: dev
ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2:12:            "log_group_name": "/aws/ec2/{{ deployment_environment }}-system-logs",
ansible/roles/monitoring/templates/amazon-cloudwatch-agent.json.j2:17:            "log_group_name": "/aws/ec2/{{ deployment_environment }}-system-logs",
ansible/roles/application/templates/docker-compose.yml.j2:13:      - NODE_ENV={{ deployment_environment }}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra/ansible

ansible-playbook \
  -i inventories/dev/hosts.yml \
  site.yml \
  --syntax-check

playbook: site.yml
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible-inventory \
  -i inventories/dev/hosts.yml \
  --graph
@all:
  |--@ungrouped:
  |--@webservers:
  |  |--web-dev-01
  |  |--web-dev-02
  |--@bastion:
  |  |--bastion-dev
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ cd ~/Ansible-Terraform-Infra/ansible

ansible-inventory \
  -i inventories/dev/hosts.yml \
  --graph
@all:
  |--@ungrouped:
  |--@webservers:
  |  |--web-dev-01
  |  |--web-dev-02
  |--@bastion:
  |  |--bastion-dev
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible all \
  -i inventories/dev/hosts.yml \
  -m ping
[ERROR]: Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.20.15 port 22: Connection timed out

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: ssh: connect to host 10.0.20.15 port 22: Connection timed out

web-dev-02 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.20.15 port 22: Connection timed out",
    "unreachable": true
}
[ERROR]: Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.10.15 port 22: Connection timed out

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: ssh: connect to host 10.0.10.15 port 22: Connection timed out

web-dev-01 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: ssh: connect to host 10.0.10.15 port 22: Connection timed out",
    "unreachable": true
}
[ERROR]: Task failed: Failed to connect to the host via ssh: ssh: connect to host 54.210.10.5 port 22: Connection timed out

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: ssh: connect to host 54.210.10.5 port 22: Connection timed out

bastion-dev | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: ssh: connect to host 54.210.10.5 port 22: Connection timed out",
    "unreachable": true
}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ cd ~/Ansible-Terraform-Infra

aws ec2 describe-instances \
  --region ap-south-1 \
  --filters "Name=tag:Environment,Values=dev" \
  --query 'Reservations[].Instances[?State.Name!=`terminated`].{Name:Tags[?Key==`Name`]|[0].Value,ID:InstanceId,State:State.Name,PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,Key:KeyName}' \
  --output table
--------------------------------------------------------------------------------------------------------------------------------------
|                                                          DescribeInstances                                                         |
+---------------------+-----------------------------------------------+-------------------+-------------+----------------+-----------+
|         ID          |                      Key                      |       Name        |  PrivateIP  |   PublicIP     |   State   |
+---------------------+-----------------------------------------------+-------------------+-------------+----------------+-----------+
|  i-0a4e5c0ffbd790910|  terraform-ansible-automation-infrastructure  |  dev-bastion-host |  10.0.1.222 |  13.205.92.122 |  running  |
+---------------------+-----------------------------------------------+-------------------+-------------+----------------+-----------+
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev

terraform output
cloudwatch_system_log_group = "/aws/ec2/dev-system-logs"
ec2_instance_id = "i-0a4e5c0ffbd790910"
ec2_public_ip = "13.205.92.122"
public_subnet_ids = [
  "subnet-0437bd180a210fbc0",
  "subnet-0464e9ef42b415ae6",
]
s3_bucket_name = "aws-dev-app-assets-storage-unique-12345"
vpc_id = "vpc-02bbd8bdd83126d09"
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd ~/Ansible-Terraform-Infra

cp ansible/inventories/dev/hosts.yml \
   ansible/inventories/dev/hosts.yml.backup

vim ansible/inventories/dev/hosts.yml
"ansible/inventories/dev/hosts.yml" 14L, 274B written
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ansible/inventories/dev/
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ ls
hosts.yml  hosts.yml.backup
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ rm -v hosts.yml
removed 'hosts.yml'
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ vim hosts.yml
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$  [New] 8L, 145B written
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ ls -lah ~/.ssh/

find ~ -maxdepth 3 -type f \
  \( -name "*.pem" -o -name "*.key" \) \
  -ls
total 28K
drwx------ 2 ubuntu ubuntu 4.0K Jul 31 16:54 .
drwxr-x--- 9 ubuntu ubuntu 4.0K Aug  1 09:48 ..
-rw------- 1 ubuntu ubuntu  425 Jul 31 13:53 authorized_keys
-rw------- 1 ubuntu ubuntu  419 Jul 31 16:46 id_ed25519
-rw-r--r-- 1 ubuntu ubuntu  104 Jul 31 16:46 id_ed25519.pub
-rw------- 1 ubuntu ubuntu  978 Jul 31 16:54 known_hosts
-rw-r--r-- 1 ubuntu ubuntu  142 Jul 31 16:54 known_hosts.old
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ cd
ubuntu@ip-172-31-3-226:~$ ls -lah ~/.ssh/

find ~ -maxdepth 3 -type f \
  \( -name "*.pem" -o -name "*.key" \) \
  -ls
total 28K
drwx------ 2 ubuntu ubuntu 4.0K Jul 31 16:54 .
drwxr-x--- 9 ubuntu ubuntu 4.0K Aug  1 09:48 ..
-rw------- 1 ubuntu ubuntu  425 Jul 31 13:53 authorized_keys
-rw------- 1 ubuntu ubuntu  419 Jul 31 16:46 id_ed25519
-rw-r--r-- 1 ubuntu ubuntu  104 Jul 31 16:46 id_ed25519.pub
-rw------- 1 ubuntu ubuntu  978 Jul 31 16:54 known_hosts
-rw-r--r-- 1 ubuntu ubuntu  142 Jul 31 16:54 known_hosts.old
ubuntu@ip-172-31-3-226:~$ ssh \
  -i ~/terraform-ansible-automation-infrastructure.pem \
  ubuntu@13.205.92.122
Warning: Identity file /home/ubuntu/terraform-ansible-automation-infrastructure.pem not accessible: No such file or directory.
The authenticity of host '13.205.92.122 (13.205.92.122)' can't be established.
ED25519 key fingerprint is: SHA256:+lSLK9ep738bW3htOHX3Dc3T2D56fbBgurVSCwQoK/k
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.205.92.122' (ED25519) to the list of known hosts.
ubuntu@13.205.92.122: Permission denied (publickey).
ubuntu@ip-172-31-3-226:~$ chmod 600 ~/terraform-ansible-automation-infrastructure.pem
chmod: cannot access '/home/ubuntu/terraform-ansible-automation-infrastructure.pem': No such file or directory
ubuntu@ip-172-31-3-226:~$ scp -i "terraform-ansible-automation-infrastructure.pem" `
  "terraform-ansible-automation-infrastructure.pem" `
  ubuntu@ec2-3-110-222-244.ap-south-1.compute.amazonaws.com:/home/ubuntu/
terraform-ansible-automation-infrastructure.pem: command not found
usage: scp [-346ABCOpqRrsTv] [-c cipher] [-D sftp_server_path] [-F ssh_config]
           [-i identity_file] [-J destination] [-l limit] [-o ssh_option]
           [-P port] [-S program] [-X sftp_option] source ... target
-bash: ubuntu@ec2-3-110-222-244.ap-south-1.compute.amazonaws.com:/home/ubuntu/: No such file or directory
ubuntu@ip-172-31-3-226:~$ ssh -i "terraform-ansible-automation-infrastructure.pem" ubuntu@ec2-3-110-222-244.ap-south-1.compute.amazonaws.com
The authenticity of host 'ec2-3-110-222-244.ap-south-1.compute.amazonaws.com (172.31.3.226)' can't be established.
ED25519 key fingerprint is: SHA256:Nr5/vbpXrWOkf53pkaPpPyJOTnKEYeKI3eDmwno/184
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-3-110-222-244.ap-south-1.compute.amazonaws.com' (ED25519) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0664 for 'terraform-ansible-automation-infrastructure.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "terraform-ansible-automation-infrastructure.pem": bad permissions
ubuntu@ec2-3-110-222-244.ap-south-1.compute.amazonaws.com: Permission denied (publickey).
ubuntu@ip-172-31-3-226:~$ ls -lah ~/terraform-ansible-automation-infrastructure.pem
-rw-rw-r-- 1 ubuntu ubuntu 1.7K Aug  1 09:51 /home/ubuntu/terraform-ansible-automation-infrastructure.pem
ubuntu@ip-172-31-3-226:~$ chmod 600 ~/terraform-ansible-automation-infrastructure.pem
ubuntu@ip-172-31-3-226:~$ ssh \
  -i ~/terraform-ansible-automation-infrastructure.pem \
  ubuntu@13.205.92.122
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-1061-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Aug  1 09:56:45 UTC 2026

  System load:  0.0               Processes:             107
  Usage of /:   9.0% of 19.20GB   Users logged in:       0
  Memory usage: 23%               IPv4 address for ens5: 10.0.1.222
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-10-0-1-222:~$ exit
logout
Connection to 13.205.92.122 closed.
ubuntu@ip-172-31-3-226:~$ cd ~/Ansible-Terraform-Infra/ansible

ansible-inventory \
  -i inventories/dev/hosts.yml \
  --graph
@all:
  |--@ungrouped:
  |--@webservers:
  |  |--dev-bastion-host
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible dev-bastion-host \
  -i inventories/dev/hosts.yml \
  -m ping
[ERROR]: Task failed: Failed to connect to the host via ssh: no such identity: /home/ubuntu/.ssh/id_rsa: No such file or directory
ubuntu@13.205.92.122: Permission denied (publickey).

Task failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

<<< caused by >>>

Failed to connect to the host via ssh: no such identity: /home/ubuntu/.ssh/id_rsa: No such file or directory
ubuntu@13.205.92.122: Permission denied (publickey).

dev-bastion-host | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: no such identity: /home/ubuntu/.ssh/id_rsa: No such file or directory\r\nubuntu@13.205.92.122: Permission denied (publickey).",
    "unreachable": true
}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ls
ansible.cfg  group_vars  inventories  roles  site.yml
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ cd inventories
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories$ ls
dev  prod
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories$ cd dev
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ ls
hosts.yml  hosts.yml.backup
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ vim hosts.yml
 9L, 246B written
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible/inventories/dev$ cd
ubuntu@ip-172-31-3-226:~$ ls
Ansible-Terraform-Infra  terraform-ansible-automation-infrastructure.pem
ubuntu@ip-172-31-3-226:~$ cd Ansible-Terraform-Infra
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra$ cd ~/Ansible-Terraform-Infra/ansible

ansible-inventory \
  -i inventories/dev/hosts.yml \
  --graph
@all:
  |--@ungrouped:
  |--@webservers:
  |  |--dev-bastion-host
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible dev-bastion-host \
  -i inventories/dev/hosts.yml \
  -m ping
[WARNING]: Host 'dev-bastion-host' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
dev-bastion-host | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.10"
    },
    "changed": false,
    "ping": "pong"
}
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible-playbook \
  -i inventories/dev/hosts.yml \
  site.yml \
  --check
[ERROR]: The 'community.general.yaml' callback plugin has been removed. The plugin has been superseded by the option `result_format=yaml` in callback plugin ansible.builtin.default from ansible-core 2.13 onwards. This feature was removed from collection 'community.general' version 12.0.0.
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible-playbook \
  -i inventories/dev/hosts.yml \
  site.yml
[ERROR]: The 'community.general.yaml' callback plugin has been removed. The plugin has been superseded by the option `result_format=yaml` in callback plugin ansible.builtin.default from ansible-core 2.13 onwards. This feature was removed from collection 'community.general' version 12.0.0.
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ ansible-playbook \
  -i inventories/dev/hosts.yml \
  site.yml \
  --list-tasks

playbook: site.yml

  play #1 (all): Apply Common Base System Configuration & Hardening     TAGS: []
    tasks:
      common : Update apt cache TAGS: []
      common : Set server timezone      TAGS: []
      common : Install baseline system packages TAGS: []
      security : Install security packages      TAGS: []
      security : Configure SSH Hardening - Disable Root Login   TAGS: []
      security : Configure SSH Hardening - Disable Password Auth        TAGS: []
      security : Configure Fail2Ban jail.local  TAGS: []
      security : Enable unattended security updates     TAGS: []
      users : Create system management users    TAGS: []
      users : Add SSH authorized keys for system users  TAGS: []

  play #2 (webservers): Provision Container Engine & Application Infrastructure TAGS: []
    tasks:
      docker : Ensure apt keyrings directory exists     TAGS: []
      docker : Add Docker GPG key       TAGS: []
      docker : Add Docker Repository    TAGS: []
      docker : Install Docker Engine and Compose Plugin TAGS: []
      docker : Enable Docker Service    TAGS: []
      docker : Add users to docker group        TAGS: []
      nginx : Install Nginx web server  TAGS: []
      nginx : Remove default Nginx site configuration   TAGS: []
      nginx : Deploy application Nginx site configuration       TAGS: []
      nginx : Enable application Nginx site     TAGS: []
      nginx : Ensure Nginx is running and enabled       TAGS: []
      application : Create application target directory TAGS: []
      application : Deploy application source code      TAGS: []
      application : Deploy Docker Compose file  TAGS: []
      application : Launch application stack using Docker Compose       TAGS: []

  play #3 (all): Configure Telemetry Monitoring & Observability TAGS: []
    tasks:
      monitoring : Create CloudWatch Agent configuration directory      TAGS: []
      monitoring : Deploy CloudWatch Agent configuration        TAGS: []
      monitoring : Create Monitoring stack target directory     TAGS: []
      monitoring : Deploy Monitoring configuration stack files  TAGS: []
      monitoring : Launch Monitoring Stack using Docker Compose TAGS: []

  play #4 (webservers): Configure Automated Backup Systems      TAGS: []
    tasks:
      backup : Create local backup storage directory    TAGS: []
      backup : Deploy automated backup script   TAGS: []
      backup : Configure nightly cron job for automated backups TAGS: []
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/ansible$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev

terraform plan
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Refreshing state... [id=/aws/ec2/dev-system-logs]
data.aws_ami.ubuntu: Reading...
module.s3.aws_s3_bucket.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Refreshing state... [id=/aws/ec2/dev-app-logs]
module.iam.aws_iam_role.ec2_role: Refreshing state... [id=dev-ec2-role]
module.vpc.aws_vpc.this: Refreshing state... [id=vpc-02bbd8bdd83126d09]
module.s3.aws_s3_bucket_public_access_block.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_versioning.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_policy.s3_access: Refreshing state... [id=arn:aws:iam::383234049116:policy/dev-s3-access-policy]
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
data.aws_ami.ubuntu: Read complete after 0s [id=ami-0aa761682283b4cc8]
module.subnets.aws_subnet.public[0]: Refreshing state... [id=subnet-0437bd180a210fbc0]
module.subnets.aws_subnet.public[1]: Refreshing state... [id=subnet-0464e9ef42b415ae6]
module.security_group.aws_security_group.ec2: Refreshing state... [id=sg-0fec03b485702c34d]
module.internet_gateway.aws_internet_gateway.this: Refreshing state... [id=igw-0cedbdc6da4e0cb9b]
module.route_tables.aws_route_table.public: Refreshing state... [id=rtb-0986b4e0100eb322f]
module.route_tables.aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0133e428f2035a787]
module.route_tables.aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0d2ce7b7e93ec7964]
module.iam.aws_iam_role_policy_attachment.ssm_core: Refreshing state... [id=dev-ec2-role-20260801091440410300000002]
module.iam.aws_iam_instance_profile.ec2_profile: Refreshing state... [id=dev-ec2-instance-profile]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Refreshing state... [id=dev-ec2-role-20260801091440374900000001]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Refreshing state... [id=dev-ec2-role-20260801091440821300000003]
module.ec2.aws_instance.bastion: Refreshing state... [id=i-0a4e5c0ffbd790910]
module.ec2.aws_eip.bastion: Refreshing state... [id=eipalloc-03fd89d43aa4ea0cb]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$