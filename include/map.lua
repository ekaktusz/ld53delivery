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
                    type = _type
                }
                add(t, obj)
                if _type == "player" then
                    mset(i,j,20)
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
                    mset(i,j,36)
                    --mset(i,j,38)
                    --mset(i+1,j,39)
                    mset(i,j+1,54)
                    mset(i+1,j+1,55)
                end
            end
        end
    end
    return t
end