info = {
[0] = {x=1008,y= 930,z=7},--[0] = {x=1008,y= 930,z=7},  ---CTF   
[2] = {x=1023,y= 930,z=7},   ----CTF
[1] = {x=1038,y= 930,z=7},   ----TDM
[3] = {x=1053,y= 930,z=7},    ---- TDM
[4] = {x=1008,y= 915,z=7}    ---- TDM
}

storage = {60002,61002}



function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
if #getCreatureSummons(cid) >= 1 then
doTeleportThing(getCreatureSummons(cid)[1], info[getGlobalStorageValue(storage[1])], false)
doTeleportThing(cid, info[getGlobalStorageValue(storage[1])], false) 
else
doTeleportThing(cid, info[getGlobalStorageValue(storage[1])], false) 
end
return true
end