dealer = {}

function dealer_init()
    dealer = get_objects_for_sprite_num(36,16,16,"dealer")[1]
    local frames = { {x=32, y=16, w=16, h=16}, {x=48, y=16, w=16, h=16} }
    dealer.animation = animation_new(frames, 20)

    --shop
    shop = {
        x = 32,
        y = 32,
        w = 64,
        h = 56
    }
    dealer.in_shop = false
    dealer.buy_btn1 = button_new(shop.x + flr(shop.w/3)*2, shop.y + 3,                 flr(shop.w/3)-1, 12, "buy")
    dealer.buy_btn2 = button_new(shop.x + flr(shop.w/3)*2, shop.y+flr(shop.h/3) + 3,   flr(shop.w/3)-1, 12, "buy")
    dealer.buy_btn3 = button_new(shop.x + flr(shop.w/3)*2, shop.y+flr(shop.h/3)*2 + 3, flr(shop.w/3)-1, 12, "buy")
    dealer.close_btn = button_new(shop.x + shop.w - 6, shop.y -8, 6, 8, "x", 9, 8, 0, 9)
    dealer.close_btn.on_click = function()
        dealer.in_shop = false
    end
    dealer.buy_btn1.on_click = function()
        --inventory_add_drug("marijuana")
        if not mouse.old_click and mouse.click then
            if not inventory_is_full() then
                if (money>=12) money-=12
                inventory_add_drug(drug_new("marijuana"))
            end
        end
    end

    dealer.buy_btn2.on_click = function()
        --inventory_add_drug("marijuana")
        if not mouse.old_click and mouse.click then
            if not inventory_is_full() then
                if (money>=12) money-=15
                inventory_add_drug(drug_new("ecstasy"))
            end
        end
    end

    dealer.buy_btn3.on_click = function()
        --inventory_add_drug("marijuana")
        if not mouse.old_click and mouse.click then
            if not inventory_is_full() then
                if (money>=12) money-=42
                inventory_add_drug(drug_new("cocaine"))
            end
        end
    end
end


function dealer_update()
    if dealer.in_shop then
        button_update(dealer.buy_btn1)
        button_update(dealer.buy_btn2)
        button_update(dealer.buy_btn3)
        button_update(dealer.close_btn)
    else
        if mouse_in_area(dealer.x, dealer.y, dealer.w, dealer.h) and not mouse.dragged then
            mouse.triggered = true
            if mouse.click then
                dealer_enter_shop()
            end
        end
    end
end

local function dealer_draw_shop()
    local sx = shop.x + cam.x
    local sy = shop.y + cam.y

    rectfill(sx, sy-8, sx+shop.w, sy, 7)
    rectfill(sx+1, sy-7, sx+shop.w-1, sy-1, 0)
    print("shop", sx+2, sy-6, 7)

    rectfill(sx, sy, sx+shop.w, sy+shop.h, 7)
    rectfill(sx+1, sy+1, sx+shop.w-1, sy+shop.h-1, 0)
    
    local offset_x = 2
    local offset_y = 1
    
    sspr(48, 0, 16, 16, sx + offset_x, sy + offset_y) -- marijuana
    sspr(96, 0, 16, 16, sx + offset_x, sy + offset_y + flr(shop.h/3)) -- ecstasy
    sspr(80, 0, 16, 16, sx + offset_x, sy + offset_y + flr(shop.h/3*2)) -- cocaine

    offset_y = 2

    print("weed", sx + flr(shop.w/3),  sy + offset_y, 7)
    print("molly", sx + flr(shop.w/3),  sy + offset_y + flr(shop.h/3),7)
    print("coke",  sx + flr(shop.w/3), sy + offset_y + flr(shop.h/3)*2,7)

    print("$12", sx + flr(shop.w/3),  sy + offset_y + 8, 7)
    print("$18", sx + flr(shop.w/3),  sy + offset_y + 8 + flr(shop.h/3),7)
    print("$42",  sx + flr(shop.w/3), sy + offset_y + 8 + flr(shop.h/3)*2,7)

    button_draw(dealer.buy_btn1)
    button_draw(dealer.buy_btn2)
    button_draw(dealer.buy_btn3)
    button_draw(dealer.close_btn)
end

function dealer_draw()
    animation_draw(dealer.animation, dealer.x, dealer.y)

    if dealer.in_shop then
        dealer_draw_shop()
    end
end

function dealer_enter_shop()
    dealer.in_shop = true
end