function onStepIn(cid, item,pos,fromPosition,toPosition)
local temple = {x=942,y=955,z=7}
if isSummon(cid) then
return false
end
if #getCreatureSummons(cid) >= 1 then
   doPlayerSendCancel(cid, "[Torneio] Nao Pode Entrar com Pokemon Fora da Ball.")
   doTeleportThing(cid, fromPosition, false)
   else
    doTeleportThing(cid, temple)
   setPlayerStorageValue(cid,130130,1)   
   return true
end
end