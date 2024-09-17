
if _VERSION ~= 'Lua 5.1' then
    unpack = table.unpack
end

function soma(...)
    local args = {...}
    if type(args[1]) == 'table' then
        args = args[1]
    end

    local res = 0
    for _, v in ipairs(args) do
        res = res + v
    end
    return res
end

function ex1()
    print(soma(2,3,4,5))
end

function teste(a, ...)
    local c, d = ...
    return a, c, d
end

function ex2()
    print(teste(2, 3, 4))

    local c, d = teste(6, 7, 8)
    print(c, d)

    print(teste())
end

function pack(...)
    return {...}
end

function showTable(t)
    local res = {}
    for k, v in pairs(t) do
        table.insert(res, k .. " = " .. v)
    end
    return table.concat(res, '\n')
end


function ex3()
    print(showTable(pack(10, 20, 30)))
end


function ex4()
    local t = {1,2,3,4,5}
    --local s = soma(unpack(t))
    local s = soma(1,2,3,4,5)
    print(s)
    local s = soma(t)
    print(s)
end


function ex5()
    function fn(...)
        local n = #{...}
        print(n)
    end

    fn(1)
    fn(1, 10)
    fn(1, 10, 100)
end



ex4()
