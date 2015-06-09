function onStepIn(cid, item,pos,fromPosition)
if isSummon(cid) then
return false
end
if item.actionid == 5054 then
doPlayerSetVocation(cid,2)
doPlayerSendTextMessage(cid, 19, "[Houses] Voce Esta Na Area Segura (Nao Pode Ser Puxado Pelo Sistema de Change Map)!")
doPlayerSendTextMessage(cid, 19, "[Houses] Existem 30 Houses 10 [FREE] e 20 [VIP]!")
return true
end
end