player = {}

function player_init()
    player.x = 30
    player.y = 30
    player.w =  16
    player.h = 16
    player.dx = 0
    player.dy = 0

    player.last_dir = "down"

    player.acc = 0.75

    player.energy = 0.7
    player.anxiety = 0.19

    local side_frames = { {x=16, y=0, w=16, h=16}, {x=16, y=16, w=16, h=16} }
    player.side_anim = animation_new(side_frames, 20)

    local up_frames = { {x=80, y=96, w=16, h=16}, {x=80, y=112, w=16, h=16} }
    player.up_anim = animation_new(up_frames, 20)

    local down_frames = { {x=64, y=96, w=16, h=16}, {x=64, y=112, w=16, h=16} }
    player.down_anim = animation_new(down_frames, 20)
end

function player_draw()
    --sspr(player.sprx,player.spry,player.w,player.h,player.x,player.y)
    if player.last_dir == "up" then
        animation_draw(player.up_anim, player.x, player.y, false, false)
    elseif player.last_dir == "down" then
        animation_draw(player.down_anim, player.x, player.y, false, false)
    else
        animation_draw(player.side_anim, player.x, player.y, player.last_dir == "right", false)
    end
    
end

function player_udpate()
    animation_update(player.side_anim)
    animation_update(player.up_anim)
    animation_update(player.down_anim)

    -- ⬆️, ⬇️, ⬅️, ➡️, 🅾️, and ❎
    if btn(⬅️) then
        player.dx -= player.acc + player.acc * player.energy
        player.last_dir = "left"
    end
    if btn(➡️) then
        player.dx += player.acc + player.acc * player.energy
        player.last_dir = "right"
    end
    if btn(⬆️) then
        player.dy -= player.acc + player.acc * player.energy
        player.last_dir = "up"
    end
    if btn(⬇️) then
        player.dy += player.acc + player.acc * player.energy
        player.last_dir = "down"
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
