function onUse(cid, item)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, 19, "[Depot] Guarde Seu Pokemon na Ball Para Abrir o Depot!")
doPlayerSendTextMessage(cid, 19, "[Balls-Bloqueados] Para Desbloquear as Balls, da Use Nelas!")
return true
end
end