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

local invisible_fences = {
    {x1=7*8,y1=12*8,x2=7*8+2,y2=23*8},
    {x1=45*8-2,y1=12*8,x2=45*8,y2=23*8},
    {x1=7*8,y1=23*8-2,x2=45*8,y2=23*8},
    {x1=49*8,y1=15*8,x2=57*8,y2=15*8+2},
    {x1=49*8,y1=12*8+2,x2=49*8+2,y2=15*8}
}

--local fence1 = {x1=7*8,y1=12*8,x2=7*8+2,y2=23*8}
--local fence2 = {x1=45*8-2,y1=12*8,x2=45*8,y2=23*8}
--local fence3 = {x1=7*8,y1=23*8-2,x2=45*8,y2=23*8}
--local fence4 = {x1=49*8,y1=15*8,x2=57*8-2,y2=15*8}

function solid_fence(x,y)
    for fence in all(invisible_fences) do
        if x >= fence.x1 and x <= fence.x2 and y >=fence.y1 and y <= fence.y2 then
            return true
        end
    end
    return false
end

function hitboxes_draw()
    for fence in all(invisible_fences) do
        rectfill(fence.x1,fence.y1,fence.x2,fence.y2,8)
    end
end