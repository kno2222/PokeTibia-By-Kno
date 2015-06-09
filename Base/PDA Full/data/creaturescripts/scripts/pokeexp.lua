local balls = {10975, 11826, 11828, 11829, 11831, 11832, 11834, 11835, 11837, 12972,
	       11737, 11739, 11740, 11742, 11743, 11745, 11746, 11748, 12621, 13259}
                                                                                  
local function playerAddExp(cid, exp)
	doPlayerAddExp(cid, exp)
	doSendAnimatedText(getThingPos(cid), exp, 215)
end


function onDeath(cid, corpse, deathList)
        
	--if not isCreature(cid) then return true end
	if isSummon(cid) or not deathList or corpse.itemid == 0 or getCreatureName(cid) == "Evolution" then return true end

    -------------Edited Golden Arena-------------------------
    if getPlayerStorageValue(cid, 22546) == 1 then
       setGlobalStorageValue(22548, getGlobalStorageValue(22548)-1)
       doItemSetAttribute(corpse.uid, "golden", 1)    --alterado v2.6
    end                                                                                                                  --alterado v2.4
    if getPlayerStorageValue(cid, 22546) == 1 and (getGlobalStorageValue(22547) == -1 or getGlobalStorageValue(22547) == #wavesGolden+1) and getGlobalStorageValue(22548) <= 0 then
       for _, sid in ipairs(getPlayersOnline()) do
           if getPlayerStorageValue(sid, 22545) == 1 then
              doPlayerSendTextMessage(sid, 20, "You have win the golden arena! Take your reward!")
              doPlayerAddItem(sid, 2152, 100)   --premio
              setPlayerStorageValue(sid, 22545, -1)
              doTeleportThing(sid, getClosestFreeTile(sid, posBackGolden), false) --alterado v2.4
           end                                                              --nao esqueçam de fazer as alteraçoes no lib/configuration.lua!!
       end
    end 
    ---------------------------------------------------
    
	local givenexp =  getWildPokemonExp(cid)
	local expstring = ""..cid.."expEx"
	local killer = getItemAttribute(corpse.uid, "corpseowner")  

if givenexp > 0 then
for a = 1, #deathList do
local pk = deathList[a]
	if isCreature(pk) then
	playerAddExp(pk, math.floor(playerExperienceRate * givenexp))
	local firstball = getPlayerSlotItem(pk, 8)

		if firstball and getItemAttribute(firstball.uid,  expstring) and getItemAttribute(firstball.uid,  expstring) > 0 then
			local percent = getItemAttribute(firstball.uid, expstring) <= 1 and getItemAttribute(firstball.uid, expstring) or 1
			local gainexp = math.ceil(percent * givenexp)
			doItemSetAttribute(firstball.uid, expstring, 0)
			givePokemonExp(pk, firstball, gainexp)
		end

		for b = 1, #balls do
			local pokes = getItemsInContainerById(getPlayerSlotItem(pk, 3).uid, balls[b])
				if #pokes >= 1 then
					for _, uid in pairs (pokes) do
						if getItemAttribute(uid,  expstring) and getItemAttribute(uid,  expstring) > 0 then
						local percent = getItemAttribute(uid, expstring) <= 1 and getItemAttribute(uid, expstring) or 1
						local gainexp = math.ceil(percent * givenexp)
						doItemSetAttribute(uid, expstring, 0)
						givePokemonExpInBp(pk, uid, gainexp, balls[b])
						end
					end
				end
		end
	end
end
end


	

doItemSetAttribute(corpse.uid, "offense", getPlayerStorageValue(cid, 1011))
doItemSetAttribute(corpse.uid, "defense", getPlayerStorageValue(cid, 1012))
doItemSetAttribute(corpse.uid, "speed", getPlayerStorageValue(cid, 1013))
doItemSetAttribute(corpse.uid, "vitality", getPlayerStorageValue(cid, 1014))
doItemSetAttribute(corpse.uid, "spattack", getPlayerStorageValue(cid, 1015))
doItemSetAttribute(corpse.uid, "level", getLevel(cid))
doItemSetAttribute(corpse.uid, "gender", getPokemonGender(cid))
return true
end