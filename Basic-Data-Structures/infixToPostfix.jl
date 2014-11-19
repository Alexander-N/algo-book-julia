include("stack.jl")
importall myStack
using Base.Test

function infixToPostfix(infixexpr::ASCIIString)
    prec = ["(" => 1,
            "+" => 2,
            "-" => 2,
            "*" => 3,
            "/" => 3]
    opStack = Stack()
    postfixList = ASCIIString[]
    tokenList = split(infixexpr)
    for token in tokenList
        if (token[1] in "ABCDEFGHIJKLMNOPQRSTUVWXYZ") || (token[1] in "0123456789")
            push!(postfixList, token)
        elseif token == "("
            push!(opStack, token)
        elseif token == ")"
            topToken = pop!(opStack)
            while topToken != "("
                push!(postfixList, topToken)
                topToken = pop!(opStack) 
            end
        else
            while !isempty(opStack) && (prec[peek(opStack)] >= prec[token])
                push!(postfixList, pop!(opStack))
            end
            push!(opStack, token)
        end
    end
    
    while !isempty(opStack)
        push!(postfixList, pop!(opStack))
    end
    
    return join(postfixList, " ")
end


@test infixToPostfix("( A + B ) * ( C + D )") == "A B + C D + *"
@test infixToPostfix("( A + B ) * C") == "A B + C *"
@test infixToPostfix("A + B * C")  == "A B C * +"
