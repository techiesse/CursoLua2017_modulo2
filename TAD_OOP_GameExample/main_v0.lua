local s = require "scheduler"


function love.load()
    W, H = love.graphics.getDimensions()
    FLOOR_Y = 10

    -- Nosso Jogador:
    r = 70
    pos = {100, H - r - FLOOR_Y}
    playerAtacking = false
    damage = 10

    love.keyboard.setKeyRepeat(true)
end


function love.draw()
    -- Exibir o jogador:
    local OUTER_RING_WIDTH = 3
    local OUTER_RING_OFFSET = 2

    love.graphics.circle('fill', pos[1], pos[2], r)
    if playerAtacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', pos[1], pos[2], r + OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end

    -- Chão:
    love.graphics.line(0, H - FLOOR_Y, W, H - FLOOR_Y)
end


function love.update(dt)
    local vx = 200
    local dx = vx * dt

    -- Jogador:
    if love.keyboard.isDown('a') then
        pos[1] = pos[1] - dx
    elseif love.keyboard.isDown('d') then
        pos[1] = pos[1] + dx
    end

    s.step()
end


function love.keypressed(key, isRepeat)
    if key == 'space' then
        -- Jogador atacando
        playerAtacking = true
        s.schedule(0.1, function()
            playerAtacking = false
        end)

    end
end


--##############################################################################
function drawPlayer(pos, r)
    local OUTER_RING_WIDTH = 3
    local OUTER_RING_OFFSET = 2
    love.graphics.circle('fill', pos[1], pos[2], r)
    if playerAtacking then
        local oldWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(OUTER_RING_WIDTH)
        love.graphics.circle('line', pos[1], pos[2], r + OUTER_RING_OFFSET + OUTER_RING_WIDTH)
        love.graphics.setLineWidth(oldWidth)
    end
end
