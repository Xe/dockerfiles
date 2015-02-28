yaml = require "yaml"

manifest_path = ...

error "Missing manifest_path" if not manifest_path

strip = (str) -> str\match "^%s*(.-)%s*$"

read_cmd = (cmd) ->
  f = io.popen cmd, "r"
  with strip f\read"*a"
    assert f\close!

fin = io.open manifest_path, "r"
app = yaml.load fin\read "*a"
fin\close!

if app.overlay
  print "writing overlay for #{app.name or "this application"}"

  for step, command in pairs app.overlay
    f = io.popen command, "r"
    for line in f\lines!
      print "#{step} -- #{line}"

    assert f\close!

if app.dependencies
  print "installing dependencies for #{app.name or "this application"}..."

  for _, dep in pairs app.dependencies
    print "installing dependency #{dep}"
    read_cmd "moonrocks install #{dep}"

print "done!"
