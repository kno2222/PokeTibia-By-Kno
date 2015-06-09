function onSay(cid, words, param, channel)
	local house = getHouseFromPos(getCreaturePosition(cid))
	if(not house) then
		doPlayerSendCancel(cid, "Evin �cinde Degilsiniz.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return false
	end

	local owner = getHouseInfo(house).owner
	if(owner ~= getPlayerGUID(cid) and (owner ~= getPlayerGuildId(cid) or getPlayerGuildLevel(cid) ~= GUILDLEVEL_LEADER)) then
		doPlayerSendCancel(cid, "Bu Evin Sahibi Degilsiniz.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return false
	end

	setHouseOwner(house, 0)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
	return false
end
