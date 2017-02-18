go-mini
=======

For when you need to keep things simple.

```ruby
# box.rb
# https://github.com/erikh/box
from "xena/go-mini:1.8"

run "go1.8 download"

# ... do your build

run "rm -rf $HOME/sdk"
flatten
```
