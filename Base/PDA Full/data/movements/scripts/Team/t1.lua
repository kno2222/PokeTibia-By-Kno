function onStepIn(cid, item, position, fromPosition)
local from,to,players,limit = {x=1015, y=953, z=7}, {x=1037, y=1036, z=7},{},5
for _, pid in ipairs(getPlayersOnline()) do
if getPlayerStorageValue(pid,12000) == 1 and getPlayerGroupId(pid) <= 1 then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Team vs Team] o Time Azul Esta Cheio!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end 
return true
end