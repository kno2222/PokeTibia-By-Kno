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
[1] = {30},
}
local timess = {
[2] = {30},
}
local TeamRed = 6666
local TeamBlue = 6667
function repeatFlagOnPlayer(cid)
 if isPlayer(cid) then
local timeA = times[getPlayerStorageValue(cid,TeamRed)]
local timeB = timess[getPlayerStorageValue(cid,TeamBlue)]
            if getPlayerStorageValue(cid,TeamRed) == 1 then -------- verifica o time 1
         if getGlobalStorageValue(global_bandeiras.time1) <= 0 or getPlayerStorageValue(cid,global_bandeiras.time1) <= 0 then
         return true
         end
         doSendMagicEffect(getCreaturePosition(cid),times[1])
         doSendAnimatedText(getCreaturePosition(cid),"Flag!",math.random(1,255)) 
                  if getCreatureSpeed(cid) < 130 or getCreatureSpeed(cid) > 130 then
            doRemoveCondition(cid,CONDITION_HASTE)
            doChangeSpeed(cid,-getCreatureSpeed(cid) + 130)
         end
            end 
            
            if getPlayerStorageValue(cid,TeamBlue) == 1 then -------- verifica o time 2
         if getGlobalStorageValue(global_bandeiras.time2) <= 0 or getPlayerStorageValue(cid,global_bandeiras.time2) <= 0 then
         return true
         end
                  if getCreatureSpeed(cid) < 130 or getCreatureSpeed(cid) > 130 then
            doRemoveCondition(cid,CONDITION_HASTE)
            doChangeSpeed(cid,-getCreatureSpeed(cid) + 130)
         end
         doSendMagicEffect(getCreaturePosition(cid),timess[2])
            doSendAnimatedText(getCreaturePosition(cid),"Flag!",math.random(1,255)) 
            end             
   return addEvent(repeatFlagOnPlayer, 1000, cid)
 end
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local Red = 6666
local Blue = 6667
doTeleportThing(cid,lastPosition,false)
if getItemAttribute(item.uid,"aid") == 17779 then --- bandeira do time 1
if getPlayerStorageValue(cid,TeamBlue) == 1 then     -- time 2 roubando a bandeira do time 1
   if getGlobalStorageValue(17778) == 1 then
      return doPlayerSendTextMessage(cid,19,"Alguem ja robou a bandeira desse time!")
   end
   setPlayerStorageValue(cid,17778,1)
   setGlobalStorageValue(17778,1)
   doRemoveCondition(cid,CONDITION_HASTE)
   doChangeSpeed(cid, -getCreatureSpeed(cid) + 130)
   doBroadcastMessage("o jogador "..getCreatureName(cid).. " do time azul robou a bandeira peguem-o!!",22)
   repeatFlagOnPlayer(cid)
end

if getPlayerStorageValue(cid,TeamRed) == 1 then
if getPlayerStorageValue(cid,17779) == 1 then
   setGlobalStorageValue(18888,getGlobalStorageValue(18888) + 1)
   doBroadcastMessage("Red ".. (getGlobalStorageValue(18888)).." X "..(getGlobalStorageValue(18889)).. " Blue",22)
   doBroadcastMessage("o jogador "..getCreatureName(cid).. " do time Vermelho entregou a bandeira e o time inteiro ganhou 20% de EXP!",22) 
  doPlayerAddItem(cid,2152,25)
for _, cid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(cid,Red) == 1 then
					doPlayerAddItem(cid,2152,5 ) 
					doPlayerAddPercentLevel(cid,20)
doSendMagicEffect(getPlayerPosition(cid), 31) 
end
end
   doPlayerAddPercentLevel(cid,100) 
   doRemoveCondition(cid,CONDITION_HASTE)
   doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
   setPlayerStorageValue(cid,17779,0)
   setGlobalStorageValue(17779,0)
end
end


elseif getItemAttribute(item.uid,"aid") == 17778 then --- bandeira do time 2
if getPlayerStorageValue(cid,TeamRed) == 1 then     -- time 1 roubando a bandeira do time 2
   if getGlobalStorageValue(17779) == 1 then
      return doPlayerSendTextMessage(cid,19,"Alguem ja robou a bandeira desse time!")
   end
   setPlayerStorageValue(cid,17779,1)
   setGlobalStorageValue(17779,1)
   doRemoveCondition(cid,CONDITION_HASTE)
   doChangeSpeed(cid, -getCreatureSpeed(cid) + 130) 
   doBroadcastMessage("o jogador "..getCreatureName(cid).. " do time Vermelho robou a bandeira peguem-o!!",22)
   repeatFlagOnPlayer(cid)
end

if getPlayerStorageValue(cid,TeamBlue) == 1 then
if getPlayerStorageValue(cid,17778) == 1 then
   setGlobalStorageValue(18889,getGlobalStorageValue(18889) + 1)
   doRemoveCondition(cid,CONDITION_HASTE)
   doBroadcastMessage("Red ".. (getGlobalStorageValue(18888)).." X "..(getGlobalStorageValue(18889)).. " Blue",22) 
   doBroadcastMessage("o jogador "..getCreatureName(cid).. " do time Azul entregou a bandeira e o time inteiro ganhou 20% de EXP!!",22) 
  doPlayerAddItem(cid,2152,25)
for _, cid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(cid,Blue) == 1 then
					doPlayerAddItem(cid,2152,5)
                    doPlayerAddPercentLevel(cid,20) 
doSendMagicEffect(getPlayerPosition(cid), 35)  
end
end
   doPlayerAddPercentLevel(cid,100) 
   doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
   setPlayerStorageValue(cid,17778,0)
   setGlobalStorageValue(17778,0)
end
end

end
return true
end