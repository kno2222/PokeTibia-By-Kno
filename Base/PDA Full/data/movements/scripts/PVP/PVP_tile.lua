function onStepIn(cid, item, position, fromPosition)       --alterado v2.7 reformulado e melhorado ^^

if isSummon(cid) or ehMonstro(cid) then return false end     --alterado v2.8

local posis = { --{{pos}, storage, cor da roupa},
[25695] = {{x = 847, y = 935, z = 7}, 6598754, 107},
[25696] = {{x = 920, y = 940, z = 7}, 6598755, 113}, 
[25697] = {{x = 1895, y = 765, z = 15}},
[25698] = {{x = 1895, y = 765, z = 15}},
[33799] = {{x = 1793, y = 830, z = 6}},
}
local action = posis[item.actionid]
local out = getPlayerSex(cid) == 0 and 511 or 510

if #getCreatureSummons(cid) >= 1 then
   doPlayerSendCancel(cid, "Nao Pode Entrar com Pokemon Fora da Ball.")
   doTeleportThing(cid, fromPosition, false)  
   return true
end                                                                          --alterado v2.9
if getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 5700) >= 1 or getPlayerStorageValue(cid, 17000) >= 1 then
   doPlayerSendCancel(cid, "You can't do that while ride/fly/or in a bike.")
   doTeleportThing(cid, fromPosition, false)  
   return true
end
if getPlayerStorageValue(cid, 52480) >= 1 then
   doPlayerSendCancel(cid, "You are already dueling!")
   doTeleportThing(cid, fromPosition, false)  
   return true
end

if posis[item.actionid] then
   if isInArray({25696, 25695}, item.actionid) then
      setPlayerStorageValue(cid, action[2], 1)
      doSetCreatureOutfit(cid, {lookType = out, lookBody = action[3], lookHead = action[3], lookLegs = action[3], lookFeet = action[3]}, -1)
   else
      setPlayerStorageValue(cid, 6598754, -1) 
      setPlayerStorageValue(cid, 6598755, -1)
      doRemoveCondition(cid, CONDITION_OUTFIT) 
   end
   doTeleportThing(cid, getClosestFreeTile(cid, action[1]), false)  
elseif item.actionid == 24158 then
   if getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
      doPlayerSendCancel(cid, "You can't do that while is in battle!")
      doTeleportThing(cid, fromPosition, false)
   end
end
   
return true
end