# Keep, at most `the[:max]` items.
@with_kw mutable struct Some 
  _has=[];    # where we keep, at most, the[:max] items
  ok=false # true if we have resorted since last addition.
  end

# Add something to `_has`. But if its full, replace anything at random.
function inc1!(i::Some,x,n) # <== n is ignored, used only in Sym
  m = length(i._has)
  if     (m      < the[:max]) (i.ok=false; push!(i._has,x))
  elseif (rand() < m/i.n)     (i.ok=false; i._has[int(m*rand())+1]=x) end end 

# `mid` = median. `div` = standard deviation. `per` returns the n-th item.
mid(i::Some)   = per(i,.5)
div(i::Some)   = (per(i,.9) - per(i, .1)) / 2,58
per(i::Some,n) = (nums(i); i._has[int(n*length(i._has))+1]) 
nums(i::Some) = i.ok ? i._has : (sort!(i._has); i.ok=true; i._has)


