function onUse(cid, item, frompos, item2, topos)
local tempo = 1 
if getPlayerStorageValue(cid, 102930) > os.time() then
return doPlayerSendTextMessage(cid,19, "[Rare Candy] Aguarde "..getPlayerStorageValue(cid, 102930) - os.time().." segundo(s) Para usar Rare Candy Novamente!.")
end


local summon = getCreatureSummons(cid)[1]

	if not isCreature(summon) then
		doPlayerSendCancel(cid, "Precisa de um Pokemon Para dar o Rare Candy!.")
	return true
	end

	if getCreatureHealth(summon) == 0 then return true end

	local pb = getPlayerSlotItem(cid, 8)

	if getLevel(summon) >= 300 then
		doPlayerSendCancel(cid, "Seu Pokemon ja Esta no Level Maximo.")
	return true
	end

	doPlayerSendTextMessage(cid, 27, "Voce deu A Bala Rare Candy Para o "..getPokeName(summon)..".")

	doCreatureSay(cid, getPokeName(summon)..", take this candy!", TALKTYPE_SAY)
	doRemoveItem(item.uid, 1)


	local level = getItemAttribute(pb.uid, "level")
	local exp = getItemAttribute(pb.uid, "exp")
	local neededexp = getItemAttribute(pb.uid, "nextlevelexp")

	if getHappiness(summon) < 50 then
		doSendMagicEffect(getThingPos(summon), 168)
	return true
	end
    setPlayerStorageValue(cid, 102930, os.time() + tempo * 5)
	doCreatureSay(summon, "Yum.", TALKTYPE_ORANGE_1)
	doItemSetAttribute(pb.uid, "rarecandy", level + 1)
 setPlayerStorageValue(cid,5050,getPlayerStorageValue(cid,5050)+1)   
	doItemSetAttribute(pb.uid, "exp", exp + neededexp)
	doPlayerSendTextMessage(cid, 26, "sounds/Levelup.wav")
doPlayerSendTextMessage(cid, 19, "[Rare Candy] Cuidado com a Diferença de Uso de Pokes Diferença de Level do Player Para Pokelevel [10]!")
	doPlayerSendTextMessage(cid, 27, "[Rare Candy] O Pokemon "..getPokeName(summon).." Ganhou Uma Bala!")
	 doPlayerSendTextMessage(getCreatureMaster(cid),MESSAGE_EVENT_ORANGE,"Voce Agora Tem ["..(getPlayerStorageValue(getCreatureMaster(cid),5050) + 1).."] Candies Score. Digita !rp ou /rp .")
    doSendFlareEffect(getThingPos(summon))
	doSendAnimatedText(getThingPos(summon), "Level up!", 215)
	adjustPokemonLevel(pb.uid, cid, pb.itemid, true)

return true
end
	