
function onSay(cid, words, param) 
setGlobalStorageValue(5002,-1) -- Placar Frag
setGlobalStorageValue(5001,-1) -- Placar Frag
doBroadcastMessage("Placar Resetado Pelo Admin Gostosao Pintudo : RedFrag [".. (getGlobalStorageValue(5001)+1).."] X ["..(getGlobalStorageValue(5002)+1).. "] BlueFrag",22)

return true
end