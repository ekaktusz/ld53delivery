fences = {}
local back_fences = {}
local front_fences = {}

function fences_init()

    clear_table(fences)
    clear_table(back_fences)
    clear_table(front_fences)

    fences = get_objects_for_sprite_num(184,8,8,"fences")
    local sexy_fences = get_objects_for_sprite_num(168,8,8,"fences")
    table_concat(fences, sexy_fences)
    
    for fence in all(fences) do
        if fence.y > 12*8 then
            --behind / lent
            add(back_fences, fence)
        else
            --front / fent
            add(front_fences, fence)
        end
    end

    fences.spr = 184
end

function fences_draw_front()
    for fence in all(front_fences) do
        --spr(184, fence.x, fence.y, fence.w, fence.h)
        sspr(64, 88, fence.w, fence.h, fence.x, fence.y)
    end
end

function fences_draw_back()
    for fence in all(back_fences) do
        --spr(184, fence.x, fence.y, fence.w, fence.h)
        if fence.spr == 184 then
            sspr(64, 88, fence.w, fence.h, fence.x, fence.y)
        else
            sspr(64, 80, fence.w, fence.h, fence.x, fence.y)
        end
    end
end