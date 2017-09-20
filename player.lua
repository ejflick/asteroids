Player = Object:extend()

function Player:new()
    --Center in screen
    self.x = 400
    self.y = 300

    self.vertices = {
        375, 275,
        425, 275,
        400, 325
    } 
end

function Player:update(dt)
    --Update vertices
end

function Player:draw()
    love.graphics.polygon("line", self.vertices)
end
