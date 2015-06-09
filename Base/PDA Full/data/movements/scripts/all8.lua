function onStepIn(cid, item,pos,fromPosition)
if isSummon(cid) then
return false
end
if item.actionid == 1818 then
if getPlayerLevel(cid) >= 100 then
doPlayerSendTextMessage(cid, 19, "[TPS 2] Bem Vindo!")
else
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, 19, "[TPS 2] Somente Level 100+ Pode Entrar!")
return true
end
end
end