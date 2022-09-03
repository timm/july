# vim: ts=2 sw=2 et : 
module Tmp
export Num,Sym,Sample

help = """
       TMP : thing that is fun
       (c)2022 Tim Menzies timm@ieee.org BSD-2
 
       Usage: julia tmp.kl [OPTIONS]

       OPTIONS:
        -a --aaaa asdas      = 10.1
        -s --sample sample = 512
        -h --help show help = false
        -b --bbbb asdas      = 20 
        -u --unknown unknown = ?
       """

for f in [
  "lib/2thing.jl","lib/2string.jl","lib/settings.jl","lib/lists.jl",
  "col/col.jl", "col/sample.jl"]
  include(f) end

end
