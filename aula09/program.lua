require 'Pair'
require 'Player'

function exPair()
    p1 = Pair(3, 4)
    p2 = Pair(30, 40)
    print(p1:abs())
    print(p2:abs())

    print()
    print('Scale:')
    print(p1:scale(2))
end

function exPlayer()
    local player1 = Player(100, 10, 'blue')
    local player2 = Player(100, 20, 'red')

    print(player1)
    print(player2)
    print()
    player1:attack(player2)

    print(player1)
    print(player2)
end

require 'Point'
function exPoint()
    local p = Point(300, 400)
    print(p:abs())

    for k, v in pairs(BaseClasses) do
        print(Point)
        print(Pair)
        print(k, v)
    end
end


exPair()
--exPoint()
