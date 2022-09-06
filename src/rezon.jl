module July
  help = """
         REZON : fun stuff
         (c)2022 Tim Menzies, timm@ieee.org, BSD-2
           
         USAGE: julia rezon.jl [OPTIONS]
             
         OPTIONS:
           -h  --help  show help            = false
           -p  --p     distance coeffecient = 2 
           -s  --seed  random number seed   = 10019
         """
  using Random, Parameters
  includes(dir,files) = map(f->include("../src/$dir/$f.jl"),files)
  includes("lib", ["2thing","settings","2string","lists"])
  includes("col", ["col" ,"sample"])
  the = cli(settings(help))
end
