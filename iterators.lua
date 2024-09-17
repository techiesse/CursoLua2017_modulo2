function count(first, last, inc)
    inc = inc or 1
    local val = first
    local function fn()
        if inc > 0 and val > last or inc < 0 and val < last then
            return nil
        end
        local ret = val
        val = val + inc
        return ret, ret^2
    end
    return fn
end

for val, v2 in count(2, 11) do
    print(val, v2)
end


--[[
function newCounter(first)
    local i = first
    local function count()
        local ret = i
        i = i + 1
        return ret
    end
    return count
end

c = newCounter(10)

function Pair(_x, _y)
    local x, y = _x or 0, _y or 0
    return {
        get = function() return x, y end,
        set = function(newx, newy)
            x, y = newx, newy
        end
    }
end

p = Pair(1, 2)
print(p.get())
p.set(10, 20)
print(p.get())


]]
