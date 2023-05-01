local tran_duration = 2.5

-- type "open" or "close"
function transition_new(_speed, _type)
    local transition = { 
        t = 0,
        s = _speed,
        started = false,
        type = _type
    }
    if (_type == "open") then
        transition.t = tran_duration
    end
    return transition
end

function transition_start(tran)
    tran.started = true
end

function transition_update(tran)
    if not tran.started then
        return
    end

    tran.t += tran.s
end

function transition_is_finished(tran)
    if (tran.type == "close") then
        return tran.t >= tran_duration
    elseif (tran.type == "open") then
        return tran.t >= tran_duration*2
    end
end

local function draw_transition(t)
    --cls()
    --this crazy bit loops through
    --limited background colors,
    --and changes it when the
    --screen is covered with white
    -- local c = 12 + ((t-2.55)/4)%4
    -- rectfill(0,0,128,128,c)
    for i=0,8 do -- column loop
        for j=0,8 do -- row loop
            --x positions are snapped
            --to 16px columns
            local x = i*16

            --this number sweeps back
            --and forth from -1 to 1
            local osc1 = sin(t+i*0.1)

            --this number also sweeps
            --back and forth, but at
            --a different rate
            local osc2 = sin(t/4+j*0.03)

            --y positions are influenced
            --by one of the sweepy
            --numbers
            local y = j*16 + osc1*10

            --the circles' radii are
            --influenced by the other
            --sweepy number
            circfill(cam.x+x, cam.y+y, osc2*17, 7)
        end
    end
end

local function draw_close_transition(t)
    if (t > tran_duration) then t=tran_duration end
    draw_transition(t)
end

local function draw_open_transition(t)
    if (t >= tran_duration*2) then return end
    draw_transition(t)
end

function transition_draw(tran)
    if not tran.started then
        return
    end

    if (tran.type == "close") then
        draw_close_transition(tran.t)
    elseif (tran.type == "open") then
        draw_open_transition(tran.t)
    end
end

