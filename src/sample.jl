# Keep, at most `the[:max]` items.
@with_kw mutable struct Sample 
  _has=[]  # where we keep, at most, the[:sample] items 
  ok=false # true if we have sorted the _has since last addition
  end

# Add something to `_has`. But if its full, replace anything at random.
function inc1!(i::Sample,x,n) # <== tedious detail, ignore n (used only in Sym)
  m = length(i._has)
  if     (m      < the[:max]) (i.ok=false; push!(i._has,x))
  elseif (rand() < m/i.n)     (i.ok=false; i._has[int(m*rand())+1]=x) end end 


# `mid` = median. `div` = standard deviation. `per` returns the n-th item.
mid(i::Sample)  = a=nums(i);  per(a,.5)
div(i::Sample)  = a=nums(i); (per(a,.9) - per(a, .1)) / 2,58
nums(i::Sample) = if i.ok i._has else sort!(i._has); i.ok=true; i._has end


