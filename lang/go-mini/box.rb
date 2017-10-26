from "xena/alpine"

run "apk add --no-cache go1.9.2"
copy "./go", "/usr/bin/go"

flatten
tag "xena/go-mini:1.9.2"
tag "xena/go-mini:1.9"
