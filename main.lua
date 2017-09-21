function love.load()
    Object = require "classic"
    require "bullet"
    require "player"

    player = Player()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    for k, v in ipairs(listOfBullets) do
        v:update(dt)
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
