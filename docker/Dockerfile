FROM ubuntu
ADD ./run.sh /root/run.sh
RUN apt update && \
    apt install -y git python-pip libssl-dev && \
    pip install cffi && \
    pip install ansible==2.2.2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    git clone https://github.com/pymag09/ansible-versioning.git && \
    chmod +x /root/run.sh
WORKDIR /root
ENTRYPOINT ["/root/run.sh"]
