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

    if _reason == "yourwinner" then
        game_over_screen.y = 20 + cam.y
    end

    game_over_screen.reset_btn = button_new(game_over_screen.x-cam.x+ 29, --x coord
                                            game_over_screen.y-cam.y+ 35,  -- y coord
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

    local offsetx = 30
    local offsety = 7
    if game_over_screen.reason != "yourwinner" then
        sspr(0,16,32,16,game_over_screen.x+offsetx,game_over_screen.y+offsety)
    end

    local offsetx = 5
    local offsety = 26
    if game_over_screen.reason == "anxiety" then
        print("  too much anxiety", game_over_screen.x+offsetx,game_over_screen.y+offsety, 8)
    elseif game_over_screen.reason == "energy" then
        print("low energy killed you", game_over_screen.x+offsetx,game_over_screen.y+offsety, 8)
    elseif game_over_screen.reason == "yourwinner" then
        print("xddddd", game_over_screen.x+offsetx,game_over_screen.y+offsety, 8)
    end

    button_draw(game_over_screen.reset_btn)
end

function update_game_over_screen()
    game_over_screen.x = 20+cam.x
    game_over_screen.y = 40+cam.y
    button_update(game_over_screen.reset_btn)
end
