           local positions = {
  [1] = {{x = 1096, y = 1009, z = 7}, -- venore red
  { x = 1020, y = 915, z = 7 }}, -- venore green
  }

local pos = positions[1]
function onThink(cid, interval, lastExecution)
local num_de_pos = 2
for i = 1,num_de_pos do  
doSendAnimatedText(pos[i],"Flex",math.random(1,256))
end
return true
end