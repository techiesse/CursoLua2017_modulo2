require 'functional'

function double(x)
    return 2 * x
end


function isEven(x)
    return x % 2 == 0
end

function printList(l)
    for i, v in ipairs(l) do
        print(v)
    end
end

function soma2(a)
    return a + 2
end


function somaN(n, acc)
    acc = acc or 0
    if n == 0 then
        return 0
    else
        return somaN(n-1, n+acc)
    end
end

function somaN_(n)
    if n == 0 then
        return acc
    else
        return n + somaN_(n-1)
    end
end

function test01()
    local l1 = {1, 2, 3, 4}
    local l2 = map(tostring, l1)
    printList(l2)
end

function test02()
    local l1 = {1, 2, 3, 4}
    local l2 = filter(function(x) return x%2 == 0 end, l1)
    printList(l2)
end


function test03()
    local f = compose(soma2, double)
    print(f(10))
end

function test04()
    local l1 = {1, 2, 3, 4}
    local l2 = take(5, l1)
    printList(l2)
end

function test05()
    function soma(a, b) return a - b end
    local soma2 = partial(soma, 2)
    print(soma2(3)) -- == 5
end

function test06()
    print(somaN_(10000000))
end

test06()