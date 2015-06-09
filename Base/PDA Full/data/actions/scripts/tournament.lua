function onUse(cid, item)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "[Torneio] Nao Pode Usar o Bau com Pokemon Fora Da Ball!.")
else
if #getPlayersInArea(torneio.area) > 1 then

doPlayerSendTextMessage(cid, 20 ,"Somente o Ultimo Sobrevivente poderar Usar essa Alavanca") return true end
doTeleportThing(cid, torneio.playerTemple)
doPlayerAddItem(cid,12618,10)
doPlayerSendTextMessage(cid, 21, "[Torneio] Jovem Treinador Parabéns, você ganhou o torneio e ganhou [10] Boost Stone + ["..getItemNameById(torneio.awardTournament).."] .")
 --setPlayerStorageValue(cid,130131,1) 
 doPlayerAddSkill(cid, 5, 1)
 setPlayerStorageValue(cid,130131,getPlayerStorageValue(cid,130131)+1)
 doPlayerSendTextMessage(cid,MESSAGE_EVENT_ORANGE,"[Torneio-Score] Voce Agora Tem ["..(getPlayerStorageValue(cid,130131) + 1).."] Torneio SCORES.") 
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
return true
end
end