function onUse(cid, item, frompos, item2, topos)
local summon = getCreatureSummons(cid)[1]
	tabela_status = {
	[13365] = {name="offense", value = 10},
	[13366] = {name="defense", value = 10},
	[13367] = {name="speed", value = 10},
	[13368] = {name="vitality", value = 10},
	[13369] = {name="specialattack", value = 10},
	}

	if #getCreatureSummons(cid) < 1 then
		doPlayerSendTextMessage((cid), 27, "[Apricorn] Solte-o Seu Pokemon Para Dar o Apricorn!.")
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
doSendAnimatedText(getThingPos(summon), "Apricorn!", 215)
	doPlayerSendTextMessage((cid), 27, "[Apricorn] Seu Pokemon "..pokename.." Ganhou "..status.value.." "..status.name.." points!")
	doSendFlareEffect(getThingPos(cid))
return true
end