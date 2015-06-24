fin = io.open(arg[1], "r")

if fin == nil then
  error("Can't open " .. arg[1])
end

for line in fin:lines() do
  os.execute("git clone https://github.com/" .. line)
  os.execute("cd " .. line:match(".+/(.+)") .. " && git submodule update --init --recursive && cd ..")
end

fin:close()
