"print a struct"
function say(i)
  s,pre="$(typeof(i)){",""
  for f in sort!([x for x in fieldnames(typeof(i)) if !("$x"[1] == '_')])
    s,pre = s * pre * ":$f $getfield(i,f)" ," " end
  print(s * "}") end


