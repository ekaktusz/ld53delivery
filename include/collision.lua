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
    return flag==1 or solid_fence(x,y)
end

local fence1 = {x1=7*8,y1=12*8,x2=7*8+2,y2=23*8}
local fence2 = {x1=45*8-2,y1=12*8,x2=45*8,y2=23*8}
local fence3 = {x1=7*8,y1=23*8-2,x2=45*8,y2=23*8}
--local fence2 = {x1=45*8,y1=11*8,x2=45*8-2,y2=23*8}

function solid_fence(x,y)
    if x >= fence1.x1 and x <= fence1.x2 and y >=fence1.y1 and y <= fence1.y2 then
        return true
    end
    if x >= fence2.x1 and x <= fence2.x2 and y >=fence2.y1 and y <= fence2.y2 then
        return true
    end
    if x >= fence3.x1 and x <= fence3.x2 and y >=fence3.y1 and y <= fence3.y2 then
        return true
    end
end

function hitboxes_draw()
    rectfill(fence1.x1,fence1.y1,fence1.x2,fence1.y2,8)
    rectfill(fence2.x1,fence2.y1,fence2.x2,fence2.y2,8)
    rectfill(fence3.x1,fence3.y1,fence3.x2,fence3.y2,8)
end