type HashTable
    size::Int
    slots::Array{Int, 1}
    data::Array{Any, 1}
    HashTable() = new(11,int(zeros(11)),zeros(11))
end
