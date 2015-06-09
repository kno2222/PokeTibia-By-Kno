function onUse(cid, item, frompos, item2, topos)

--doPlayerAddSkill(cid, 4, 1)
doPlayerAddSkillTry(cid,1,2)
                         --1
   if getPlayerStorageValue(cid,6598754) >= 1 or getPlayerStorageValue(cid, 6598755) >= 1  then 
doPlayerSendTextMessage(cid, 19, "[Revive] Nao Pode usa Revive Nessa Area.")
return true
end



	if getPlayerStorageValue(cid, 990) >= 1 then
		doPlayerSendCancel(cid, "GYM Savasinda Revive Kullanamazsiniz.")
	return true
	end
    
    if getPlayerStorageValue(cid, 52481) >= 1 then
	   return doPlayerSendCancel(cid, "Savastayken Revive Kullanamazsiniz.")  --alterado v2.6
    end
                 --
	if item2.itemid <= 0 or not isPokeball(item2.itemid) then
		doPlayerSendCancel(cid, "Sadece Pokeball Üzerinde Kullanilir.")
	return true
	end

	for a, b in pairs (pokeballs) do
        if item2.itemid == b.on or item2.itemid == b.off then         --edited deixei igual ao do PXG
        
           doTransformItem(item2.uid, b.on)
           doSetItemAttribute(item2.uid, "hp", 1)
           for c = 1, 15 do
               local str = "move"..c
               setCD(item2.uid, str, 0)
	       end
           doSendMagicEffect(getThingPos(cid), 13)
           doRemoveItem(item.uid, 1)
           doCureBallStatus(item2.uid, "all")
           cleanBuffs2(item2.uid)             --alterado v2.5
           setCD(item2.uid, "control", 0)     --alterado v2.5
           setCD(item2.uid, "blink", 0)  --alterado v2.6
	       return true
        end
	end

return true
end