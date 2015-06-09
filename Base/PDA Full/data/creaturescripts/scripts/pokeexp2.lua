local function doPlayerAddPercentLevel(cid, percent) 
    local player_lv, player_lv_1 = getExperienceForLevel(getPlayerLevel(cid)), getExperienceForLevel(getPlayerLevel(cid)+2) 
    local percent_lv = ((player_lv_1 - player_lv) / 200) * percent 
    doPlayerAddExperience(cid, percent_lv)
end 


function onKill(cid, target, lastHit)
 if isPlayer(cid) and isSummon(target) then
 doPlayerAddPercentLevel(cid,300)
return true
end
end