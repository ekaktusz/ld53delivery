local game_over_screen = {}

function init_game_over_screen(_reason)
    clear_table(game_over_screen)
    game_over = true

    game_over_screen = {
        x = 20+cam.x,
        y = 40+cam.y,
        sx = 91,
        sy = 50,
        bg_col = 0,
        frame_col = 7,
        reason = _reason
    }

    retrybutton_posy = game_over_screen.y-cam.y+ 35

    if _reason == "yourwinner" then
        game_over_screen.y = 20 + cam.y
        game_over_screen.sy = 80
        retrybutton_posy = game_over_screen.y-cam.y+ 65
    end

    game_over_screen.reset_btn = button_new(game_over_screen.x-cam.x+ 29, --x coord
    retrybutton_posy,  -- y coord
                                            flr(game_over_screen.sx/3), -- width
                                            8, -- height
                                            " retry") --text
    game_over_screen.reset_btn.on_click = function()
        game_state_init()
    end
end

function draw_game_over_screen()

    rectfill(game_over_screen.x,  game_over_screen.y, game_over_screen.x+game_over_screen.sx, game_over_screen.y+game_over_screen.sy, game_over_screen.frame_col) -- frame
    rectfill(game_over_screen.x+1,  game_over_screen.y+1, game_over_screen.x+game_over_screen.sx-1, game_over_screen.y+game_over_screen.sy-1,game_over_screen.bg_col) --inside


    if game_over_screen.reason != "yourwinner" then
        local offsetx = 30
        local offsety = 7
        sspr(0,16,32,16,game_over_screen.x+offsetx,game_over_screen.y+offsety)
    else
        local offsetx = 20
        local offsety = 4
        print("nice job bro!", game_over_screen.x+offsetx,game_over_screen.y+offsety, 14)
        print("high scores", game_over_screen.x+offsetx+4,game_over_screen.y+offsety+ 15, 10)
    end

    local offsetx = 5
    local offsety = 26
    if game_over_screen.reason == "anxiety" then
        print("  too much anxiety", game_over_screen.x+offsetx,game_over_screen.y+offsety, 8)
    elseif game_over_screen.reason == "energy" then
        print("low energy killed you", game_over_screen.x+offsetx,game_over_screen.y+offsety, 8)
    elseif game_over_screen.reason == "yourwinner" then
        print("gumbo jack     50000$", game_over_screen.x+offsetx,game_over_screen.y+offsety, 7)
        print("ken kendo       1000$", game_over_screen.x+offsetx,game_over_screen.y+offsety+6, 7)
        print("nitro nick       500$", game_over_screen.x+offsetx,game_over_screen.y+offsety+12, 7)
        print("hawkeye bill     100$", game_over_screen.x+offsetx,game_over_screen.y+offsety+18, 7)
        print("you            "..money.."$", game_over_screen.x+offsetx,game_over_screen.y+offsety+28, 11)
    end

    button_draw(game_over_screen.reset_btn)
end

function update_game_over_screen()
    if game_over_screen.reason == "yourwinner" then
        game_over_screen.x = 20+cam.x
        game_over_screen.y = 20 + cam.y
        --game_over_screen.sy = 60
    else
        game_over_screen.x = 20+cam.x
        game_over_screen.y = 40+cam.y
    end
    button_update(game_over_screen.reset_btn)
end
