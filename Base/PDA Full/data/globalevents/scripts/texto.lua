           local positions = {
  [1] = {{x = 1090, y = 1004, z = 7}},
  }

local pos = positions[1]
function onThink(cid, interval, lastExecution)
local num_de_pos = 1
for i = 1,num_de_pos do  
doSendAnimatedText(pos[i],"PVP",math.random(1,256))
end
return true
end