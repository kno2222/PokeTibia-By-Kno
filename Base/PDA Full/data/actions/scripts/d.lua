local info = {
[0] = {x=1008,y= 930,z=7},  ---CTF   
[2] = {x=1023,y= 930,z=7},   ----CTF
[1] = {x=1038,y= 930,z=7},   ----TDM
[3] = {x=1053,y= 930,z=7},    ---- TDM
[4] = {x=1008,y= 915,z=7}    ---- TDM
}
local storage = {60002,61002}
local positions = {
{{x = 961,y = 923, z = 7},{x = 981,y = 971, z = 7}},
{{x = 1003,y = 907, z = 7},{x =1013,y = 917, z = 7}},
{{x = 970,y = 973, z = 7},{x = 984,y = 987, z = 7}}
}

local M = { 
[1] = {"Torre 1",{x=958, y=1021, z=7}}, 
[2] = {"Torre I",{x=892, y=1021, z=7}},
[3] = {"Torre 2",{x=936, y=1021, z=7}},
[4] = {"Torre II",{x=914, y=1021, z=7}} 
} 




    	
local storage = {60002,61002} 
function onUse(cid, item, frompos, item2, topos)
for i = 1, #M do 
doCreateMonster(M[i][1], M[i][2])
end
if getGlobalStorageValue(storage[2]) <= 0 then
setGlobalStorageValue(storage[1], getGlobalStorageValue(storage[1]) < #info and getGlobalStorageValue(storage[1])+1 or 0)  
for _, pid in ipairs(getPlayersOnline()) do
addEvent(doRemoveConditions, 2000, pid, true) 
doCreatureAddHealth(pid, getCreatureMaxHealth(pid))
doCreatureAddMana(pid, getCreatureMaxMana(pid)) 
doRemoveCondition(pid, CONDITION_OUTFIT) 
setPlayerStorageValue(pid,17778,0)  -- seta verificacao de bandeira em 0
setPlayerStorageValue(pid,17777,0)   -- seta verificacao de bandeira em 0
 doChangeSpeed(pid, -getCreatureSpeed(pid) + getCreatureBaseSpeed(pid))
setGlobalStorageValue(17778,-1) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(17779,-1) -- ninguem ficar com bandeira time vermelho!
setGlobalStorageValue(18888,-1) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(18889,-1) -- ninguem ficar com bandeira time vermelho!!
setGlobalStorageValue(5002,-1) -- Placar Frag
setGlobalStorageValue(5001,-1) -- Placar Frag
setPlayerStorageValue(pid,6598755,0)   
setPlayerStorageValue(pid,6598754,0)
setPlayerStorageValue(pid,12000,0)
doPlayerAddItem(cid,2160,5) 
doPlayerAddItem(pid,2152,50)  
doBroadcastMessage("[DOTA] O Mapa Foi Trocado Pelo Jogador ["..getCreatureName(cid).."] e Ganhou 5 TD, E Todo Mundo Ganhou 50 HD Por Participaçao !.")  
doTeleportThing(pid, info[getGlobalStorageValue(storage[1])], false)
doTeleportThing(cid, info[getGlobalStorageValue(storage[1])], false)  
end
return true
end
end