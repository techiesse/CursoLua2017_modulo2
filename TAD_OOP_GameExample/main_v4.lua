local s = require 'scheduler'
local character = require 'character_v4'

--##############################################################################
-- Abstrações
local window = {}


function love.load()
    window.W, window.H = love.graphics.getDimensions()
    R = 70
    FLOOR_Y = 10
    love.keyboard.setKeyRepeat(true)

    -- Nosso Jogador:
    player = character.create(
        {100, window.H - R - FLOOR_Y}, -- position
        R,                             -- radius
        100,                           -- HP
        20,                            -- Damage
        {1, 1, 1}                      -- color
    )

    -- Inimigo:
    enemy = character.create(
        {250, window.H - R - FLOOR_Y},
        R,
        100,
        20,
        {1, 1, 0.5}
    )
end


function love.draw()
    -- Personagens:
    player:draw()
    enemy:draw()

    -- Chão:
    drawFloor()

    if not gameOver() then
        showScore()
    else
        showGameOver()
    end
end


function love.update(dt)
    if enemy.hp > 0 or not s.isEmpty() then
        local vx = 200
        local dx = vx * dt

        -- Jogador:
        if love.keyboard.isDown('a') then
            player:move('left', dx)
        elseif love.keyboard.isDown('d') then
            player:move('right', dx)
        end

        -- Inimigo:
        if love.keyboard.isDown('left') then
            enemy:move('left', dx)
        elseif love.keyboard.isDown('right') then
            enemy:move('right', dx)
        end

        s.step()
    end
end


function love.keypressed(key, isRepeat)
    if key == 'space' then
        -- Jogador atacando
        player:attack(enemy)
    end

    if key == 'm' then
        -- Inimigo atacando
        enemy:attack(player)
    end
end

--##############################################################################

function drawFloor()
    love.graphics.line(0, window.H - FLOOR_Y, window.W, window.H - FLOOR_Y)
end

function showScore()
    local score = {
        { 'Vida', player.hp },
        { 'Inimigo', enemy.hp },
    }

    local y = 10
    for i, line in ipairs(score) do
        line = table.concat(line, ' ')
        love.graphics.print(line, window.W - 100, y)
        y = y + 10
    end
end


function gameOver()
    return (player.hp <= 0) or (enemy.hp <= 0)
end

function showGameOver()
    local message = 'You win'
    if player.hp <= 0 then
        message = 'You lose'
    end
    love.graphics.print(message, window.W - 100, 10)
end