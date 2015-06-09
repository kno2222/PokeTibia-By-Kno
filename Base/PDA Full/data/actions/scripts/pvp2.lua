function onUse(cid, item)
local temple = {x=981,y=903,z=7}
local from,to,players,limit = {x=969, y=877, z=7}, {x=979, y=888, z=7},{}



for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) and isInRange(getCreaturePosition(pid), from, to) then
if getPlayerGroupId(cid) > 4 then
doTeleportThing(cid, temple)
doTeleportThing(pid, temple)
doBroadcastMessage("[Evento-PVP] O Admin ["..getCreatureName(cid).. "] Deu a Partida no Evento (PVP)!",22)
else
doPlayerSendTextMessage(cid, 19 ,"[Evento-PVP] Somente o Admin Pode Puxar a Alavanca!") 
return true
end
end
end
end