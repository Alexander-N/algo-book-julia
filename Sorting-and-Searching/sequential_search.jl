function sequentialSearch(alist, item)
    found = false
    for element in alist
        if element == item
            found = true
            break
        end
    end
    return found
end

testlist = [1, 2, 32, 8, 17, 19, 42, 13, 0]
println(sequentialSearch(testlist, 3))
println(sequentialSearch(testlist, 13))
