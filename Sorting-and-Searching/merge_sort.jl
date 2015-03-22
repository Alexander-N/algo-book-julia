function mergeSort!(alist)
    println("Splitting $alist")
    if length(alist)>1
        mid = div(length(alist),2)
        lefthalf = alist[1:mid]
        righthalf = alist[mid+1:end]
        mergeSort!(lefthalf)
        mergeSort!(righthalf)
        i = j = k = 1
        while i <= length(lefthalf) && j <= length(righthalf)
            if lefthalf[i] < righthalf[j]
                alist[k] = lefthalf[i]
                i += 1
            else 
                alist[k] = righthalf[j]
                j += 1
            end
            k += 1
        end
        
        while i <= length(lefthalf)
            alist[k] = lefthalf[i]
            i += 1
            k += 1
        end
            
        while j <= length(righthalf)
            alist[k] = righthalf[j]
            j += 1
            k += 1
        end
    end
    println("Merging $alist")
end

alist = [54,26,93,17,77,31,44,55,20]
mergeSort!(alist)
println(alist)
