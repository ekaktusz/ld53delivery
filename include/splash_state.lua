local splash_state = {}

local function print_angle(s, x, y, c, a)
    for i=1,#s do
        print(sub(s,i,i), x, y, c)
        x += cos(a) * 4.1
        y += sin(a) * 4.2
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
    splash_state.bgcolor = 0
    splash_state.fccolor = 7
    splash_state.hdcolor = 3
    splash_state.mcolor = 8
end

function splash_state_update()
    splash_state.angle += 0.02

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
            splash_state.hat_color = splash_state.timer1 * 10 % 14 + 3
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
        rectfill(40, 64, 83, 90, splash_state.bgcolor)
        ovalfill(34,58,80,70,splash_state.hat_color) -- sapi ellenző
        rectfill(82,56,85,64,splash_state.hat_color) -- sapi legszele
        ovalfill(45, 45, 81, 65, splash_state.hat_color) --sapi középső rész
        circ(65, 6, 60, splash_state.hat_color+1) --varrás 1
        circ(80, 63, 30, splash_state.hat_color+1) --varrás 2
        circ(40, 63, 30, splash_state.hat_color+1) --varrás 3
        rectfill(0,0,38,60,splash_state.bgcolor) --takarás
        rectfill(83,0,128,80,splash_state.bgcolor) --takarás
        rectfill(0,0,38,60,splash_state.bgcolor) --takarás
        rectfill(0,0,128,40,splash_state.bgcolor8) --takarás
        rectfill(83,0,128,80,splash_state.bgcolor) --takarás
        rectfill(0,0,30,128,splash_state.bgcolor) --takarás
        rectfill(0,128,49,92,splash_state.bgcolor) --takarás
        rectfill(128,128,68,92,splash_state.bgcolor) --takarás
        rectfill(90,0,128,128,splash_state.bgcolor) --takarás
        rectfill(0,71,128,100,splash_state.bgcolor) --takarás
        rectfill(68,70,69,71,splash_state.bgcolor) --takarás
        rectfill(49,65,51,70,splash_state.hat_color) -- sapi cover up
        rectfill(69,67,71,69,splash_state.hat_color) -- sapi cover up
    end

    print_angle('gerappa', 46, 50, 7, splash_state.angle) --0.015
    print_angle('games!', 48, 56, 7, splash_state.angle)

    if splash_state.show_face then
        circfill(60,73,21,splash_state.hdcolor) --fej

        circfill(61,61,20,splash_state.hat_color) --sapi teteje
        rectfill(40, 66, 80, 75, splash_state.hdcolor)
        ovalfill(34,58,80,70,splash_state.hat_color) -- sapi ellenző
        rectfill(82,56,85,64,splash_state.hat_color) -- sapi legszele
        ovalfill(45, 45, 81, 65, splash_state.hat_color) --sapi középső rész
        circ(65, 6, 60, splash_state.hat_color+1) --varrás 1
        circ(80, 63, 30, splash_state.hat_color+1) --varrás 2
        circ(40, 63, 30, splash_state.hat_color+1) --varrás 3

        rectfill(0,0,38,60,splash_state.bgcolor) --takarás
        rectfill(0,0,128,40,splash_state.bgcolor8) --takarás
        rectfill(83,0,128,80,splash_state.bgcolor) --takarás
        rectfill(0,0,30,128,splash_state.bgcolor) --takarás
        rectfill(0,128,49,92,splash_state.bgcolor) --takarás
        rectfill(128,128,68,92,splash_state.bgcolor) --takarás
        rectfill(90,0,128,128,splash_state.bgcolor) --takarás
        rectfill(68,70,69,71,splash_state.hdcolor) --takarás
        rectfill(69,91,71,91,splash_state.hdcolor) --takarás
        rectfill(50,91,51,91,splash_state.hdcolor) --takarás
        rectfill(49,65,51,70,splash_state.hat_color) -- sapi cover up
        rectfill(69,67,71,69,splash_state.hat_color) -- sapi cover up

        ovalfill(46, 74, 74, 92, splash_state.mcolor) --száj ív 2
        ovalfill(46, 72, 74, 84, splash_state.hdcolor) --száj ív 1
        rectfill(45, 71, 76, 81, splash_state.hdcolor) -- takarás
        rectfill(61, 85, 63, 88, 7) -- fog
        rectfill(56, 85, 58, 88, 7) -- fog
        circfill(51, 75, 2, splash_state.fccolor) --balszem
        rectfill(51, 75, 52, 76, 12) --balszem pupilla
        if splash_state.blink then
            rectfill(66, 75, 68, 75, splash_state.fccolor)
        else
            circfill(67, 75, 2, splash_state.fccolor) --jobbszem
            rectfill(67, 75, 68, 76, 12) --balszem pupilla
        end
    end

    print_angle('gerappa', 46, 50, 7, splash_state.angle) --0.015
    print_angle('games!', 48, 56, 7, splash_state.angle)

    transition_draw(splash_state.close_tran)
end