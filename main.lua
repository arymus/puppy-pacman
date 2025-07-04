--[[

LÖVE, or Love2D, is a Lua framework that allows you to make 2D games,
an easy-to-learn embedded language that is widely used for game development.
Love2D is not considered a game engine because it has no UI for creating games.

]]--

-- PACMAN --

--[[

PACMAN COMPONENTS
- Pacman (Puppy/Player)
- Ghost (Enemy)
- Pellets that spawn randomly (Kibble)
- Power Pellets that make ghosts vulnerable (Bones)

]]--

-- Function that runs once when the game is loaded, perfect for initializing assets
function love.load()
    width, height, flags = love.window.getMode() -- The height, width, and flags of the window (flags is a table with all the window properties)
    
    -- Table containing player data
    player = {
        x = 0, -- Placement on the x-axis
        y = 0,-- Placement on the y-axis
        speed = 200, -- Speed
        -- ["sprite"] = love.graphics.newImage("/assets/images/player.png") (This is defined later with player.image)
    }

    -- Initialize all assets on game load
    player.sprite = love.graphics.newImage("/assets/images/player.png") -- Player sprite
    enemy = love.graphics.newImage("/assets/images/enemy.png") -- Enemy sprite
    kibble = love.graphics.newImage("/assets/images/kibble.png") -- Kibble (accumulates points)
    bone = love.graphics.newImage("/assets/images/bone.png") -- Bone (makes enemies vulnerable)
    love.graphics.setBackgroundColor(250/255, 132/255, 174/255) -- Set the background with an RGB value (divide the values by 255 because after Love2D 11.0, RGB values range from 0-1)

    -- Player height and width
    player.height = player.sprite:getHeight() * 0.05 -- The height is the height of the image multiplied by 0.05 because that's what it's scaled to when it's drawn
    player.width = player.sprite:getWidth() * 0.05 -- The width is the width of the image multiplied by 0.05 because that's what it's scaled to when it's drawn
end

-- Function to draw items to the screen
function love.draw()
    love.graphics.draw(player.sprite, player.x, player.y, 0, 0.05, 0.05) -- Draw the player sprite at it's x and y values, with a rotation of 0 degrees and at a scale of 0.05
    love.graphics.setColor(1, 1, 1) -- Set the color of all graphics to white (RGB values have a maximum of 1)

    -- Draw a square using coordinates
    love.graphics.line(0, 0, 800, 0) -- Top line (0, 0) to (800, 0)
    love.graphics.line(0, 0, 0, 600) -- Left line (0, 0) to (0, 600)
    love.graphics.line(0, 600, 800, 600) -- Bottom line (0, 600) to (800, 600)
    love.graphics.line(800, 0, 800, 600) -- Right line (800, 0) to (800, 600)
end

-- Function that runs every frame, perfect for detecting in-game events
function love.update(dt) -- Delta time is the time between the current and previous frame
    -- PLAYER MOVEMENT --
    
    -- If the "w" key pr up key is down
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        player.y = player.y - (player.speed * dt) -- Multiply the player's speed by the delta time and subtract it from the player's y position to go down
        
        -- If the "a" key or left arrow is down
    elseif love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        player.x = player.x - (player.speed * dt) -- Multiply the player's speed by the delta time and subtract it from the player's x position to go left
        
        -- If the "s" key or the down arrow is down
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        player.y = player.y + (player.speed * dt) -- Multiply the player's speed by the delta time and add it to the player's y position to go up 
        
        -- If the "d" key or right arrow is down
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        player.x = player.x + (player.speed * dt) -- Multiply the player's speed by the delta time and add it to the player's x position to go right
    end

    -- COLLISION DETECTION --

    --[[
        player.x represents the left side of the sprite because it is where the sprite is drawn from.
        player.y represents the top side of the sprite because it is where the sprite is drawn from.
        Images (the player sprite in this case) are drawn from a (0, 0) point so therefore player.x is 0 and player.y is 0, making them the top left corner.

        player.width represents the right side of the sprite because it is where the sprite stops being drawn.
        player.height represents the bottom side of the sprite because it is where the sprite stops being drawn.
        This is because is it where the image ends.

        We add player.x to player.width and player.y to player.width to get the right side or bottom side of the sprite at any time.
        By adding player.x or player.y, the width and height become values that are relative to the origin (0, 0) of the sprite.
        So if the sprite's origin (top left side) is at (255, 255) and it is 64x64, the bottom right side would be at (319, 319).
    ]]--

    -- If the player's left side goes past the left border
    if player.x < 0 then
        player.x = 0 -- Set the player's left side back to 0

    -- If the player's top side goes past the top border
    elseif player.y < 0 then
        player.y = 0 -- Set the player's top side back to 0

    -- If the player's right side goes past the right border
    elseif player.x + player.width > width then
        player.x = width - player.width -- Set the player's right side back to the width

    -- If the player's bottom side goes past the bottom border
    elseif player.y + player.height > height then
        player.y = height - player.height -- Set the player's bottom side back to the bottom
    end
end