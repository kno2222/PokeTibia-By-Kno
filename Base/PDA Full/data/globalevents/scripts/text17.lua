           local positions = {
  [1] = {{x = 1103, y = 1011, z = 7}}, -- venore red
  }

local pos = positions[1]
function onThink(cid, interval, lastExecution)
local num_de_pos = 1
for i = 1,num_de_pos do  
doSendAnimatedText(pos[i],"CASSINO",math.random(1,256))  
end
return true
end