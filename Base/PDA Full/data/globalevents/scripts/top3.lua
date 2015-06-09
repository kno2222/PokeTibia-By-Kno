      function onThink(cid, interval, lastExecution)
local summon = getCreatureSummons(cid)[1]
local str,top = "Top 5 Level\n",5

local query = db.getResult('SELECT `value`, `player_id` FROM `player_storage` WHERE `key`=5050 ORDER BY cast(`value` as DECIMAL) DESC;')
if (query:getID() ~= -1) then

k = 1

while true do

str = str .. "\n " .. k .. ". "..getPlayerNameByGUID(result:getDataInt("player_id")).." - [" .. (result:getDataInt("value") + 1) .. "]"

k = k + 1

if not(query:next()) or k > top then

break

end

end

query:free()

end

return doBroadcastMessage(str)

end