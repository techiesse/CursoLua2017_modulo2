local Pair = require "pair"


p1 = Pair(3, 4)
p2 = Pair(1, 2)


print(p1:abs())


function test_soma()
    print(p1 + p2)
end

function test_unm()
    print(-p1)
end

function test_sub()
    print(p1 - p2)
end

function test_prod()
    print(p1 * p2)
end

function test_div()
    print(p1 / p2)
end
