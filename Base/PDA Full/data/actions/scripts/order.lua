local skills = specialabilities
local surfborders = {4644, 4645, 4646, 4647, 4648, 4649, 4650, 4651, 4652, 4653, 4654, 4655, 4656, 4657, 4658, 4659, 4660, 4661, 4662, 4663}

local txt = {
["rock smash"] = {"break that rock!", "smash that rock!", "destroy that rock!", "smash it!", "break it!", "destroy it!"},
["cut"] = {"cut that bush!", "cut it down!", "cut it off!", "cut off that bush!", "cut down that bush!", "cut that bush down!"},
["move"] = {"move!", "move there!", "go there!", "walk there!"},
["light"] = {"flash!", "light!", "flash this place!", "light up this place!"},
["dig"] = {"open that hole!", "dig that hole!", "open it!", "dig it!"},
["blink"] = {"teleport there!", "blink there!", "blink!", "teleport!"},
["ride"] = {"let me ride you!", "let's ride!", "let me mount you!", "let me get on you!"},
["fly"] = {"let's fly!", "let me get on you!"} ,
["untransform"] = {"go back to normal!", "transform into yourself again!", "stop transformation!"},
["headbutt"] = {"headbutt on three", "headbutt that three!", "headbutt it off"}, --alterado v2.6
}

function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,130130) >= 1 then 
doPlayerSendTextMessage(cid, 19, "Nao Pode Dar Order Nessa Area.")
return true
end
   if getPlayerStorageValue(cid,6598754) >= 1 or getPlayerStorageValue(cid, 6598755) >= 1  then 
doPlayerSendTextMessage(cid, 19, "[Order] Nao Pode usa Order Nessa Area.")
return true
end
	local checkpos = topos
	checkpos.stackpos = 0

	if getTileThingByPos(checkpos).uid <= 0 then return true end

--------END FLY/RIDE --------
if getCreatureCondition(cid, CONDITION_OUTFIT) and (item2.uid == cid or getRecorderPlayer(topos) == cid) and (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1) then

	if isInArray({460, 11675, 11676, 11677}, getTileInfo(getThingPos(cid)).itemid) then
        doPlayerSendCancel(cid, "You can\'t stop flying at this height!")
        return true
        end

	local item = getPlayerSlotItem(cid, 8)
	local pokemon = getItemAttribute(item.uid, "poke")
	local x = pokes[pokemon]

        if getTileInfo(getThingPos(cid)).itemid >= 4820 and getTileInfo(getThingPos(cid)).itemid <= 4825 then
        doPlayerSendCancel(cid, "You can\'t stop flying above the water!")
        return true
        end

	doSummonMonster(cid, pokemon)

	local pk = getCreatureSummons(cid)[1]

		if not isCreature(pk) then
			pk = doCreateMonster(pokemon, backupPos)
			if not isCreature(pk) then
				doPlayerSendCancel(cid, "You can't stop flying/riding here.")
			return true
			end
			doConvinceCreature(cid, pk)
		end

	doTeleportThing(pk, getThingPos(cid), false)
	doCreatureSetLookDir(pk, getCreatureLookDir(cid))

	adjustStatus(pk, item.uid, true, false, true)

	doPlayerSay(cid, ""..getPokeName(getCreatureSummons(cid)[1])..", let me get down!", 1)
	if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
       doRemoveCondition(cid, CONDITION_PARALYZE)
	   addEvent(doAddCondition, 10, cid, paralizeArea)             --alterado v2.4
    end
    
    if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
       doRemoveCondition(cid, CONDITION_PARALYZE)
	   addEvent(doAddCondition, 10, cid, paralizeArea2)             --alterado v2.5
    end
    doRegainSpeed(cid)
    
	doRemoveCondition(cid, CONDITION_OUTFIT)
	setPlayerStorageValue(cid, 17000, -1)
	setPlayerStorageValue(cid, 17001, -1)

return true
end


if #getCreatureSummons(cid) == 0 then return doPlayerSendCancel(cid, "You need a pokemon to use order!") end
if getCreatureNoMove(getCreatureSummons(cid)[1]) then return true end
markLP(getCreatureSummons(cid)[1], -1)

