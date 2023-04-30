inventory = {}

function inventory_init()
    inventory.items = {nil, drug_new("marijuana"), drug_new("cocaine"), nil, nil, nil, nil, nil}
    inventory.x = 0
    inventory.y = 0
    inventory.w = 127
    inventory.h = 15

    local eki = drug_new("ecstasy")
    inventory_add_drug(eki)
end

function inventory_draw()
    rectfill(inventory.x,inventory.y,inventory.x+inventory.w,inventory.y+inventory.h,7) -- outside
    rectfill(inventory.x+1,inventory.y+1,inventory.x+inventory.w-1,inventory.y+inventory.h-1,0) -- inside

    -- Each character in the PICO-8 system font appears to be 3 pixels wide 
    -- and 5 pixels tall, but the font includes a 1-pixel wide gap on the right, 
    -- and a 1-pixel-tall gap on the bottom, so the final size is actually 
    -- 4 pixels wide and 6 pixels high. 
    rectfill(cam.x, 105+cam.y, cam.x+9*4+2, 112+cam.y,7) -- outside 
    rectfill(1+cam.x, 106+cam.y, cam.x+9*4+1, 113+cam.y, 0) -- inside
    print("inventory", 2+cam.x, 107+cam.y, 7) --text

    for item in all(inventory.items) do
        if item != nil then
            drug_draw(item)
        end
    end

    rectfill(cam.x+127-35, 105+cam.y, 127+cam.x, 112+cam.y,7) -- outside 
    rectfill(cam.x+127-34, 106+cam.y, 126+cam.x, 112+cam.y,0) -- inside 
    print(money.."$",cam.x+(127-4*(#(tostr(money))+1)), 107+cam.y, 11)
end

function inventory_update()
    inventory.x = cam.x
    inventory.y = cam.y + 112

    for i=1,8,1 do
        local item = inventory.items[i]
        if item != nil then
            if not item.dragged then
                item.x = inventory.x + (i-1) * item.w
                item.y = inventory.y
            end
            drug_update(item)
        end
    end
end

function inventory_add_drug(drug)
    for i=1,8,1 do
        local item = inventory.items[i]
        if item == nil then
            --add(inventory.items,drug,i)
            inventory.items[i] = drug
            return
        end
    end
end

function inventory_remove_drug(drug)
    for i=1,8,1 do
        local item = inventory.items[i]
        if item == drug then
            inventory.items[i] = nil
            return
        end
    end
end

function inventory_is_full()
    for i=1,8,1 do
        local item = inventory.items[i]
        if item == nil then
            return false
        end
    end
    return true
end