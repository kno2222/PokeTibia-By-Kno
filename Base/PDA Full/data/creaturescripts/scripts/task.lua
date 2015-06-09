local function doPlayerAddPercentLevel(cid, percent) 
    local player_lv, player_lv_1 = getExperienceForLevel(getPlayerLevel(cid)), getExperienceForLevel(getPlayerLevel(cid)+2) 
    local percent_lv = ((player_lv_1 - player_lv) / 200) * percent 
    doPlayerAddExperience(cid, percent_lv)
end 



function onKill(cid, target)
if isSummon(cid) or ehMonstro(cid) then return false end
    for _, tasks in pairs(amoebaTask) do
        if isInArray(tasks.creatures, getCreatureName(target)) then
            if taskKills(cid, tasks.storagecount) < tasks.count then

              doPlayerSendTextMessage(cid, 27, "[Progresso - Task Pokemon] •Elemento:  "..tasks.nome.."   •Kills: ["..(taskKills(cid, tasks.storagecount)+1).."/" .. tasks.count .. "].")
                doPlayerSetStorageValue(cid, tasks.storagecount, taskKills(cid, tasks.storagecount)+1)
                break
            end
        end
    end
    return true
end


 