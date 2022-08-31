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
  for line in split(s,"\n") 
    if size(line)>8 && line[1:2]==" ="
      (a -> d[a[2][3:end]] = coerce(a[end]))(split(line)) end end
  d end

