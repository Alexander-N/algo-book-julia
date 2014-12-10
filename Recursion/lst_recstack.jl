include("../Basic-Data-Structures/dataStructs.jl")
importall myStack

rStack = Stack()

function toStr(n::Int, base::Int)
    convertString = "0123456789ABCDEF"
    while n > 0
        if n < base
            push!(rStack, convertString[n+1])
        else
            push!(rStack, convertString[(n%base)+1])
        end
        n = div(n, base)
    end
    res = ""
    while !isempty(rStack)
        res = string(res, pop!(rStack))
    end
    return res
end

println(toStr(1453, 16))

