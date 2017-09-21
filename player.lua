--! file: player.lua
Player = Object:extend()

turnSpeed = math.pi
moveSpeed = 200

function Player:new()
    self.image = love.graphics.newImage("images/ship.png")

    --Center in screen
    self.x = screenWidth / 2
    self.y = screenHeight / 2

    self.scale = 0.5
    self.width = self.image:getWidth() * self.scale
    self.height = self.image:getHeight() * self.scale

    self.orientation = math.rad(270) 
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
        self.x = self.x + math.cos(self.orientation) * moveSpeed * dt
        self.y = self.y + math.sin(self.orientation) * moveSpeed * dt
    elseif love.keyboard.isDown("s") then
        self.x = self.x - math.cos(self.orientation) * moveSpeed * dt
        self.y = self.y - math.sin(self.orientation) * moveSpeed * dt
    end

    -- Remain in bounds
    if self.x < 0 then
        self.x = screenWidth
    elseif self.x > screenWidth then
        self.x = 0
    end

    if self.y < 0 then
        self.y = screenHeight
    elseif self.y > screenHeight then
        self.y = 0
    end

end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y,self.orientation, self.scale, self.scale, self.width, self.height)
end

function Player:keyPressed(key)
    if key == "space" and #listOfBullets < 3 then
        table.insert(listOfBullets, Bullet(self.x, self.y, self.orientation))
    end
end
