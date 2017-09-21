function love.load()
    Object = require "classic"
    require "bullet"
    require "player"

    -- Easier to just have global variables of these
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    player = Player()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    for k, v in ipairs(listOfBullets) do
        v:update(dt)

        if not v.alive then
            table.remove(listOfBullets, k)
        end
    end
end

function love.draw()
    player:draw()
    for k, v in ipairs(listOfBullets) do
        v:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
end
