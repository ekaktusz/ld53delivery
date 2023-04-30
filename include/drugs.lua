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
                    pcenter = get_center(player.x,player.y,player.w,player.h)
                    ccenter = get_center(customer.x,customer.y,customer.w,customer.h)
                    if mouse_in_area(customer.x, customer.y, customer.w, customer.h)
                    and (get_distance(pcenter.x, pcenter.y, ccenter.x, ccenter.y) < 50)
                     then
                        drug_sell(drug)
                    end
                end

                if mouse_in_area(player.x, player.y, player.w, player.h) then
                    drug_use(drug)
                end
            end
            if not mouse.click and mouse.old_click then
                drug.dragged = false
                mouse.dragged = false
            end
        end
    end
end

function drug_sell(drug)
    inventory_remove_drug(drug)
    mouse.dragged = false
    
    if (drug.type == "marijuana") then 
        money+=20
    elseif (drug.type == "ecstasy") then 
        money+=30
    elseif (drug.type == "cocaine") then 
        money+=100
    end

    drug = nil
    player.anxiety += 0.1
end

function drug_use(drug)
    inventory_remove_drug(drug)
    mouse.dragged = false
    
    if (drug.type == "marijuana") then 
        player.anxiety -= 0.5
        player.energy -= 0.3
    elseif (drug.type == "ecstasy") then 
        player.energy += 0.5
        player.anxiety += 0.2
    elseif (drug.type == "cocaine") then 
        player.energy = 0.7
        player.anxiery = 0.19
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