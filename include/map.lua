function get_objects_for_sprite_num(spriten,w,h,type)
    local _w = w or 8
    local _h = h or 8
    local _type = type or "snail"
    local t = {}
    for i=0,127,1 do
        for j=0,32,1 do
            local sprite_num = mget(i,j)
            if (sprite_num == spriten) then
                obj = customer_new(i*8,j*8,_w,_h,_type)
                add(t, obj)
                mset(i,j,21)
                if _w==16 then
                    mset(i+1,j,21)
                end
                if _h==16 then
                    mset(i,j+1,21)
                end
                if _w==16 and _h==16 then
                    mset(i+1,j+1,21)
                end
            end
        end
    end
    return t
end