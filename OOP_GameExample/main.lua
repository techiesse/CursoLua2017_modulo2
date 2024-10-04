local s = require 'scheduler'
local Character = require 'Character'
local Color = require 'Color'
local Sword = require 'Sword'
local Shield = require 'Shield'
require 'util'

--##############################################################################
-- Abstrações
local window = {}


function love.load()

    --font = love.graphics.newFont('DejaVuSans.ttf', 16)
    --love.graphics.setFont(font)

    window.W, window.H = love.graphics.getDimensions()
    R = 70
    FLOOR_Y = 10
    love.keyboard.setKeyRepeat(true)

    -- Nosso Jogador:
    player = Character(
        {100, window.H - R - FLOOR_Y}, -- position
        R,                             -- radius
        100,                           -- HP
        20,                            -- Damage
        Color.WHITE                    -- color
    )

    -- Inimigo:
    enemy = Character(
        {250, window.H - R - FLOOR_Y},
        R,
        100,
        20,
        Color.LIGHT_YELLOW
    )

    -- Items:
    sword = Sword(10, 20)

    --font = love.graphics.getFont()
    --print(showTable(font))

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

    if key == 't' then
        player:pickItem(sword)
        print(showTable(player.inventory.items))
    end

    if key == 'y' then
        player:dropItem(sword)
    end

    player.inventory:check()
    enemy.inventory:check()
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