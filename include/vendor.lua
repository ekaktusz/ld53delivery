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