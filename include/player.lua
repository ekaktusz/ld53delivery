player = {}

function player_init()
    player.x = 30
    player.y = 30
    player.w =  16
    player.h = 16
    player.dx = 0
    player.dy = 0

    player.acc = 0.75

    player.energy = 0.7
    player.anxiety = 0.19

    local frames = { {x=16, y=0, w=16, h=16}, {x=16, y=16, w=16, h=16} }
    player.idle_anim = animation_new(frames, 20)
end

function player_draw()
    --sspr(player.sprx,player.spry,player.w,player.h,player.x,player.y)
    animation_draw(player.idle_anim, player.x, player.y)
end

function player_udpate()
    animation_update(player.idle_anim)

    -- ⬆️, ⬇️, ⬅️, ➡️, 🅾️, and ❎
    if btn(⬅️) then
        player.dx -= player.acc + player.acc * player.energy
    end
    if btn(➡️) then
        player.dx += player.acc + player.acc * player.energy
    end
    if btn(⬆️) then
        player.dy -= player.acc + player.acc * player.energy
    end
    if btn(⬇️) then
        player.dy += player.acc + player.acc * player.energy
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
