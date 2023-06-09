local game_state = {}

function game_state_init()
    clear_table(game_state)
    reload(0x1000, 0x1000, 0x2000)
    _update60 = game_state_update
    _draw = game_state_draw

    game_state.open_transition = transition_new(0.025, "open")
    transition_start(game_state.open_transition)
    mouse_init()
    player_init()
    inventory_init()
    customers_load()
    dealer_init()
    speakers_init()
    fences_init()

    energy_bar = bar_new(30, 2, 30, 4,7,8)
    anxiety_bar = bar_new(95, 2, 30, 4,7,12)

    palt(12, true) -- beige color as transparency is true
    palt(0, false) -- black color as transparency is false

    in_game_time = {
        hours = 0,
        minutes = 0,
        text = "00:00 am"
    }
    
    money = 30
    game_timer = 0
    passed_seconds = 0
    game_duration_seconds = 45 * 6
    game_over = false

    music(1)
end

function game_state_update()
    --if (game_over) return
    if game_over then
        update_game_over_screen()
        mouse_update()
        return
    end
    
    game_timer += 1
    
    player_udpate()
    customers_update()
    dealer_update()
    speakers_update()
    
    transition_update(game_state.open_transition)
    
    camera_set_position(player.x + player.w/2 - 64, player.y + player.h/2 - 64)
    inventory_update()
    mouse_update()

    if game_timer % 60 == 0 then
        passed_seconds += 1
        player.energy -= 0.008
        if passed_seconds >= game_duration_seconds then
            game_over = true
            init_game_over_screen("yourwinner")
        end
    end

    if game_timer % 45 == 0 then
        in_game_time.minutes += 1
        if in_game_time.minutes >= 60 then
            in_game_time.hours += 1
            in_game_time.minutes = 0
        end
        if in_game_time.minutes < 10 then
            in_game_time.text = "0"..in_game_time.hours..":".."0"..in_game_time.minutes.." am"
        else
            in_game_time.text = "0"..in_game_time.hours..":"..in_game_time.minutes.." am"
        end
    end

    if player.anxiety >= 1 and not game_over then
        -- TODO game over
        game_over = true
        init_game_over_screen("anxiety")
    elseif player.anxiety <= 0 then
        player.anxiety = 0
    end


    if player.energy <= 0 and not game_over then
        -- TODO game over
        game_over = true
        init_game_over_screen("energy")
    elseif player.energy >= 1 then
        player.energy = 1
    end

    if game_over then
        update_game_over_screen()
    end

    bar_update(energy_bar, player.energy)
    bar_update(anxiety_bar, player.anxiety)
    
end

function game_state_draw()
    cls(0)
    --map(0, 0, 0, 16)
    map(0,0)

    fences_draw_back()
    
    player_draw()
    customers_draw()
    
    speakers_draw()
    customers_draw_demand()
    fences_draw_front()
    rect(7*8,11*8,7*8,23*8,6)
    rect(45*8,11*8,45*8,23*8,6)

    dealer_draw()
    player_draw_sniff()

    --top bar
    rectfill(cam.x,cam.y,cam.x+127,cam.y+8,7) -- outside
    rectfill(cam.x+1,cam.y+1,cam.x+126,cam.y+7,0) -- inside
    
    local time_size = 34
    local clock_x = cam.x+127-time_size
    local clock_y = cam.y+8

    rectfill(clock_x,  clock_y, clock_x+time_size,  clock_y + 7,7) -- outside
    rectfill(clock_x+1, clock_y-1, clock_x+time_size-1,  clock_y + 6, 0) -- inside
    print(in_game_time.text, clock_x +2, clock_y + 1,7)

    print("energy:",cam.x+energy_bar.x-28, cam.y+energy_bar.y, 7)
    print("anxiety:",cam.x+anxiety_bar.x-32, cam.y+2, 7)

    rect(cam.x,cam.y,127+cam.x,127+cam.y,7)--frame
    
    

    inventory_draw()

    --hitboxes_draw()

    --rectfill(7*8,16*8,45*8,24*8,3) -- outside

    bar_draw(energy_bar)
    bar_draw(anxiety_bar)


    --print(stat(9),cam.x+120,cam.y+120,7)

    --print(money.."$",cam.x+(127-4*(#(tostr(money))+1)), cam.y+2, 3)
    

    if game_over then   
        draw_game_over_screen()
    end

    mouse_draw()

    transition_draw(game_state.open_transition)
end