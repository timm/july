# vim: ts=2 sw=2 et : 
function coerce(x)  x end
function coerce(s::String)  
  if ((x=tryparse(Float64,s))
      != nothing)             x 
  elseif ((s=strip(s))=="?")  s 
  elseif s=="true"            true 
  elseif s=="false"           false 
  else                        s end end 

function settings(s)
  d = Dict()
  fun=(ss -> d[ss[2][3:]] = coerce(d[end]))
  [fun(split(line)) for line in split(s,"\n") 
   if size(line)>8 and line[1:2]==" ="]
  d end

