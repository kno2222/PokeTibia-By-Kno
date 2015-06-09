function onUse(cid, item)

if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "[Corrida] Nao Pode Usar o Bau com Pokemon Fora Da Ball!.")
else
if getPlayerGroupId(cid) > 4 then
OpenWallBattle()
doBroadcastMessage("[Corrida] O Admin ["..getCreatureName(cid).. "] Deu  a Partida na Corrida",22)
else
doPlayerSendTextMessage(cid, 20 ,"[Corrida] Somente Admin Pode Puxar a Alavanca!")    
return true
end
end
end