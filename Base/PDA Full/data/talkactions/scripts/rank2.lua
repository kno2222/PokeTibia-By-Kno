function doPlayerShowHighscore(uid, storage)
                local showPlayers = 5
                local str = "Rank Capture the Flag:\n#  Player - [Score]\n"
                local result = db.getResult('SELECT `value`, `player_id` FROM `player_storage` WHERE `key`=2021 ORDER BY cast(`value` as DECIMAL) DESC;')
                local i = 1
                while i <= showPlayers do                
                        str = str .. "\n " .. i .. ". "..getPlayerNameByGUID(result:getDataInt("player_id")).." - [" .. (result:getDataInt("value") + 1) .. "]"
                        if not(result:next())then
                            break
                        end
                        i = i+1
                end
                result:free()
                if(str ~= "") then
                    doShowTextDialog(uid, 2160, str)
                end
    return true
end    

function onSay(cid, words, param) 
doPlayerShowHighscore(cid, 2021)
return true
end