function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if getPlayerStorageValue(cid,17778) >= 1 then
setGlobalStorageValue(17778,0) 
setPlayerStorageValue(cid,17778,0)
 doRemoveCondition(cid,CONDITION_HASTE)
 doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
doBroadcastMessage("O Jogador "..getCreatureName(cid).. " do time Azul entrou na base e perdeu a bandeira!",22)
end
if getPlayerStorageValue(cid,17779) >= 1 then
setPlayerStorageValue(cid,17779,0)  
setGlobalStorageValue(17779,0) 
 doRemoveCondition(cid,CONDITION_HASTE)
 doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
doBroadcastMessage("O Jogador "..getCreatureName(cid).. " do time Vermelho entrou na base e perdeu a bandeira!",22)
end
end