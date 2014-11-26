include("dataStructs.jl")
importall myDeque
using Base.Test

function palchecker(aString)
    chardeque = Deque()
    for ch in aString
        addRear!(chardeque, ch)
    end
    while size(chardeque) > 1
        first = removeFront!(chardeque)
        last = removeRear!(chardeque)
        if first != last
            return false
        end
    end
    return true 
end

@test palchecker("lsdkjfskf") == false
@test palchecker("radar") == true
