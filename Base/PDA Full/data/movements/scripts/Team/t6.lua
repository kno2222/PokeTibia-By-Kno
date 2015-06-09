local time = 30 
local Base1 = {x= 857, y= 942, z= 7}
local Base2 = {x= 910, y= 947 ,z= 7}    ----ctf



local fightcondition = createConditionObject(CONDITION_INFIGHT)
setConditionParam(fightcondition, CONDITION_PARAM_TICKS, time * 1000)

function onStepIn(cid, item, position, fromPosition)
if isSummon(cid) then
return false
end

if item.actionid == 1011 then
doAddCondition(cid, fightcondition)
doTeleportThing(cid, Base1)
doPlayerSendTextMessage(cid, 19, "[PVP-TEAM] Voce Ganhou Battle de 30 Segundos!")
end

if item.actionid == 1012 then
doAddCondition(cid, fightcondition)
doTeleportThing(cid, Base2)
doPlayerSendTextMessage(cid, 19, "[PVP-TEAM] Voce Ganhou Battle de 30 Segundos!")
return true
end
end