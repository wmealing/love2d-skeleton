-- in objects/Test.lua
Test = Object:extend()

function Test:new()

end

function Test:update(dt)

end

function Test:draw()
   hamster = love.graphics.newImage("gfx/hamster.jpg")
   love.graphics.draw(hamster, 100, 100)
end 

function Test:keypress(key,scancode,isrepeat)
   print("Test:  Handling keypress")
end
