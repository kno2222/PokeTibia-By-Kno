function onUse(cid, item, frompos, item2, topos)
 local summon = getCreatureSummons(cid)[1]
	tabela_status = {
	[8301] = {name="offense", value = 2},
	[8302] = {name="defense", value = 2},
	[8303] = {name="speed", value = 2},
	[8298] = {name="vitality", value = 2},
	[8299] = {name="specialattack", value = 2},
	}


	if #getCreatureSummons(cid) < 1 then
		doPlayerSendTextMessage((cid), 27, "[Vitamina] Solte-o Seu Pokemon Para Dar a Vitamina!.")
		return false
	end	
	local pb = getPlayerSlotItem(cid, 8)
	local pokename = getItemAttribute(pb.uid, "poke")
	doRemoveItem(item.uid, 1)
	local status = tabela_status[item.itemid]
	local pbstat= getItemAttribute(pb.uid, status.name)
	local st = pbstat + tabela_status[item.itemid].value
	doItemSetAttribute(pb.uid, status.name , st)
	doSendFlareEffect(getThingPos(summon))
doSendAnimatedText(getThingPos(summon), "Vitamina!", 215)
	doPlayerSendTextMessage((cid), 27, "[Vitamina] Seu Pokemon "..pokename.." Ganhou "..status.value.." "..status.name.." points!")
	doSendFlareEffect(getThingPos(cid))
return true
end