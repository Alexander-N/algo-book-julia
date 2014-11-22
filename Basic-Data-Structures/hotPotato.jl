include("dataStructs.jl")
importall myQueue
using Base.Test

function hotPotato(namelist, num)
    simqueue = Queue()

    for name in namelist
        enqueue!(simqueue, name)
    end
    
    while size(simqueue) > 1
        for i in 1:num
            enqueue!(simqueue, dequeue!(simqueue))
        end
        dequeue!(simqueue)
    end
    dequeue!(simqueue)
end



namelist = ["Bill","David","Susan","Jane","Kent","Brad"]
num = 7
    
@test hotPotato(namelist, num) == "Susan"
