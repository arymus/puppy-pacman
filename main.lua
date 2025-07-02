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

-- Function that runs when the game is loaded
function love.load()
    
    -- Table containing player data
    player = {
        x = 0, -- Placement on the x-axis
        y = 0, -- Placement on the y-axis
        speed = 200 -- Speed
        -- ["sprite"] = love.graphics.newImage("/assets/images/player.png") (This is defined later with player.image)
    }
    
    -- Initialize all assets on game load
    player.sprite = love.graphics.newImage("/assets/images/player.png") -- Player sprite
    enemy = love.graphics.newImage("/assets/images/enemy.png") -- Enemy sprite
    kibble = love.graphics.newImage("/assets/images/kibble.png") -- Kibble (accumulates points)
    bone = love.graphics.newImage("/assets/images/bone.png") -- Bone (makes enemies vulnerable)
    love.graphics.setBackgroundColor(250/255, 132/255, 174/255) -- Set the background with an RGB value (divide the values by 255 because after Love2D 11.0, RGB values range from 0-1)
end

-- Function to draw items to the screen
function love.draw()
    love.graphics.draw(player.sprite, player.x, player.y, 0, 0.05, 0.05) -- Draw the player sprite at it's x and y values, with a rotation of 0 degrees and at a scale of 0.05
end

-- Function for handling keyboard events with delta time passed to it
function love.update(dt)
    -- Delta time is the time between the current and previous frame

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
end