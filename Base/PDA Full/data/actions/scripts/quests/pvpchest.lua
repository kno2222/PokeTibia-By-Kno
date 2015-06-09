function onUse (cid,item,frompos,item2,topos)
pos = {x=1895, y=763, z=15}

    	UID_DO_BAU = 12333
    	STORAGE_VALUE = 12333
    	ID_DO_PREMIO = 2152
    	ID_DO_PREMIO2 = 2391

    	if getPlayerLevel(cid) >= 10 then
  if item.uid == 12333 then
      	queststatus = getPlayerStorageValue(cid,12333)
      	if queststatus == -1 then
    	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
    	doPlayerSendTextMessage(cid,22,"Congratulations.") -- Aqui é colocado o nome do item
    	doPlayerAddItem(cid,2152,100)
    	doPlayerAddItem(cid,2391,75)
    	setPlayerStorageValue(cid,12333,1)
      	else
    	doPlayerSendTextMessage(cid,22,"The chest is empty.")
      	end
  end
    	else
  doPlayerSendCancel(cid,'Only levels 10 or up can open this chest.')
    	end
return 1
end