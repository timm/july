# vim: ts=2 sw=2 et : 

function coerce(s)
  for t in [Int64,Float64,Bool] if (x=tryparse(t,s)) != nothing return x end end 
  return strip(s) end

function cli(d::Dict)
  for (slot, x) in d
    for (i, v) in pairs(ARGS) 
      if v == "-" * slot[1] 
<<<<<<< HEAD
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
=======
        d[slot]= coerce(x==true  ? "false" : (
                        x==false ? "true"  : (ARGS[i+1]))) end end end
  d end 

d =Dict()

text = """
asda asd
>>>>>>> a315497ee2dfa88b8ab18e9cc062065096a04d35

println(cli((settings(help))))

<<<<<<< HEAD
=======
 -a --aaaa asdas  = 10.1
 -b --bbbb asdas  = 20 
 -n --norm asdas  = true
"""
want = r"\n [-][^-]+[-][-]([\S]+)[^=]+=[\s]+([\S]+)"
for m in eachmatch(want, text) d[m[1]] = coerce(m[2]) end
println(d)
println(cli(d))
println(d.k)
>>>>>>> a315497ee2dfa88b8ab18e9cc062065096a04d35
# the=[]
# setting(words) = (the[words[1][2:end]] = coerce(words[end]))
#
# [setting(split(line," ")) for line in split(help,"\n") if line[1:2]==" -"]
