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

    menu_state.start_button = button_new(38, 105, 50, 20, "\n start game")
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
    cls(2) --background color

    obprint("groove",7,6,10,0,2) --str,x,y,colorin,colorout,scale
    obprint("'n'",59,6,10,0,2)
    obprint("goods",83,6,10,0,2)

    palt(12, true) -- beige color as transparency is true
    palt(0, false) -- black color as transparency is false

    print("party-goers need refreshments\ndrag and drop from inventory!", 7, 20, 7) -- text, x, y, szín
    print("let's face it: you're a dealer.\n  buy stuff from the panda !\n  the party ends at 6:00 am!", 3, 86, 7)
    print("you can consume as well,\n  but don't overdose!", 19, 72, 10)

    print(" = -anxiety, -energy", 30, 38, 7)
    print(" = +anxiety, +energy", 30, 50, 7)
    print(" = resets both", 30, 62, 7)
    
    sspr(48, 0, 16, 16, 17, 31) --utso ketto a pozi
    sspr(96, 0, 16, 16, 18, 44)
    sspr(80, 0, 16, 16, 18, 55)

    rect(0, 0, 127, 127, 7)

    button_draw(menu_state.start_button)
    mouse_draw()

    transition_draw(menu_state.close_tran)
    transition_draw(menu_state.open_transition)
end