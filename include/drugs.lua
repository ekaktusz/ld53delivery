-- marijuana, ecstasy, cocaine
function drug_new(_type)
    local drug = {
        type=_type,
        x=0,
        y=0,
        w=16,
        h=16,
        dragged=false
    }
    return drug
end

function drug_update(drug)
    log("drug_update")
    if drug.dragged then
        drug.x = stat(32)+cam.x-1
        drug.y = stat(33)+cam.y-1
    end

    if mouse_in_area(drug.x, drug.y, drug.w, drug.h) then
        log("mouse_in_area")
        --print("??")
        mouse.triggered = true
        if stat(34)==1 and (not mouse.dragged or drug.dragged) then
            log("turn on drag")
            drug.dragged = true
            mouse.dragged = true
        else 
            log("turn_off_drag")
            drug.dragged = false
            mouse.dragged = false
        end
    end
end

function drug_draw(drug)
    print(drug.dragged,cam.x+30,0)
    print(mouse.dragged,cam.x+60,0)

    if drug.type == "marijuana" then
        sspr(48, 0, drug.w, drug.h, drug.x, drug.y)
    elseif drug.type == "ecstasy" then
        sspr(96, 0, drug.w, drug.h, drug.x, drug.y)
    elseif drug.type == "cocaine" then
        sspr(80, 0, drug.w, drug.h, drug.x, drug.y)
    end
end