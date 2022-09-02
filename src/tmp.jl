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
# ### String to Things
# Coerce string to thing.
function coerce(s)
  for t in [Int64,Float64,Bool] if (x=tryparse(t,s)) != nothing return x end end 
  return strip(s) end

# Coerce csv rows to cells.
function csv(file, fun)
  for line in eachline(file)
    line = strip(line)
    if sizeof(line) > 0 fun(map(coerce, split(line, ","))) end end end 

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
function inc!(i,x,n=1)
  if x != the[:unknown] i.n += n; inc1!(i x,n) end end

# -----------------------------------------------------------------------------
# Keep, at most `the[:max]` items.
@with_kw mutable struct Some _has=[]; ready=false end

# Add something to `_has`. But if its full, replace anything at random.
function inc1!(i::Some,x)
  m = length(i._has)
  if     (m      < the[:max]) (i.ready=false; push!(i._has,x))
  elseif (rand() < m/i.n) (i.ready=false; i._has[int(m*rand())+1]=x) end end end  

# `mid` = median. `div` = standard deviation. `per` returns the n-th item.
mid(i::Some)   = per(i,.5)
div(i::Some)   = (per(i,.9) - per(i, .1)) / 2,58
per(i::Some,n) = (ok(i); i._has[int(n*length(i._has))+1]) 
fresh(i::Some) = i.ready ? i._has : (sort!(i._has); i.ready=true; i._has)

# ------------------------------------------------------------------------------
@with_kw mutable struct Num 
  at=0; txt=""; w=1;  n=0; lo=10^30; hi=-1*10^30; _all=Some()  end

mid(i::Num)   = i.mu
stale(i::Num) = i.sd = nothing


# the = cli(settings(help))
# println(the)
# csv("../data/auto93.csv", println)

end
