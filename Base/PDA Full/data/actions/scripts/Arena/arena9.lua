local M = { 
[1] = {"Sceptile",{x= 902, y = 897, z=7}}, 
} 
local stor = 12458
local tp = {x= 961, y= 955, z= 7}
local minutos = 1 

function onUse(cid, item, frompos, item2, topos)
local tempo = 6 
if getPlayerStorageValue(cid, 102955) > os.time() then
return doPlayerSendTextMessage(cid,18, " Aguarde ["..getPlayerStorageValue(cid, 102955) - os.time().."] segundo(s) Para dar Puxar Alavanca!.")
end
for i = 1, #M do                                                                                   
if isPremium(cid) == false and isPlayer(cid) then

if (getPlayerStorageValue(cid, stor) == 0) then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [1/10]!")
setPlayerStorageValue(cid, stor, 1) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)

elseif (getPlayerStorageValue(cid, stor) == 1) then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [2/10]!")
setPlayerStorageValue(cid, stor, 2) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)

elseif (getPlayerStorageValue(cid, stor) == 2) then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [3/10]!")
setPlayerStorageValue(cid, stor, 3) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)  

elseif (getPlayerStorageValue(cid, stor) == 3)  then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [4/10]!")
setPlayerStorageValue(cid, stor, 4) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)
 
elseif (getPlayerStorageValue(cid, stor) == 4)  then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [5/10]!")
setPlayerStorageValue(cid, stor, 5)
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)  
   
elseif (getPlayerStorageValue(cid, stor) == 5) then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [6/10]!")
setPlayerStorageValue(cid, stor, 6) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)

elseif (getPlayerStorageValue(cid, stor) == 6)  then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [7/10]!")
setPlayerStorageValue(cid, stor, 7)
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10) 

elseif (getPlayerStorageValue(cid, stor) == 7)  then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [8/10]!")
setPlayerStorageValue(cid, stor, 8) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10) 

elseif (getPlayerStorageValue(cid, stor) == 8)  then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [9/10]!")
setPlayerStorageValue(cid, stor, 9) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)  

elseif (getPlayerStorageValue(cid, stor) == 9)  then
doCreateMonster(M[i][1], M[i][2])
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [10/10]!")
setPlayerStorageValue(cid, stor, 10) 
setPlayerStorageValue(cid, 102955, os.time() + tempo * 10)

elseif (getPlayerStorageValue(cid, stor) == 10)  then
doPlayerSendTextMessage(cid, 19, "[Arena] Voce Puxou [10/10] e Foi Removido [1] Dia de VIP!")
setPlayerStorageValue(cid, stor, 0)  
doTeleportThing(cid,tp)
doPlayerRemovePremiumDays(cid, 1)
end
else
doPlayerSendTextMessage(cid, TALKTYPE_ORANGE_1, msg1)
end
return true
end
end