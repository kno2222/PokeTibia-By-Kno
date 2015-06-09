function onStepIn(cid, item,pos,fromPosition,toPosition)
local temple = {x=955,y=956,z=7}
if isSummon(cid) then
return false
end
if item.actionid == 1255 then   
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, 19, "[Pokemon] Guarde Seu Pokemon na Ball Para Entrar no Teleport!")
doTeleportThing(cid, fromPosition, false)
else
doTeleportThing(cid,temple)
      setPlayerStorageValue(cid, 6598754, -1) 
      setPlayerStorageValue(cid, 6598755, -1)
      doRemoveCondition(cid, CONDITION_OUTFIT) 
return true
end
end
end