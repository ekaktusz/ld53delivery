--wavy text
function wavy_text(text,f,color1,color2)
    local y
    local c
    local x = 128/2 - (#text*4)/2 
    for c=1,#text do
        y = sin((x+f)/100) * 3
        color(color1 or 5)
        print(sub(text,c,c),x,(64-4)+y)
        y = sin((x+10+f)/100) * 3
        color(color2 or 7)
        print(sub(text,c,c),x,(64-4)+y)
        x = x+4
    end
end

function clear_table(t)
	for k in pairs (t) do
		t [k] = nil
	end
end

function obprint(str,x,y,c,co,scale)
	_str_to_sprite_sheet(str)
	
	local w = #str*4
	local h = 5
	palt(0,true)
	
	pal(7,co)
	
	
	for xx=-2,1,2 do
		for yy=-2,1,2 do
			sspr(0,0,w,h,x+xx,y+yy,w*scale,h*scale)
		end
	end
	
	pal(7,c)
	sspr(0,0,w,h,x,y,w*scale,h*scale)
	pal()
	
	_restore_sprites_from_usermem()
end

function _str_to_sprite_sheet(str)
	_copy_sprites_to_usermem()
	_black_out_sprite_row()
	set_sprite_target()
	print(str,0,0,7)
	set_screen_target()
end

function set_sprite_target()
	poke(0x5f55,0x00)
end

function set_screen_target()
	poke(0x5f55,0x60)
end

function _copy_sprites_to_usermem()
	memcpy(0x4300,0x0,0x0200)
end

function _black_out_sprite_row()
	memset(0x0,0,0x0200)
end

function _restore_sprites_from_usermem()
	memcpy(0x0,0x4300,0x0200)
end
