mouse = {}

function mouse_init()
    poke(0x5f2d, 1)
    mouse.x = 0
    mouse.y = 0
    mouse.click = false
    mouse.triggered = false
    mouse.dragged = false
    mouse.spr = 0
    mouse.idlespr = 0
    mouse.actspr = 1
    mouse.dragspr = 17
end

function mouse_draw()
    spr(mouse.spr,stat(32)+cam.x-1,stat(33)+cam.y-1)
end

function mouse_update()
    if stat(34)==1 then
        mouse.click = true
    else
        mouse.click = false
    end

    if mouse.dragged then
        mouse.spr = mouse.dragspr
    elseif mouse.triggered then
        mouse.spr = mouse.actspr
    else
        mouse.spr = mouse.idlespr
    end

    mouse.triggered = false
    --mouse.dragged = false
end

function mouse_in_area(x, y, w, h)
    return (stat(32)+cam.x-1 >= x and stat(32)+cam.x-1 <= x+w and stat(33)+cam.y-1 >=y and stat(33)+cam.y-1 <= y+h)
end