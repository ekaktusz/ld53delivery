local menu_state = {}

function menu_state_init()
    _update60 = menu_state_update
    _draw = menu_state_draw

    menu_state.wavy_f = 0
    menu_state.tran_t = 0
end

function menu_state_update()
    if btnp(❎) then
        game_state_init()
    end

    menu_state.tran_t += 0.03
    menu_state.wavy_f += 2.5
end

function menu_state_draw()
    cls()
    print("menu_state")
    wavy_text("press ❎  to start", menu_state.wavy_f)
    close_transition(menu_state.tran_t)
end