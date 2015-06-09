function onStepIn(cid, item, position, fromPosition)
if #getCreatureSummons(cid) >= 1 then
doTeleportThing(getCreatureSummons(cid)[1], getThingPos(cid))
doSendMagicEffect(getThingPos(cid), 21)
return true
end
end