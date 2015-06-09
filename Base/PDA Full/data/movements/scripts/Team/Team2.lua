function onStepIn(cid, item, position, fromPosition)
if isSummon(cid) then
return false
end
local from,to,players,limit = {x=839, y=933, z=7}, {x=927, y=957, z=7},{},5
for _, pid in ipairs(getPlayersOnline()) do
if getPlayerStorageValue(pid,6598755) == 1 and getPlayerGroupId(pid) <= 1 then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
end
if #players >= limit then
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, 19, "[TWP] Guarde o Pokemon Para Usar o TP !")
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Team vs Team] o Time Azul Esta Cheio!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
else
doCreatureExecuteTalkAction(cid, "!on")
return true
end 
return true
end
end