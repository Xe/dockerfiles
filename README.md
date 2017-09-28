# dockerfiles

## tl;dr

To build every image: `$ mage all`

## xena/alpine

My custom spin of [Alpine Linux][alpine-linux] for containers with runit as a
process manager. This also starts syslog in every container and adds my custom
repo whose apkbuilds are at https://github.com/Xe/aports.

This is based on alpine edge. I can make a version based on a stable branch if
there is interest however.

## xena/go

```ruby
$gover = "1.9"
$repo = "github.com/user/project"

from "xena/go"

def foldercopy(dir)
  copy "#{dir}", "/root/go/src/#{$repo}/#{dir}"
end

def gobuild(pkg)
  run "go build #{$repo}/#{pkg} && go install #{$repo}/#{pkg}"
end

[
    # vendor dependencies first so any changes to them breaks the cache.
    "vendor",
    # common prefix for code that can be reused.
    "pkg",
    # internal packages for things like database helpers.
    "internal",
    # the binaries that get run
    "cmd",
    # any scripts or tools needed for building the program
    "build",
].each { |x| foldercopy x }

gobuild "cmd/foobar"
run "cp /go/bin/foobar /usr/local/bin/foobar"

run "rm -rf /usr/local/go /go/pkg /go/bin"

flatten

workdir "/go/src/#{$repo}"
cmd "/usr/local/bin/foobar"

tag "user/project:latest"
```

## xena/go-mini

### paths to delete when cleaning

- /root/sdk
- /root/go/pkg
- /root/go/bin

## xena/nim

```ruby
from "xena/nim:0.17.2"

[
    "project.nimble",
    "public",
    "src",
].each { |x| copy x, "/app/" + x }

run "cd /app && nimble update && yes | nimble build"

cmd "sh -c 'cd /app && ./project'"

# clean up
run %q[ rm -rf /root/.nimble /opt ./src/nimcache && apk del libc-dev gcc curl libgcc git perl xz tar nim-compiler-deps ]

flatten
tag "user/project"
```

---

[alpine-linux]: https://alpinelinux.org
