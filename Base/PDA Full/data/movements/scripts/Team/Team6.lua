function onStepIn(cid, item, position, fromPosition)
local from,to,players,limit = {x=1051, y=881, z=6}, {x=1134, y=904, z=6},{},50
for _, pid in ipairs(getPlayersOnline()) do
if getPlayerStorageValue(pid,12000) == 2 and getPlayerGroupId(pid) <= 1 then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, true)
doCreatureExecuteTalkAction(cid, "!on")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[TWP] Time [Azul] Esta Cheio!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end 
return true
end