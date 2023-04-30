customers = {}

local function table_concat(t1,t2) --feltetelezzuk hogy object
    for i=1,#t2 do
        t1[#t1+1] = {x=t2[i].x, y=t2[i].y, w=t2[i].w, h=t2[i].h, type=t2[i].type}
    end
    return t1
end

local function customer_new(_x,_y,_w,_h,_type)
    local customer = {
        x = _x, 
        y = _y,
        w = _w,
        h = _h,
        type = _type 
    }
    return customer
end

local function customer_update(customer)

end

local function customer_draw(customer)
    if customer.type == "snail" then
        sspr(64,0,customer.w,customer.h,customer.x,customer.y)
    end
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

