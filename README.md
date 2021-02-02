# ec2-docker-env
Some helpful files I use to spin up a docker workspace in EC2

## Getting started
SSH into EC2 instance and run:
```
sudo yum install git -y
git clone https://github.com/jerry-hall/ec2-docker-env.git
cd ec2-docker-env
echo "export PATH=\"$PATH:/home/ec2-user/ec2-docker-env\"" | sudo tee -a /etc/profile; source /etc/profile
start
```

If you see the following, you are inside the container.
```
[root@docker-############ /]$
```

To exit the container, type:
```
[root@docker-############ /]$ exit
```

To reconnect to the container, type:
```
ec2 $ connect.ssh
```

To stop/terminate container, type:
```
ec2 $ stop
ec2 $ terminate
```