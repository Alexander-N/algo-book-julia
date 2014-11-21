include("dataStructs.jl")
importall myStack
using Base.Test

function divideBy2(decNumber::Int64)
    remstack = Stack()

    while decNumber > 0
        decNumber, remainder = divrem(decNumber, 2)
        push!(remstack,remainder)
    end

    binString = ""
    while !isempty(remstack)
        binString = binString * string(pop!(remstack))
    end
    
    return binString 
end


@test divideBy2(42) == "101010"
