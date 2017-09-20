function love.load()
    Object = require "classic"
    require "player"

    player = Player()
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end

function love.keyPressed(key)
    player:keyPressed(key)
end
