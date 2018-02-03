#!/bin/sh

set +e
set +x

version=1.0-alpha4

mkdir adelie
cd adelie

../apk -X https://distfiles.adelielinux.org/adelie/${version}/system -X https://distfiles.adelielinux.org/adelie/${version}/user -U --allow-untrusted --root . --initdb add adelie-base bash-binsh ssmtp

tar cf ../adelie-$version.tar *

cd ..
rm -rf adelie

docker import adelie-$version.tar xena/adelie:$version
docker push xena/adelie:$version
