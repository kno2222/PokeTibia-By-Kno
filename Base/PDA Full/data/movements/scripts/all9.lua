function onStepIn(cid, item,pos,fromPosition)
if isSummon(cid) then
return false
end
if item.actionid == 1819 then
if getPlayerLevel(cid) >= 150 then
doPlayerSendTextMessage(cid, 19, "[TPS 3] Bem Vindo!")
else
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, 19, "[TPS 3] Somente Level 150+ Pode Entrar!")
return true
end
end
end