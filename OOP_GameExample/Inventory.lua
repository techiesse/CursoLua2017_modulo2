require 'oop'

local Inventory = newClass()

function Inventory:init()
    self.items = {}
end

function Inventory:hasItem(item)
    for i, v in ipairs(self.items) do
        if item == v then
            return true
        end
    end
    return false
end


function Inventory:add(item)
    if not self:hasItem(item) then
        table.insert(self.items, item)
    end
    return self
end

function Inventory:remove(item)
    local removedItem = nil
    for i, v in ipairs(self.items) do
        if item == v then
            table.remove(self.items, i)
            removedItem = v
            break
        end
    end
    return removedItem
end

function Inventory:check()
    for i = #self.items, 1, -1 do
        local item = self.items[i]
        if item.durability <= 0 then
            table.remove(self.items, i)
        end
    end
end

return Inventory