require 'coins'
require 'utils'

-- Tarefa 1: Filtrar moedas ativas

function t01()
    local coins = {}
    for _, coin in ipairs(COINS) do
        if coin.isActive then
            table.insert(coins, coin)
        end
    end

    printCoins(coins)
end

-- Tarefa 2: Filtrar moedas por país

function t02()
    local country = 'alemanha'
    local codes = COIN_COUNTRY[country]
    local coins = {}
    for _, code in ipairs(codes) do
        for i, coin in ipairs(COINS) do
            if coin.code == code then
                table.insert(coins, coin)
                break
            end
        end
    end

    printCoins(coins)
end

--t01()
t02()