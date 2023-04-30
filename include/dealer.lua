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
    dealer.in_shop = true
    dealer.buy_btn1 = button_new(shop.x + flr(shop.w/3)*2, shop.y + 3,                 flr(shop.w/3)-1, 12, "buy")
    dealer.buy_btn2 = button_new(shop.x + flr(shop.w/3)*2, shop.y+flr(shop.h/3) + 3,   flr(shop.w/3)-1, 12, "buy")
    dealer.buy_btn3 = button_new(shop.x + flr(shop.w/3)*2, shop.y+flr(shop.h/3)*2 + 3, flr(shop.w/3)-1, 12, "buy")
end


function dealer_update()
    if dealer.in_shop then
        button_update(dealer.buy_btn1)
        button_update(dealer.buy_btn2)
        button_update(dealer.buy_btn3)
    end
end

local function dealer_draw_shop()
    rectfill(shop.x, shop.y, shop.x+shop.w, shop.y+shop.h, 7)
    rectfill(shop.x+1, shop.y+1, shop.x+shop.w-1, shop.y+shop.h-1, 0)
    
    local offset_x = 2
    local offset_y = 1
    
    sspr(48, 0, 16, 16, shop.x + offset_x, shop.y + offset_y) -- marijuana
    sspr(96, 0, 16, 16, shop.x + offset_x, shop.y + offset_y + flr(shop.h/3)) -- ecstasy
    sspr(80, 0, 16, 16, shop.x + offset_x, shop.y + offset_y + flr(shop.h/3*2)) -- cocaine

    offset_y = 2

    print("weed", shop.x + flr(shop.w/3),  shop.y + offset_y, 7)
    print("molly", shop.x + flr(shop.w/3),  shop.y + offset_y + flr(shop.h/3),7)
    print("coke",  shop.x + flr(shop.w/3), shop.y + offset_y + flr(shop.h/3)*2,7)

    print("$10", shop.x + flr(shop.w/3),  shop.y + offset_y + 8, 7)
    print("$15", shop.x + flr(shop.w/3),  shop.y + offset_y + 8 + flr(shop.h/3),7)
    print("$20",  shop.x + flr(shop.w/3), shop.y + offset_y + 8 + flr(shop.h/3)*2,7)

    button_draw(dealer.buy_btn1)
    button_draw(dealer.buy_btn2)
    button_draw(dealer.buy_btn3)
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