module myStack
export Stack, isempty, push!, pop!, peek, size

type Stack
    items::Array{Any,1}
    Stack() = new([])
end

#import functions which will be extended
import Base.isempty
import Base.push!
import Base.pop!
import Base.size

function isempty(S::Stack)
    isempty(S.items)
end

function push!(S::Stack, item)
    push!(S.items, item)
end

function pop!(S::Stack)
    pop!(S.items)
end

function peek(S::Stack)
    S.items[end]
end

function size(S::Stack)
    size(S.items)
end

end


module myQueue
export Queue, isempty, size, enqueue!, dequeue!

type Queue 
    items::Array{Any,1}
    Queue() = new([])
end


#import functions which will be extended
import Base.isempty
import Base.size

function isempty(Q::Queue)
    isempty(Q.items)
end

function size(Q::Queue)
    size(Q.items)
end

function enqueue!(Q::Queue, item)
    unshift!(Q.items, item)
end

function dequeue!(Q::Queue)
    pop!(Q.items)
end

end
