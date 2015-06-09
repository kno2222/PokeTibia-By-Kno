local EFFECTS = {
	--[OutfitID] = {Effect}
	["Magmar"] = 35,   
	["Magmortar"] = 35,   
	["Shiny Magmar"] = 35,
	["Jynx"] = 17,          --alterado v2.5
	["Shiny Jynx"] = 17,  
   ["Mamoswine"] = 205,  
   ["Piloswine"] = 205,  --alterado v2.8
   ["Swinub"] = 205,  
}

function onUse(cid, item, frompos, item2, topos)


if getPlayerStorageValue(cid,130130) >= 1 then 
doPlayerSendTextMessage(cid, 19, "Nao Pode Dar Goback Nessa Area.")
return true
end

if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end

if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 
or getPlayerStorageValue(cid, 75846) >= 1 or getPlayerStorageValue(cid, 5700) >= 1  then    --alterado v2.9 <<
   return true                                                                                                                        
end

local ballName = getItemAttribute(item.uid, "poke")
local btype = getPokeballType(item.itemid)
local usando = pokeballs[btype].use

local effect = pokeballs[btype].effect
	if not effect then
		effect = 21
	end
	
unLock(item.uid) --alterado v2.8
if item.itemid == usando then
--if getPlayerGroupId == 8 then
--doPlayerSendTextMessage(cid, 19, "TESTS 1!")
--setPlayerGroupId(cid,1) 
--return true
--end  


                          
   if getPlayerStorageValue(cid, 990) == 1 then -- GYM
		doPlayerSendCancel(cid, "You can't return your pokemon during gym battles.")
	   return true
	end
	
	if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v2.6
       if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
          BackTeam(cid)       
       end
    end 
    
    if #getCreatureSummons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
       doPlayerSendCancel(cid, "You can't do that while is controling a mind")
       return true     --alterado v2.5
    end
    
	 if #getCreatureSummons(cid) <= 0 then
	    if isInArray(pokeballs[btype].all, item.itemid) then
		    doTransformItem(item.uid, pokeballs[btype].on)
			 doItemSetAttribute(item.uid, "hp", 1)
			 --setPlayerGroupId(cid,1)
			 doPlayerSendCancel(cid, "[Ball-Desbloqueado] Balls Desbloqueado com Sucesso!")
			 doPlayerSendTextMessage(cid, 21, "[Ball-Desbloqueado] Balls Desbloqueado com Sucesso!")
			            doSendMagicEffect(getThingPos(cid), 29)
           doSendAnimatedText(getCreaturePosition(cid),"Unlock",math.random(1,255)) 
		    return true
		 end
    end

    local cd = getCD(item.uid, "blink", 30)
    if cd > 0 then
       setCD(item.uid, "blink", 0)
    end
    
	 local z = getCreatureSummons(cid)[1]

	 if getCreatureCondition(z, CONDITION_INVISIBLE) and not isGhostPokemon(z) then
	    return true
	 end
    doReturnPokemon(cid, z, item, effect)
elseif item.itemid == pokeballs[btype].on then
--doPlayerSendTextMessage(cid, 19, "TESTS 3!")
--setPlayerGroupId(cid,8) 

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
if not isInArray({5, 6}, getPlayerGroupId(cid)) then                          --alterado v2.9 \/
   local balls = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
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

	if getPlayerLevel(cid) + pokemonMaxLevelAbovePlayer < getItemAttribute(item.uid, "level") + boosts then
	   doPlayerSendCancel(cid, "Your pokemon's level is much higher than yours, you can't use him.")
	   return true
    end
    doSummonMonster(cid, pokemon)

	 local pk = getCreatureSummons(cid)[1]
	 if not isCreature(pk) then return true end
	 ------------------------passiva hitmonchan------------------------------
	 if isSummon(pk) then                                                  --alterado v2.8 \/
       if pokemon == "Shiny Hitmonchan" or pokemon == "Hitmonchan" then
          if not getItemAttribute(item.uid, "hands") then
             doSetItemAttribute(item.uid, "hands", 0)
          end
          local hands = getItemAttribute(item.uid, "hands")
          doSetCreatureOutfit(pk, {lookType = hitmonchans[pokemon][hands].out}, -1)
       end
    end
	-------------------------------------------------------------------------
    ---------movement magmar, jynx-------------
    if EFFECTS[getCreatureName(pk)] then             
       markPosEff(pk, getThingPos(pk))
       sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk)) --alterado v2.5
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

	if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end

	doCreatureSetLookDir(pk, 2)

	adjustStatus(pk, item.uid, true, false, true)
	doAddPokemonInOwnList(cid, pokemon)

	doTransformItem(item.uid, item.itemid+1)

	local pokename = getPokeName(pk) --alterado v2.7 

	local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	doCreatureSay(cid, mgo, TALKTYPE_SAY)

	doSendMagicEffect(getCreaturePosition(pk), effect)
	
	if useOTClient then
	   doPlayerSendCancel(cid, '12//,show') --alterado v2.7
    end

else
    doPlayerSendCancel(cid, "This pokemon is fainted.")
end

	if useKpdoDlls then
		doUpdateMoves(cid)
	end
return true
end