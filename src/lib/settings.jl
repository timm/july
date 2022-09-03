# Update `slot` in `d` if a cli flag has the slot prefix;e.g. "-f" for "file".
function cli(d::Dict)
  for (slot, x) in d
    for (i, v) in pairs(ARGS) 
      if v == "-" * "$slot"[1] 
        d[slot] = coerce(x==true  ? "false" : (
                         x==false ? "true"  : (
                         ARGS[i+1]))) end end end; d end 

# Return a dictionary of settings extracted from a help string. 
function settings(s)
  d=Dict()
  for m in eachmatch(r"\n\s+-[^-]+--(\S+)[^=]+=\s+(\S+)",s) 
    d[Symbol(m[1])] = coerce(m[2] ) end; d end
