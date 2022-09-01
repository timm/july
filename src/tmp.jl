# vim: ts=2 sw=2 et : 

function coerce(s)
  for t in [Int64,Float64,Bool] if (x=tryparse(t,s)) != nothing return x end end 
  return strip(s) end

function cli(d::Dict)
  for (slot, x) in d
    for (i, v) in pairs(ARGS) 
      if v == "-" * String(slot)[1] 
        d[slot] = coerce(x==true  ? "false" : (
                         x==false ? "true"  : (
                         ARGS[i+1]))) end end end; d end 

function settings(s)
  d=Dict(); for m in eachmatch(r"\n\s+-[^-]+--(\S+)[^=]+=\s+(\S+)",s) 
              d[Symbol(m[1])] = coerce(m[2]) end
  d end

help = """
       asda asd
 
       OPTIONS
 
        -a --aaaa asdas  = 10.1
        -b --bbbb asdas  = 20 
        -n --norm asdas  = true
       """

the = cli(settings(help))
print(the)
