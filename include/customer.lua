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
    if _type == "snail" then
        local frames = { {x=64, y=0, w=_w, h=_h}, {x=64, y=16, w=_w, h=_h} }
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
    local snails = get_objects_for_sprite_num(8,16,16)
    table_concat(customers, snails)
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

