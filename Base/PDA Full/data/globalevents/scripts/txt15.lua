           local positions = {
  [1] = {{x = 1100, y = 1004, z = 7}}, -- venore red
  }

local pos = positions[1]
function onThink(cid, interval, lastExecution)
local num_de_pos = 1
for i = 1,num_de_pos do  
doSendAnimatedText(pos[i],"Torneio",math.random(1,256))
end
return true
end