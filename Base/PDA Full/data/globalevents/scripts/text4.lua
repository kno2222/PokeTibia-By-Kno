           local positions = {
  [1] = {{x = 1005, y = 1113, z = 7}, 
  { x = 1005, y = 1121, z = 7 },
  { x = 1014, y = 1121, z = 7 }},-- venore red
  }

local pos = positions[1]
function onThink(cid, interval, lastExecution)
local num_de_pos = 3
for i = 1,num_de_pos do  
doSendAnimatedText(pos[i],"VOLTA",math.random(1,256))
end
return true
end