FROM docker.io/xena/dotfiles

USER root
RUN dnf -y install sbcl

USER xena
WORKDIR /home/xena
RUN (mkdir dl || true)
ADD ./setup.lisp dl/setup_quicklisp.lisp
ADD ./sbclrc /home/xena/.sbclrc

RUN wget https://beta.quicklisp.org/quicklisp.lisp -O dl/quicklisp.lisp && \
    sbcl --load dl/quicklisp.lisp < dl/setup_quicklisp.lisp
