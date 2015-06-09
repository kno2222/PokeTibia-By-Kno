function onStepIn(cid, item, position, fromPosition)
local from,to,players,limit = {x=851, y=896, z=7}, {x=857, y=902, z=7},{},1
for _, pid in ipairs(getPlayersOnline()) do
if  isPlayer(pid) == TRUE then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Arena] A Sala Esta Cheio!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end 
return true
end