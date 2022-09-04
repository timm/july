# vim: ts=2 sw=2 et : 
module tmp
export Num,Sym,Sample
help = """
       JULY : fun stuff
       (c)2022 Tim Menzies, timm@ieee.org, BSD-2
         
       USAGE: julia july.jl [OPTIONS]
           
       OPTIONS:
         -h  --help  show help            = false
         -p  --p     distance coeffecient = 2 
       """

using Random, Parameters
for f in ["lib/2thing.jl", "lib/settings.jl", "lib/2string.jl",
          "lib/settings.jl","lib/lists.jl", "col/col.jl", "col/sample.jl"]
  include(f) end

the = cli(settings(help))
end
