local menu_state = {}

function menu_state_init()
    clear_table(menu_state)
    _update60 = menu_state_update
    _draw = menu_state_draw

    menu_state.wavy_f = 0
    
    menu_state.open_transition = transition_new(0.025, "open")
    transition_start(menu_state.open_transition)

    menu_state.close_tran = transition_new(0.025, "close")
end

function menu_state_update()
    if btnp(❎) then
        transition_start(menu_state.close_tran)
    end

    if transition_is_finished(menu_state.close_tran) then
        game_state_init()
    end

    transition_update(menu_state.close_tran)
    transition_update(menu_state.open_transition)

    menu_state.wavy_f += 2.5
end

function menu_state_draw()
    cls(1)
    print("menu_state")
    wavy_text("press ❎  to start", menu_state.wavy_f)
    
    transition_draw(menu_state.close_tran)
    transition_draw(menu_state.open_transition)

    print(stat(9),cam.x+120,cam.y+120,7)
end