#!/bin/bash

sys_update() {	
	[[ ! -f /etc/updated ]] && apt update && touch /etc/updated	
}

install_pkgs(){
	apt install -y mc python-pip libssl-dev git docker.io
}

install_python_venv(){
	[[ ! -f /etc/profile.d/penv.sh ]] && \
	pip install virtualenvwrapper && \
	echo "export WORKON_HOME=~/Envs" > /etc/profile.d/penv.sh &&\
	echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc && \
	source /etc/profile.d/penv.sh
	source /usr/local/bin/virtualenvwrapper.sh
}

install_ansible_in_penv(){
	[[ $(workon | grep -c "ansible-2.2.2") -eq 0 ]] && \
	mkvirtualenv ansible-2.2.2 && \
	workon ansible-2.2.2 && \
	pip install cffi && \
	pip install ansible==2.2.2
}

download_poc_repo(){
	cd /root && git clone https://github.com/pymag09/ansible-versioning.git
}

build_docker_image(){
    cd /vagrant/docker && \
    docker build -t ansible-run:latest .
}

sys_update
install_pkgs
install_python_venv
install_ansible_in_penv
download_poc_repo
build_docker_image
