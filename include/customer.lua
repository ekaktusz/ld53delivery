customers = {}

local function table_concat(t1,t2) --feltetelezzuk hogy object
    for i=1,#t2 do
        t1[#t1+1] = {x=t2[i].x, y=t2[i].y, w=t2[i].w, h=t2[i].h, type=t2[i].type, animation=t2[i].animation}
    end
    return t1
end

function customer_new(_x,_y,_w,_h,_type)
    local customer = {
        x = _x, 
        y = _y,
        w = _w,
        h = _h,
        type = _type
    }
    if _type == "turtle" then
        local frames = { {x=80, y=64, w=_w, h=_h}, {x=80, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "dj" then
        local frames = { {x=32, y=64, w=_w, h=_h}, {x=32, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "rabbit" then
        local frames = { {x=16, y=64, w=_w, h=_h}, {x=16, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "tiger" then
        local frames = { {x=96, y=64, w=_w, h=_h}, {x=96, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "snake" then
        local frames = { {x=112, y=64, w=_w, h=_h}, {x=112, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "horse" then
        local frames = { {x=32, y=96, w=_w, h=_h}, {x=32, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "monke" then
        local frames = { {x=16, y=96, w=_w, h=_h}, {x=16, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "chicken" then
        local frames = { {x=0, y=112, w=_w, h=_h}, {x=0, y=96, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "racoon" then
        local frames = { {x=96, y=96, w=_w, h=_h}, {x=96, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    elseif _type == "owl" then
        local frames = { {x=112, y=96, w=_w, h=_h}, {x=112, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 20)
    end
    
    return customer
end

local function customer_update(customer)
    animation_update(customer.animation)
end

local function customer_draw(customer)
    --if customer.type == "snail" then
    --    sspr(64,0,customer.w,customer.h,customer.x,customer.y)
    --end
    animation_draw(customer.animation, customer.x, customer.y)
end

function customers_load()
    local turtles = get_objects_for_sprite_num(138,16,16,"turtle")
    local dj = get_objects_for_sprite_num(132,16,16,"dj")
    local rabbits = get_objects_for_sprite_num(130,16,16,"rabbit")
    local tigers = get_objects_for_sprite_num(140,16,16,"tiger")
    local snakes = get_objects_for_sprite_num(142,16,16,"snake")
    local horses = get_objects_for_sprite_num(196,16,16,"horse")
    local monkes = get_objects_for_sprite_num(194,16,16,"monke")
    local chickens = get_objects_for_sprite_num(192,16,16,"chicken")
    local racoons = get_objects_for_sprite_num(204,16,16,"racoon")
    local owls = get_objects_for_sprite_num(206,16,16,"owl")


    table_concat(customers, turtles)
    table_concat(customers, dj)
    table_concat(customers, rabbits)
    table_concat(customers, tigers)
    table_concat(customers, snakes)
    table_concat(customers, horses)
    table_concat(customers, monkes)
    table_concat(customers, chickens)
    table_concat(customers, racoons)
    table_concat(customers, owls)
end

function customers_draw()
    for customer in all(customers) do
        customer_draw(customer)
    end
end

function customers_update()
    for customer in all(customers) do
        customer_update(customer)
    end
end

