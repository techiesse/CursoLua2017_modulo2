local s = require 'scheduler'
local character = require 'character_v3'

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
    character.draw(player)
    character.draw(enemy)

    -- Chão:
    love.graphics.line(0, window.H - FLOOR_Y, window.W, window.H - FLOOR_Y)

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
            character.move(player, 'left', dx)
        elseif love.keyboard.isDown('d') then
            character.move(player, 'right', dx)
        end

        -- Inimigo:
        if love.keyboard.isDown('left') then
            character.move(enemy, 'left', dx)
        elseif love.keyboard.isDown('right') then
            character.move(enemy, 'right', dx)
        end

        s.step()
    end
end


function love.keypressed(key, isRepeat)
    if key == 'space' then
        -- Jogador atacando
        character.attack(player, enemy)
    end

    if key == 'm' then
        -- Inimigo atacando
        character.attack(enemy, player)
    end
end

--##############################################################################

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