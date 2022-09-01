# vim: ts=2 sw=2 et : 

function coerce(s)
  if     ((x=tryparse(Int64,s))   != nothing)  x 
  elseif ((x=tryparse(Float64,s)) != nothing)  x 
  elseif ((s=strip(s))=="?")                   "?" 
  elseif s=="true"                             true 
  elseif s=="false"                            false 
  else                                         s end end 

function cli(d::Dict)
  for (slot,x) in d
    for (i, v) in pairs(ARGS) 
      if v == "-" * slot[1] 
        d[slot] = coerce(x==true  ? "false" : (
                         x==false ? "true"  : (
                         ARGS[i+1]))) end end end; d end 

function settings(s)
  d=Dict()
  rWant = r"\n[\s]+[-][^-]+[-][-]([\S]+)[^=]+=[\s]+([\S]+)"
  for m in eachmatch(rWant, s) d[m[1]] = coerce(m[2]) end
  d end

help = """
       asda asd
 
       Fred: sdsaas
       OPTIONS
 
        -a --aaaa asdas  = 10.1
        -b --bbbb asdas  = 20 
        -n --norm asdas  = true
       """

println(cli((settings(help))))

# the=[]
# setting(words) = (the[words[1][2:end]] = coerce(words[end]))
#
# [setting(split(line," ")) for line in split(help,"\n") if line[1:2]==" -"]
