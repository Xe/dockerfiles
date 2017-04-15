from "xena/alpine"

run "apk add gmp"
run "rm /usr/bin/vardene"

flatten
tag "xena/haskell"
