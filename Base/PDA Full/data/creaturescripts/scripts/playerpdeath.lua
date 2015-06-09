function onDeath(cid, corpse, killer)

    if getPlayerStorageValue(cid, 12000) == 1 then
        setPlayerStorageValue(cid, 12000, 0)
    elseif getPlayerStorageValue(cid, 12000) == 2 then
        setPlayerStorageValue(cid, 12000, 0)
return true
end
end