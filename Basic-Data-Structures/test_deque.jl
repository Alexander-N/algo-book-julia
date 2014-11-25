include("dataStructs.jl")
importall myDeque

d=Deque()
println(isempty(d))
addRear!(d,4)
addRear!(d,"dog")
addFront!(d,"cat")
addFront!(d,true)
println(size(d))
println(isempty(d))
addRear!(d,8.4)
println(removeRear!(d))
println(removeFront!(d))
