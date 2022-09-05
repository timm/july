@with_kw mutable struct Row 
  _cells=[]      # where we keep, at most, the[:sample] items 
  _cooked=[]
  _inside= [] end

rows(i::Data,src::String, fun) = csv(src,x -> inc!(i,x))
rows(i::Data,src::Array,  fun) = for one in src inc!(i, x) end

function inc!(i::Data, row::Array) inc!(i, Row(_cells=i, _inside=i)) end
function inc!(i::Data, row::Row)
  push!(i.rows, row)
  for cols in [i.cols.x,i.cols.y]
    for col in cols
      col:inc!(row.cells[col.at]) end end end
