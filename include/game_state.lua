local game_state = {}

function game_state_init()
    _update60 = game_state_update
    _draw = game_state_draw

    game_state.open_transition = transition_new(0.025, "open")
    transition_start(game_state.open_transition)
    mouse_init()
    player_init()
    inventory_init()
end

function game_state_update()
    
    player_udpate()
    
    transition_update(game_state.open_transition)
    
    camera_set_position(player.x - 61, player.y - 61)
    inventory_update()
    mouse_update()
end

function game_state_draw()
    cls(1)
    map()
    
    player_draw()
    inventory_draw()

    mouse_draw()
    transition_draw(game_state.open_transition)
end