include("dataStructs.jl")
importall myOrderedList

mylist = OrderedList()
add!(mylist, 31)
add!(mylist, 77)
add!(mylist, 17)
add!(mylist, 93)
add!(mylist, 26)
add!(mylist, 54)

println(size(mylist))
println(search(mylist, 93))
println(search(mylist, 100))
println(mylist)
