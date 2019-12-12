FROM xena/alpine AS build
RUN apk --no-cache add cargo rust alpine-sdk openssl-dev cmake \
 && cargo install mdbook \
 && apk del cargo rust alpine-sdk \
 && cp /root/.cargo/bin/mdbook /usr/local/bin

FROM xena/alpine
RUN apk --no-cache add libgcc
COPY --from=build /usr/local/bin/mdbook /usr/local/bin
