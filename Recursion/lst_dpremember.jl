function dpMakeChange(coinValueList, change, minCoins, coinsUsed)
    for cents in [1:change]
        coinCount = cents
        newCoin = 1
        for j in filter(c -> c <= cents, coinValueList)
            if (minCoins[cents-j+1] + 1) < coinCount
                coinCount = minCoins[cents-j+1] + 1
                newCoin = j
            end
        end
        minCoins[cents+1] = coinCount
        coinsUsed[cents+1] = newCoin
    end
    return minCoins[change+1]
end

amnt = 63
clist = [1,5,10,21,25]
coinsUsed = zeros(Int,amnt+1)
coinCount = zeros(Int,amnt+1)


print(dpMakeChange(clist,amnt,coinCount,coinsUsed))
