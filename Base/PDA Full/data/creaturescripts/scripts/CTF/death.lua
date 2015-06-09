function onPrepareDeath(cid, deathList)
    if  getPlayerStorageValue(cid,17778) == 1 then
    setGlobalStorageValue(17778,0) 
    setPlayerStorageValue(cid,17778,0)
    doBroadcastMessage("O Jogador "..getCreatureName(cid).. " do time Azul  morreu e perdeu a bandeira!",22)
     else
if getPlayerStorageValue(cid,17779) == 1 then
    setPlayerStorageValue(cid,17779,0)  
    setGlobalStorageValue(17779,0) 
    doBroadcastMessage("O Jogador "..getCreatureName(cid).. " do time Vermelho morreu e perdeu a bandeira!",22)
end
return true
end
end