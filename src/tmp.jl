# vim: ts=2 sw=2 et : 
help="asa
asd
asd
as
asdas"

function coerce(x)  x end
function coerce(s::String)  
  if ((x=tryparse(Float64,s))
      != nothing)             x 
  elseif ((s=strip(s))=="?")  s 
  elseif s=="true"            true 
  elseif s=="false"           false 
  else                        s end  end 

x= 23
      println(coerce(x), " ", typeof(coerce(x)))

# the=[]
# setting(words) = (the[words[1][2:end]] = coerce(words[end]))
#
# [setting(split(line," ")) for line in split(help,"\n") if line[1:2]==" -"]
