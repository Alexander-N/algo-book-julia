function recDC(coinValueList, change, knownResults)
    minCoins = change
    if change in coinValueList
        return 1
    end
    if knownResults[change] != 0
        return knownResults[change]
    end
    for i in filter(c-> c < change, coinValueList)
        numCoins = 1 + recDC(coinValueList, change-i, knownResults)
        if numCoins < minCoins
            minCoins = numCoins
            knownResults[change] = minCoins
        end
    end
    return minCoins
end


print(recDC([1,5,10,25],63,zeros(Int, 64)))

