from "xena/alpine"

run "apk add --no-cache go1.8.3"
copy "./go", "/usr/bin/go"

flatten
tag "xena/go-mini:1.8"
tag "xena/go-mini:1.8.3"
