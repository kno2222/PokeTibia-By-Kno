function onUse(cid, item, fromPos, item2, toPos)

if getPlayerStorageValue(cid, 54843) == -1 then
   setPlayerStorageValue(cid, 54843, 0)
end

if getPlayerStorageValue(cid, 54844) == -1 then
   setPlayerStorageValue(cid, 54844, 0)
end

		local stt = {}                                               --alterado v2.9 \/

		table.insert(stt, "� Attempts to catch: "..getPlayerStorageValue(cid, 54843).."\n")
		table.insert(stt, "� Successful catches: "..getPlayerSoul(cid).."\n")
		table.insert(stt, "� Failed catches: "..getPlayerStorageValue(cid, 54843) - getPlayerSoul(cid).."\n\n")
		
		table.insert(stt, "Caught Pokemon Species:\n")

local t = getCatchList(cid)

if #t <= 0 then
	table.insert(stt, "\nNone.") --alterado v2.9  \/
	doShowTextDialog(cid, 12690, table.concat(stt))
return true
end

for b = 1, #oldpokedex do
	for a = 1, #t do
		if t[a] == oldpokedex[b][1] then
         table.insert(stt, "\n["..threeNumbers(b).."] - "..t[a].."") --alterado v2.9
		end
	end
end
		
	doShowTextDialog(cid, 12690, table.concat(stt)) --alterado v2.9
return true
end