include("dataStructs.jl")
importall myUnorderedList

#test node
temp = Node(93)
println(temp.data)

#test UnorderedList
println("")
mylist = UnorderedList()
add!(mylist, 31)
add!(mylist, 77)
add!(mylist, 17)
add!(mylist, 93)
add!(mylist, 26)
add!(mylist, 54)
println(size(mylist))
println(search(mylist, 93))
println(search(mylist, 100))
add!(mylist, 100)
println(search(mylist, 100))
println(size(mylist))
remove!(mylist, 54)
println(size(mylist))
remove!(mylist, 93)
println(size(mylist))
remove!(mylist, 31)
println(size(mylist))
println(search(mylist, 93))
