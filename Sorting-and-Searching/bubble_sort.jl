function bubbleSort(alist)
    for passnum in length(alist)-1:-1:1
        for i in 1:passnum
            if alist[i] > alist[i+1]
                alist[i], alist[i+1] = alist[i+1], alist[i]
            end
        end
    end
    return alist
end

alist = [54,26,93,17,77,31,44,55,20]
bubbleSort(alist)
print(alist)
