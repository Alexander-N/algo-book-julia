function recMC(coinValueList, change)
    minCoins = change
    if change in coinValueList
        return 1
    end
    for i in filter(c-> c < change, coinValueList)
        numCoins = 1 + recMC(coinValueList, change-i)
        if numCoins < minCoins
            minCoins = numCoins
        end
    end
    return minCoins
end


print(recMC([1,5,10,25],63))
