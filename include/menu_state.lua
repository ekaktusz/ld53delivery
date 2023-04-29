local menu_state = {}

function menu_state_init()
    _update60 = menu_state_update
    _draw = menu_state_draw

    menu_state.wavy_f = 0
    
    menu_state.close_tran = transition_new(0.03, "close")
end

function menu_state_update()
    if btnp(❎) then
        --game_state_init()
        transition_start(menu_state.close_tran)
    end

    transition_update(menu_state.close_tran)

    menu_state.wavy_f += 2.5
end

function menu_state_draw()
    cls()
    print("menu_state")
    wavy_text("press ❎  to start", menu_state.wavy_f)
    
    transition_draw(menu_state.close_tran)
end