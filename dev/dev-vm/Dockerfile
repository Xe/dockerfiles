FROM flitter/init:latest

USER root

# Package installs
RUN apt-get update && \
    apt-get upgrade -qy && \
    apt-get install -qy zsh git python wget build-essential libssl-dev vim tmux dtach dvtm cmake python-dev golang mercurial bzr

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make user account
RUN useradd --create-home xena && \
    echo 'root:screencast' | chpasswd && \
    echo 'xena:user' | chpasswd

ENV HOME /home/xena
ENV DOCKER YES
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8
ENV LANG en_us.utf-8
ENV LC_CTYPE en_US.UTF-8
ENV GOPATH /home/xena/go
ENV PATH /usr/local/go/bin:$PATH

# To use Docker please pass the docker socket as a bind mount
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/local/bin/docker && \
    chmod 555 /usr/local/bin/docker

WORKDIR /home/xena

# Dotfiles
RUN setuser xena mkdir code
RUN setuser xena git clone https://github.com/Xe/dotfiles code/dotfiles

ADD setup.sh /home/xena/
RUN setuser xena bash setup.sh

RUN chsh xena -s /bin/zsh

EXPOSE 22

CMD ["/sbin/my_init", "setuser", "xena", "/bin/zsh"]

