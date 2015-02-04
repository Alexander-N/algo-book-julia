function orderedSequentialSearch(alist, item)
    found = false
    for element in alist
        if element == item
            found = true
            break
        elseif element > item
            found = false
            break
        end
    end
    return found
end

testlist = [0, 1, 2, 8, 13, 17, 19, 32, 42,]
println(orderedSequentialSearch(testlist, 3))
println(orderedSequentialSearch(testlist, 13))
