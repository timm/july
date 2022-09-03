# vim: ts=2 sw=2 et : 
module Tmp

help = """
       TMP : thing that is fun
       (c)2022 Tim Menzies timm@ieee.org BSD-2
 
       Usage: julia tmp.kl [OPTIONS]

       OPTIONS:
        -a --aaaa asdas      = 10.1
        -b --bbbb asdas      = 20 
        -n --norm asdas      = true
        -u --unknown unknown = ?
       """

# ------------------------------------------------------------------------------
# ## Lib
inlcude("lb/2thing.jl")
# ### Thing to String
function say(i)
  s,pre="$(typeof(i)){",""
  for f in sort!([x for x in fieldnames(typeof(i)) if !("$x"[1] == '_')])
    s,pre = s * pre * ":$f $getfield(i,f)" ," " end
  print(s * "}") end

# ### Settings
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

# -----------------------------------------------------------------------------
# Generic add. Ignore unknown values. Increment `n`, call `inc1!`.
function incs(i,a) for x in a inc!(i,x); end; a end
function inc!(i,x,n=1)
  if (x != the[:unknown]) (i.n += n; inc1!(i x,n)); end end

# -----------------------------------------------------------------------------
# Keep, at most `the[:max]` items.
@with_kw mutable struct Some _has=[]; ready=false end

# Add something to `_has`. But if its full, replace anything at random.
function inc1!(i::Some,x,n) # <== n is ignored, used only in Sym
  m = length(i._has)
  if     (m      < the[:max]) (i.ready=false; push!(i._has,x))
  elseif (rand() < m/i.n) (i.ready=false; i._has[int(m*rand())+1]=x) end end end  

# `mid` = median. `div` = standard deviation. `per` returns the n-th item.
mid(i::Some)   = per(i,.5)
div(i::Some)   = (per(i,.9) - per(i, .1)) / 2,58
per(i::Some,n) = (nums(i); i._has[int(n*length(i._has))+1]) 
nums(i::Some) = i.ready ? i._has : (sort!(i._has); i.ready=true; i._has)

incs(Some(),[1,2,3,4,5,6])
# ------------------------------------------------------------------------------

# the = cli(settings(help))
# println(the)
# csv("../data/auto93.csv", println)

end
