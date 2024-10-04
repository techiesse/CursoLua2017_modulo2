require 'oop'

Player = newClass()

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