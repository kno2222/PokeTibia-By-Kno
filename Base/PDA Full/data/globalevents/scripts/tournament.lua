function onTimer()

if #getPlayersInArea(torneio.area) > 1 then
doBroadcastMessage("[Torneio] O torneio desta vez n�o teve vencedor, tentar na pr�xima vez!") return true end

for _, pid in ipairs(getPlayersInArea(torneio.waitArea)) do
doTeleportThing(pid, torneio.tournamentFight)
 
doPlayerSendTextMessage(pid, 21, "[Torneio] O torneio come�ou, e que ven�a o melhor ! HEHEHEHE.")
end
return true
end