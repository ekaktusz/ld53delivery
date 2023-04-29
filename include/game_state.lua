local game_state = {}

function game_state_init()
    _update60 = game_state_update
    _draw = game_state_draw

    game_state.open_transition = transition_new(0.05, "open")
    transition_start(game_state.open_transition)
end

function game_state_update()
    transition_update(game_state.open_transition)
end

function game_state_draw()
    cls(3)
    print("game_state")
    transition_draw(game_state.open_transition)
end