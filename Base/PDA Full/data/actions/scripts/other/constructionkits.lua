local CONSTRUCTIONS = {
	[3901] = 11705, [3902] = 11709, [3903] = 11713, [3904] = 11693, [3905] = 11498, [3906] = 11498, [3907] = 11492, [3908] = 2603, [3909] = 11481, [3910] = 11480,
	[3911] = 11479, [3912] = 11478, [3913] = 11477, [3914] = 3807, [3915] = 11468, [3916] = 11462, [3917] = 11461, [3918] = 11457, [3919] = 11455, [3920] = 11407,
	[3921] = 11405, [3922] = 11401, [3923] = 11397, [3924] = 11395, [3925] = 11502, [3926] = 2080, [3927] = 1676, [3928] = 2101, [3929] = 1614,[3930] = 8684,[3931] = 4996,[3932] = 10532,[3933] = 11549,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x == CONTAINER_POSITION) then
		doPlayerSendCancel(cid, "[House] Nao Pode Usar o Item Dentro da Bag!.")
	elseif(not getTileInfo(fromPosition).house) then
		doPlayerSendCancel(cid,"[House] Voce Nao Pode Usar Esse Item Fora da House!.")
	elseif(CONSTRUCTIONS[item.itemid] ~= nil) then
		doTransformItem(item.uid, CONSTRUCTIONS[item.itemid])
		doSendMagicEffect(fromPosition, 12)
	else
		return false
	end

	return true
end