player = {}

function player_init()
    player.x = 30
    player.y = 30
    player.w =  16
    player.h = 16
    player.dx = 0
    player.dy = 0
    player.sprx = 16
    player.spry = 0
end

function player_draw()
    sspr(player.sprx,player.spry,player.w,player.h,player.x,player.y)
end

function player_udpate()
    -- ⬆️, ⬇️, ⬅️, ➡️, 🅾️, and ❎
    if btn(⬅️) then
        player.dx -= 1
    end
    if btn(➡️) then
        player.dx += 1
    end
    if btn(⬆️) then
        player.dy -= 1
    end
    if btn(⬇️) then
        player.dy += 1
    end

    if player.dx != 0 and player.dy != 0 then
        player.dx /= sqrt(2)
        player.dy /= sqrt(2)
    end

    if can_move(player.x+player.dx, player.y, player.w, player.h) then
        player.x += player.dx
    end

    if can_move(player.x, player.y+player.dy, player.w, player.h) then
        player.y += player.dy
    end
    
    player.dx = 0
    player.dy = 0
end
