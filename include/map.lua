
local dance_floor = {x1=7*8-2, y1=16*8-5, x2=45*8, y2= 24*8}

function is_on_dance_floor(x,y)
    return x > dance_floor.x1 and x < dance_floor.x2 and y > dance_floor.y1 and y < dance_floor.y2
end 

local bathroom = {x1=49*8-2, y1=24*8, x2=57*8, y2= 30*8}
function is_on_bathroom(x, y) 
    return x > bathroom.x1 and x < bathroom.x2 and y > bathroom.y1 and y < bathroom.y2
end

local wc = {x1=49*8, y1=22*8-5, x2=57*8, y2= 24*8}
function is_on_wc(x, y)
    return x > wc.x1 and x < wc.x2 and y > wc.y1 and y < wc.y2
end

function get_objects_for_sprite_num(spriten,w,h,type)
    local _w = w or 8
    local _h = h or 8
    local _type = type
    local t = {}
    for i=0,127,1 do
        for j=0,31,1 do
            local sprite_num = mget(i,j)
            if (sprite_num == spriten) then
                obj = {
                    x = i*8,
                    y = j*8,
                    w = _w,
                    h = _h,
                    type = _type,
                    spr = spriten
                }
                add(t, obj)
                if _type == "player" then
                    mset(i,j,36)
                elseif _type == "speaker" then
                    if j > 5 then
                        mset(i,j,68)
                    else
                        mset(i,j,102)
                    end
                elseif _type == "dj" then
                    customer_init(obj, _type)
                    mset(i,j,68)
                elseif _type == "fences" then
                    if j > 12 then
                        mset(i,j,20)
                    else
                        mset(i,j,36)
                    end
                elseif _type == "dealer" then
                    mset(i,j,38)
                    mset(i+1,j,39)
                    mset(i,j+1,54)
                    mset(i+1,j+1,55)

                    mset(i+2,j,38)
                    mset(i+3,j,39)
                    mset(i+2,j+1,54)
                    mset(i+3,j+1,55)
                else
                    obj = customer_init(obj, _type)
                    if is_on_dance_floor(obj.x, obj.y) or is_on_bathroom(obj.x,obj.y) then
                        mset(i,j,20)
                        --mset(i,j,38)
                        --mset(i+1,j,39)
                        mset(i,j+1,21)
                        mset(i+1,j+1,21)
                    elseif is_on_wc(obj.x, obj.y) then
                        mset(i,j,76)
                        mset(i+1,j,77)
                        mset(i,j+1,92)
                        mset(i+1,j+1,93)
                    
                    elseif j==15 then
                        mset(i,j,84)
                        --mset(i,j,38)
                        --mset(i+1,j,39)
                        mset(i,j+1,21)
                        mset(i+1,j+1,21)
                    else
                        mset(i,j,36)
                        --mset(i,j,38)
                        --mset(i+1,j,39)
                        mset(i,j+1,54)
                        mset(i+1,j+1,55)
                    end
                end
            end
        end
    end
    return t
end