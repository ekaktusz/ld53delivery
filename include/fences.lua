fences = {}

function fences_init()
    clear_table(fences)
    fences = get_objects_for_sprite_num(184,8,8,"fences")
    fences.spr = 184
end

function fences_draw()
    for fence in all(fences) do
        --spr(184, fence.x, fence.y, fence.w, fence.h)
        sspr(64, 88, fence.w, fence.h, fence.x, fence.y)
    end
end