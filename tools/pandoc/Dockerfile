FROM xena/alpine AS build

RUN apk add --no-cache ghc cabal wget alpine-sdk zlib-dev
RUN cabal update && cabal install pandoc ||:

FROM xena/alpine
RUN apk add --no-cache gmp
COPY --from=build /root/.cabal/bin/pandoc /usr/local/bin/pandoc
