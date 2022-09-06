using Random,Test

function bb() println(2) end

function aux1(fun,settings,  b4=Dict(),out=true)
  b4 = Dict()
  for (k,v) in settings b4[k]=v end
  Random.seed!(settings[:seed])
  try     ; out = fun()
  catch e ; printstyled("FAILED: $e\n"    ; color= :red) end
  if out!=true printstyled("FAILED: $(fun)\n"; color= :red) end
  for (k,v) in b4 settings[k]=v end
  return out != true end 

d=Dict()
d[:seed] = 100019
aux1(() -> print(:aa), d)
