function listsum(numList)
    if length(numList) == 1
        numList[1]
    else
        numList[1] + listsum(numList[2:end])
    end
end

println(listsum([1,3,5,7,9]))
