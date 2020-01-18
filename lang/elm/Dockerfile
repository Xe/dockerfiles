FROM xena/alpine AS build
WORKDIR /elm
RUN apk --no-cache add curl \
 && curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
 && gunzip elm.gz \
 && chmod +x ./elm

FROM xena/alpine
COPY --from=build /elm/elm /usr/local/bin/elm
