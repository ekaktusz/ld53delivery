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
    dealer_init()

    energy_bar = bar_new(30, 2, 30, 4,7,8)
    anxiety_bar = bar_new(95, 2, 30, 4,7,12)

    --palt(1, true) -- beige color as transparency is true
    --palt(0, false) -- black color as transparency is false
    
    money = 0
end

function game_state_update()
    
    player_udpate()
    customers_update()
    dealer_update()
    
    transition_update(game_state.open_transition)
    
    camera_set_position(player.x + player.w/2 - 64, player.y + player.h/2 - 64)
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
    dealer_draw()

    --top bar
    rectfill(cam.x,cam.y,cam.x+127,cam.y+8,7) -- outside
    rectfill(cam.x+1,cam.y+1,cam.x+126,cam.y+7,0) -- inside
    
    local time_size = 34
    local clock_x = cam.x+127-time_size
    local clock_y = cam.y+8
    rectfill(clock_x,  clock_y, clock_x+time_size,  clock_y + 7,7) -- outside
    rectfill(clock_x+1, clock_y-1, clock_x+time_size-1,  clock_y + 6, 0) -- inside
    print("01:27 am", clock_x +2, clock_y + 1,7)

    print("energy:",cam.x+energy_bar.x-28, cam.y+energy_bar.y, 7)
    print("anxiety:",cam.x+anxiety_bar.x-32, cam.y+2, 7)

    rect(cam.x,cam.y,127+cam.x,127+cam.y,7)--frame

    inventory_draw()

    bar_draw(energy_bar)
    bar_draw(anxiety_bar)

    --print(money.."$",cam.x+(127-4*(#(tostr(money))+1)), cam.y+2, 3)
    

    mouse_draw()
    transition_draw(game_state.open_transition)
end