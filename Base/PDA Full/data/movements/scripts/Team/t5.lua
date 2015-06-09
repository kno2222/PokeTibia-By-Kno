 info = {
[0] = {x=1008,y= 930,z=7},  ---CTF   
[2] = {x=1023,y= 930,z=7},   ----CTF
[1] = {x=1038,y= 930,z=7},   ----TDM
[3] = {x=1053,y= 930,z=7}    ---- TDM
}

storage = {60002,61002}

function onStepIn(cid, item, pos,fromPosition)
if item.actionid == 5050 then
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, 19, "[TWP] Guarde o Pokemon Para Usar o TP !")
doTeleportThing(cid, fromPosition, false)
else
setPlayerStorageValue(cid, 12000 , 0)
doRemoveCondition(cid, CONDITION_OUTFIT)
doTeleportThing(cid, info[getGlobalStorageValue(storage[1])], false)
return true
end
end
end  