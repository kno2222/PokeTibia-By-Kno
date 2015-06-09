local s = {
--[action id] = {pos de volta}
[33691] = {x=2686,y=1279,z=6}, -- Cinnabar
[33692] = {x=2748,y=607,z=7}, -- pewter
[33693] = {x=3158,y=604,z=7}, -- cerulean
[33694] = {x=3144,y=777,z=6}, -- saffron
[33695] = {x=3164,y=928,z=7}, -- vermillion
[33696] = {x=3160,y=1075,z=7}, -- fuchsia
[33697] = {x=2729,y=910,z=7}, -- viridian
[33698] = {x=1780,y=828,z=6}, -- celadon
[33699] = {x=3301,y=781,z=7}, -- Lavender
[33700] = {x=4432,y=2596,z=6}, -- Snow City
[33701] = {x=3549,y=1674,z=7}, -- Golden Arena
}

local b = {
--[action id] = {{pos para onde ir}, {pos de volta}},
[33702] = {{x=3985,y=2081,z=13}, {x=985,y=1083,z=13}}, -- Clan Psycraft
[33703] = {{x=3982,y=2081,z=13}, {x=982,y=1083,z=13}}, -- Clan Orebound
[33704] = {{x=3979,y=2081,z=13}, {x=979,y=1083,z=13}}, -- Clan Wingeon
[33705] = {{x=3976,y=2081,z=13}, {x=976,y=1083,z=13}}, -- Clan Naturia
[33706] = {{x=3973,y=2081,z=13}, {x=973,y=1083,z=13}}, -- Clan Seavel
[33707] = {{x=3970,y=2081,z=13}, {x=970,y=1083,z=13}}, -- Clan Gardestrike
[33708] = {{x=3967,y=2081,z=13}, {x=967,y=1083,z=13}}, -- Clan Malefic
[33709] = {{x=3964,y=2081,z=13}, {x=964,y=1083,z=13}}, -- Clan Raibolt
[33710] = {{x=3961,y=2081,z=13}, {x=961,y=1083,z=13}}, -- Clan Volcanic
}

function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
--
local posi = {x=1895, y=765, z=15} --posi�ao do Trade Center...
local pos = s[item.actionid]
local storage = 171877 
--
if b[item.actionid] then
   pos = b[item.actionid][2]
   posi = b[item.actionid][1] 
   storage = 171878
end
setPlayerStorageValue(cid, storage, "/"..pos.x..";"..pos.y..";"..pos.z.."/")
--
if #getCreatureSummons(cid) >= 1 then
   for i = 1, #getCreatureSummons(cid) do
       doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
   end
end 
doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)  
return true
end