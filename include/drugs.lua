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
local drag_offset = 5
local lenti_drag_offset = 2
function drug_update(drug)
    if drug.dragged then
        drug.x = stat(32)+cam.x-1 -4
        drug.y = stat(33)+cam.y-1 -6
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
                    if mouse_in_area(customer.x-drag_offset, customer.y-drag_offset, customer.w+lenti_drag_offset+drag_offset, customer.h+lenti_drag_offset+drag_offset)
                    --and (get_distance(pcenter.x, pcenter.y, ccenter.x, ccenter.y) < 110)
                     then
                        if (customer.demand == drug.type) then
                            drug_sell(drug)
                            if customer.type == "owl" then
                                if drug.type == "ecstasy" then
                                    customer.current_drug = "ecstasy"
                                elseif drug.type == "marijuana" then
                                    customer.current_drug = "marijuana"
                                end
                            elseif drug.type == "ecstasy" then
                                customer.animation.dt /= 2 
                            end
                            customer.just_drugged = drug.type
                            customer_reset_demand(customer)
                            return
                        end
                    end
                end
                if mouse_in_area(player.x-drag_offset, player.y-drag_offset, player.w+lenti_drag_offset+drag_offset, player.h+lenti_drag_offset+drag_offset) then
                    drug_use(drug)
                    player.just_drugged = drug.type
                    return
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
    mouse.dragged = false
    
    if (drug.type == "marijuana") then 
        money+=20
        sfx(36)
    elseif (drug.type == "ecstasy") then 
        money+=30
        sfx(32)
    elseif (drug.type == "cocaine") then 
        money+=100
        sfx(35)
    end
    --sfx(34)
    inventory_remove_drug(drug)
    drug = nil
    player.anxiety += 0.1
end

function drug_use(drug)
    mouse.dragged = false
    
    if (drug.type == "marijuana") then 
        player.anxiety -= 0.5
        player.energy -= 0.3
        sfx(36)
    elseif (drug.type == "ecstasy") then 
        player.energy += 0.5
        player.anxiety += 0.2
        sfx(32)
    elseif (drug.type == "cocaine") then 
        player.energy = 0.7
        player.anxiety = 0.19
        sfx(35)
    end

    inventory_remove_drug(drug)
    drug = nil
end

function drug_draw(drug)
    if drug.type == "marijuana" then
        sspr(48, 0, drug.w, drug.h, drug.x, drug.y)
    elseif drug.type == "ecstasy" then
        sspr(96, 0, drug.w, drug.h, drug.x, drug.y)
    elseif drug.type == "cocaine" then
        sspr(80, 0, drug.w, drug.h, drug.x, drug.y)
    end
    if drug.dragged then
        sspr(48, 32, drug.w, drug.h, drug.x, drug.y) --zacsi
    end
end