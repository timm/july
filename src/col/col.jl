"Add stuff to `i`. Ignore unknown values. Increment `n`, call `inc1!`."
function inc!(i,a::Array) for x in a inc!(i,x,1) end;  a end
function inc!(i,x, n=1)
  if x != the[:unknown] i.n = i.n + n
                        inc1!(i,x,n) end  end 
