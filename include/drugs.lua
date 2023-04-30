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
    if mouse_in_area(drug.x, drug.y, drug.w, drug.h) then
        mouse.triggered = true
        if mouse.click and not mouse.dragged then
            drug.dragged = true
            mouse.dragged = true
        else 
            drug.dragged = false
        end
    end
end

function drug_draw(drug)
    if drug.type == "marijuana" then
        sspr(48, 0, drug.w, drug.h, drug.x, drug.y)
    elseif drug.type == "ecstasy" then
        sspr(96, 0, drug.w, drug.h, drug.x, drug.y)
    elseif drug.type == "cocaine" then
        sspr(80, 0, drug.w, drug.h, drug.x, drug.y)
    end
end