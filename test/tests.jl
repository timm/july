include("../src/rezon.jl")

fails=0

function run(settings,sName,fun,    b4=Dict(),out=true,inc=0)
  for (k,v) in settings b4[k]=v end
  Random.seed!(settings[:seed])
  try out=fun()
  catch e 
    printstyled("FAILED: $sName\n" ; color= :red) 
    inc = 1 end
  if out!=true 
    printstyled("FAILED: $sName\n"; color= :red) 
    inc = 1 end
  fails += inc
  for (k,v) in b4 settings[k]=v end end

eg = Dict()

eg["ls"] =() -> [print("\t$k")    for k in sort(collect(keys(eg)))]
eg["all"]=() -> [run(the,k,eg[k]) for k in sort(collect(keys(eg))) if k != "all"] 

eg["the"] = ()-> println(the)
eg["num"] = Num()

if eg.haskey(the.eg) test1(the, the.eg,  eg[the.eg]) end
exit(fails)
