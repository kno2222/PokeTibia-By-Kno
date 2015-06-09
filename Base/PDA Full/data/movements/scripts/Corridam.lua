function onStepIn(cid, item,pos,fromPosition,toPosition)
local temple = {x=955,y=956,z=7}

if isSummon(cid) then
return false
end

if isPlayer(cid) then
doTeleportThing(cid, temple)
doChangeSpeed(cid, -1000)
resetBattle()
doPlayerAddItem(cid,12618,5)
doPlayerAddItem(cid,6569,5)
setPlayerStorageValue(cid,130130,0) 
doPlayerSendTextMessage(cid, 19, "[Evento-Corrida] Voce Venceu a Corrida e Ganhou [5] Boost Stone + [5] Rare Candy!")
doBroadcastMessage("[Evento-Corrida] O jogador ["..getCreatureName(cid).. "] Ganhou no Evento de (Corrida de Pokemon) e Recebeu [5] Boost Stone + [5] Rare Candy!",22)
return true
end
end