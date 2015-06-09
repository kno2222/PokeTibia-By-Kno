function onStepIn(cid, item,pos,fromPosition)
if isSummon(cid) then
return false
end
if item.actionid == 1820 then
if getPlayerLevel(cid) >= 200 then
doPlayerSendTextMessage(cid, 19, "[TPS 4] Bem Vindo!")
else
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, 19, "[TPS 4] Somente Level 200+ Pode Entrar!")
return true
end
end
end