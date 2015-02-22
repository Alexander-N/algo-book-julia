include("HashTable.jl")

H = HashTable()
H[54] = "cat"
H[26] = "dog"
H[93] = "lion"
H[17] = "tiger"
H[77] = "bird"
H[31] = "cow"
H[44] = "goat"
H[55] = "pig"
H[20] = "chicken"
println(H.slots)
println(H.data)
println(H[20])
println(H[17])
H[20] = "duck"
println(H[20])
println(H.data)
println(H[99])
