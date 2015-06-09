local Base1 = {x= 847, y= 935, z= 7}
local Base2 = {x= 920, y= 940 ,z= 7}    ----ctf


function onStepIn(cid, item, position, fromPosition)
if item.actionid == 1021 then
if (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, 19, "[PVP-TEAM] Desculpe, Voce Esta Com Battle e Nao Pode Entrar no Templo!")
else
doTeleportThing(cid, Base1)
end
end

if item.actionid == 1022 then
if (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, 19, "[PVP-TEAM] Desculpe, Voce Esta Com Battle e Nao Pode Entrar no Templo!")
else
doTeleportThing(cid, Base2)
return true
end
end
end