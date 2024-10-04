local s = require "scheduler"


function love.load()
    W, H = love.graphics.getDimensions()

    -- Nosso Jogador:
    r = 70
    pos = {100, H - r - 2}
    playerAtacking = false
    damage = 10

    -- Inimigo:
    posI = {250, H - r - 2}
    enemyHP = 100

    love.keyboard.setKeyRepeat(true)
end


function love.draw()
    -- Exibir o jogador:
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle('fill', pos[1], pos[2], r)
    if playerAtacking then
        love.graphics.circle('line', pos[1], pos[2], r + 2)
    end

    -- Exibir o inimigo:
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.circle('fill', posI[1], posI[2], r)

    -- Chão:
    love.graphics.setColor(1, 1, 1)
    love.graphics.line(0, H - 2, W, H - 2)

    if enemyHP > 0 then
        showScore()
    else
        love.graphics.print('You win', W - 100, 10)
    end
end


function love.update(dt)
    if enemyHP > 0 then
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

        local isColiding = math.abs(pos[1] - posI[1]) <= 2 * r
        if isColiding then
            enemyHP = enemyHP - damage
        end
    end
end


function showScore()
    local score = {
        { 'Vida', enemyHP }
    }

    local y = 10
    for i, line in ipairs(score) do
        line = table.concat(line, ' ')
        love.graphics.print(line, W - 100, y)
        y = y + 10
    end
end


