function onSay(cid, words, param) 
local players = getPlayersOnline() 
local x = 0
local y = 0
local z = 0
local adm = 0
    for i, pid in ipairs(players) do
        if getPlayerStorageValue(pid,6598755) == 1 and getPlayerGroupId(pid) <= 1 then
         x = x + 1
         elseif getPlayerStorageValue(pid,6598754) == 1 and getPlayerGroupId(pid) <= 1 then
         y = y + 1
         elseif getPlayerGroupId(pid) >= 5 then
         adm = adm + 1
         end
         z = z + 1
    end

doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[".. x .."/5] Red online Na Arena PVP!")
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[".. y .."/5] Blue online Na Arena PVP!")
return true
end