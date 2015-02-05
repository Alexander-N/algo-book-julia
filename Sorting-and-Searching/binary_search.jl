function binarySearch(alist, item)
    first = 1
    last = length(alist)
    found = false

    while first<=last && !found
        midpoint = div(first + last, 2)
        if alist[midpoint] == item
            found = true
        else
            if item < alist[midpoint]
                last = midpoint-1
            else
                first = midpoint+1
            end
        end
    end
    return found
end

testlist = [0, 1, 2, 8, 13, 17, 19, 32, 42,]
println(binarySearch(testlist, 3))
println(binarySearch(testlist, 13))
