function onStepIn(cid, item,pos,fromPosition,toPosition)
if isSummon(cid) then
return false
end
if isPlayer(cid) then
doChangeSpeed(cid, 1000)
setPlayerStorageValue(cid,130130,1) 
doPlayerSendTextMessage(cid, 19, "[Evento-Corrida] Para Correr Com o Pokemon Tera que dar Follow em Seu Pokemon (Seguir)!")

return true 
end
end