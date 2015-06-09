                                                                                              function onStepIn(cid, item,pos,fromPosition,toPosition)
if isSummon(cid) then
return false
end
if #getCreatureSummons(cid) == 0 then
doPlayerSendTextMessage(cid, 19, "[Corrida] Voce Deve Entrar com o Pokemon fora da Ball!")
doTeleportThing(cid, fromPosition, false) 
return true 
end

if getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 5700) >= 1 or getPlayerStorageValue(cid, 17000) >= 1 then
   doPlayerSendCancel(cid, "You can't do that while ride/fly/or in a bike.")
   doTeleportThing(cid, fromPosition, false)  
   return true
end

local from,to,players,limit = {x=1006, y=905, z=7}, {x=1060, y=906, z=7},{},1
if item.actionid == 50501 then   
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-----------------------------2--------------------
local from,to,players,limit = {x=1006, y=907, z=7}, {x=1060, y=908, z=7},{},1
if item.actionid == 50502 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end 
end   
-------------------------3---------------
local from,to,players,limit = {x=1006, y=909, z=7}, {x=1060, y=910, z=7},{},1
if item.actionid == 50503 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
---------------------------4----------------------
local from,to,players,limit = {x=1006, y=911, z=7}, {x=1060, y=912, z=7},{},1
if item.actionid == 50504 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
------------------5---------------------
local from,to,players,limit = {x=1006, y=913, z=7}, {x=1060, y=914, z=7},{},1
if item.actionid == 50505 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-----------------------------6---------------
local from,to,players,limit = {x=1006, y=915, z=7}, {x=1060, y=916, z=7},{},1
if item.actionid == 50506 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-------------------------------7--------------------------
local from,to,players,limit = {x=1006, y=917, z=7}, {x=1060, y=918, z=7},{},1
if item.actionid == 50507 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
----------------------------------8----------------------
local from,to,players,limit = {x=1006, y=919, z=7}, {x=1060, y=920, z=7},{},1
if item.actionid == 50508 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-----------------------------------9----------------------------
local from,to,players,limit = {x=1006, y=921, z=7}, {x=1060, y=922, z=7},{},1
if item.actionid == 50509 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
--------------------------------10--------------
local from,to,players,limit = {x=1006, y=923, z=7}, {x=1060, y=924, z=7},{},1
if item.actionid == 50510 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-------------------------------------11--------------------------
local from,to,players,limit = {x=1006, y=925, z=7}, {x=1060, y=926, z=7},{},1
if item.actionid == 50511 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
--------------------------------12-------------------------
local from,to,players,limit = {x=1006, y=927, z=7}, {x=1060, y=928, z=7},{},1
if item.actionid == 50512 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
----------------------------------------13------------------------
local from,to,players,limit = {x=1006, y=929, z=7}, {x=1060, y=930, z=7},{},1
if item.actionid == 50513 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-----------------------------------------14-----------------------
local from,to,players,limit = {x=1006, y=931, z=7}, {x=1060, y=932, z=7},{},1
if item.actionid == 50514 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-----------------------------15---------------------------
local from,to,players,limit = {x=1006, y=933, z=7}, {x=1060, y=934, z=7},{},1
if item.actionid == 50515 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
---------------------------------16---------------------
local from,to,players,limit = {x=1006, y=935, z=7}, {x=1060, y=936, z=7},{},1
if item.actionid == 50516 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
-----------------------------17-------------------------
local from,to,players,limit = {x=1006, y=937, z=7}, {x=1060, y=938, z=7},{},1
if item.actionid == 50517 then 
for _, pid in ipairs(getPlayersOnline()) do
if isPlayer(cid) then
if isInRange(getCreaturePosition(pid), from, to) then
table.insert(players, pid)
end
end
if #players >= limit then
doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Evento-Corrida] Essa Pista ja Esta Ocupada, Escolhe Outro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
end
end
end