include("stack.jl")
importall myStack

s=Stack()
println(isempty(s))
push!(s,4)
push!(s,"dog")
println(peek(s))
push!(s,true)
println(size(s))
println(isempty(s))
push!(s,8.4)
println(pop!(s))
println(pop!(s))
println(size(s))

