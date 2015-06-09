function onStepIn(cid, item,pos,fromPosition)
if isSummon(cid) then
return false
end
if item.actionid == 8866 then
if getPlayerStorageValue(cid,19999) >= 50 then
doPlayerSendTextMessage(cid, 19, "[Quest 50 Win Score] Parabens!")
else
doPlayerSendTextMessage(cid, 19, "[Quest 50 Win Score] Voce Nao Tem 50 Wins Score")
doTeleportThing(cid, fromPosition, false)
end
end

if item.actionid == 8853 then
if getPlayerStorageValue(cid,23254) >= 500 then
doPlayerSendTextMessage(cid, 19, "[Change Coins] Seja Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "[Change Coins] Voce Nao Tem 500 Cassino Coins Wins Score")
doTeleportThing(cid, fromPosition, false)
end
end

if item.actionid == 8867 then
if getPlayerStorageValue(cid,19998) >= 30 then
doPlayerSendTextMessage(cid, 19, "[Quest 30 Lose Score] Parabens!")
else
doPlayerSendTextMessage(cid, 19, "[Quest 30 Lose Score] Voce Nao Tem 30 Loses Score")
doTeleportThing(cid, fromPosition, false)
return TRUE
end
end
end