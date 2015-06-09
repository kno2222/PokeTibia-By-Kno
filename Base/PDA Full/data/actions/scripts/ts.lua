local config ={
fromPosition = {x=862, y=1014, z=7},
toPosition = {x=987, y=1029, z=7},
}

local Red = {x= 913, y= 999 ,z= 7} ----- Posiçoes das Bases dos Times
local Blue = {x= 922, y= 999, z= 7}

function onUse(cid, item, frompos, item2, topos)
if item.actionid == 1125 then
doTeleportThing(cid,Red)
for x = config.fromPosition.x, config.toPosition.x do
for y = config.fromPosition.y, config.toPosition.y do
for z = config.fromPosition.z, config.toPosition.z do
areapos = {x = x, y = y, z = z, stackpos = 253}
getMonsters = getThingfromPos(areapos)
if isMonster(getMonsters.uid) then
doRemoveCreature(getMonsters.uid)
end
end
end
end
end

if item.actionid == 1126 then
doTeleportThing(cid,Blue)
for x = config.fromPosition.x, config.toPosition.x do
for y = config.fromPosition.y, config.toPosition.y do
for z = config.fromPosition.z, config.toPosition.z do
areapos = {x = x, y = y, z = z, stackpos = 253}
getMonsters = getThingfromPos(areapos)
if isMonster(getMonsters.uid) then
doRemoveCreature(getMonsters.uid)
end
end
end
end
end
end