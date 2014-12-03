function listsum(numList)
    theSum = 0
    for i in numList
        theSum = theSum + i
    end
    return theSum
end

println(listsum([1,3,5,7,9]))
