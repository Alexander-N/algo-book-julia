type HashTable
    size::Int
    slots::Array{Int, 1}
    data::Array{Any, 1}
    HashTable() = new(11,int(zeros(11)),zeros(11))
end

function hashfunction(key, size)
    key % size
end

function rehash(oldhash, size)
    (oldhash+1) % size
end

