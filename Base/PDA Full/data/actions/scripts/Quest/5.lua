 local function doPlayerAddPercentLevel(cid, percent) 
    local player_lv, player_lv_1 = getExperienceForLevel(getPlayerLevel(cid)), getExperienceForLevel(getPlayerLevel(cid)+2) 
    local percent_lv = ((player_lv_1 - player_lv) / 200) * percent 
    doPlayerAddExperience(cid, percent_lv)
end 


    local Templo = {x= 976,y=953,z=7}	

local level = 100
function onUse(cid, item, frompos, item2, topos)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Quest] Guarde Seu Pokemon Para Receber o Premio do Bau!")
return true
end
if getPlayerLevel(cid) >= level then
else
doPlayerSendTextMessage(cid, 19, '[Quest] Voce Precisa de Level [' .. level .. '] Para Fazer a Quest!.')
return true
end
if item.uid == 12337 then
queststatus = getPlayerStorageValue(cid,12337)
if queststatus == -1 then  
setPlayerStorageValue(cid,12337,1)                          ------------------ FREEE
doPlayerAddItem(cid,2160,10)
doPlayerAddItem(cid,6569,10)
doPlayerAddPercentLevel(cid,300)
           doTeleportThing(cid, Templo)
doPlayerSendTextMessage(cid, 19, "[FREE QUEST] Voce Fez a Quest! (Premio: [10] Rare Candy + [10] TD + [3] Level)")
else
doTeleportThing(cid, Templo)
doPlayerSendTextMessage(cid, 19, "[FREE QUEST] Voce Ja Fez a Quest!")
return true
end
end
end 