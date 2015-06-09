local fishing = {
["Magikarp"] = {skill = 0, level = -2},
["Feebas"] = {skill = 15, level = 15},
["Poliwag"] = {skill = 17, level = 20},
["Azurill"] = {skill = 18, level = 23},
["Horsea"] = {skill = 19, level = 25},
["Goldeen"] = {skill = 19, level = 25},
["Remoraid"] = {skill = 19, level = 27},
["Krabby"] = {skill = 19, level = 28},
["Chinchou"] = {skill = 19, level = 30},
["Mantyke"] = {skill = 20, level = 35},
["Tentacool"] = {skill = 20, level = 35},
["Marill"] = {skill = 20, level = 35},
["Qwilfish"] = {skill = 20, level = 40},
["Poliwhirl"] = {skill = 20, level = 40},
["Seaking"] = {skill = 20, level = 40},
["Mudkip"] = {skill = 20, level = 45},
["Spheal"] = {skill = 21, level = 50},
["Kingler"] = {skill = 21, level = 50},
["Seadra"] = {skill = 21, level = 55},
["Wailmer"] = {skill = 21, level = 60},
["Corsola"] = {skill = 22, level = 55},
["Octillery"] = {skill = 22, level = 60},
["Marshtomp"] = {skill = 22, level = 70},
["Lanturn"] = {skill = 22, level = 75},
["Sealeo"] = {skill = 23, level = 70},
["Crawdaunt"] = {skill = 23, level = 70},
["Azumarill"] = {skill = 23, level = 70},
["Mantine"] = {skill = 23, level = 75},
["Politoed"] = {skill = 23, level = 80},
["Poliwrath"] = {skill = 23, level = 80},
["Vaporeon"] = {skill = 23, level = 80},
["Kingdra"] = {skill = 24, level = 85},
["Dratini"] = {skill = 24, level = 90},
["Gyarados"] = {skill = 25, level = 95},
["Milotic"] = {skill = 25, level = 95},
["Wailord"] = {skill = 25, level = 95},
["Swampert"] = {skill = 25, level = 95},
["Walrein"] = {skill = 25, level = 95},
["Tentacruel"] = {skill = 25, level = 95},
}

local storage = 15496
local bonus = 40
local limite = 80

local function doFish(cid, pos, ppos, chance, interval, number)
        if not isCreature(cid) then return false end

        if getThingPos(cid).x ~= ppos.x or getThingPos(cid).y ~= ppos.y then
        return false end

        if getPlayerStorageValue(cid, storage) ~= number then return false end

        doSendMagicEffect(pos, CONST_ME_LOSEENERGY)

local peixe = 0
local playerpos = getClosestFreeTile(cid, getThingPos(cid))
local fishes = {}
local randomfish = ""

                                                                  --alterado!!
 if getPlayerSkillLevel(cid, 6) < limite then
 doPlayerAddSkillTry(cid, 6, 100)--- 100
 end

for a, b in pairs (fishing) do
 if getPlayerSkillLevel(cid, 6) >= b.skill then
  table.insert(fishes, a)
 end
end

 if math.random(1, 100) <= chance then
  if getPlayerSkillLevel(cid, 6) < limite then
  doPlayerAddSkillTry(cid, 6, bonus)
  end
  randomfish = fishes[math.random(#fishes)]
     peixe = doSummonCreature(randomfish, playerpos)
  if not isCreature(peixe) then
   addEvent(doFish, interval, cid, pos, ppos, chance, interval, number)
  return true
  end
  if #getCreatureSummons(cid) >= 1 then
          doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
   doChallengeCreature(getCreatureSummons(cid)[1], peixe)
         else
   doSendMagicEffect(getThingPos(cid), 173)
   doChallengeCreature(cid, peixe)
         end
  doCreatureSetNoMove(cid, false)
  doRemoveCondition(cid, CONDITION_OUTFIT)
 return true
 end
addEvent(doFish, interval, cid, pos, ppos, chance, interval, number)
doCreatureSetNoMove(cid, true)
return true
end

local waters = {4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}

function onUse(cid, item, fromPos, itemEx, toPos)

if getPlayerGroupId(cid) == 11 then
return true
end

local checkPos = toPos
checkPos.stackpos = 0

if getTileThingByPos(checkPos).itemid <= 0 then
doPlayerSendCancel(cid, '!')
return true
end

if not isInArray(waters, getTileInfo(toPos).itemid) then
return true
end

if (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) and not canFishWhileSurfingOrFlying then
doPlayerSendCancel(cid, "You can't fish while surfing/flying.")
return true
end

if isInArray(waters, getTileInfo(getThingPos(cid)).itemid) then
doPlayerSendCancel(cid, "You can\'t fish while surfing neither flying above water.")
return true
end

if getTileInfo(getThingPos(getCreatureSummons(cid)[1] or cid)).protection then
 doPlayerSendCancel(cid, "You can't fish pokémons if you or your pokémon is in protection zone.")
return true
end


 
if not tonumber(getPlayerStorageValue(cid, storage)) then
 local test = io.open("data/sendtobrun123.txt", "a+")
 local read = ""
 if test then
  read = test:read("*all")
  test:close()
 end
 read = read.."\n[fishing.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, storage)..""
 local reopen = io.open("data/sendtobrun123.txt", "w")
 reopen:write(read)
 reopen:close()
 setPlayerStorageValue(cid, storage, 1)
end

setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
 if getPlayerStorageValue(cid, storage) >= 800 then
  setPlayerStorageValue(cid, storage, 1)
 end

local delay = 1500 - getPlayerSkillLevel(cid, 6) * 50
local chance = 7 + getPlayerSkillLevel(cid, 6) / 6.5
outfit = getCreatureOutfit(cid)
if getPlayerSex(cid) == 0 then
 out = 1467
else
 out = 1468
end
doSetCreatureOutfit(cid, {lookType = out, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
doFish(cid, toPos, getThingPos(cid), chance, delay, getPlayerStorageValue(cid, storage))

return true
end