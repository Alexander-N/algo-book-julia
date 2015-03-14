function insertionSort(alist)
    for index in 2:length(alist)
        currentvalue = alist[index]
        position = index
        while position > 1 && alist[position-1] > currentvalue
            alist[position] = alist[position-1]
            position -= 1
        alist[position] = currentvalue 
        end
    end
end

alist = [54,26,93,17,77,31,44,55,20]
insertionSort(alist)
println(alist)
