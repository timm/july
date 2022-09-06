"Coerce string to thing."
function coerce(s::Bool) s end
function coerce(s)
  s = strip(s) 
  print(s)
  if s == "true"  return true end
  if s == "false" return false end
  for t in [Int64,Float64] if (x=tryparse(t,s)) != nothing return x end  end
  return s end  

"Coerce rows to cells. Pass each row to `fun`."
function csv(src, fun)
  for line in eachline(file)
    line = strip(line)
    if sizeof(line) > 0 fun(map(coerce, split(line, ","))) end end end 


