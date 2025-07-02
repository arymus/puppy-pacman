-- Function that applies properties to the game window, which is passed to this function as game
function love.conf(game)
    game.title = "Puppy Pacman!" -- The name of the game's window
    game.version = "11.5" -- The version of Love2D
    game.window.width = 800 -- The width of the window in px (pixels)
    game.window.height = 600 -- The height of the window in px (pixels)
end
