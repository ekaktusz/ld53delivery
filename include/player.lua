player = {}

function player_init()
    player.x = 0
    player.y = 0
    player.dx = 0
    player.dy = 0
    player.spr = 16
end

function player_draw()
    sspr(player.spr,0,16,16,player.x,player.y)
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

    player.x += player.dx
    player.y += player.dy
    player.dx = 0
    player.dy = 0
end
