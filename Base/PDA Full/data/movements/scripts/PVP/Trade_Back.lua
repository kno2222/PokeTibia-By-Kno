local tileClans = {33702, 33703, 33704, 33705, 33706, 33707, 33708, 33709, 33710}
               --   psy    ore    win    nat    sea   gard   male    rai   volc
function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
--
local storage = 171877
if isInArray(tileClans, item.actionid) then
   storage = 171878
end
--
local b = string.explode(getPlayerStorageValue(cid, storage), "/")
local t = string.explode(b[1], ";")   --alterado v2.8
--
if #getCreatureSummons(cid) >= 1 then
   for i = 1, #getCreatureSummons(cid) do
       doTeleportThing(getCreatureSummons(cid)[i], {x=tonumber(t[1]) - 1, y=tonumber(t[2]), z=tonumber(t[3])}, false)
   end
end 
doTeleportThing(cid, {x=tonumber(t[1]), y=tonumber(t[2]), z=tonumber(t[3])}, false)
setPlayerStorageValue(cid, storage, -1)
return true
end