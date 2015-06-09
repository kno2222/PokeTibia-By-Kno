local function doPlayerAddPercentLevel(cid, percent) 
    local player_lv, player_lv_1 = getExperienceForLevel(getPlayerLevel(cid)), getExperienceForLevel(getPlayerLevel(cid)+2) 
    local percent_lv = ((player_lv_1 - player_lv) / 200) * percent 
    doPlayerAddExperience(cid, percent_lv)
end 

local global_bandeiras = {
time1 = 17779,
time2 = 17778,
}

local times = {
[1] = {361},
[2] = {361},
}
local STORAGE_TEAM_ID = 12000
function repeatFlagOnPlayer(cid)
 if isPlayer(cid) then
local time = times[getPlayerStorageValue(cid,STORAGE_TEAM_ID)]
            if getPlayerStorageValue(cid,STORAGE_TEAM_ID) == 1 then -------- verifica o time 1
         if getGlobalStorageValue(global_bandeiras.time1) <= 0 or getPlayerStorageValue(cid,global_bandeiras.time1) <= 0 then
         return true
         end
         doSendMagicEffect(getCreaturePosition(cid),time[1]) 
         doSendAnimatedText(getCreaturePosition(cid),"Flag!",math.random(1,255)) 
                  if getCreatureSpeed(cid) < 130 or getCreatureSpeed(cid) > 130 then
            doRemoveCondition(cid,CONDITION_HASTE)
            doChangeSpeed(cid,-getCreatureSpeed(cid) + 130)
         end
            end 
            
            if getPlayerStorageValue(cid,STORAGE_TEAM_ID) == 2 then -------- verifica o time 1
         if getGlobalStorageValue(global_bandeiras.time2) <= 0 or getPlayerStorageValue(cid,global_bandeiras.time2) <= 0 then
         return true
         end
                  if getCreatureSpeed(cid) < 130 or getCreatureSpeed(cid) > 130 then
            doRemoveCondition(cid,CONDITION_HASTE)
            doChangeSpeed(cid,-getCreatureSpeed(cid) + 130)
         end
         doSendMagicEffect(getCreaturePosition(cid),time[1])
            doSendAnimatedText(getCreaturePosition(cid),"Flag!",math.random(1,255)) 
            end             
   return addEvent(repeatFlagOnPlayer, 1000, cid)
 end
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local Red = 12000
local Blue = 12000
item_qualquer = {
[1] = 2160,
[2] = 2160,
[3] = 6569,
[4] = 6569,
[5] = 2160,
[6] = 2152,
}

doTeleportThing(cid,lastPosition,false)
if getItemAttribute(item.uid,"aid") == 17779 then --- bandeira do time 1
if getPlayerStorageValue(cid,STORAGE_TEAM_ID) == 2 then     -- time 2 roubando a bandeira do time 1
   if getGlobalStorageValue(17778) == 1 then
      return doPlayerSendTextMessage(cid,19,"[CTF] Alguem ja robou a bandeira desse time!")
   end
   setPlayerStorageValue(cid,17778,1)
   setGlobalStorageValue(17778,1)
   doRemoveCondition(cid,CONDITION_HASTE)
   doChangeSpeed(cid, -getCreatureSpeed(cid) + 130)
   doBroadcastMessage("[CTF] O jogador ("..getCreatureName(cid).. ") do time azul robou a bandeira peguem-o!!",22)
   repeatFlagOnPlayer(cid)
end

if getPlayerStorageValue(cid,STORAGE_TEAM_ID) == 1 then
if getPlayerStorageValue(cid,17779) == 1 then
   setGlobalStorageValue(18888,getGlobalStorageValue(18888) + 1)
   setPlayerStorageValue(cid,2021,getPlayerStorageValue(cid,2021)+1) 
   doPlayerSendTextMessage(cid, 19,"Voce Agora Tem ["..(getPlayerStorageValue(getCreatureMaster(cid),2021) + 1).."] CTF SCORES.")
   doBroadcastMessage("RedCTF ".. (getGlobalStorageValue(18888)+1).." X "..(getGlobalStorageValue(18889)+1).. " BlueCTF",22)
   doBroadcastMessage("[CTF] O jogador ["..getCreatureName(cid).. "] do Time Vermelho entregou  a bandeira [Ganhou 50% EXP + Premio Aleatorio] e o Time inteiro ganhou 10% de Exp!",22)   
for _, cid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(cid,Red) == 1 then
					doPlayerAddPercentLevel(cid,10)
doSendMagicEffect(getPlayerPosition(cid), 31) 
end
end
   doPlayerAddPercentLevel(cid,40) 
   doPlayerAddItem(cid, item_qualquer[math.random(#item_qualquer)], 1) 
   doRemoveCondition(cid,CONDITION_HASTE)
   doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
   setPlayerStorageValue(cid,17779,0)
   setGlobalStorageValue(17779,0)
end
end


elseif getItemAttribute(item.uid,"aid") == 17778 then --- bandeira do time 2
if getPlayerStorageValue(cid,STORAGE_TEAM_ID) == 1 then     -- time 1 roubando a bandeira do time 2
   if getGlobalStorageValue(17779) == 1 then
      return doPlayerSendTextMessage(cid,19,"[CTF] Alguem ja robou a bandeira desse time!")
   end
   setPlayerStorageValue(cid,17779,1)
   setGlobalStorageValue(17779,1)
   doRemoveCondition(cid,CONDITION_HASTE)
   doChangeSpeed(cid, -getCreatureSpeed(cid) + 130) 
   doBroadcastMessage("[CTF] O jogador ("..getCreatureName(cid).. ") do time Vermelho robou a bandeira peguem-o!!",22)
   repeatFlagOnPlayer(cid)
end

if getPlayerStorageValue(cid,STORAGE_TEAM_ID) == 2 then
if getPlayerStorageValue(cid,17778) == 1 then
   setGlobalStorageValue(18889,getGlobalStorageValue(18889) + 1)
   doRemoveCondition(cid,CONDITION_HASTE)
   setPlayerStorageValue(cid,2021,getPlayerStorageValue(cid,2021)+1) 
   doPlayerSendTextMessage(cid, 19,"Voce Agora Tem ["..(getPlayerStorageValue(getCreatureMaster(cid),2021) + 1).."] CTF SCORES.")
   doBroadcastMessage("RedCTF ".. (getGlobalStorageValue(18888)+1).." X "..(getGlobalStorageValue(18889)+1).. " BlueCTF",22) 
   doBroadcastMessage("[CTF] O jogador ["..getCreatureName(cid).. "] do Time Azul entregou a bandeira [Ganhou 50% EXP + Premio Aleatorio] e o  Time inteiro ganhou 10% de Exp!",22)
for _, cid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(cid,Blue) == 2 then 
					doPlayerAddPercentLevel(cid,10)
doSendMagicEffect(getPlayerPosition(cid), 31) 
end
end
   doPlayerAddPercentLevel(cid,40) 
   doPlayerAddItem(cid, item_qualquer[math.random(#item_qualquer)], 1) 
   doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
   setPlayerStorageValue(cid,17778,0)
   setGlobalStorageValue(17778,0)
end
end

end
return true
end