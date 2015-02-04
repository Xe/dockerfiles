FROM ubuntu:14.04

RUN apt-get update && apt-get install -y hexchat ca-certificates

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/xena && \
    echo "xena:x:${uid}:${gid}:Developer,,,:/home/xena:/bin/bash" >> /etc/passwd && \
    echo "xena:x:${uid}:" >> /etc/group && \
    echo "xena ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/xena && \
    chmod 0440 /etc/sudoers.d/xena && \
    chown ${uid}:${gid} -R /home/xena

USER xena
ENV HOME /home/xena
CMD /usr/bin/hexchat
