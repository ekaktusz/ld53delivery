function get_objects_for_sprite_num(spriten,w,h,type)
    local _w = w or 8
    local _h = h or 8
    local _type = type or "snail"
    local t = {}
    for i=0,127,1 do
        for j=0,32,1 do
            local sprite_num = mget(i,j)
            if (sprite_num == spriten) then
                obj = {x=i*8,y=j*8,w=_w,h=_h,type=_type}
                add(t, obj)
                mset(i,j,20)
            end
        end
    end
    return t
end