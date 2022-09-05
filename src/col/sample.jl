"Keep, at most `the[:max]` items."
@with_kw mutable struct Sample 
  _has=[]      # where we keep, at most, the[:sample] items 
  ok=false end # true if we have sorted _has since its last chandge

"Add something to `_has`. If full, replace anything at random."
function inc1!(i::Sample,x,n) # <== tedious detail, ignore n (used only in Sym)
  a = i._has
  n = length(a)
  if     ( n      < the[:max] ) begin i.ok=false; push!(a,x)  end
  elseif ( rand() < n/i.n )     begin i.ok=false; a[Int(n*rand())+1]=x end end end

" `mid` = median. `div` = standard deviation. `per` returns the n-th item."
mid(i::Sample,    a=nums(i)) = per(a,.5) 
div(i::Sample,    a=nums(i)) = (per(a,.9) - per(a, .1)) / 2,58 
nums(i::Sample) = begin ( !i.ok || sort!(i._has) ) ; i.ok=true ; i._has end 
