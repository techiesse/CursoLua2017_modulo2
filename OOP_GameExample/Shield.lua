require 'oop'
local InventoryItem = require 'InventoryItem'

local Shield = newClass(InventoryItem)


function Shield:init(defenceBonus)
    self.defenceBonus = defenceBonus
end

return Shield