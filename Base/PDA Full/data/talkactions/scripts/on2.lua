function onSay(cid, words, param) 
local players = getPlayersOnline() 
local x = 0
local y = 0
local z = 0
local adm = 0
    for i, pid in ipairs(players) do
        if getPlayerStorageValue(pid,12000) == 1 and getPlayerGroupId(pid) <= 1 then
         x = x + 1
         elseif getPlayerStorageValue(pid,12000) == 2 and getPlayerGroupId(pid) <= 1 then
         y = y + 1
         elseif getPlayerGroupId(pid) >= 5 then
         adm = adm + 1
         end
         z = z + 1
    end

doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[".. x .."/25] Red online!")
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[".. y .."/25] Blue online!")
return true
end