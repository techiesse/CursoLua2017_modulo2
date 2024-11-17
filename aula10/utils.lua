function printList(l)
    for i, v in ipairs(l) do
        print(v)
    end
end

function printCoin(coin)
    print(coin.name)
end

function printCoins(coins)
    for _, coin in ipairs(coins) do
        printCoin(coin)
    end
end