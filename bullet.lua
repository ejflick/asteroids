Bullet = Object:extend()

bulletSpeed = 500

function Bullet:new(x, y, orientation)
    self.image = love.graphics.newImage("images/bullet.png")

    self.x = x
    self.y = y
    self.orientation = orientation

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Bullet:update(dt)
   self.x = self.x + math.cos(self.orientation) * bulletSpeed * dt
   self.y = self.y + math.sin(self.orientation) * bulletSpeed * dt
end

function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y, self.orientation, 1, 1, self.width/2, self.height)
end
