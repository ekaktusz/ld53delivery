player_parts = {}

function get_rand_f(min,max)
    return min + rnd(max - min)
end

function addpart(x,y,dx,dy,g,maxage,col,old_col,_parts)
    local p={}
    p.x=x 
    p.y=y 
    p.mage=maxage
    p.age=0
    p.col=col
    p.oldcol=oldcol 
    p.dx=dx
    p.dy=dy
    p.g=g
    add(_parts,p)
end

function spawn_trail(x,y,sx,sy,col,oldcol,intensity,_parts,min_age,max_age)
    local _max_age = max_age or 10
    local _min_age = min_age or 5

    for i=1,intensity,1 do
        local ang = rnd()
        local ox = sin(ang)*sx
        local oy = cos(ang)*sy
        
        addpart(x+ox,y+oy,0,0,0,get_rand_f(_min_age,_max_age),col,oldcol,_parts)
    end
end

function draw_parts(_parts)
    for p in all(_parts) do
        pset(p.x,p.y,p.col)
    end
end

function update_parts(_parts)
    for p in all(_parts) do
        p.dy += p.g
        p.y += p.dy
        p.x += p.dx
        p.age += 1
        if p.age > p.mage then
            del(_parts,p)
        elseif p.age/p.mage > 0.5 then
            p.col = 3 --lol
        end
    end
end