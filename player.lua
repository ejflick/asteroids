Player = Object:extend()

turnSpeed = math.pi
moveSpeed = 200

function Player:new()
    self.image = love.graphics.newImage("images/ship.png")

    --Center in screen
    self.x = 400
    self.y = 300

    self.scale = 0.5
    self.width = self.image:getWidth() * self.scale
    self.height = self.image:getHeight() * self.scale

    self.orientation = 0 
end

function Player:update(dt)
    --Update orientation
    if love.keyboard.isDown("a") then
        self.orientation = self.orientation - (turnSpeed * dt)
    elseif love.keyboard.isDown("d") then
        --counter clockwise
        self.orientation = self.orientation + (turnSpeed * dt)
    end
    
    if love.keyboard.isDown("w") then
        --self.y = self.y + math.tan(self.orientati
        self.x = self.x + math.cos(self.orientation) * moveSpeed * dt
        self.y = self.y + math.sin(self.orientation) * moveSpeed * dt
    elseif love.keyboard.isDown("s") then
        self.x = self.x - math.cos(self.orientation) * moveSpeed * dt
        self.y = self.y - math.sin(self.orientation) * moveSpeed * dt
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y,self.orientation, self.scale, self.scale, self.width, self.height)
end

function Player:accelerate()
end

function Player:deccelerate()
end
