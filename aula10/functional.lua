

function map(f, l)
    local res = {}
    for i, v in ipairs(l) do
        table.insert(res, f(v) or nil)
    end
    return res
end

function filter(f, l)
    local res = {}
    for i, v in ipairs(l) do
        if f(v) then
            table.insert(res, v)
        end
    end
    return res
end

function take(n, l)
    local ret = {}
    for i = 1, n do
        local v = l[i]
        table.insert(ret, v)
    end
    return ret
end


function compose(f, g)
    local h = function(...)
        return f(g(...))
    end
    return h
end

function partial(f, ...)
    local args = {...}
    function ret(...)
        local _args = {...}
        for i, v in ipairs(_args) do
            table.insert(args, v)
        end
        return f(table.unpack(args))
    end
    return ret
end