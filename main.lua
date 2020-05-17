local open = io.open
local inspect = require('inspect')

Object = require 'classic'

gdt = 0
objects_to_draw = {}

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
       local file = folder .. '/' .. item
       local info = love.filesystem.getInfo( file );
        if info.type ~= nil then
            table.insert(file_list, file)
        elseif love.filesystem.isDirectory(file) then
            recursiveEnumerate(file, file_list)
        end
    end
end

function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

function love.conf(t)
   t.console = true
   game_start = 0
end

function love.load()
   object_files = {}
   recursiveEnumerate('objects', object_files)
   requireFiles(object_files)

   -- what
   thisQuad = love.graphics.newQuad(0,0,800,800,1000,1000 )
   thisImage = love.graphics.newImage("gfx/background.jpg")
   thisImage:setWrap('repeat','repeat')
   
   
   
   -- create a simple thing.    
   table.insert(objects_to_draw, Test())
end

function love.keypressed( key, scancode, isrepeat )

   for i,v in ipairs(objects_to_draw) do
      v:keypress(key,scancode,isrepeat)
   end   
   
end

function love.update(dt)
   gdt = gdt + dt
   
   for i,v in ipairs(objects_to_draw) do
      v:update(dt)
   end
   
end

function love.draw()

   -- draw the background.
   love.graphics.draw(thisImage,thisQuad,0,0)
   
   for i,v in ipairs(objects_to_draw) do
      v:draw()
   end
      
end


