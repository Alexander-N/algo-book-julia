type HashTable
    slots::Array{Int, 1}
    data::Array{Any, 1}
    HashTable() = new(int(zeros(11)),fill(nothing,11))
end

function hashfunction(key, size)
    key % size
end

function rehash(oldhash, size)
    (oldhash+1) % size
end

function get(hashtable::HashTable, key::Int, data)
    hashvalue = hashfunction(key, length(hashtable.slots))
end
                      
