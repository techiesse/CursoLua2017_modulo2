require 'oop'

local s = require 'scheduler'
local Color = require 'Color'
local Inventory = require 'Inventory'
local Sword = require 'Sword'

local R = 70

local Character = newClass()

function Character:init(pos, r, hp, damage, color)
    color = color or Color.WHITE
    if hp <= 0 then
        error('HP não pode ser menor ou igual a 0')
    end

    self.x = pos[1]
    self.y = pos[2]
    self.r = r
    self.hp = hp
    self.damage = damage
    self.attacking = false
    self.color = color
    self.inventory = Inventory()
end

function Character:pickItem(item)
    self.inventory:add(item)
    return self
end


function Character:dropItem(item)
    self.inventory:remove(item)
    return self
end


function Character:draw()
    local OUTER_RING_WIDTH = 3
    local OUTER_RING_OFFSET = 2
    local oldColor = {love.graphics.getColor()}
    love.graphics.setColor(unpack(self.color:asarray()))

    love.graphics.circle('fill', self.x, self.y, self.r)
    if self.attacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', self.x, self.y, self.r + OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end

    love.graphics.setColor(unpack(oldColor))
end


function Character:move(direction, amount)
    local directions = {
        left = -1,
        right = 1,
    }
    if directions[direction] == nil then
        error(string.format('Valores permitidos para "direction" ("left"|"right"). Obtido: "%s"', direction))
    end

    self.x = self.x + directions[direction] * amount
end


function Character:coliding(other)
    return math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2) <= self.r + other.r
end


function Character:applyDamage(defender)
    local damage = self.damage
    for i, item in ipairs(self.inventory.items) do
        if isInstance(item, Sword) then
            damage = damage + item:use()
        end
    end
    print(damage)
    defender.hp = defender.hp - damage
end

function Character:attack(defender)
    self.attacking = true
    s.schedule(0.1, function()
        self.attacking = false
    end)

    if self:coliding(defender) then
        self:applyDamage(defender)
    end
end

return Character
