module Rezon
  help = """
         REZON : fun stuff
         (c)2022 Tim Menzies, timm@ieee.org, BSD-2
           
         USAGE: julia rezon.jl [OPTIONS]
             
         OPTIONS:
           -e  --egs   what to do            = nothing
           -h  --help  show help             = false
           -p  --p     distance coeffecient  = 2 
           -s  --seed  random number seed    = 10019
         """
  using Random, Parameters
  includes(dir,files) = map(f->include("../src/$dir/$f.jl"),files)
  includes("lib", ["2thing","settings","2string","lists"])
  includes("col", ["col" ,"sample"])
  print(111)
  the = settings(help)
  print(222)
  println(the)
end
