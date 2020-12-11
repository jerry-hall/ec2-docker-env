FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y git curl sudo nano
RUN echo 'export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u@docker-\h \W]\\$ \[$(tput sgr0)\]"' >> ~/.bashrc

# Install Chef client (you can remove if you don't need)
RUN curl -L https://omnitruck.chef.io/install.sh | sudo bash
