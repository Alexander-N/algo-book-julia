include("stack.jl")
importall myStack
using Base.Test

function postfixEval(postfixexpr::ASCIIString)
    operandStack = Stack()
    postfixexpr = split(postfixexpr)
    
    for token in postfixexpr
        if token[1] in "+-*/"
            operand2 = float(pop!(operandStack))
            operand1 = float(pop!(operandStack))
            result = doMath(token, operand1, operand2)
            push!(operandStack, result)
        else
            push!(operandStack, token)
        end
    end
    pop!(operandStack)
end

function doMath(op, op1, op2)
    if op == "+"
        return op1 + op2
    elseif op == "-"
        return op1 - op2
    elseif op == "*"
        return op1 * op2
    elseif op == "/"
        return op1 / op2
    end
end
    
@test postfixEval("7 8 + 3 2 + /") == 3
