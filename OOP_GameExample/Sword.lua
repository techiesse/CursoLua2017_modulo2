require 'oop'
local InventoryItem = require 'InventoryItem'

local Sword = newClass(InventoryItem)

Sword.degradation = 10


function Sword:__tostring()
    return string.format('Sword(ab = %s, db = %s)', self.attackBonus, self.durability)
end

function Sword:init(attackBonus, durability)
    InventoryItem.init(self, durability)
    self.attackBonus = attackBonus
end

function Sword:use()
    self.durability = self.durability - Sword.degradation
    return self.attackBonus
end

return Sword