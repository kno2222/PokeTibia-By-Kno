function onTimer()

if #getPlayersInArea(torneio.area) > 1 then
doBroadcastMessage("[Torneio] O torneio desta vez não teve vencedor, tentar na próxima vez!") return true end

for _, pid in ipairs(getPlayersInArea(torneio.waitArea)) do
doTeleportThing(pid, torneio.tournamentFight)
 
doPlayerSendTextMessage(pid, 21, "[Torneio] O torneio começou, e que vença o melhor ! HEHEHEHE.")
end
return true
end