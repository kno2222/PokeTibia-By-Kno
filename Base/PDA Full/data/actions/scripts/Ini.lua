function onUse(cid, item, frompos, item2, topos)
queststatus= getPlayerStorageValue(cid,12364)
if queststatus == -1 then
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid,12364,1)
doPlayerAddItem(cid,1990,1)
doPlayerAddItem(cid,2394,100)
doPlayerAddItem(cid,12348,10)
doPlayerAddItem(cid,12344,5)
doPlayerAddItem(cid,12349,10)

doPlayerAddItem(cid,8301,1)
doPlayerAddItem(cid,8302,1)
doPlayerAddItem(cid,8303,1)
doPlayerAddItem(cid,8298,1)
doPlayerAddItem(cid,8299,1)
doPlayerSendTextMessage(cid, 19, "[KIT INICIAL] Voce Ganhou o Kit Inicial!")
else
doPlayerSendTextMessage(cid, 19, "[KIT INICIAL] Voce ja Abriu o Presente!")
doRemoveItem(item.uid, 1)
return true
end
end