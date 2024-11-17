require 'coins'
require 'utils'
require 'functional'

-- Tarefa 1: Filtrar moedas ativas
function byActiveCoin(coin)
    return coin.isActive
end


function t01()
    local coins = filter(byActiveCoin, COINS)
    printCoins(coins)
end

----------------------------------------------------------

function byCountry(country)
    function by(coin)
        local codes = COIN_COUNTRY[country]
        for _, code in ipairs(codes) do
            if code == coin.code then
                return true
            end
        end
        return false
    end
    return by
end



function t02()
    local country = 'frança'
    local coins = filter(byCountry(country), COINS)
    printCoins(coins)
end


function byAll(...)
    local bys = {...}
    return function(v)
        for _, by in ipairs(bys) do
            if not by(v) then
                return false
            end
        end
        return true
    end
end


function t03()
    printCoins(filter(byAll(byActiveCoin, byCountry('alemanha')), COINS))
end


--t01()
t03()