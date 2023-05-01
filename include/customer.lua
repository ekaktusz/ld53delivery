customers = {}

local demand_types = {"marijuana", "ecstasy", "cocaine"}

local demand_anim_timer = 0

local function table_concat(t1,t2) --feltetelezzuk hogy object
    for i=1,#t2 do
        t1[#t1+1] = {
            x=t2[i].x, 
            y=t2[i].y, 
            w=t2[i].w, 
            h=t2[i].h, 
            type=t2[i].type, 
            animation=t2[i].animation,
            demand = t2[i].demand,
            demand_timer = t2[i].demand_timer,
            demand_time = t2[i].demand_time,
            current_drug = t2[i].current_drug
        }
        --for key, value in pairs(t2) do
        --    t1[key] = value
        --end
    end
    return t1
end

function customer_init(customer,_type)
    local _w = customer.w
    local _h = customer.h
    if _type == "turtle" then
        local frames = { {x=80, y=64, w=_w, h=_h}, {x=80, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "dj" then
        local frames = { {x=32, y=64, w=_w, h=_h}, {x=32, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "rabbit" then
        local frames = { {x=16, y=64, w=_w, h=_h}, {x=16, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "tiger" then
        local frames = { {x=96, y=64, w=_w, h=_h}, {x=96, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "snake" then
        local frames = { {x=112, y=64, w=_w, h=_h}, {x=112, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "horse" then
        local frames = { {x=32, y=96, w=_w, h=_h}, {x=32, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "monke" then
        local frames = { {x=16, y=96, w=_w, h=_h}, {x=16, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "chicken" then
        local frames = { {x=0, y=112, w=_w, h=_h}, {x=0, y=96, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "racoon" then
        local frames = { {x=96, y=96, w=_w, h=_h}, {x=96, y=112, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "crow" then
        local frames = { {x=0, y=64, w=_w, h=_h}, {x=0, y=80, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    elseif _type == "fox" then
        local frames = { {x=112, y=32, w=_w, h=_h}, {x=112, y=48, w=_w, h=_h} }
        customer.animation = animation_new(frames, 29)
    end

    customer.demand = nil
    customer.demand_timer = 0
    customer.demand_time = rnd(200) * 60
    customer.current_drug = nil

    return customer
end

function customer_reset_demand(customer)
    customer.demand = nil
    customer.demand_timer = 0
    customer.demand_time = 3600 + rnd(300) * 60
end

local function customer_update(customer)
    if customer.type != "owl" then
        animation_update(customer.animation)
    end
    
    --w when dont have demand
    if customer.demand == nil then
        customer.demand_timer += 1
        if customer.demand_timer >= customer.demand_time then
            -- TODO létrejön a demand
            customer.demand = demand_types[flr(rnd(#demand_types))+1]
        end
    end
end

local function customer_draw(customer)
    if customer.type == "owl" then
        if customer.current_drug == "ecstasy" then
            sspr(112,112,16,16,customer.x,customer.y)
        elseif customer.current_drug == "marijuana" then
            sspr(64,16,16,16,customer.x,customer.y)
        else
            sspr(112,96,16,16,customer.x,customer.y)
        end
    else
        animation_draw(customer.animation, customer.x, customer.y)
    end
end

local function customer_draw_demand(customer)
    -- draw demand
    if demand_anim_timer < 120 then
        if customer.demand == "marijuana" then
            sspr(48, 0, 16, 16, customer.x, customer.y-16)
        elseif customer.demand == "ecstasy" then
            sspr(96, 0, 16, 16, customer.x, customer.y-16)
        elseif customer.demand == "cocaine" then
            sspr(80, 0, 16, 16, customer.x, customer.y-16)
        end
    end
end

function customers_load()
    clear_table(customers)

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
    local crows = get_objects_for_sprite_num(128,16,16,"crow")
    local foxs = get_objects_for_sprite_num(78,16,16,"fox")


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
    table_concat(customers, crows)
    table_concat(customers, foxs)
end

function customers_draw()
    for customer in all(customers) do
        customer_draw(customer)
    end
end

function customers_draw_demand()
    for customer in all(customers) do
        customer_draw_demand(customer)
    end
end

function customers_update()
    demand_anim_timer += 1
    if demand_anim_timer >= 150 then
        demand_anim_timer = 0
    end

    for customer in all(customers) do
        customer_update(customer)
    end
end

