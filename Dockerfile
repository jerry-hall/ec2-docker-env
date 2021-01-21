FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y git curl sudo nano
RUN echo 'export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u@docker-\h \W]\\$ \[$(tput sgr0)\]"' >> ~/.bashrc

# Install Chef client (you can remove if you don't need)
RUN curl -L https://www.opscode.com/chef/install.sh | bash -s -- -v 12
RUN /opt/chef/embedded/bin/gem install chef-handler-sns vault

# Install Terraform (latest release)
RUN sudo apt-get -y install gnupg lsb-core software-properties-common
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN sudo apt-get update && sudo apt-get install terraform

# Install AWS CLI
# unzip req'd for install
RUN sudo apt install -y unzip 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install