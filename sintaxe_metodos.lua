
_f = string.format

Pair = {
    sum = function (self)
        return self.x + self.y
    end,
}

function Pair.create(x, y)
    return {
        x = x,
        y = y,
        sum = Pair.sum,
    }
end


p1 = Pair.create(1, 2)
p2 = Pair.create(10, 20)


print(_f("p1.x = %s", p1.x))
print(_f("p1.y = %s", p1.y))
print(_f("p1.sum() = %s", p1:sum()))
print()
print(_f("p2.x = %s", p2.x))
print(_f("p2.y = %s", p2.y))
print(_f("p2.sum() = %s", p2:sum()))
