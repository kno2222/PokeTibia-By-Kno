bpslot = CONST_SLOT_BACKPACK --em outros servers, pode ser que seja CONST_SLOT_AMMO o lugar onde fica a backpack no inventory

ginasios = {
["Brock"] = { storage = 990,
	      msgdefeat = "You lost! You aren't strong enough yet, don't come back until you get stronger!",
	      msgafk = "Go away if you don't have any pokemons!",
	      msgwin = "Congratulations, you were strong enough to win this battle fairly! Take this Earth Badge as reward.",
	      [1] = { msggo = "Lets fight then! I choose you, Geodude!",
			msgba = "That's enough, Geodude!",
			pokem = "Brock Geodude",
			nextp = "Brock Graveler"},
	      [2] = { msggo = "It's your turn, Graveler!",
			msgba = "Come back, Graveler!",
			pokem = "Brock Graveler",
			nextp = "Brock Golem"},
	      [3] = { msggo = "Crush'em, Golem!",
			msgba = "You did well, Golem!",
			pokem = "Brock Golem",
			nextp = "finish"}},
["Bruna"] = {storage = 992,
	     msgwin = "SHIT! i lost :D",
	     msgafk = "Leave seu fdp...",
	     msgdefeat = "PFFFF, KKK PERDEU OTARIO!",
		[1] = { msggo = "� agora seu bosta!",
			msgba = "Porra, que merda mlk",
			pokem = "Pidgeot s",
			nextp = "Poliwrath s"},
		[2] = { msggo = "Agora ta fudido",
			msgba = "Ah vai se fude",
			pokem = "Poliwrath s",
			nextp = "finish"}}
}

function noPokeAtAll(cid, gympoke, npcname, msgafk)
	 if not isCreature(cid) then
         return false
	 end
	 if not isCreature(gympoke) then
         return false
	 end
	 if #getCreatureSummons(cid) == 0 and getPlayerStorageValue(cid, 991) == 0 and getPlayerStorageValue(cid, ginasios[npcname].storage) ~= 2 then
	 setPlayerStorageValue(cid, 991, -1)
	 doCreatureSay(getCreatureByName(npcname), msgafk, 1)
         doSendMagicEffect(getThingPos(gympoke), 10)
	 setPlayerStorageValue(cid, ginasios[npcname].storage, 0)
         doRemoveCreature(gympoke)
	return true
	end
end
 
function gymChecker(cid, duel, nb, npcname)
         if not isCreature(cid) then
         return true
         end
	 if not isCreature(duel) then
	 doSendMagicEffect(getThingPos(cid), 10)
	 doRemoveCreature(cid)
	 return true
	 end
	 if getDistanceBetween(getThingPos(getCreatureByName(npcname)), getThingPos(duel)) >= 8 then
            doSendMagicEffect(getThingPos(cid), 10)
            doRemoveCreature(cid)
            setPlayerStorageValue(duel, ginasios[npcname].storage, 0)
	 return true
	 end
	 if isCreature(duel) and getPlayerStorageValue(duel, 991) == 0 then
	 addEvent(noPokeAtAll, 6000, duel, cid, npcname, ginasios[npcname].msgafk)
	 end
         if isCreature(duel) and getPlayerStorageValue(duel, 991) == -1 then
            doSendMagicEffect(getThingPos(cid), 10)
            doRemoveCreature(cid)
            setPlayerStorageValue(duel, ginasios[npcname].storage, 0)
            doCreatureSay(getCreatureByName(npcname), ginasios[npcname].msgdefeat, 1)
         return true
         end
         if isCreature(duel) and not hasPokemon(duel) then
         setPlayerStorageValue(duel, 991, -1)
         end
         if not isCreature(getCreatureTarget(cid)) then
            if nb == 0 then
            addEvent(gymChecker, 200, cid, duel, 1, npcname)
            else
            doSendMagicEffect(getThingPos(cid), 10)
            doRemoveCreature(cid)
                if isCreature(duel) then
                setPlayerStorageValue(duel, ginasios[npcname].storage, 0)
                end
            end
         return true
         end
         addEvent(gymChecker, 1000, cid, duel, 0, npcname)
end

function hasPokemon(cid)

	if #getCreatureSummons(cid) >= 1 then
	return true
	end

	local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local bp = getPlayerSlotItem(cid, bpslot)

	for a, b in pairs (pokeballs) do
		if item.itemid == b.on or #getItemsInContainerById(bp.uid, b.on) >= 1 then
			return true
		end
	end

	return false
	end

function doGymBattle(npcname, gympoke, cid, turn)
	doCreatureSay(getCreatureByName(npcname), ginasios[npcname][turn].msggo, 1)
	local x = doSummonCreature(gympoke, getThingPos(getCreatureByName(npcname)))
	registerCreatureEvent(x, "Gym1")
	registerCreatureEvent(x, "Gym2")
	registerCreatureEvent(x, "Gym3")
	registerCreatureEvent(x, "Gym4")
	setPlayerStorageValue(x, 201, ".")
	setPlayerStorageValue(x, 201, npcname)
	setPlayerStorageValue(x, 202, turn)
	doSendMagicEffect(getThingPos(x), 10)
	setPlayerStorageValue(x, ginasios[npcname].storage, 1)
	addEvent(gymChecker, 1000, x, cid, 0, npcname)
end

--ex: doGymBattle("Brock", "Brock Geodude", cid, 1)