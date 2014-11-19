include("stack.jl")
importall myStack
using Base.Test

function baseConverter(decNumber::Int64, base::Int64)
    digits = "0123456789abcdef"
    remstack = Stack()
    
    while decNumber > 0
        decNumber, remainder = divrem(decNumber, base)
        push!(remstack,remainder)
    end

    binString = ""
    while !isempty(remstack)
        # at the time of writing, conversion to string is necessary
        # this is likely to be changed in future julia versions
        binString = binString * string(digits[pop!(remstack)+1])
    end
    
    return binString 
end


@test baseConverter(25,2) == "11001"
@test baseConverter(25,16) == "19"
@test baseConverter(25,8) == "31"
@test baseConverter(256,16) == "100"
@test baseConverter(26,26) == "10"
