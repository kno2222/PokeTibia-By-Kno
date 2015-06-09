 local function doPlayerAddPercentLevel(cid, percent) 
    local player_lv, player_lv_1 = getExperienceForLevel(getPlayerLevel(cid)), getExperienceForLevel(getPlayerLevel(cid)+2) 
    local percent_lv = ((player_lv_1 - player_lv) / 200) * percent 
    doPlayerAddExperience(cid, percent_lv)
end 

local tps = {"Torre I","Torre II","Torre 1","Torre 2"
}

function onDeath(cid)
if isPlayer(cid) then
local tps = getCreatureName(cid)
doPlayerAddPercentLevel(cid,200)
return true
end
end