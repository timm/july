"For e.g. slot x=1, update if cli has `-x 10`. For bool, cli flags flip default."
function cli(d::Dict)
  for (slot, x) in d
    x="$x"
    for (i, v) in pairs(ARGS) 
      if v == "-" * "$slot"[1] 
        d[slot] = coerce(x=="true"  ? "false" : (
                         x=="false" ? "true"  : (
                         ARGS[i+1]))) end end end
  if d["help"] println(d["_help"]) end
  d end 

"Return dictionary of settings, extracted from help string."
function settings(s) 
  d=Dict()
  d["_help"] = s
  # for example:        -h --help  show help = false
  for m in eachmatch(r"\n\s+-[^-]+--(\S+)[^=]+=\s+(\S+)",s) 
    print(33333)
    d["$m[1]"] = m[2] #coerce( m[2] ) 
    print(44444)
  end
  for (k,v) in d println("k",k,"\nv",v) end
  d end 
