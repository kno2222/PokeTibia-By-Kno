function onThink(cid,interval, lastExecution) 
local players = getPlayersOnline()
for i, cid in ipairs(players) do  
if getPlayerStorageValue(cid,12000) == 1 and getPlayerGroupId(cid) <= 1 and not getTilePzInfo(getPlayerPosition(cid)) then
setTeam(cid)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Team balance Cheking] Voce esta Sendo checado e Talves Pode Trocar de Time e Perder a Bandeira [Automaticamente]!")
elseif getPlayerStorageValue(cid,12000) == 2 and  getPlayerGroupId(cid) <= 1 and not getTilePzInfo(getPlayerPosition(cid)) then
setTeam(cid)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Team balance Cheking] Voce esta Sendo checado e Talves Pode Trocar de Time e Perder a Bandeira [Automaticamente]!")
return TRUE
end
end
end