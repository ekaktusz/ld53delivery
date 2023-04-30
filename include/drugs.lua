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
    if drug.dragged then
        drug.x = stat(32)+cam.x-1
        drug.y = stat(33)+cam.y-1
    end

    if mouse_in_area(drug.x, drug.y, drug.w, drug.h) then
        --print("??")
        mouse.triggered = true
        if stat(34)==1 and (not mouse.dragged or drug.dragged) then
            drug.dragged = true
            mouse.dragged = true
        else 
            if drug.dragged then 
                for customer in all(customers) do
                    if mouse_in_area(customer.x, customer.y, customer.w, customer.h) then
                        drug_sell(drug)
                    end
                end
            end

            drug.dragged = false
            mouse.dragged = false
        end
    end
end

function drug_sell(drug)
    inventory_remove_drug(drug)
    mouse.dragged = false
    drug = nil
    money+=10
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