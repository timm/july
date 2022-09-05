"For e.g. slot x=1, update if cli has `-x 10`. For bool, cli flags flip default."
function cli(d::Dict)
  for (slot, x) in d
    for (i, v) in pairs(ARGS) 
      if v == "-" * "$slot"[1] 
        d[slot] = coerce(x==true  ? "false" : (
                         x==false ? "true"  : (
                         ARGS[i+1]))) end end end; d end 

"Return dictonary of settings, extracted from help string."
function settings(s) # -> dictionary of settings
  d=Dict()
  # for example:        -h --help  show help = false
  for m in eachmatch(r"\n\s+-[^-]+--(\S+)[^=]+=\s+(\S+)",s) 
    d[Symbol(m[1])] = coerce(m[2] ) end; d end 