if getMarkedPos(getCreatureSummons(cid)[1]).x == topos.x and getMarkedPos(getCreatureSummons(cid)[1]).y == topos.y then
return true
end

local unfix = {x = 1, y = 1, z = 1}
local thisball = getPlayerSlotItem(cid, 8)
local mysum = getCreatureSummons(cid)[1]
local sid = mysum or cid
local maxMoveDist = getDistanceBetween(getThingPos(sid), topos) * 2 + 1

	markPos(mysum, topos)
	markOwnerPos(mysum, getThingPos(cid))

-------- ROCK SMASH ---------
if item2.itemid == 1285 and isInArray(skills["rock smash"], getPokemonName(mysum)) then

	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["rock smash"][math.random(1, #txt["rock smash"])].."", 1)
	addEvent(goThere, 500, mysum, topos, "rock smash", isCreature(getCreatureTarget(cid)))

return true
end
-----------------------------

-------- HEADBUTT -----------
if item2.itemid == 12591 and getPokemonLevel(mysum) >= 15 then  --alterado v2.6
                  --id do item  arvore normal
doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["headbutt"][math.random(1, #txt["headbutt"])].."", 1)
addEvent(goThere, 500, mysum, topos, "headbutt", isCreature(getCreatureTarget(cid)))

return true
end
-----------------------------

-------- CUT ----------------
if item2.itemid == 2767 and isInArray(skills["cut"], getPokemonName(mysum)) then

	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["cut"][math.random(1, #txt["cut"])].."", 1)
	addEvent(goThere, 500, mysum, topos, "cut", isCreature(getCreatureTarget(cid)))

return true
end
-----------------------------

-------- TRANSFORM ----------
if getCreatureName(mysum) == "Ditto" and isMonster(item2.uid) then
	if item2.uid == mysum then
		if isTransformed(mysum) then
			deTransform(mysum, getItemAttribute(thisball.uid, "transTurn"))
			markPos(mysum, unfix)
			doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["untransform"][math.random(1, #txt["untransform"])].."", 1)
		return true
		end
	doPlayerSendCancel(cid, "Your ditto is not transformed.")
	markPos(mysum, unfix)
	return true
	end

	if getCreatureName(item2.uid) == "Ditto" then
		doPlayerSendCancel(cid, "Your ditto can't transform into another ditto.")
		markPos(mysum, unfix)
	return true
	end

	if getCreatureName(item2.uid) == getPlayerStorageValue(mysum, 1010) then
		doPlayerSendCancel(cid, "Your ditto is already transformed into that pokemon.")
		markPos(mysum, unfix)
	return true
	end

	local cd = getCD(thisball.uid, "trans", 40)

	if cd > 0 then
	doPlayerSendCancel(cid, "Your pokemon is too tired to transform again. Cooldown: ("..getStringmytempo(cd)..")")
	return true
	end

	if getHappiness(mysum) <= 50 then
		doSendMagicEffect(getThingPos(mysum), happinessRate[1].effect)
		markPos(mysum, unfix)
	return true
	end

	local turn = getItemAttribute(thisball.uid, "transTurn")

		if not turn or turn > 10 then
			doItemSetAttribute(thisball.uid, "transTurn", 0)
		else
			doItemSetAttribute(thisball.uid, "transTurn",  turn + 1)
		end

	local time = 140 + 2 * getPokemonLevel(mysum)

	turn = getItemAttribute(thisball.uid, "transTurn")

	markPos(mysum, unfix)
	setPlayerStorageValue(mysum, 1010, getCreatureName(item2.uid))
	doSetCreatureOutfit(mysum, getCreatureOutfit(item2.uid), -1)
	addEvent(deTransform, time * 1000, mysum, turn)
	doSendMagicEffect(getThingPos(mysum), 184)
	doCreatureSay(mysum, "TRANSFORM!", TALKTYPE_MONSTER)
	local name = getCreatureName(item2.uid)
	setCD(thisball.uid, "trans", 40)
	doItemSetAttribute(thisball.uid, "transBegin", os.clock())
	doSetItemAttribute(thisball.uid, "transLeft", time)
	doSetItemAttribute(thisball.uid, "transOutfit", getCreatureOutfit(item2.uid).lookType)
	doSetItemAttribute(thisball.uid, "transName", getCreatureName(item2.uid))
	doFaceCreature(mysum, getThingPos(item2.uid))
	doPlayerSay(cid, ""..getPokeName(mysum)..", transform into "..getArticle(name).." "..name.."!", 1)

    if useKpdoDlls then
		doUpdateMoves(cid)  --alterado v2.6
	end
	
		if dittoCopiesStatusToo then
			doSetItemAttribute(thisball.uid, "boffense", dittoBonus * getOffense(item2.uid))
			doSetItemAttribute(thisball.uid, "bdefense", dittoBonus * getDefense(item2.uid))
			doSetItemAttribute(thisball.uid, "bsattack", dittoBonus * getSpecialAttack(item2.uid))
			doSetItemAttribute(thisball.uid, "bagility", dittoBonus * getSpeed(item2.uid))
			adjustStatus(mysum, thisball.uid)
		end

return true
end
-----------------------------

-------- LIGHT --------------
if isMonster(item2.uid) and getCreatureMaster(item2.uid) == cid then

	markPos(mysum, unfix)

	if not isInArray(skills["light"], getPokemonName(item2.uid)) then
	doPlayerSendCancel(cid, "Your pokemon can't use flash.")
	return true
	end
	
	local cd = getCD(thisball.uid, "light", 30)

	if cd > 0 then
	doPlayerSendCancel(cid, "Your pokemon is too tired to use flash. Cooldown: ("..getStringmytempo(cd)..")")
	return true
	end

	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["light"][math.random(1, #txt["light"])].."", 1)
	doCreatureSay(mysum, "FLASH!", TALKTYPE_MONSTER)
	doSendMagicEffect(getThingPos(mysum), 28)

	local size = 5
		size = size + math.floor(getSpecialAttack(mysum) / 60)
		size = size + math.ceil(getPokemonLevel(mysum) / 60)

		if size > 11 then
			size = 11
		end

	doSetCreatureLight(mysum, size, 215, 600*1000)

	local delay = math.floor(30 - getPokemonLevel(mysum) / 4)
		if delay > 0 then
		setCD(thisball.uid, "light", delay)
		end

return true
end
-----------------------------


-------- DIG ----------------
if isInArray(skills["digholes"], item2.itemid) and isInArray(skills["dig"], getPokemonName(mysum)) then

	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["dig"][math.random(1, #txt["dig"])].."", 1)
	addEvent(goThere, 500, mysum, topos, "dig", isCreature(getCreatureTarget(cid)))

return true
end
-----------------------------


-------- BLINK / MOVE -------

if not isCreature(item2.uid) and isInArray(skills["blink"], getPokemonName(mysum)) then

	local cd = getCD(thisball.uid, "blink", 30)
	
	if getPlayerStorageValue(mysum, 2365487) ==  1 then
	return true                  --alterado v2.4
	end

	if cd > 0 or not canWalkOnPos(topos, false, false, true, true, true) then

		doPlayerSendCancel(cid, "Blink cooldown: ("..getStringmytempo(cd)..")")
		doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["move"][math.random(1, #txt["move"])].."", 1)
		addEvent(goThere, 500, mysum, topos, "move", isCreature(getCreatureTarget(cid)), maxMoveDist)

	return true
	end

	local CD = isShinyName(getCreatureName(mysum)) and 20 or 30   --edited blink

	markPos(mysum, topos)
	markOwnerPos(mysum, getThingPos(cid))
	setCD(thisball.uid, "blink", CD)
	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["blink"][math.random(1, #txt["blink"])].."", 1)
	doSendDistanceShoot(getThingPos(mysum), topos, 39)
	doSendMagicEffect(getThingPos(mysum), 211)
	doTeleportThing(mysum, topos, false)
	doSendMagicEffect(topos, 134)
	doCreatureSay(mysum, "BLINK!", TALKTYPE_MONSTER)
	goThere(mysum, topos, "blink", isCreature(getCreatureTarget(cid)))  --edited blink

return true
end
-----------------------------


----START FLYorRIDE ---------

if (item2.uid == cid or getRecorderPlayer(topos) == cid) and (isInArray(skills["fly"], getPokemonName(mysum)) or isInArray(skills["ride"], getPokemonName(mysum))) then




    if getPlayerStorageValue(cid, 212124) >= 1 then         --alterado v2.6
       return doPlayerSendCancel(cid, "You can't do it with a pokemon with mind controlled!")
    end
    
    if getPlayerStorageValue(cid, 52480) >= 1 then
       return doPlayerSendCancel(cid, "You can't do it while a duel!")  --alterado v2.6
    end 
    
    if getPlayerStorageValue(cid, 5700) == 1 then
       doPlayerSendCancel(cid, "You can't do that while is mount in a bike!") --edited prote�ao pra bike
       return true
    end
    
	local pct = getCreatureHealth(mysum) / getCreatureMaxHealth(mysum)
	doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hp", 1 - pct)

	if isInArray(skills["fly"], getPokemonName(mysum)) then
	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["fly"][math.random(1, #txt["fly"])].."", 1)
	addEvent(goThere, 500, mysum, topos, "fly", isCreature(getCreatureTarget(cid)))
	else
	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["ride"][math.random(1, #txt["ride"])].."", 1)
	addEvent(goThere, 500, mysum, topos, "ride", isCreature(getCreatureTarget(cid)))
	end

return true
end
----------------------------------Control Mind--------------------------------------------   alterado v2.5
if isCreature(item2.uid) and ehMonstro(item2.uid) and isInArray(skills["control mind"], getCreatureName(mysum)) and item2.uid ~= mysum then
   if not isCreature(item2.uid) then
   return true
   end

   if isSleeping(mysum) then
      return doPlayerSendCancel(cid, "Your pokemon is sleeping...zZzZ")
   end

   if getTileInfo(getThingPos(cid)).protection or getTileInfo(getThingPos(getCreatureSummons(cid)[1])).protection then
      return doPlayerSendCancel(cid, "You or your pokemon are in Pz zone!")
   end
  
   if #getCreatureSummons(cid) == 2 then
      return doPlayerSendCancel(cid, "You only can control one Pokemon!")
   end

   local cd = getCD(thisball.uid, "control", 120)
   
   if cd > 0 then
      doPlayerSendCancel(cid, "You have to wait "..cd.." segs to use Control Mind again!")
      return true
   end
   
   if getPokemonLevel(item2.uid) >= getPokemonLevel(mysum) then
      return doPlayerSendCancel(cid, "Your pokemon can't control this mind!")
   end
   
local cmed = item2.uid
setCD(thisball.uid, "control", 120) 
doSendDistanceShoot(getThingPos(mysum), getThingPos(cmed), 39)
--------------
setPlayerStorageValue(cid, 212124, 1)
doConvinceCreature(cid, cmed) 
setPlayerStorageValue(cmed, 212123, 1) 
doCreatureSay(cid, ""..getCreatureName(mysum)..", control "..string.lower(getCreatureName(cmed)).."'s mind!", 1)

local cmname = getCreatureName(mysum)
local cmpos = getThingPos(mysum)
local pokelife = (getCreatureHealth(mysum) / getCreatureMaxHealth(mysum))
doItemSetAttribute(thisball.uid, "hp", pokelife)
doRemoveCreature(mysum)
local cmzao = doSummonCreature(""..cmname.." cm", cmpos)
doConvinceCreature(cid, cmzao)
setPlayerStorageValue(cid, 888, 1)
if useKpdoDlls then
   doUpdateMoves(cid)
end

local function check(cid, controled, rod)
if isCreature(cid) then
ball2 = getPlayerSlotItem(cid, 8)
   if getPlayerStorageValue(cid, 888) <= 0 then
   return true
   end
   if not isCreature(controled) then
      setPlayerStorageValue(cid, 212124, 0)
      local sum = isCreature(getCreatureSummons(cid)[1]) and getCreatureSummons(cid)[1] or getCreatureSummons(cid)[2] 
      local pkcmpos = getThingPos(sum)
      doRemoveCreature(sum)
      local item = getPlayerSlotItem(cid, 8)
      local pk = doSummonCreature(getItemAttribute(item.uid, "poke"), pkcmpos)
      doConvinceCreature(cid, pk)
      doCreatureSetLookDir(getCreatureSummons(cid)[1], 2)
      addEvent(doAdjustWithDelay, 100, cid, pk, true, true, false)
      setPlayerStorageValue(cid, 888, 0)
      cleanCMcds(item.uid)
      registerCreatureEvent(pk, "SummonDeath")  --alterado v2.6
      if useKpdoDlls then
         doUpdateMoves(cid)
      end
      return true
   end
   
   if rod <= 0 then
      --Pokemon controlado
      local cmed2 = getCreatureSummons(cid)[1]
	  local poscmed = getThingPos(cmed2)
	  local cmeddir = getCreatureLookDir(cmed2)
	  local namecmed = getCreatureName(cmed2)
	  local gender = getPokemonGender(cmed2)
	  local level = getWildPokemonLevel(cmed2)
	  local hp, maxHp = getCreatureHealth(getCreatureSummons(cid)[1]), getCreatureMaxHealth(getCreatureSummons(cid)[1])
	  doRemoveCreature(getCreatureSummons(cid)[1])
	  local back = doCreateMonster(namecmed, poscmed)
	  addEvent(doCreatureSetSkullType, 150, back, gender)
	  addEvent(setWildPokemonLevel, 150, back, level)
      doWildAttackPlayer(back, cid)
	  doCreatureSetLookDir(back, cmeddir)
	  addEvent(doCreatureAddHealth, 100, back, hp-maxHp)
	
	  -- pokemon controlador	
      local mynewpos = getThingPos(getCreatureSummons(cid)[1])
      doRemoveCreature(getCreatureSummons(cid)[1])
      local pk2 = doSummonCreature(getItemAttribute(ball2.uid, "poke"), mynewpos) 
      doConvinceCreature(cid, pk2)
      addEvent(doAdjustWithDelay, 100, cid, pk2, true, true, false)
      setPlayerStorageValue(cid, 888, 0)
      doCreatureSetLookDir(getCreatureSummons(cid)[1], 2)
      setPlayerStorageValue(cid, 212124, 0)
      cleanCMcds(ball2.uid)
      registerCreatureEvent(pk2, "SummonDeath")  --alterado v2.6
      if useKpdoDlls then
         doUpdateMoves(cid)
      end
   else
       if isInArray({"Haunter", "Gengar", "Shiny Gengar"}, cmname) then
          doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 214)
       else 
          doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 220)
       end
   end
end
addEvent(check, 500, cid, controled, rod-1)
end

check(cid, cmed, 40) 
return true
end
---------------------------------------------------------------------
-------- MOVE / END ---------
    
	local onlyWater = false

	if isWater(getTileThingByPos(checkpos).itemid) then
		onlyWater = true
		for checkwater = 0, 7 do
			if not isWater(getTileThingByPos(getPosByDir(checkpos, checkwater)).itemid) then
				onlyWater = false
			end
		end
	end

	if onlyWater then
		doPlayerSendCancel(cid, "Destination is not reachable.")
	return true
	end

	doPlayerSay(cid, ""..getPokeName(mysum)..", "..txt["move"][math.random(1, #txt["move"])].."", 1)
	
	if isCreature(getCreatureTarget(cid)) then
	   goThere(mysum, topos, "move", isCreature(getCreatureTarget(cid)), maxMoveDist)           
	else
       addEvent(goThere, 500, mysum, topos, "move", isCreature(getCreatureTarget(cid)), maxMoveDist)                 
	end	
-----------------------------
return true
end