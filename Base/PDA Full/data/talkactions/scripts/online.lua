function onSay(cid, words, param, channel)
local players = getPlayersOnline()
local x = 0
local y = 0
local z = 0
local za = 0
local zb = 0
local adm = 0
for i, pid in ipairs(players) do
        if getPlayerStorageValue(pid,12000) == 1 and getPlayerGroupId(pid) <= 1 then
         x = x + 1
         elseif getPlayerStorageValue(pid,12000) == 2 and getPlayerGroupId(pid) <= 1 then
y = y + 1
         elseif getPlayerStorageValue(pid,6666) == 1 and getPlayerGroupId(pid) <= 1 then
za = za + 1
         elseif getPlayerStorageValue(pid,17779) == 1 and getPlayerGroupId(pid) <= 1 then
zb = zb + 1
elseif getPlayerGroupId(pid) >= 5 then
adm = adm + 1
end
z = z + 1
end

local strings, i, position, added, showGamemasters = {""}, 1, 1, false, getBooleanFromString(getConfigValue('displayGamemastersWithOnlineCommand'))
for _, pid in ipairs(getPlayersOnline()) do
if(added) then
if(i > (position * 7)) then
strings[position] = strings[position] .. ","
position = position + 1
strings[position] = ""
else
strings[position] = i == 1 and "" or strings[position] .. ", "
end
end

added = false
if((showGamemasters or getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES) or not getPlayerCustomFlagValue(pid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) and (not isPlayerGhost(pid) or getPlayerGhostAccess(cid) >= getPlayerGhostAccess(pid))) then
strings[position] = strings[position] .. getCreatureName(pid) .. " [" .. getPlayerLevel(pid) .. "]"
i = i + 1
added = true
end
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (i - 1) .. " player" .. (i > 1 and "s" or "") .. " online:")
for i, str in ipairs(strings) do
if(str:sub(str:len()) ~= ",") then
str = str .. "."
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, str)

end



return true
end