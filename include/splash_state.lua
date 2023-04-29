local splash_state = {}

local function print_angle(s, x, y, c, a)
    for i=1,#s do
        print(sub(s,i,i), x, y, c)
        x += cos(a) * 4
        y += sin(a) * 6
    end
end
   
function splash_state_init()
    _update60 = splash_state_update
    _draw = splash_state_draw

    splash_state.angle = 0
    splash_state.show_hat = false
    splash_state.show_face = false
    splash_state.link = false
    splash_state.timer1 = 0
    splash_state.close_tran = transition_new(0.025, "close")
    splash_state.bgcolor = 5
    splash_state.fccolor = 7
    splash_state.mcolor = 8
end

function splash_state_update()
    splash_state.angle += 0.01

    if splash_state.angle > 1.015 then
        splash_state.angle = 1.015
        splash_state.show_hat = true
    end

    if splash_state.show_hat then
        splash_state.timer1 += 0.025
        if splash_state.timer1 > 1 then
            splash_state.show_face = true
            splash_state.hat_color = 1
        else
            splash_state.hat_color = splash_state.timer1 * 7 % 15
        end
        if splash_state.timer1 > 1.5 then
            splash_state.blink = true
        end
        if splash_state.timer1 > 2 then
            splash_state.blink = false
        end
        if splash_state.timer1 > 2.5 then
            transition_start(splash_state.close_tran)
        end
    end

    if transition_is_finished(splash_state.close_tran) then
        menu_state_init()
    end

    transition_update(splash_state.close_tran)
end

function splash_state_draw()
    cls(splash_state.bgcolor)
    if splash_state.show_hat then
        circfill(61,61,20,splash_state.hat_color) --sapi teteje
        circfill(61,72,20,splash_state.bgcolor) --fej
        ovalfill(34,58,80,70,splash_state.hat_color) -- sapi ellenző
        ovalfill(45, 45, 81, 65, splash_state.hat_color) --sapi középső rész ssolver
    end

    print_angle('gerappa', 46, 50, 7, splash_state.angle) --0.015
    print_angle('games!', 48, 56, 7, splash_state.angle)

    if splash_state.show_face then
        circ(57,80,5,splash_state.mcolor) --száj ív
        rectfill(52, 75, 63, 81, splash_state.bgcolor)
        circfill(50, 75, 1, splash_state.fccolor) --balszem
        if splash_state.blink then
            rectfill(66, 75, 68, 75, splash_state.fccolor)
        else
            circfill(67, 75, 1, splash_state.fccolor) --jobbszem
        end
    end

    transition_draw(splash_state.close_tran)
end