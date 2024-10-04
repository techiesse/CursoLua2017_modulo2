class_mt = {}

function class_mt.__call(cls, ...)
    local obj = setmetatable({}, cls)
    cls.init(obj, ...)
    return obj
end

-----------------------------------------------------------
Pair = setmetatable({}, class_mt)
Pair.__index = Pair

function Pair.init(self, x, y)
    self.x = x
    self.y = y
end


function Pair.abs(self)
    return math.sqrt(self.x^2 + self.y^2)
end

p1 = Pair(3, 4)
p2 = Pair(30, 40)
print(p1:abs())
print(p2:abs())

-----------------------------------------------------------
-- Classe Player:
Player = setmetatable({}, class_mt)
Player.__index = Player

-- Inicializador
function Player.init(self, hp, damage, color)
    self.hp = hp
    self.damage = damage
    self.color = color
end

function Player.attack(self, defender)
    defender.hp = defender.hp - self.damage
end

function Player:__tostring()
    return string.format('Player(hp=%s, damage=%s, color=%s)', self.hp, self.damage, self.color)
end

player1 = Player(100, 10, 'blue')
player2 = Player(100, 20, 'red')

print()
print(player1)
print(player2)
print()
player1:attack(player2)

print(player1)
print(player2)
