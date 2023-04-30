local game_state = {}

function game_state_init()
    _update60 = game_state_update
    _draw = game_state_draw

    game_state.open_transition = transition_new(0.025, "open")
    transition_start(game_state.open_transition)
    mouse_init()
    player_init()
    inventory_init()
    customers_load()

    energy_bar = bar_new(30, 2, 30, 4,7,8)
    anxiety_bar = bar_new(95, 2, 30, 4,7,12)

    --palt(1, true) -- beige color as transparency is true
    --palt(0, false) -- black color as transparency is false
    
    money = 0
end

function game_state_update()
    
    player_udpate()
    customers_update()
    
    transition_update(game_state.open_transition)
    
    camera_set_position(player.x - 61, player.y - 61)
    inventory_update()
    mouse_update()

    bar_update(energy_bar, 0.7)
    bar_update(anxiety_bar, 0.7)

end

function game_state_draw()
    cls(0)
    --map(0, 0, 0, 16)
    map(0,0)
    
    player_draw()
    customers_draw()

    rectfill(cam.x,cam.y,cam.x+127,cam.y+8,7) -- outside
    rectfill(cam.x+1,cam.y+1,cam.x+126,cam.y+7,0) -- inside

    rect(cam.x,cam.y,127+cam.x,127+cam.y,7)--frame

    inventory_draw()

    bar_draw(energy_bar)
    bar_draw(anxiety_bar)

    --print(money.."$",cam.x+(127-4*(#(tostr(money))+1)), cam.y+2, 3)
    print("energy:",cam.x+energy_bar.x-28, cam.y+energy_bar.y, 7)
    print("anxiety:",cam.x+anxiety_bar.x-32, cam.y+2, 7)

    mouse_draw()
    transition_draw(game_state.open_transition)
end