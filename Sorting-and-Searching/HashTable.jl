type HashTable
    slots::Array{Int, 1}
    data::Array{Any, 1}
    HashTable() = new(int(zeros(11)),fill(nothing,11))
end

function hashfunction(key, size)
    key % size + 1
end

function rehash(oldhash, size)
    (oldhash+1) % size + 1
end

function setindex!(hashtable::HashTable, data, key::Int)
    put(hashtable, key, data)
end

function getindex(hashtable::HashTable, key::Int)
    get(hashtable, key)
end

function put(hashtable::HashTable, key::Int, data)
    hash = hashfunction(key, length(hashtable.slots))
    if hashtable.data[hash] == nothing
        hashtable.slots[hash] = key
        hashtable.data[hash] = data
    else
        while hashtable.data[hash] != nothing && hashtable.slots[hash] != key
            hash = rehash(hash, length(hashtable.slots))
        end
        hashtable.slots[hash] = key
        hashtable.data[hash] = data
    end
end

function get(hashtable::HashTable, key::Int)
    startslot = hash = hashfunction(key, length(hashtable.slots))
    while hashtable.slots[hash] != key 
        hash = rehash(hash, length(hashtable.slots))
        if hash == startslot
            return nothing 
        end
    end
    return hashtable.data[hash]
end
