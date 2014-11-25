module myStack
export Stack, isempty, push!, pop!, peek, size

type Stack
    items::Array{Any,1}
    Stack() = new([])
end

#import functions which will be extended
import Base.isempty
import Base.size
import Base.push!
import Base.pop!

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
    size(S.items)[1]
end

end


module myQueue
export Queue, isempty, size, enqueue!, dequeue!
import Base.isempty
import Base.size

type Queue 
    items::Array{Any,1}
    Queue() = new([])
end


function isempty(Q::Queue)
    isempty(Q.items)
end

function size(Q::Queue)
    size(Q.items)[1]
end

function enqueue!(Q::Queue, item)
    unshift!(Q.items, item)
end

function dequeue!(Q::Queue)
    pop!(Q.items)
end

end

module myDeque
export Deque, isempty, size, addFront!, addRear!, removeFront!, removeRear!
import Base.isempty
import Base.size

type Deque
    items::Array{Any,1}
    Deque() = new([])
end


function isempty(D::Deque)
    isempty(D.items)
end

function size(D::Deque)
    size(D.items)[1]
end

function addFront!(D::Deque, item)
    push!(D.items, item)
end


function addRear!(D::Deque, item)
    unshift!(D.items, item)
end

function removeFront!(D::Deque)
    pop!(D.items)
end

function removeRear!(D::Deque)
    shift!(D.items)
end

end
