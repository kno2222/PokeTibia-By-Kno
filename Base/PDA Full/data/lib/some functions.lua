function addPokeToPlayer(cid, pokemon, level, extStr, gender, boost, ball, unique)             --alterado v2.9 \/ peguem ele todo...
local genders = {
["male"] = 4,
["female"] = 3,
[1] = 4,
[0] = 3,
[4] = 4,
[3] = 3,
}
if not isCreature(cid) then return false end

local pokemon = doCorrectString(pokemon)
if not pokes[pokemon] then return false end

   local GENDER = (gender and genders[gender]) and genders[gender] or getRandomGenderByName(pokemon)
   local btype = (ball and pokeballs[ball]) and ball or isShinyName(pokemon) and "shinynormal" or "normal"
   local happy = 250
   local level = tonumber(level) and tonumber(level) or pokes[pokemon].level
   local extra = tonumber(extStr) and tonumber(extStr) or 1
   local mypoke = pokes[pokemon]

  if (getPlayerFreeCap(cid) <= 1 and not isInArray({3, 2}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
      item = doCreateItemEx(11826)
   else
      item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, 11826, 1)   
   end
   if not item then return false end
   
   local off = mypoke.offense * level * extra
   local def = mypoke.defense * level * extra
   local sp = mypoke.specialattack * level * extra
   local vit = mypoke.vitality * level * extra
   local agi = mypoke.agility * level * extra
   local leveltable = getPokemonExperienceTable(pokemon)

   doItemSetAttribute(item, "poke", pokemon)
   doItemSetAttribute(item, "hp", 1)
   
   doItemSetAttribute(item, "level", level)
   doItemSetAttribute(item, "exp", leveltable[level])
   doItemSetAttribute(item, "nextlevelexp", leveltable[level+1] - leveltable[level])
   doItemSetAttribute(item, "offense", off)   
   doItemSetAttribute(item, "defense", def)
   doItemSetAttribute(item, "speed", agi)
   doItemSetAttribute(item, "vitality", vit)
   doItemSetAttribute(item, "specialattack", sp)
   
   doItemSetAttribute(item, "happy", happy)
   doItemSetAttribute(item, "gender", GENDER)
   doSetItemAttribute(item, "hands", 0)
   doItemSetAttribute(item, "description", "Contains a "..pokemon..".")
   doItemSetAttribute(item, "fakedesc", "Contains a "..pokemon..".") 
   if boost and tonumber(boost) and tonumber(boost) > 0 and tonumber(boost) <= 50 then     
      local off = mypoke.offense * boost_rate * tonumber(boost)
      local def = mypoke.defense * boost_rate * tonumber(boost)
      local agi = mypoke.agility * tonumber(boost)
      local spatk = mypoke.specialattack * boost_rate * tonumber(boost)
      local vit = mypoke.vitality * boost_rate * tonumber(boost)

      doItemSetAttribute(item, "boost", tonumber(boost))
      doItemSetAttribute(item, "offense", getItemAttribute(item, "offense") + off)
      doItemSetAttribute(item, "defense", getItemAttribute(item, "defense") + def)
      doItemSetAttribute(item, "speed", getItemAttribute(item, "speed") + agi)
      doItemSetAttribute(item, "specialattack", getItemAttribute(item, "specialattack") + spatk)
      doItemSetAttribute(item, "vitality", getItemAttribute(item, "vitality") + vit)
   end                                                                     
   if (getPlayerFreeCap(cid) <= 1 and not isInArray({3, 2}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
      doPlayerSendMailByName(getCreatureName(cid), item, 1)
      sendMsgToPlayer(cid, 27, "[Box] You are already holding six pokemons, so your new pokemon was sent to your depot.")
   end
   if (isShinyName(pokemon) or (boost and tonumber(boost) and tonumber(boost) >= 10)) and pokeballs["shiny"..btype] then
      doTransformItem(item, pokeballs["shiny"..btype].off)
       
   else
      doTransformItem(item, pokeballs[btype].off)
      
   end
return true
end 

function unLock(ball)                                                            
if not ball or ball <= 0 then return false end
if getItemAttribute(ball, "lock") and getItemAttribute(ball, "lock") > 0 then
   local vipTime = getItemAttribute(ball, "lock")
   local timeNow = os.time()
   local days = math.ceil((vipTime - timeNow)/(24 * 60 * 60))
   if days <= 0 then
      doItemEraseAttribute(ball, "lock")
      doItemEraseAttribute(ball, "unique")
      return true
   end
end
return false
end

function getGuildMembersOnline(GuildId)
local players = {}
for _, pid in pairs(getPlayersOnline()) do
    if getPlayerGuildId(pid) == tonumber(GuildId) then
       table.insert(players, pid)
    end
end                                                   --by Vodkart
return #players > 0 and players or false
end

function getGuildMembers(GuildId)
local players,query = {},db.getResult("SELECT `name` FROM `players` WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = " .. GuildId .. ");")
if (query:getID() ~= -1) then  
   repeat
         table.insert(players,query:getDataString("name"))
   until not query:next()                           --by Vodkart
   query:free()
end
return #players > 0 and players or false
end 
--/////////////////////////////////////////////////////////////////////////////////---
function sendMsgToPlayer(cid, tpw, msg)      
if not isCreature(cid) or not tpw or not msg then return true end
doPlayerSendTextMessage(cid, tpw, msg)
end

function getPlayerDesc(cid, thing, TV)
if (not isCreature(cid) or not isCreature(thing)) and not TV then return "" end

local pos = getThingPos(thing)
local ocup = youAre[getPlayerGroupId(thing)]
local rank = (getPlayerStorageValue(thing, 86228) <= 0) and "a Pokemon Trainer" or lookClans[getPlayerStorageValue(thing, 86228)][getPlayerStorageValue(thing, 862281)]
local name = thing == cid and "yourself" or getCreatureName(thing)     
local art = thing == cid and "You are" or (getPlayerSex(thing) == 0 and "She is" or "He is")
   
local str = {}
table.insert(str, "You see "..name..". "..art.." ")
if youAre[getPlayerGroupId(thing)] then
   table.insert(str, (ocup).." and "..rank.." from ".. getTownName(getPlayerTown(thing))..".")       
else
   table.insert(str, (rank).." from ".. getTownName(getPlayerTown(thing))..".")
end
if getPlayerGuildId(thing) > 0 then
   table.insert(str, " "..art.." "..getPlayerGuildRank(thing).." from the "..getPlayerGuildName(thing)..".")
end
if TV then
   table.insert(str, " "..art.." watching TV.")
end
table.insert(str, ((isPlayer(cid) and youAre[getPlayerGroupId(cid)]) and "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]" or "")) 

return table.concat(str) 
end
-------------------------------------------------------------------------------------------------   /\/\
function getLivePokeballs(cid, container, duel) --alterado v2.8
    if not isCreature(cid) then return {} end     
	if not isContainer(container) then return {} end
	local items = {}
	---
	local ballSlot = getPlayerSlotItem(cid, 8)
    if ballSlot.uid ~= 0 then
       for a, b in pairs (pokeballs) do
           if ballSlot.itemid == b.on or ballSlot.itemid == b.use then
              if duel and getPlayerLevel(cid) >= (pokes[getItemAttribute(ballSlot.uid, "poke")].level + getPokeballBoost(ballSlot)) then
                 table.insert(items, ballSlot.uid)                                                                      --alterado v2.8
              elseif not duel then
                 table.insert(items, ballSlot.uid)
              end
           end
       end
    end
    ---     
	if isContainer(container) and getContainerSize(container) > 0 then      
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getPokeballsInContainer(item.uid)
					for i=0, #itemsbag do
						if not isInArray(items, itemsbag[i]) then
                           table.insert(items, itemsbag[i])
                        end
					end
				elseif isPokeball(item.itemid) then
				    for a, b in pairs (pokeballs) do
                        if item.itemid == b.on then
                           if duel and getPlayerLevel(cid) >= (pokes[getItemAttribute(item.uid, "poke")].level + getPokeballBoost(item)) then    
					          table.insert(items, item.uid)                                            --alterado v2.8
                           elseif not duel then
                              table.insert(items, item.uid)
                           end
	                    end
                    end
				end
		end
	end
return items
end

function addItemInFreeBag(container, item, num)
if not isContainer(container) then return false end                                             
if not item then return false end
if not num then num = 1 end                                            --alterado v2.6.1
if getContainerSize(container) < getContainerCap(container) then
   return doAddContainerItem(container, item, num)
else
   for slot = 0, (getContainerSize(container)-1) do
       local container2 = getContainerItem(container, slot)
       if isContainer(container2.uid) and getContainerSize(container2.uid) < getContainerCap(container2.uid) then
          return doAddContainerItem(container2.uid, item, num)
       end
   end
end
return false
end
------------------------------------------------------------------------------------------------------
function pokeHaveReflect(cid)
if not isCreature(cid) then return false end
local table = getTableMove(cid, "Reflect")
if table and table.name then     --alterado v1.6
   return true 
end
return false
end

function nextHorario(cid)
    horarioAtual = os.date("%X")
    horario = string.explode(horarioAtual, ":")
    
    for i = 1, #horas do
        horarioComparacao = horas[i]
        horarioComp = string.explode(horarioComparacao, ":")
        ---------------
        if tonumber(horarioComp[1]) > tonumber(horario[1]) then
           return horarioComparacao                                 --alterado v2.3
        elseif tonumber(horarioComp[1]) == tonumber(horario[1]) and tonumber(horario[2]) < tonumber(horarioComp[2]) then
           return horarioComparacao
        end
    end 
    return horas[1]                                  --alterado v2.3
end                                                               

function getTimeDiff(timeDiff)
local dateFormat = {
{'hour', timeDiff / 60 / 60}, --6%
{'min', timeDiff / 60 % 60},
}
local out = {}                                   --alterado v2.3
for k, t in ipairs(dateFormat) do
    local v = math.floor(t[2])
    if(v > -1) then
         table.insert(out, (k < #dateFormat and '' or ' and ') .. v .. '' .. (v <= 1 and t[1] or t[1].."s"))
    end
end
if tonumber(dateFormat[1][2]) == 0 and tonumber(dateFormat[2][2]) == 0 then
   return "seconds"
end
return table.concat(out)
end

function showTimeDiff(timeComp)
local b = string.explode(os.date("%X"), ":")
local c = string.explode(timeComp, ":")
    ---
    local d, m, y = os.date("%d"), os.date("%m"), os.date("%Y")
    local hAtual, mAtual = tonumber(b[1]), tonumber(b[2])
    local hComp, mComp = tonumber(c[1]), tonumber(c[2])
    ---
    local t = os.time{year= y, month= m, day= d, hour= hAtual, min= mAtual}
    local t1 = os.time{year= y, month= m, day= d, hour= hComp, min= mComp}
    ---                                                                         --alterado v2.3
    comparacao = t1-t
    if hComp < hAtual then
       v = os.time{year= y, month= m, day= d, hour= 24, min= 0}
       v2 = os.time{year= y, month= m, day= d, hour= 0, min= 0}
       comparacao = (v-t)+(t1-v2)
    end
return getTimeDiff(comparacao)
end
-------------------------------------------------------------------------
function cleanCMcds(item)
if item ~= 0 then
   for c = 1, 15 do              --alterado v2.5
      local str = "cm_move"..c
      setCD(item, str, 0)
   end
end
end

function ehNPC(cid)   --alterado v2.9
return isCreature(cid) and not isPlayer(cid) and not isSummon(cid) and not isMonster(cid)
end

function ehMonstro(cid)   --alterado v2.9
return cid and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS and getCreatureMaster(cid) == cid
end                                                     --alterado v2.9.1 /\

function doAppear(cid)    --Faz um poke q tava invisivel voltar a ser visivel...
if not isCreature(cid) then return true end
	doRemoveCondition(cid, CONDITION_INVISIBLE)
    doRemoveCondition(cid, CONDITION_OUTFIT)
	doCreatureSetHideHealth(cid, false)
	if getCreatureName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
       if isSummon(cid) then
          local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
          doSetCreatureOutfit(cid, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)   --alterado v2.6.1
       end
    end 
end

function doAppear(cid)    --Faz um poke q tava invisivel voltar a ser visivel...
if not isCreature(cid) then return true end
	doRemoveCondition(cid, CONDITION_INVISIBLE)
    doRemoveCondition(cid, CONDITION_OUTFIT)
	doCreatureSetHideHealth(cid, false)
	if getCreatureName(cid) == "Shiny Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Shiny Ditto" then
       if isSummon(cid) then
          local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
          doSetCreatureOutfit(cid, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)   --alterado v2.6.1
       end
    end 
end

function doDisapear(cid)   --Faz um pokemon ficar invisivel
if not isCreature(cid) then return true end
doCreatureAddCondition(cid, permanentinvisible)
doCreatureSetHideHealth(cid, true)
doSetCreatureOutfit(cid, {lookType = 2}, -1)
end

function hasTile(pos)    --Verifica se tem TILE na pos
pos.stackpos = 0
if getTileThingByPos(pos).itemid >= 1 then
   return true
end
return false
end

function getThingFromPosWithProtect(pos)  --Pega uma creatura numa posi�ao com prote�oes
if hasTile(pos) then
pos.stackpos = 253
   pid = getThingfromPos(pos).uid
else
   pid = getThingfromPos({x=1,y=1,z=10,stackpos=253}).uid
end
return pid
end

function getTileThingWithProtect(pos)    --Pega um TILE com prote�oes
if hasTile(pos) then
pos.stackpos = 0
   pid = getTileThingByPos(pos)
else
   pid = getTileThingByPos({x=1,y=1,z=10,stackpos=0})
end
return pid
end


function canAttackOther(cid, pid)         --Function q verifica se um poke/player pode atacar outro poke/player

if not isCreature(cid) or not isCreature(pid) then return "Cant" end

local master1 = isSummon(cid) and getCreatureMaster(cid) or cid
local master2 = isSummon(pid) and getCreatureMaster(pid) or pid
   
   if getPlayerStorageValue(master1, 6598754) >= 1 and getPlayerStorageValue(master2, 6598755) >= 1 then
      return "Can" 
   end
   if getPlayerStorageValue(master1, 6598755) >= 1 and getPlayerStorageValue(master2, 6598754) >= 1 then  ---estar em times diferentes
      return "Can"
   end
   ----
   if getTileInfo(getThingPos(cid)).pvp then
      return "Can" 
   end
   if ehMonstro(cid) and ehMonstro(pid) and not isSummon(cid) and not isSummon(pid) then --alterado v2.9.1
      return "Can"
   end

return "Cant"
end
   
      
function stopNow(cid, time)   
if not isCreature(cid) or not tonumber(time) or isSleeping(cid) then return true end
                                                      --alterado v2.9.1 \/
local function podeMover(cid)                         
if isPlayer(cid) then 
   mayNotMove(cid, false) 
elseif isCreature(cid) then 
   doRegainSpeed(cid) 
end
end

if isPlayer(cid) then mayNotMove(cid, true) else doChangeSpeed(cid, -getCreatureSpeed(cid)) end
addEvent(podeMover, time, cid)
end


function doReduceStatus(cid, off, def, agi)   --reduz os status
if not isCreature(cid) then return true end
setPlayerStorageValue(cid, 547888, -1)  --alterado v2.8
local A = getOffense(cid)
local B = getDefense(cid)
local C = getSpeed(cid)

if off > 0 then
   setPlayerStorageValue(cid, 1001, A - off)
end
if def > 0 then
   setPlayerStorageValue(cid, 1002, B - def)
end
if agi > 0 then
   setPlayerStorageValue(cid, 1003, C - agi)
   if getCreatureSpeed(cid) ~= 0 then
      doRegainSpeed(cid)
   end                                              --alterado v2.5  functions arrumadas...
end
end

function doRaiseStatus(cid, off, def, agi, time)  
if not isCreature(cid) then return true end
setPlayerStorageValue(cid, 547888, 1)  --alterado v2.8
local A = getOffense(cid)
local B = getDefense(cid)
local C = getSpeed(cid)

if off > 0 then
   setPlayerStorageValue(cid, 1001, A * off)
end
if def > 0 then
   setPlayerStorageValue(cid, 1002, B * def)
end
if agi > 0 then
   setPlayerStorageValue(cid, 1003, C + agi)
   if getCreatureSpeed(cid) ~= 0 then
      doRegainSpeed(cid)
   end
end

local D = getOffense(cid)
local E = getDefense(cid)
local F = getSpeed(cid)
---------------------------
local G = D - A
local H = E - B
local I = F - C

addEvent(doReduceStatus, time*1000, cid, G, H, I)
end


function BackTeam(cid)          
  if isCreature(cid) then
     local summon = getCreatureSummons(cid)   --alterado v2.6
     for i = 2, #summon do
         doSendMagicEffect(getThingPos(summon[i]), 211)
         doRemoveCreature(summon[i])
     end
     setPlayerStorageValue(cid, 637501, -1)
  end  
end
    
function choose(...) -- by mock
    local arg = {...}
    return arg[math.random(1,#arg)]
end

function AddPremium(cid, days)
local function removerPlayer(cid)
if isCreature(cid) then
   doRemoveCreature(cid)
end
end

db.executeQuery("UPDATE `accounts` SET `premdays` = '"..days.."' WHERE `accounts`.`id` = ".. getPlayerAccountId(cid) ..";")
doPlayerSendTextMessage(cid,25,"Voc� ser� kickado em 5 segundos.")    
addEvent(removerPlayer, 5*1000, cid)     
return TRUE
end

function isShiny(cid) 
return isCreature(cid) and string.find(getCreatureName(cid), "Shiny")  --alterado v2.9
end

function isShinyName(name)        
return tostring(name) and string.find(doCorrectString(name), "Shiny") --alterado v2.9
end

function doConvertTypeToStone(type, string)
local t = {
["fly"] = {heart, "heart"},
["flying"] = {heart, "heart"},
["normal"] = {heart, "heart"},
["fire"] = {fire, "fire"},
["grass"] = {leaf, "leaf"},
["leaf"] = {leaf, "leaf"},
["water"] = {water, "water"},
["poison"] = {venom, "venom"},
["venom"] = {venom, "venom"},
["electric"] = {thunder, "thunder"},
["thunder"] = {thunder, "thunder"},
["rock"] = {rock, "rock"},
["fight"] = {punch, "punch"},
["fighting"] = {punch, "punch"},
["bug"] = {coccon, "coccon"},
["dragon"] = {crystal, "crystal"},
["dark"] = {dark, "dark"},
["ghost"] = {dark, "dark"},
["ground"] = {earth, "earth"},
["earth"] = {earth, "earth"},
["psychic"] = {enigma, "enigma"},
["steel"] = {metal, "metal"},
["metal"] = {metal, "metal"},
["ice"] = {ice, "ice"},
["Shiny"] = {ice, "Shiny"},
["boost"] = {boostStone, "boost"},  --alterado v2.9
}

if string then
return t[type][2]
else
return t[type][1]
end
end

function doConvertStoneIdToString(stoneID)
local t = {
[11453] = "Deeph Sea Scale",
[11441] = "Leaf Stone",
[11442] = "Water Stone",
[11443] = "Dusk Stone",
[11444] = "Thunder Stone",
[11445] = "Moon Stone",
[11446] = "Electirizer", 
[11447] = "Fire Stone",               --alterado v2.6
[11448] = "Magmarizer", 
[11449] = "Prism Scale",
[11450] = "Dubious Disc", 
[11451] = "Protector",
[11452] = "Shiny Stone",
[11454] = "Dawn Stone", 
[12244] = "King's Rock",
[12232] = "Metal Coat",
[12242] = "Sun Stone",
[12417] = "Dragon Scale",
[12419] = "Up-Grade",
[13031] = "Punch Machine",
[13032] = "Kick Machine",
[13033] = "Rolling Kick Machine",
[12406] = "Shiny Rock Stone",
[12407] = "Shiny Venom Stone", 
[12408] = "Shiny Ice Stone",
[12409] = "Shiny Thunder Stone",
[12410] = "Shiny Crystal Stone",
[12411] = "Shiny Cocoon Stone",
[12412] = "Shiny Darkness Stone",
[12413] = "Shiny Punch Stone",
[12414] = "Shiny Earth Stone",
[boostStone] = "Boost Stone",  --alterado v2.9
}
if t[stoneID] then
return t[stoneID]
else
return ""
end
end

function isStone(id)
if id >= 11441 and id <= 11454 then
return true
end
if id == 12618 then  --alterado v2.9
return true
end
if id == 12232 or id == 12242 or id == 12244 or id == 12245 then
return true                                  --alterado v2.7 com as stones shinys tb soh pra garantir.. ^^
end
if (id >= 1452 and id <= 1478) or id == 12401 or id == 12402 then
return true 
end
if (id >= 12403 and id <= 12429) or id == 12430 or id == 12432 then
return true 
end
if (id >= 13031 and id <= 13033) or id == 12430 or id == 12432 then
return true 
end
return false
end

function isWater(id)
return tonumber(id) and id >= 4820 and id <= 4825 --alterado v2.9
end

function getTopCorpse(position)
	local pos = position

		for n = 1, 255 do

			pos.stackpos = n
			local item = getTileThingByPos(pos)

			if item.itemid >= 2 and (string.find(getItemNameById(item.itemid), "fainted ") or string.find(getItemNameById(item.itemid), "defeated ")) then
				return getTileThingByPos(pos)
			end
		end
return null
end

bpslot = CONST_SLOT_BACKPACK

function hasPokemon(cid)
	if not isCreature(cid) then return false end
	if getCreatureMana(cid) <= 0 then return false end
	if #getCreatureSummons(cid) >= 1 then return true end
	local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local bp = getPlayerSlotItem(cid, bpslot)
	for a, b in pairs (pokeballs) do
        if item.itemid == b.on or item.itemid == b.use then
        return true                              --alterado v2.4
        end
        if #getItemsInContainerById(bp.uid, b.on) >= 1 then
        return true
        end
	end
return false
end

function isNpcSummon(cid)
return isNpc(getCreatureMaster(cid))
end

function getPokemonHappinessDescription(cid)
	if not isCreature(cid) then return true end
	local str = ""
	if getPokemonGender(cid) == SEX_MALE then
		str = "He"
	elseif getPokemonGender(cid) == SEX_FEMALE then
		str = "She"
	else
		str = "It"
	end
	local h = getPlayerStorageValue(cid, 1008)
	if h >= tonumber(getConfigValue('PokemonStageVeryHappy')) then
		str = str.." is very happy with you!"
	elseif h >= tonumber(getConfigValue('PokemonStageHappy')) then
		str = str.." is happy."
	elseif h >= tonumber(getConfigValue('PokemonStageOK')) then
		str = str.." is unhappy."
	elseif h >= tonumber(getConfigValue('PokemonStageSad')) then
		str = str.." is sad."
	elseif h >= tonumber(getConfigValue('PokemonStageMad')) then
		str = str.." is mad."
	else
		str = str.." is very mad at you!"
	end
return str
end

function doSetItemAttribute(item, key, value)
doItemSetAttribute(item, key, value)
end

function deTransform(cid, check)
	if not isCreature(cid) then return true end

	local m = getCreatureMaster(cid)
	local p = getPlayerSlotItem(m, 8)

	if getItemAttribute(p.uid, "transTurn") ~= check then return true end

	setPlayerStorageValue(cid, 1010, "Ditto")
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doSendMagicEffect(getThingPos(cid), 184)
	doCreatureSay(cid, "DITTO!", TALKTYPE_MONSTER)
	doItemSetAttribute(p.uid, "transBegin", 0)
	doItemSetAttribute(p.uid, "transLeft", 0)
	doItemEraseAttribute(p.uid, "transName")
	doItemEraseAttribute(p.uid, "boffense")
	doItemEraseAttribute(p.uid, "bdefense")
	doItemEraseAttribute(p.uid, "bsattack")
	doItemEraseAttribute(p.uid, "bagility")
end

function deTransform(cid, check)
	if not isCreature(cid) then return true end

	local m = getCreatureMaster(cid)
	local p = getPlayerSlotItem(m, 8)

	if getItemAttribute(p.uid, "transTurn") ~= check then return true end

	setPlayerStorageValue(cid, 1010, "Shiny Ditto")
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doSendMagicEffect(getThingPos(cid), 184)
	doCreatureSay(cid, "DITTO!", TALKTYPE_MONSTER)
	doItemSetAttribute(p.uid, "transBegin", 0)
	doItemSetAttribute(p.uid, "transLeft", 0)
	doItemEraseAttribute(p.uid, "transName")
	doItemEraseAttribute(p.uid, "boffense")
	doItemEraseAttribute(p.uid, "bdefense")
	doItemEraseAttribute(p.uid, "bsattack")
	doItemEraseAttribute(p.uid, "bagility")
end

function isTransformed(cid)
return isCreature(cid) and not isInArray({-1, "Ditto", "Shiny Ditto"}, getPlayerStorageValue(cid, 1010))  --alterado v2.9
end

function doSendFlareEffect(pos)
	local random = {28, 29, 79}
	doSendMagicEffect(pos, random[math.random(1, 3)])
end

function isDay()
	local a = getWorldTime()
	if a >= 360 and a < 1080 then
	return true
	end
return false
end

function doPlayerSendTextWindow(cid, p1, p2)
	if not isCreature(cid) then return true end
	local item = 460
	local text = ""
	if type(p1) == "string" then
		doShowTextDialog(cid, item, p1)
	else
		doShowTextDialog(cid, p1, p2)
	end
end

function getClockString(tw)
	local a = getWorldTime()
	local b = a / 60
	local hours = math.floor(b)
	local minut = a - (60 * hours)

	if not tw then
		if hours < 10 then
			hours = "0"..hours..""
		end
		if minut < 10 then
			minut = "0"..minut..""
		end
	return hours..":"..minut
	else
		local sm = "a.m"
		if hours >= 12 then
			hours = hours - 12
			sm = "p.m"
		end
		if hours < 10 then
			hours = "0"..hours..""
		end
		if minut < 10 then
			minut = "0"..minut..""
		end
	return hours..":"..minut.." "..sm
	end
end

function doCorrectPokemonName(poke)
return doCorrectString(poke)
end

function doCorrectString(str)
local name = str:explode(" ")  --alterado v2.9
local final = {}
for _, s in ipairs(name) do
    table.insert(final, s:sub(1, 1):upper()..s:sub(2, #s):lower())
end
return table.concat(final, (name[2] and " " or ""))
end 

function getHappinessRate(cid)
	if not isCreature(cid) then return 1 end
	local a = getPlayerStorageValue(cid, 1008)
		if a == -1 then return 1 end
	if a >= getConfigValue('PokemonStageVeryHappy') then
		return happinessRate[5].rate
	elseif a >= getConfigValue('PokemonStageHappy') then
		return happinessRate[4].rate
	elseif a >= getConfigValue('PokemonStageOK') then
		return happinessRate[3].rate
	elseif a >= getConfigValue('PokemonStageSad') then
		return happinessRate[2].rate
	else
		return happinessRate[1].rate
	end
return 1
end

function doBodyPush(cid, target, go, pos)
	if not isCreature(cid) or not isCreature(target) then
		doRegainSpeed(cid)
		doRegainSpeed(target)
	return true
	end
		if go then
			local a = getThingPos(cid)
			doChangeSpeed(cid, -getCreatureSpeed(cid))
				if not isPlayer(target) then
					doChangeSpeed(target, -getCreatureSpeed(target))
				end
			doChangeSpeed(cid, 800)
			doTeleportThing(cid, getThingPos(target))
			doChangeSpeed(cid, -800)
			addEvent(doBodyPush, 350, cid, target, false, a)
		else
			doChangeSpeed(cid, 800)
			doTeleportThing(cid, pos)
			doRegainSpeed(cid)
			doRegainSpeed(target)
		end
end

function doReturnPokemon(cid, pokemon, pokeball, effect, hideeffects, blockevo)

    --////////////////////////////////////////////////////////////////////////////////////////--
	checkDuel(cid)                                                                      --alterado v2.6 duel system
    --////////////////////////////////////////////////////////////////////////////////////////--
    if getPlayerStorageValue(cid, 52480) >= 1 and getPlayerStorageValue(cid, 52484) ~= 10 then
       return sendMsgToPlayer(cid, 27, "You can't do that while the duel don't begins!")        --alterado v2.8
    end
    --////////////////////////////////////////////////////////////////////////////////////////--
    
    if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v2.6
       if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
          BackTeam(cid)       
       end
    end
    ----------------------
	local edit = true

	if not pokeball then
		pokeball = getPlayerSlotItem(cid, 8)
	end

	if blockevo then
		edit = false
		doPlayerSendCancel(cid, "Your pokemon couldn't evolve due to server mistakes, please wait until we fix the problem.")
	end

	local happy = getPlayerStorageValue(pokemon, 1008)
	local hunger = getPlayerStorageValue(pokemon, 1009)
	local pokelife = (getCreatureHealth(pokemon) / getCreatureMaxHealth(pokemon))

	if edit then
		doItemSetAttribute(pokeball.uid, "happy", happy)
		doItemSetAttribute(pokeball.uid, "hunger", hunger)
		doItemSetAttribute(pokeball.uid, "hp", pokelife)
	end

	if getCreatureName(pokemon) == "Ditto" then
		if isTransformed(pokemon) then
			local left = getItemAttribute(pokeball.uid, "transLeft") - (os.clock() - getItemAttribute(pokeball.uid, "transBegin"))
			doItemSetAttribute(pokeball.uid, "transLeft", left)
		end
	end

	if getCreatureName(pokemon) == "Shiny Ditto" then
		if isTransformed(pokemon) then
			local left = getItemAttribute(pokeball.uid, "transLeft") - (os.clock() - getItemAttribute(pokeball.uid, "transBegin"))
			doItemSetAttribute(pokeball.uid, "transLeft", left)
		end
	end


	if hideeffects then
		doRemoveCreature(pokemon)
	return true
	end

	local pokename = getPokeName(pokemon)

	local mbk = gobackmsgs[math.random(1, #gobackmsgs)].back:gsub("doka", pokename)

	if getCreatureCondition(cid, CONDITION_INFIGHT) then
		if isCreature(getCreatureTarget(cid)) then
			doItemSetAttribute(pokeball.uid, "happy", happy - 5)
		else
			doItemSetAttribute(pokeball.uid, "happy", happy - 2)
		end
	end

	doTransformItem(pokeball.uid, pokeball.itemid-1)
	doCreatureSay(cid, mbk, TALKTYPE_SAY)

	doSendMagicEffect(getCreaturePosition(pokemon), effect)

	doRemoveCreature(pokemon)

    unLock(pokeball.uid) --alterado v2.8
    
    if useOTClient then
       doPlayerSendCancel(cid, '12//,hide')  --alterado v2.7
    end
    
	if useKpdoDlls then
		doUpdateMoves(cid)
	end

end

local EFFECTS = {
	--[OutfitID] = {Effect}
	["Magmar"] = 35,    --magmar            --alterado v2.5
	["Magmortar"] = 35,    --magmar
	["Jynx"] = 17,    --jynx
	["Shiny Jynx"] = 17,    --shiny jynx
	["Shiny Magmar"] = 35,    --magmar 
	["Shiny Magmortar"] = 35,    --magmar
}

function doGoPokemon(cid, item)

	if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 then
	return true
	end
---------------------------------------------------------------
local ballName = getItemAttribute(item.uid, "poke")

   btype = getPokeballType(item.itemid)                   

	local effect = pokeballs[btype].effect
		if not effect then
			effect = 21
		end
-----------------------------------------------------------------
	if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
	return TRUE
	end

	local thishp = getItemAttribute(item.uid, "hp")

	if thishp <= 0 then
		if isInArray(pokeballs[btype].all, item.itemid) then
			doTransformItem(item.uid, pokeballs[btype].off)
			doItemSetAttribute(item.uid, "hp", 0)
			doPlayerSendCancel(cid, "This pokemon is fainted.")
		    return true
		end
	end
    
	local pokemon = getItemAttribute(item.uid, "poke")

	if not pokes[pokemon] then
	return true
	end
	
----------------------- Sistema de nao poder carregar mais que 3 pokes lvl baixo e + q 1 poke de lvl medio/alto ---------------------------------
if not isInArray({5, 6}, getPlayerGroupId(cid)) then
   local balls = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)      --alterado v2.9 \/
   local low = {}
   local lowPokes = {"Rattata", "Caterpie", "Weedle", "Oddish", "Pidgey", "Paras", "Poliwag", "Bellsprout", "Magikarp", "Hoppip", "Sunkern"}
   if #balls >= 1 then
      for _, uid in ipairs(balls) do
          local nome = getItemAttribute(uid, "poke")
          if not isInArray(lowPokes, pokemon) and nome == pokemon then
             return doPlayerSendTextMessage(cid, 27, "Sorry, but you can't carry two pokemons equals!")
          else
             if nome == pokemon then
                table.insert(low, nome)
             end
          end
      end
   end
if #low >= 3 then
   return doPlayerSendTextMessage(cid, 27, "Sorry, but you can't carry more than three pokemons equals of low level!")
end   
end
---------------------------------------------------------------------------------------------------------------------------------------------------

	local x = pokes[pokemon]
	local boosts = getItemAttribute(item.uid, "boost") or 0

	if getPlayerLevel(cid) + pokemonMaxLevelAbovePlayer < getItemAttribute(item.uid, "level") then
	doPlayerSendCancel(cid, "Your pokemon's level is much higher than yours, you can't use him.")
	return true
	end
	
    --------------------------------------------------------------------------------------

	doSummonMonster(cid, pokemon)

	local pk = getCreatureSummons(cid)[1]
	if not isCreature(pk) then return true end
	
	------------------------passiva hitmonchan------------------------------
	if isSummon(pk) then
       --local e = getCreatureMaster(cid)
       local nameHIT = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")
       local hands = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "hands")
       if nameHIT == "Shiny Hitmonchan" or nameHIT == "Hitmonchan" then
          if getItemAttribute(getPlayerSlotItem(cid, 8).uid, "hands") then
             doSetCreatureOutfit(pk, {lookType = hitmonchans[nameHIT][hands].out}, -1)
          else
              doPlayerSendTextMessage(cid, 27, "Contact a GameMaster! Error in passive system! Attribute \"hands\" missing")  
          end
       end
    end
	-------------------------------------------------------------------------
    ---------movement magmar, jynx-------------
    if EFFECTS[getCreatureName(pk)] then   --alterado v2.5  
       markPosEff(pk, getThingPos(pk))
       sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk))  --alterado v2.5
    end
    --------------------------------------------------------------------------  

	if getCreatureName(pk) == "Ditto" then

		local left = getItemAttribute(item.uid, "transLeft")
		local name = getItemAttribute(item.uid, "transName")

		if left and left > 0 then
			setPlayerStorageValue(pk, 1010, name)
			doSetCreatureOutfit(pk, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)
			addEvent(deTransform, left * 1000, pk, getItemAttribute(item.uid, "transTurn"))
			doItemSetAttribute(item.uid, "transBegin", os.clock())
		else
			setPlayerStorageValue(pk, 1010, "Ditto")
		end
	end

	if getCreatureName(pk) == "Shiny Ditto" then

		local left = getItemAttribute(item.uid, "transLeft")
		local name = getItemAttribute(item.uid, "transName")

		if left and left > 0 then
			setPlayerStorageValue(pk, 1010, name)
			doSetCreatureOutfit(pk, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)
			addEvent(deTransform, left * 1000, pk, getItemAttribute(item.uid, "transTurn"))
			doItemSetAttribute(item.uid, "transBegin", os.clock())
		else
			setPlayerStorageValue(pk, 1010, "Shiny Ditto")
		end
	end

	if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end

	doCreatureSetLookDir(pk, 2)

	adjustStatus(pk, item.uid, true, false, true)
	doAddPokemonInOwnList(cid, pokemon)

	doTransformItem(item.uid, item.itemid+1)

	local pokename = getPokeName(pk) --alterado v2.7

	local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	doCreatureSay(cid, mgo, TALKTYPE_SAY)

	doSendMagicEffect(getCreaturePosition(pk), effect)

    unLock(item.uid) --alterado v2.8
    
	if useKpdoDlls then
		doUpdateMoves(cid)
	end
end

function doRegainSpeed(cid)              --alterado v2.9 \/
if not isCreature(cid) then return true end

   local speed = PlayerSpeed
   if isMonster(cid) then
      speed = getCreatureBaseSpeed(cid) + getSpeed(cid) * speedRate 
   elseif isPlayer(cid) and isInArray({4, 5, 6}, getPlayerGroupId(cid)) then
      speed = 200*getPlayerGroupId(cid) 
   end
   if speed > 1500 then speed = 1500 end
   
   doChangeSpeed(cid, -getCreatureSpeed(cid))
   if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
      doRemoveCondition(cid, CONDITION_PARALYZE)
      addEvent(doAddCondition, 10, cid, paralizeArea2)             
   end
    
doChangeSpeed(cid, speed)
return speed
end

function isPosEqualPos(pos1, pos2, checkstackpos)
	if pos1.x ~= pos2.x or pos1.y ~= pos2.y and pos1.z ~= pos2.z then
	return false
	end
	if checkstackpos and pos1.stackpos and pos2.stackpos and pos1.stackpos ~= pos2.stackpos then
	return false
	end
return true
end

function getRandomGenderByName(name)
local rate = newpokedex[name]
	if not rate then return 0 end
	rate = rate.gender
	if rate == 0 then
		gender = 3
	elseif rate == 1000 then
		gender = 4
	elseif rate == -1 then
		gender = 0
	elseif math.random(1, 1000) <= rate then
		gender = 4
	else
		gender = 3
	end
return gender
end

function getRecorderPlayer(pos, cid)
	local ret = 0
	if cid and isPosEqual(getThingPos(cid), pos) then   --alterado v2.9
	return cid
	end
	local s = {}
	s.x = pos.x
	s.y = pos.y
	s.z = pos.z
		for a = 0, 255 do
			s.stackpos = a
			local b = getTileThingByPos(s).uid
			if b > 1 and isPlayer(b) and getCreatureOutfit(b).lookType ~= 814 then
				ret = b
			end
		end
return ret
end

function getRecorderCreature(pos, cid)
	local ret = 0
	if cid and isPosEqual(getThingPos(cid), pos) then   --alterado v2.9
	return cid
	end
	local s = {}
	s.x = pos.x
	s.y = pos.y
	s.z = pos.z                                       --alterado v2.6
		for a = 0, 255 do
			s.stackpos = a
			local b = getTileThingByPos(s).uid
			if b > 1 and isCreature(b) and getCreatureOutfit(b).lookType ~= 814 then
				ret = b
			end
		end
return ret
end

function doCreatureSetOutfit(cid, outfit, time)
	doSetCreatureOutfit(cid, outfit, time)
end

function doMagicalFlower(cid, away)
	if not isCreature(cid) then return true end
	for x = -3, 3 do
		for y = -3, 3 do
		local a = getThingPos(cid)
		a.x = a.x + x
		a.y = a.y + y
			if away then
				doSendDistanceShoot(a, getThingPos(cid), 21)
			else
				doSendDistanceShoot(getThingPos(cid), a, 21)
			end
		end
	end
end		

function isItemPokeball(item)         --alterado v2.9 \/
if not item then return false end
for a, b in pairs (pokeballs) do
	if isInArray(b.all, item) then return true end
end
return false
end

function isPokeball(item)
return isItemPokeball(item)
end                                    --/\

function getPokeballType(id)
	for a, b in pairs (pokeballs) do
		if isInArray(b.all, id) then
			return a
		end
	end
return "none"
end

randomdiagonaldir = {
[NORTHEAST] = {NORTH, EAST},
[SOUTHEAST] = {SOUTH, EAST},
[NORTHWEST] = {NORTH, WEST},
[SOUTHWEST] = {SOUTH, WEST}}

function doFaceOpposite(cid)
local a = getCreatureLookDir(cid)
local d = {
[NORTH] = SOUTH,
[SOUTH] = NORTH,
[EAST] = WEST,
[WEST] = EAST,
[NORTHEAST] = SOUTHWEST,
[NORTHWEST] = SOUTHEAST,
[SOUTHEAST] = NORTHWEST,
[SOUTHWEST] = NORTHEAST}
doCreatureSetLookDir(cid, d[a])
end

function doFaceRandom(cid)
local a = getCreatureLookDir(cid)
local d = {
[NORTH] = {SOUTH, WEST, EAST},
[SOUTH] = {NORTH, WEST, EAST},
[WEST] = {SOUTH, NORTH, EAST},
[EAST] = {SOUTH, WEST, NORTH}}
doChangeSpeed(cid, 1)
doCreatureSetLookDir(cid, d[a][math.random(1, 3)])
doChangeSpeed(cid, -1)
end

function getFaceOpposite(dir)
local d = {
[NORTH] = SOUTH,
[SOUTH] = NORTH,
[EAST] = WEST,
[WEST] = EAST,
[NORTHEAST] = SOUTHWEST,
[NORTHWEST] = SOUTHEAST,
[SOUTHEAST] = NORTHWEST,
[SOUTHWEST] = NORTHEAST}
return d[dir]
end

function getResistance(cid, combat)
	if isPlayer(cid) then return false end
local poketype1 = pokes[getCreatureName(cid)].type
local poketype2 = pokes[getCreatureName(cid)].type2
local multiplier = 1
	if effectiveness[combat].super and isInArray(effectiveness[combat].super, poketype1) then
		multiplier = multiplier * 2
	end
	if poketype2 and effectiveness[combat].super and isInArray(effectiveness[combat].super, poketype2) then
		multiplier = multiplier * 2
	end
	if effectiveness[combat].weak and isInArray(effectiveness[combat].weak, poketype1) then
		multiplier = multiplier * 0.5
	end
	if poketype2 and effectiveness[combat].weak and isInArray(effectiveness[combat].weak, poketype2) then
		multiplier = multiplier * 0.5
	end
	if effectiveness[combat].non and isInArray(effectiveness[combat].non, poketype1) then
		multiplier = multiplier * 0
	end
	if poketype2 and effectiveness[combat].non and isInArray(effectiveness[combat].non, poketype2) then
		multiplier = multiplier * 0
	end

	if multiplier == 0.25 then
		multiplier = 0.5
	elseif multiplier == 4 then
		multiplier = 2
	end

return multiplier
end

function getCreatureDirectionToTarget(cid, target, ranged)
	if not isCreature(cid) then return true end
	if not isCreature(target) then return getCreatureLookDir(cid) end
	local dirs = {
	[NORTHEAST] = {NORTH, EAST},
	[SOUTHEAST] = {SOUTH, EAST},
	[NORTHWEST] = {NORTH, WEST},
	[SOUTHWEST] = {SOUTH, WEST}}
	local x = getDirectionTo(getThingPos(cid), getThingPos(target), false)
		if x <= 3 then return x
		else
			local xdistance = math.abs(getThingPos(cid).x - getThingPos(target).x)
			local ydistance = math.abs(getThingPos(cid).y - getThingPos(target).y)
				if xdistance > ydistance then
					return dirs[x][2]
				elseif ydistance > xdistance then
					return dirs[x][1]
				elseif isInArray(dirs[x], getCreatureLookDir(cid)) then
					return getCreatureLookDir(cid)
				else
					return dirs[x][math.random(1, 2)]
				end
		end
end

function getSomeoneDescription(cid)
	if isPlayer(cid) then return getPlayerNameDescription(cid) end
return getMonsterInfo(getCreatureName(cid)).description
end
	

function isGhostPokemon(cid)
	if not isCreature(cid) then return false end                             --alterado v2.7
	if isInArray({"Gengar", "Haunter", "Gastly", "Misdreavus", "Shiny Misdreavus", "Mismagius", "Shiny Mismagius", "Shiny Haunter", "Shiny Gastly", "Shiny Gengar", "Darkrai", "Shuppet", "Banette", "Duskull", "Dusclops", "Dusknoir", "Shiny Duskull", "Shiny Dusclops", "Shiny Dusknoir"}, getCreatureName(cid)) then
	return true
	end
return false
end

function updateGhostWalk(cid)
	if not isCreature(cid) then return false end
	local pos = getThingPos(cid)
	pos.x = pos.x + 1
	pos.y = pos.y + 1
	local ret = getThingPos(cid)
	doTeleportThing(cid, pos, false)
	doTeleportThing(cid, ret, false)
return true
end

function doRemoveElementFromTable(t, e)
	local ret = {}
	for a = 1, #t do
		if t[a] ~= e then
		table.insert(ret, t[a])
		end
	end
return ret
end

function doFaceCreature(sid, pos)
if not isCreature(sid) then return true end
	if getThingPos(sid).x == pos.x and getThingPos(sid).y == pos.y then return true end
	local ret = 0

	local ld = getCreatureLookDir(sid)
	local dir = getDirectionTo(getThingPos(sid), pos)
	local al = {
	[NORTHEAST] = {NORTH, EAST},
	[NORTHWEST] = {NORTH, WEST},
	[SOUTHEAST] = {SOUTH, EAST},
	[SOUTHWEST] = {SOUTH, WEST}}

	if dir >= 4 and isInArray(al[dir], ld) then return true end

	doChangeSpeed(sid, 1)
		if dir == 4 then
			ret = math.random(2, 3)
		elseif dir == 5 then
			ret = math.random(1, 2)
		elseif dir == 6 then
			local dirs = {0, 3}
			ret = dirs[math.random(1, 2)]
		elseif dir == 7 then
			ret = math.random(0, 1)
		else
			ret = getDirectionTo(getThingPos(sid), pos)
		end
doCreatureSetLookDir(sid, ret)
doChangeSpeed(sid, -1)
return true
end

function doCreatureAddCondition(cid, condition)
if not isCreature(cid) then return true end
doAddCondition(cid, condition)
end

function doCreatureRemoveCondition(cid, condition)
if not isCreature(cid) then return true end
doRemoveCondition(cid, condition)
end

function setCD(item, tipo, tempo)

	if not tempo or not tonumber(tempo) then
		doItemEraseAttribute(item, tipo)
	return true
	end

	doItemSetAttribute(item, tipo, "cd:"..(tempo + os.time()).."")
return tempo + os.time()
end

function getCD(item, tipo, limite)

	if not getItemAttribute(item, tipo) then
	return 0
	end

	local string = getItemAttribute(item, tipo):gsub("cd:", "")
	local number = tonumber(string) - os.time()

	if number <= 0 then
	return 0
	end

	if limite and limite < number then
		return 0
	end

return number
end

function doSendMoveEffect(cid, target, effect)
if not isCreature(cid) or not isCreature(target) then return true end
doSendDistanceShoot(getThingPos(cid), getThingPos(target), effect)
return true
end

function doSetItemActionId(uid, actionid)
doItemSetAttribute(uid, "aid", actionid)
return true
end

function threeNumbers(number)
	if number <= 9 then
	return "00"..number..""
	elseif number <= 99 then
	return "0"..number..""
	end
return ""..number..""
end

function isBr(cid)
if getPlayerStorageValue(cid, 105505) ~= -1 then
return true
end
return false
end

function isBeingUsed(ball)            
if not ball then return false end
for a, b in pairs (pokeballs) do           --alterado v2.9
    if b.use == ball then return true end
end
return false
end

function doRemoveTile(pos)-- Script by mock
pos.stackpos = 0
local sqm = getTileThingByPos(pos)
doRemoveItem(sqm.uid,1)
end

function doCreateTile(id,pos) -- By mock
doAreaCombatHealth(0,0,pos,0,0,0,CONST_ME_NONE)
doCreateItem(id,1,pos)
end

function hasSqm(pos)
local f = getTileThingByPos(pos)
if f.itemid ~= 0 and f.itemid ~= 1 then
return true
end
return false
end

function getPosDirs(p, dir) -- By MatheusMkalo
return dir == 1 and {x=p.x-1, y=p.y, z=p.z} or dir == 2 and {x=p.x-1, y=p.y+1, z=p.z} or dir == 3 and {x=p.x, y=p.y+1, z=p.z} or dir == 4 and {x=p.x+1, y=p.y+1, z=p.z} or dir == 5 and {x=p.x+1, y=p.y, z=p.z} or dir == 6 and {x=p.x+1, y=p.y-1, z=p.z} or dir == 7 and {x=p.x, y=p.y-1, z=p.z} or dir == 8 and {x=p.x-1, y=p.y-1, z=p.z}
end

function canWalkOnPos(pos, creature, pz, water, sqm, proj)
if not pos then return false end
if not pos.x then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid <= 1 and sqm then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 919 then return false end
if isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false end
    local n = not proj and 3 or 2                                    --alterado v2.6
    for i = 0, 255 do
        pos.stackpos = i                           
        local tile = getTileThingByPos(pos)        
        if tile.itemid ~= 0 and i ~= 253 and not isCreature(tile.uid) then     --edited
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end   
return true
end

function canWalkOnPos2(pos, creature, pz, water, sqm, proj)     --alterado v2.6
if not pos then return false end
if not pos.x then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid <= 1 and sqm then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 919 then return false end
if isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false end
    --[[local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i                           --edited pra retirar um bug.. ;x
        local tile = getTileThingByPos(pos)        
        if tile.itemid ~= 0 and i ~= 253 and not isCreature(tile.uid) then     --edited
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end ]]  
return true
end

function getFreeTile(pos, cid)
	if canWalkOnPos(pos, true, false, true, true, false) then
		return pos
	end
	local positions = {}
	for a = 0, 7 do
		if canWalkOnPos(getPosByDir(pos, a), true, false, true, true, false) then
		table.insert(positions, pos)
		end
	end
	if #positions >= 1 then
		if isCreature(cid) then
			local range = 1000
			local ret = getThingPos(cid)
			for b = 1, #positions do
				if getDistanceBetween(getThingPos(cid), positions[b]) < range then
					ret = positions[b]
					range = getDistanceBetween(getThingPos(cid), positions[b])
				end
			end
			return ret
		else
			return positions[math.random(#positions)]
		end
	end
return getThingPos(cid)
end

function isWalkable(pos, creature, proj, pz, water)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if isWater(getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end


function isPlayerSummon(cid, uid)
return getCreatureMaster(uid) == cid  --alterado v2.9
end

function isSummon(sid)
return isCreature(sid) and getCreatureMaster(sid) ~= sid and isPlayer(getCreatureMaster(sid))   --alterado v2.9
end 

function hasSpaceInContainer(container)                --alterado v2.6
if not isContainer(container) then return false end
if getContainerSize(container) < getContainerCap(container) then return true end

for slot = 0, (getContainerSize(container)-1) do
    local item = getContainerItem(container, slot)
    if isContainer(item.uid) then
       if hasSpaceInContainer(item.uid) then
          return true
       end
    end
end
return false
end

function getItemsInContainerById(container, itemid) -- Function By Kydrai
local items = {}
if isContainer(container) and getContainerSize(container) > 0 then
for slot=0, (getContainerSize(container)-1) do
local item = getContainerItem(container, slot)
if isContainer(item.uid) then
local itemsbag = getItemsInContainerById(item.uid, itemid)
for i=0, #itemsbag do
table.insert(items, itemsbag[i])
end
else
if itemid == item.itemid then
table.insert(items, item.uid)
end
end
end
end
return items
end

function getPokeballsInContainer(container) -- Function By Kydrai
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getPokeballsInContainer(item.uid)
					for i=0, #itemsbag do
						table.insert(items, itemsbag[i])
					end
				elseif isPokeball(item.itemid) then
					table.insert(items, item.uid)
				end
		end
	end
return items
end

function getItensUniquesInContainer(container)    --alterado v2.6
if not isContainer(container) then return {} end
local items = {}
if isContainer(container) and getContainerSize(container) > 0 then
   for slot=0, (getContainerSize(container)-1) do
       local item = getContainerItem(container, slot)
       if isContainer(item.uid) then
          local itemsbag = getItensUniquesInContainer(item.uid)
          for i=0, #itemsbag do
	          table.insert(items, itemsbag[i])
          end
       elseif getItemAttribute(item.uid, "unique") then
          table.insert(items, item)
       end
   end
end
return items
end