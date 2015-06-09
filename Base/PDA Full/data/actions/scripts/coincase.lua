local coins = 23254

function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, coins) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cassino Coins] Voce Tem ["..(getPlayerStorageValue(cid,23254) + 1).."] Win Cassino Coins.")
return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cassino Coins] Para Comprar Cassino Coins Somente No Teleporte [PVP].")
return true
end