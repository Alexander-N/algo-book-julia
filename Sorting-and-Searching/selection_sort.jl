function selectionSort(alist)
    for fillslot in length(alist):-1:1
        positionOfMax = 1
        for location in 1:fillslot
            if alist[location] > alist[positionOfMax]
                positionOfMax = location
            end
        end
        alist[fillslot], alist[positionOfMax] = alist[positionOfMax], alist[fillslot]
    end
    return alist
end

alist = [54,26,93,17,77,31,44,55,20]
selectionSort(alist)
println(alist)
