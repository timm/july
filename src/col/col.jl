# Add stuff to `i`. Ignore unknown values. Increment `n`, call `inc1!`.
function incs(i,a) 
  for x in a inc!(i,x)  end
  a end

function inc!(i,x, n)
  if x != the[:unknown] 
    i.n = i.n+n
    inc1!(i,x,n) end  end 


