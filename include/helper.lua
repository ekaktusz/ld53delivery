function get_center(x, y, w, h)
    return {x=x+(x+w)/2, y=y+(y+h)/2}
end

function get_distance(x1,y1,x2,y2)
    local a = abs(x1 - x2)
    local b = abs(y1 - y2)
    return sqrt(a*a+b*b)
end