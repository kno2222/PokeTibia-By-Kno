function onUse(cid, item, frompos, item2, topos)

	tabela_status = {
	[13365] = {name="offense", value = 5},
	[13366] = {name="defense", value = 5},
	[13367] = {name="speed", value = 5},
	[13368] = {name="vitality", value = 5},
	[13369] = {name="specialattack", value = 5},
	}

	if #getCreatureSummons(cid) < 1 then
		doPlayerSendCancel(cid, "[Apricorn] Solte-o Seu Pokemon Para Dar o Apricorn!.")
		return false
	end	
	local pb = getPlayerSlotItem(cid, 8)
	local pokename = getItemAttribute(pb.uid, "poke")
	doRemoveItem(item.uid, 1)
	local status = tabela_status[item.itemid]
	local pbstat= getItemAttribute(pb.uid, status.name)
	local st = pbstat + tabela_status[item.itemid].value
	doItemSetAttribute(pb.uid, status.name , st)
	doPlayerSendTextMessage((cid), 27, "[Apricorn] Seu Pokemon "..pokename.." Ganhou "..status.value.." "..status.name.." points!")
	doSendFlareEffect(getThingPos(cid))
return true
end