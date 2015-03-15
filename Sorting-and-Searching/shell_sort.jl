function shellSort(alist)
    sublistcount = div(length(alist),2)
    while sublistcount > 0
        for startposition in 1:sublistcount
            gapInsertionSort(alist,startposition,sublistcount)
        end
        println("After increments of size $sublistcount, The list is $alist")
        sublistcount = div(sublistcount,2)
    end
end

function gapInsertionSort(alist, start, gap)
    for i in start+gap:gap:length(alist)
        currentvalue = alist[i]
        position = i
        while position > gap && alist[position-gap] > currentvalue
            alist[position] = alist[position-gap]
            position -= gap
        end
        alist[position] = currentvalue
    end
end

alist = [54,26,93,17,77,31,44,55,20]
shellSort(alist)
println(alist)
