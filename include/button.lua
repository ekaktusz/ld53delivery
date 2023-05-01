function button_new(_x,_y,_w,_h,_text,_click_c, _bg_c, _text_c, _hover_c)
    local button = {
        x=_x,
        y=_y,
        w=_w,
        h=_h,
        text=_text,
        on_click = nil,
        click_c = _click_c or 3,
        bg_c = _bg_c or 0,
        text_c = _text_c or 7,
        hover_c = _hover_c or 5,
        c = 0
    }
    return button
end

function button_draw(button)
    rectfill(button.x+cam.x, button.y+cam.y, button.x+cam.x+button.w, button.y+cam.y+button.h, 7)
    rectfill(button.x+cam.x+1, button.y+cam.y+1, button.x+cam.x+button.w-1, button.y+cam.y+button.h-1, button.c)
    print(button.text,button.x+cam.x+2, button.y+cam.y+2,button.text_c)
end

function button_update(button)
    if mouse_in_area(button.x+cam.x, button.y+cam.y, button.w, button.h) then
        if mouse.click then
            button.c = button.click_c
            if button.on_click != nil then
                button.on_click()
            end
        else
            mouse.triggered = true
            button.c = button.hover_c -- hover color
        end
    else
        button.c = button.bg_c
    end
end