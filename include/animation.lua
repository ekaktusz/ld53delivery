
function animation_new(_frames, _dt)
    local animation = {
        frames = _frames,
        current_frame = 1,
        dt = _dt,
        timer = 0
    }
    return animation
end

local function animation_next_frame(animation)
    animation.current_frame += 1
    if animation.current_frame > #animation.frames then
        animation.current_frame = 1
    end
end

function animation_update(animation)
    animation.timer += 1
    if animation.timer > animation.dt then
        animation.timer = 0
        animation_next_frame(animation)
    end
end

function animation_draw(animation, x, y)
    log(animation.frames[animation.current_frame].y)
    --sspr(animation.frames[animation.current_frame].x, animation.frames[animation.current_frame].y, animation.w, animation.h, x, y)
    sspr(animation.frames[animation.current_frame].x,animation.frames[animation.current_frame].y,animation.frames[animation.current_frame].w,animation.frames[animation.current_frame].h,x,y)
end