cam = {
    x = 0,
    y = 0
}

function camera_set_position(x,y)
    cam.x = mid(0,x,cam.max_x or 320)
    cam.y = mid(0,y,cam.max_x or 32*4)
    camera(cam.x, cam.y)
end

function camera_set_limits(x, y)
    cam.max_x = x
    cam.max_y = y
end

function camera_to_world(_x, _y)
    return {x=x+cam.x, y=y+cam.y} 
end

function camera_to_cam(_x, _y)
    return {x=_x-cam.x, y=_y-cam.y} 
end