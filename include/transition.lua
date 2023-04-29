tran_duration = 2.5

function close_transition(t)
    if (t > tran_duration) then t=tran_duration end
    draw_transition(t)
end

function open_transition(t)
    t = tran_duration-t
    if (t < 0) then return end
    draw_transition(t)
end

function draw_transition(t)
 --cls()

 --this crazy bit loops through
 --limited background colors,
 --and changes it when the
 --screen is covered with white
 -- local c = 12 + ((t-2.55)/4)%4
 -- rectfill(0,0,128,128,c)

 for i=0,8 do -- column loop
  for j=0,8 do -- row loop
    --x positions are snapped
    --to 16px columns
    local x = i*16

    --this number sweeps back
    --and forth from -1 to 1
    local osc1 = sin(t+i*0.1)

    --this number also sweeps
    --back and forth, but at
    --a different rate
    local osc2 = sin(t/4+j*0.03)

    --y positions are influenced
    --by one of the sweepy
    --numbers
    local y = j*16 + osc1*10

    --the circles' radii are
    --influenced by the other
    --sweepy number
   circfill(x, y, osc2*17, 7)
  end
 end

 color(1)
 print(t)
 color(7)
end