function can_move(x,y,w,h)
    if (solid(x,y)) return false
    if (solid(x+w,y)) return false
    if (solid(x,y+h)) return false
    if (solid(x+w,y+h)) return false

    if (solid(x+flr(w/2),y)) return false
    if (solid(x,y+flr(h/2))) return false
    if (solid(x+w,y+flr(h/2))) return false
    if (solid(x+flr(w/2),y+h)) return false

    return true
end

function solid(x,y)
    local map_x=flr(x/8)
    local map_y=flr(y/8)
    local map_sprite=mget(map_x,map_y)
    local flag=fget(map_sprite)
    return flag==1
end