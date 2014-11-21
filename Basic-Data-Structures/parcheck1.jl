include("dataStructs.jl")
importall myStack
using Base.Test

function parChecker(symbolString::ASCIIString)
    s = Stack()
    for symbol in symbolString
        if symbol == '('
            push!(s, symbol)
        else
            if isempty(s)
                return false
            else
                pop!(s)
            end
        end
    end
    if isempty(s)
        return true
    else
        return false
    end
end

@test parChecker("((()))") == true
@test parChecker("(()") == false
