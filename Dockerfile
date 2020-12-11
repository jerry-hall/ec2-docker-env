FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y git curl sudo 

# Install Chef client (you can remove if you don't need)
RUN curl -L https://omnitruck.chef.io/install.sh | sudo bash