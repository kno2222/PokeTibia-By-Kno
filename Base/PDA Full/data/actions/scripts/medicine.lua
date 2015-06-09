function onUse(cid, item, frompos, item2, topos)  --alterado v2.8 \/ ajeitado!

	if not isSummon(item2.uid) then return doPlayerSendCancel(cid, "[Medicine Potion] Voce so Pode Dar Medicine Potion com Pokemon Fora da ball!.") end
	if getCreatureMaster(item2.uid) ~= cid then return doPlayerSendCancel(cid, "Sadece Kendi Pokemonunuza Potion Kullanabilirsiniz.") end
	if getPlayerStorageValue(cid, 52481) >= 1 then return doPlayerSendCancel(cid, "Duello Sirasinda Potion Kullanamazsiniz.") end
	
	local pokeball = getPlayerSlotItem(cid, 8)
    doCureBallStatus(pokeball.uid, "all")
    doCureStatus(item2.uid, "all", false)         
    if (getCreatureCondition(item2.uid, CONDITION_PARALYZE) == true) then
	   doRemoveCondition(item2.uid, CONDITION_PARALYZE)
    end
    if getCreatureSpeed(item2.uid) < getSpeed(item2.uid) then     
       doRegainSpeed(item2.uid)
    end                                                               
	doSendMagicEffect(getThingPos(item2.uid), 14)
	doRemoveItem(item.uid, 1)

return true
end