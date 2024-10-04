local s = require 'scheduler'

local OUTER_RING_WIDTH = 3
local OUTER_RING_OFFSET = 2
local R = 70
local character = {}

function character.create(pos, r, hp, damage, color)
    color = color or {1, 1, 1} -- Branco por padrão
    if hp <= 0 then
        error('HP não pode ser menor ou igual a 0')
    end
    return {
        x = pos[1],
        y = pos[2],
        r = r,
        hp = hp,
        damage = damage,
        attacking = false,
        color = color,
    }
end


function character.draw(char)
    local OUTER_RING_WIDTH = 3
    local OUTER_RING_OFFSET = 2
    local oldColor = {love.graphics.getColor()}
    love.graphics.setColor(unpack(char.color))

    love.graphics.circle('fill', char.x, char.y, char.r)
    if char.attacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', char.x, char.y, char.r + OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end

    love.graphics.setColor(unpack(oldColor))
end


function character.move(char, direction, amount)
    local directions = {
        left = -1,
        right = 1,
    }
    if directions[direction] == nil then
        error(string.format('Valores permitidos para "direction" ("left"|"right"). Obtido: "%s"', direction))
    end

    char.x = char.x + directions[direction] * amount
end


function character.coliding(c1, c2)
    return math.sqrt((c1.x - c2.x)^2 + (c1.y - c2.y)^2) <= c1.r + c2.r
end


function character.applyDamage(attacker, defender)
    defender.hp = defender.hp - attacker.damage
end

function character.attack(attacker, defender)
    attacker.attacking = true
    s.schedule(0.1, function()
        attacker.attacking = false
    end)

    if character.coliding(attacker, defender) then
        character.applyDamage(attacker, defender)
    end
end

return character
