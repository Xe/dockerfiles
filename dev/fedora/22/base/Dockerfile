FROM fedora:22

RUN dnf -y groupinstall "Development Tools" &&\
    dnf -y install tar zsh git python wget openssl-devel vim-enhanced tmux dtach cmake python-devel mercurial lua luarocks gcc-c++ xz clang-devel php &&\
    useradd --create-home xena && \
    echo 'root:screencast' | chpasswd && \
    echo 'xena:user' | chpasswd && \
    chsh xena -s /bin/zsh

# Envvars!
ENV HOME /home/xena
ENV DOCKER YES
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# To use Docker please pass the docker socket as a bind mount
# Some of my servers still use docker 1.3.0
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-1.3.0 -O /usr/local/bin/docker && \
    chmod 555 /usr/local/bin/docker

# Golang compilers
RUN cd /usr/local && wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz && \
    tar xf go1.4.2.linux-amd64.tar.gz && rm go1.4.2.linux-amd64.tar.gz

ADD setup.sh /opt/xena/setup.sh
ADD ./vimplugins.lua /opt/xena/vimplugins.lua
RUN chmod 777 /opt/xena/setup.sh &&\
    su xena "/opt/xena/setup.sh"

RUN dnf -y install dnf-plugins-core &&\
    yes | dnf copr enable xena/moonscript &&\
    dnf -y install lua-moonscript &&\
    yes | dnf copr enable avsej/nim &&\
    dnf -y install nim

# Add Tini
ENV TINI_VERSION v0.5.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

USER xena
CMD /bin/zsh
