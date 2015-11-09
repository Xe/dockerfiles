FROM nginx

ONBUILD ADD . /site
ONBUILD RUN cd /site && sw site && cp -vrf ./site.static /usr/share/nginx/html

ADD https://github.com/jroimartin/sw/archive/master.tar.gz /opt/sw.tar.gz
RUN cd /opt && tar vxf sw.tar.gz \
 && cd sw-master \
 && cp md2html.awk /usr/local/bin/md2html.awk \
 && cp sw /usr/local/bin/sw \
 && chmod a+x /usr/local/bin/*
