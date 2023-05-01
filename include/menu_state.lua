local menu_state = {}

function menu_state_init()
    clear_table(menu_state)
    _update60 = menu_state_update
    _draw = menu_state_draw

    palt(12, true) -- beige color as transparency is true
    palt(0, false) -- black color as transparency is false

    mouse_init()

    menu_state.wavy_f = 0
    
    menu_state.open_transition = transition_new(0.025, "open")
    transition_start(menu_state.open_transition)

    menu_state.start_button = button_new(45, 112, 42, 8, "start game")
    menu_state.close_tran = transition_new(0.025, "close")

    menu_state.start_button.on_click = function()
        transition_start(menu_state.close_tran)
    end
end

function menu_state_update()

    mouse_update()

    if transition_is_finished(menu_state.close_tran) then
        game_state_init()
    end

    button_update(menu_state.start_button)

    transition_update(menu_state.close_tran)
    transition_update(menu_state.open_transition)
end

function menu_state_draw()
    cls(1) --background color

    obprint("ursa maior",16,5,7,0,2) --str,x,y,colorin,colorout,scale

    palt(12, true) -- beige color as transparency is true
    palt(0, false) -- black color as transparency is false

    print("hellooo", 10, 20, 7)
    print("helloooooooo", 10, 30, 8)
    
    sspr(48, 0, 16, 16, 50, 50) --utso ketto a pozi
    sspr(96, 0, 16, 16, 50, 70)
    sspr(80, 0, 16, 16, 50, 90)

    button_draw(menu_state.start_button)
    mouse_draw()

    transition_draw(menu_state.close_tran)
    transition_draw(menu_state.open_transition)
end