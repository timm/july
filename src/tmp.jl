# vim: ts=2 sw=2 et : 
help="asa
asd
asd
as
asdas"

phone = r"\((\d{3})\)-(\d{3})-(\d{4})"
text = """
       My phone number is (555)-505-1000.
       Her phone number is (555)-999-9999.
       """

print(ARGS)

for m in eachmatch(phone, text)
           println("Matched $(m.match) with area code $(m[1])") end

function coerce(s)
  for t in [Int64,Float64,Bool] if (x=tryparse(t,s)) != nothing return x end end 
  return strip(s) end

function cli(d::Dict)
  for (slot, x) in d
    for (i, v) in pairs(ARGS) 
      if v == "-" * slot[1] 
        d[slot]= coerce(x==true  ? "false" : (
                        x==false ? "true"  : (ARGS[i+1]))) end end end
  d end 

d =Dict()

text = """
asda asd

Fred: sdsaas
OPTIONS

 -a --aaaa asdas  = 10.1
 -b --bbbb asdas  = 20 
 -n --norm asdas  = true
"""
want = r"\n [-][^-]+[-][-]([\S]+)[^=]+=[\s]+([\S]+)"
for m in eachmatch(want, text) d[m[1]] = coerce(m[2]) end
println(d)
println(cli(d))
println(d.k)
# the=[]
# setting(words) = (the[words[1][2:end]] = coerce(words[end]))
#
# [setting(split(line," ")) for line in split(help,"\n") if line[1:2]==" -"]
