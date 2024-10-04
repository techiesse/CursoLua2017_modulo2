require 'oop'

InventoryItem = newClass()

function InventoryItem:init(durability)
    if durability <= 0 then
        error('Durability deve ser maior que 0', 2)
    end

    self.durability = durability
end

return InventoryItem