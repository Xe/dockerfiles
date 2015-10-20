FROM xena/base

RUN dnf -y install emacs

USER xena
RUN git clone https://github.com/syl20bnr/spacemacs /home/xena/.emacs.d
RUN emacs --daemon
RUN emacs --daemon

CMD /bin/zsh
