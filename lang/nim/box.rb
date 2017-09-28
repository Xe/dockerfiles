$nimVer = "0.17.2"

from "xena/alpine"

# update envvars
env "PATH" => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/nim/bin:/root/.nimble/bin",
    "NIM_VERSION" => $nimVer

# system deps
run %q[ apk add --no-cache --virtual nim-compiler-deps wget libc-dev gcc libgcc git perl xz tar \
     && apk add --no-cache libressl ca-certificates libcrypto1.0 libssl1.0 ]

# download and build nim and nimble
run %q[ mkdir -p /opt && cd /opt \
     && wget https://nim-lang.org/download/nim-$NIM_VERSION.tar.xz \
     && /usr/bin/tar xJf nim-$NIM_VERSION.tar.xz && rm -f nim-$NIM_VERSION.tar.xz \
     && mv nim-$NIM_VERSION nim && cd nim \
     && sh build.sh \
     && cd .. && git clone https://github.com/nim-lang/nimble.git \
     && cd nimble && nim -d:release c -r src/nimble -y install ]

# shipit
flatten
tag "xena/nim:#{$nimVer}"
