--[[

LÖVE, or Love2D, is a Lua framework that allows you to make 2D games,
an easy-to-learn embedded language that is widely used for game development.
Love2D is not considered a game engine because it has no UI for creating games.

]]--

-- PACMAN --

--[[

PACMAN COMPONENTS
- Pacman
- Ghost
- Pellets that spawn randomly
- Power Pellets that make ghosts vulnerable

]]--

-- Function that runs when the game is loaded
function love.load()
    player = love.graphics.newImage("/assets/images/player.png")
    enemy = love.graphics.newImage("/assets/images/enemy.png")
    bone = love.graphics.newImage("/assets/images/bone.png")
    power_pellet = love.graphics.newImage("/assets/images/power_pellet.png")
end

