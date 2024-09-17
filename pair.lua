local _f = string.format
local unpack = table.unpack

--p1 + p2
--p1 - p2
--p1 * p2

local meta = {}
local Pair = {
    __tostring = function(pair)
        return _f('(%s, %s)', unpack(pair))
    end,
}
setmetatable(Pair, meta)
Pair.__index = Pair


function meta.__call(self, x , y)
    return Pair.create(x, y)
end

function Pair.create(x, y)
    return setmetatable({x, y}, Pair)
end

function Pair.__add(p1, p2)
    return Pair(p1[1] + p2[1], p1[2] + p2[2])
end

function Pair.__unm(pair)
    return Pair(-pair[1], -pair[2])
end

function Pair.__sub(p1, p2)
    return p1 + (-p2)
end

function Pair.__mul(p1, p2)
    return Pair(p1[1] * p2[1], p1[2] * p2[2])
end

function Pair.__div(p1, p2)
    return Pair(p1[1] / p2[1], p1[2] / p2[2])
end

function Pair.sum(pair)
    return pair[1] + pair[2]
end

function Pair.prod(pair)
    return pair[1] * pair[2]
end

function Pair.abs(p)
    return math.sqrt(p[1]^2 + p[2]^2)
end


return Pair
