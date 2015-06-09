function onStepIn(cid, item, position, fromPosition)
if isSummon(cid) then
return false
end
local from,to,players,limit = {x=899, y=968, z=7}, {x=919, y=989, z=7},{},1
for _, pid in ipairs(getPlayersOnline()) do
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
end
if #players >= limit then
if #getCreatureSummons(cid) >= 1 then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Torneio] Somente 1 Sobrevivente Pode Chegar ate o Bau!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end 
return true
end