mouse = {}

function mouse_init()
    poke(0x5f2d, 1)
    mouse.x = 0
    mouse.y = 0
    mouse.click = false
    mouse.triggered = false
    mouse.spr = 0
    mouse.idlespr = 0
    mouse.actspr = 1
    mouse.dragspr = 17
end

function mouse_draw()
    spr(mouse.spr,stat(32)+cam.x-1,stat(33)+cam.y-1)
end

function mouse_update()
    mouse.x = stat(32)
    mouse.y = stat(33)
    if stat(34)==1 then
        mouse.click = true
    else
        mouse.click = false
    end

    if mouse.click then
        mouse.spr = mouse.dragspr
    elseif mouse.triggered then
        mouse.spr = mouse.actspr
    else
        mouse.spr = mouse.idlespr
    end

    mouse.triggered = false
end

function mouse_in_area(x, y, w, h)
    return (mouse.x >= x and mouse.x <= x+w and mouse.y >=y and mouse.y <= y+h)
end