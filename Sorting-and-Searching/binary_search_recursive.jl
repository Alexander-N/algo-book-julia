function binarySearch(alist, item)
    if length(alist) == 0
        return false
    else
        midpoint = div(length(alist), 2)
        if alist[midpoint+1] == item
            return true
        else
            if item < alist[midpoint+1]
                binarySearch(alist[1:midpoint], item)
            else
                binarySearch(alist[midpoint+2:end], item)
            end
        end
    end
end

testlist = [0, 1, 2, 8, 13, 17, 19, 32, 42,]
println(binarySearch(testlist, 3))
println(binarySearch(testlist, 13))
testlist = [1, 2, 8, 13, 17, 19, 32, 42,]
println(binarySearch(testlist, 3))
println(binarySearch(testlist, 13))
println(binarySearch(testlist, 0))
