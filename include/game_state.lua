local game_state = {}

function game_state_init()
    _update60 = game_state_update
    _draw = game_state_draw
end

function game_state_update()
    
end

function game_state_draw()
    cls(3)
    print("game_state")
end