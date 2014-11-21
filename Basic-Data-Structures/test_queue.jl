include("dataStructs.jl")
importall myQueue

q = Queue()

enqueue!(q, 4)
enqueue!(q, "dog")
enqueue!(q, true)
println(size(q))
println(isempty(q))
enqueue!(q, 8.4)
println(dequeue!(q))
println(dequeue!(q))
println(size(q))
