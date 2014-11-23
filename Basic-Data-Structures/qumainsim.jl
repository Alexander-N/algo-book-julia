include("dataStructs.jl")
importall myQueue
using Base.Test


type pTask
    timeStamp::Int64
    pages::Int64
    pTask(time) = new(time, rand(1:21))
end

type Printer
    pagerate::Float64 #pages per minute
    currentTask::Union(pTask, Nothing)
    timeRemaining::Float64
    Printer(ppm) = new(ppm, nothing, 0)
end

#Printer functions
function tick!(p::Printer)
    if p.currentTask != nothing
        p.timeRemaining -= 1
        if p.timeRemaining <= 0
            p.currentTask = nothing
        end
    end
end

function busy(p::Printer)
    if p.currentTask != nothing
        return true
    else
        return false
    end
end

function startNext!(p, newTask)
    p.currentTask = newTask
    p.timeRemaining = getPages(newTask) * 60/p.pagerate
end


#pTask function
function getStamp(t::pTask)
    t.timeStamp
end

function getPages(t::pTask)
    t.pages
end

function waitTime(t::pTask, currentTime)
    currentTime - t.timeStamp
end

#Simulation
function newPrintTask()
    num = rand(1:180)
    if num == 180
        return true
    else
        return false
    end
end

function simulation(numSeconds, pagesPerMinute)
    labprinter = Printer(pagesPerMinute)
    printQueue = Queue()
    waitingtimes = Float64[]   
    
    for currentSecond in 1:numSeconds
        if newPrintTask()
            enqueue!(printQueue, pTask(currentSecond))
        end

        if !busy(labprinter) && !isempty(printQueue)
            nexttask = dequeue!(printQueue)
            push!(waitingtimes, waitTime(nexttask,currentSecond))
            startNext!(labprinter, nexttask)
        end
        
        tick!(labprinter)
    end

    averageWait=sum(waitingtimes)/length(waitingtimes)
    @printf "Average Wait %6.2f secs %3d tasks remaining.\n" averageWait size(printQueue)   
end

for i in 1:10
    simulation(3600,10)
end

        
