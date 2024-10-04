--[[
    Implementação do inimigo atacando (sem TAD)
]]

local s = require "scheduler"


function love.load()
    W, H = love.graphics.getDimensions()
    FLOOR_Y = 10
    love.keyboard.setKeyRepeat(true)

    -- Nosso Jogador:
    r = 70
    pos = {100, H - r - FLOOR_Y}
    playerAtacking = false
    damage = 10
    hp = 100

    -- Inimigo:
    posI = {250, H - r - FLOOR_Y}
    enemyAtacking = false
    enemyDamage = 5
    enemyHP = 100
end


function love.draw()
    local OUTER_RING_WIDTH = 3
    local OUTER_RING_OFFSET = 2

    -- Exibir o jogador:
    love.graphics.circle('fill', pos[1], pos[2], r)
    if playerAtacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', pos[1], pos[2], r + OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end

    -- Exibir o inimigo:
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.circle('fill', posI[1], posI[2], r)
    if enemyAtacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', posI[1], posI[2], r +  OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end

    -- Chão:
    love.graphics.setColor(1, 1, 1)
    love.graphics.line(0, H - FLOOR_Y, W, H - FLOOR_Y)

    if enemyHP > 0 and hp > 0 then
        showScore()
    else
        local message = 'You win'
        if hp <= 0 then
            message = 'You lose'
        end
        love.graphics.print(message, W - 100, 10)
    end
end


function love.update(dt)
    if enemyHP > 0 or not s.isEmpty() then
        local vx = 200
        local dx = vx * dt

        -- Jogador:
        if love.keyboard.isDown('a') then
            pos[1] = pos[1] - dx
        elseif love.keyboard.isDown('d') then
            pos[1] = pos[1] + dx
        end

        -- Inimigo:
        if love.keyboard.isDown('left') then
            posI[1] = posI[1] - dx
        elseif love.keyboard.isDown('right') then
            posI[1] = posI[1] + dx
        end

        s.step()
    end
end


function love.keypressed(key, isRepeat)
    if key == 'space' then
        -- Jogador atacando
        playerAtacking = true
        s.schedule(0.1, function()
            playerAtacking = false
        end)

        local isColiding =  math.abs(pos[1] - posI[1]) <= 2 * r
        if isColiding then
            enemyHP = enemyHP - damage
        end
    end

    if key == 'm' then
        -- Inimigo atacando
        enemyAtacking = true
        s.schedule(0.1, function()
            enemyAtacking = false
        end)

        local isColiding =  math.abs(pos[1] - posI[1]) <= 2 * r
        if isColiding then
            hp = hp - enemyDamage
        end
    end
end

--##############################################################################

function showScore()
    local score = {
        { 'Vida', hp },
        { 'Inimigo', enemyHP },
    }

    local y = 10
    for i, line in ipairs(score) do
        line = table.concat(line, ' ')
        love.graphics.print(line, W - 100, y)
        y = y + 10
    end
end


function drawPlayer(pos, r, color)
    local OUTER_RING_WIDTH = 3
    local OUTER_RING_OFFSET = 2
    local oldColor = {love.graphics.getColor()}
    love.graphics.setColor(unpack(color))

    love.graphics.circle('fill', pos[1], pos[2], r)
    if playerAtacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', pos[1], pos[2], r + OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end

    love.graphics.setColor(unpack(oldColor))
end