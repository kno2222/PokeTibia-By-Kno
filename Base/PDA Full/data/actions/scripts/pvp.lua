function onUse(cid, item)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "[Evento-PVP] Nao Pode Usar o Bau com Pokemon Fora Da Ball!.")
else
if #getPlayersInArea(torneioo.area) > 1 then
doPlayerSendTextMessage(cid, 20 ,"[Evento-PVP] Somente o Ultimo Sobrevivente Poderar Usar o Bau!") 
return true
end
doTeleportThing(cid, torneioo.playerTemple)
doPlayerAddItem(cid,12618,10)
doPlayerAddItem(cid,2160,10)
doPlayerSendTextMessage(cid, 19, "[Evento-PVP] Jovem Treinador Parabéns, você ganhou o Evento [PVP] e Ganhou [10] Boost Stone + ["..getItemNameById(torneio.awardTournament).."] .")
doBroadcastMessage("[Evento-PVP] O jogador ["..getCreatureName(cid).. "] Ganhou no Evento [PVP] e Ganhou [10] Boost Stone + [10] TD!",22)   
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
return true
end
end