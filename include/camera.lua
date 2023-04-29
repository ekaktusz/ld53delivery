local cam = {}

function camera_set_position(x,y)
    cam_x = mid(0,x,cam.max_x or 896)
    cam_y = mid(0,y,cam.max_x or 128)
    camera(cam_x, cam_y)
end

function camera_set_limits(x, y)
    cam.max_x = x
    cam.max_y = y
end