           local positions = {
  [1] = {{x = 1102, y = 1004, z = 7}, 
  { x = 1009, y = 1116, z = 7 }},
  -- venore red -- venore green
  }

local pos = positions[1]
function onThink(cid, interval, lastExecution)
local num_de_pos = 2
for i = 1,num_de_pos do  
doSendAnimatedText(pos[i],"TPS",math.random(1,256))
end
return true
end