mouse = {}

function mouse_init()
    poke(0x5f2d, 1)
    mouse.x = 0
    mouse.y = 0
    mouse.click = false
end

function mouse_draw()
    spr(0,stat(32)+cam.x-1,stat(33)+cam.y-1)
end

function mouse_update()
    mouse.x = stat(32)
    mouse.y = stat(33)
    if stat(34)==1 then
        mouse.click = true
    else
        mouse.click = false
    end
end