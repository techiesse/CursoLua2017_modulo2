
function double(x)
    return 2 * x
end


function isEven(x)
    return x % 2 == 0
end


-- Ex 1: Realizar uma operação sobre todos os elementos de uma lista:

function test01()

    local l1 = {1, 2, 3, 4}

    local l2 = {}

    for i, v in ipairs(l1) do
        table.insert(l2, double(v))
    end

    for i, v in ipairs(l2) do
        print(v)
    end
end


-- Ex 2: Filtrar elementos de uma lista:
function test02()

    local l1 = {1, 2, 3, 4}

    local l2 = {}

    for i, v in ipairs(l1) do
        if isEven(v) then
            table.insert(l2, v)
        end
    end

    for i, v in ipairs(l2) do
        print(v)
    end
end


test01()
--test02()