FROM xena/alpine AS build
RUN apk add --no-cache ghc cabal wget alpine-sdk zlib-dev
RUN cabal update && cabal install pandoc ||:

FROM xena/alpine
RUN apk add --no-cache gmp libffi texlive-xetex texmf-dist-fontsextra
RUN apk add --no-cache texmf-dist-latexextra
COPY --from=build /root/.cabal/share/x86_64-linux-ghc-8.6.5/pandoc-2.9.1.1/data /root/.cabal/share/x86_64-linux-ghc-8.6.5/pandoc-2.9.1.1/data
COPY --from=build /root/.cabal/bin/pandoc /usr/local/bin/pandoc
# NOTE: https://www.amazon.com/gp/feature.html?docId=1000765211
ENV KINDLEGEN_VERSION="2.9"
ENV KINDLEGEN_CHECKSUM="9828db5a2c8970d487ada2caa91a3b6403210d5d183a7e3849b1b206ff042296"
RUN apk add --no-cache ca-certificates curl tar
RUN curl "https://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v${KINDLEGEN_VERSION/\./_}.tar.gz" \
  -o "kindlegen-$KINDLEGEN_VERSION.tar.gz" \
  && echo "$KINDLEGEN_CHECKSUM  kindlegen-$KINDLEGEN_VERSION.tar.gz" | sha256sum -c - \
  && mkdir /kindlegen \
  && tar -xzf "kindlegen-$KINDLEGEN_VERSION.tar.gz" -C /kindlegen \
  && rm "kindlegen-$KINDLEGEN_VERSION.tar.gz" \
  && mv /kindlegen/kindlegen /usr/local/bin/kindlegen \
  && rm -rf /kindlegen
