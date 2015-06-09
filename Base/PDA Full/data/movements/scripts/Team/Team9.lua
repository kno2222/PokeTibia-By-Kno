function onStepIn(cid, item, position, fromPosition)
local from,to,players,limit = {x=862, y=1014, z=7}, {x=987, y=1029, z=7},{},25
for _, pid in ipairs(getPlayersOnline()) do
if getPlayerStorageValue(pid,12000) == 1 and getPlayerGroupId(pid) <= 1 then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, true)
doCreatureExecuteTalkAction(cid, "!on2")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[TWP] Time [Vermelho] Esta Cheio!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end 
return true
end