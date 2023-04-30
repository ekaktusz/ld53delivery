function button_new(_x,_y,_w,_h,_text)
    local button = {
        x=_x,
        y=_y,
        w=_w,
        h=_h,
        text=_text,
        on_click = nil,
        click_c = 3,
        c = 0
    }
    return button
end

function button_draw(button)
    rectfill(button.x+cam.x, button.y+cam.y, button.x+cam.x+button.w, button.y+cam.y+button.h, 7)
    rectfill(button.x+cam.x+1, button.y+cam.y+1, button.x+cam.x+button.w-1, button.y+cam.y+button.h-1, button.c)
    print("buy",button.x+cam.x+2, button.y+cam.y+2,7)
end

function button_update(button)
    if mouse_in_area(button.x+cam.x, button.y+cam.y, button.w, button.h) and mouse.click then
        button.c = button.click_c
        if button.on_click != nil then
            button.on_click()
        end
    else
        button.c = 0
    end
end