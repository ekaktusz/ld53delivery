function bar_new(_x, _y, _w, _h, _c1, _c2)
    bar = {
        x=_x,
        y=_y,
        w=_w,
        h=_h,
        prog = 0.5,
        c1=_c1 or 3,
        c2=_c2 or 4
    }
    return bar
end

function bar_draw(bar)
    rectfill(bar.x+cam.x, bar.y+cam.y, bar.x+bar.w+cam.x, bar.y+bar.h+cam.y, bar.c1)
    rectfill(bar.x+1+cam.x, bar.y+1+cam.y, bar.x+bar.w+cam.x-1, bar.y+bar.h+cam.y-1, 0)
    if bar.prog >= 0.01 then
        rectfill(bar.x+1+cam.x, bar.y+1+cam.y, mid(bar.x+1+cam.x, bar.x+flr(bar.w*bar.prog)+cam.x-1, bar.x+bar.w+cam.x-1), bar.y+bar.h+cam.y-1, bar.c2)
    end
end

function bar_update(bar, progress)
    bar.prog = progress
end