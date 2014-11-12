include("stack.jl")
using myStack
using Base.Test

function parChecker(symbolString::ASCIIString)
    s = Stack()
    for symbol in symbolString
        if symbol in "([{"
            push!(s, symbol)
        else
            if isempty(s)
                return false
            end
            top = pop!(s)
            if !matches(top, symbol)
                return false
            end
        end
    end
    
    if isempty(s)
        return true
    else
        return false
    end
end

function matches(open::Char, close::Char)
    opens = "([{"
    closers = ")]}"
    findin(opens, open) == findin(closers, close)
end

@test parChecker("{{([][])}()}") == true
@test parChecker("[{()]") == false
@test matches('(', ')') == true
@test matches('(', ']') == false
@test parChecker("([)]") == false
