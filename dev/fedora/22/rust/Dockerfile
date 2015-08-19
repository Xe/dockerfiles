FROM xena/base

USER root
ADD ./sudo /bin/sudo
RUN wget https://static.rust-lang.org/rustup.sh -O /rust.sh &&\
    yes | bash /rust.sh -y &&\
    rm /bin/sudo

USER xena
CMD /bin/zsh
