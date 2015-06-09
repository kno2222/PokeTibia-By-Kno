function onStepIn(cid, item,pos,fromPosition,toPosition)
local temple = {x=955,y=956,z=7}
doTeleportThing(cid, temple)
setPlayerStorageValue(cid,130130,0)
return true
end 