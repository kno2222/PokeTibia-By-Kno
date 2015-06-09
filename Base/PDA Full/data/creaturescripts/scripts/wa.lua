function onThink(cid, interval)
local players = getPlayersOnline()
for i, cid in ipairs(players) do  
if getPlayerGroupId(cid) == 1 and getPlayerVocation(cid) == 1 then
if not getTilePzInfo(getPlayerPosition(cid)) then 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Team balance Cheking] Voce esta Sendo checado e Talves Pode Trocar de Time e Perder a Bandeira!")
setTeam(cid)
return TRUE
end
end
end
end