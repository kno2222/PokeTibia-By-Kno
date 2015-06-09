function onThink()
local r = db.getResult('SELECT * FROM shop_history WHERE processed=0')
if r:getID() ~= -1 then
repeat
local cid = getPlayerByName(r:getDataString('player'))
if isPlayer(cid) then
local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).uid
if bp ~= 0 then
local j = db.getResult('SELECT * FROM shop_offer WHERE id='..r:getDataInt('product'))
if j:getID() ~= -1 then
local id = tonumber(j:getDataInt('item'))
local tid = tonumber(r:getDataInt('id'))
local count = tonumber(j:getDataInt('count'))
local tipe = tonumber(j:getDataInt('type'))
local name = j:getDataString('name')
if tipe == 5 or tipe == 8 then
local w = getItemInfo(id).weight * count
if getPlayerFreeCap(cid) >= w then
if doAddContainerItemEx(bp, doCreateItemEx(id, count)) == 1 then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] You have received >> '..name..' << from our shop system')
db.executeQuery('UPDATE shop_history SET processed=1 WHERE id = ' .. tid)
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] You don\'t have enough space in backpack to receive >> '..name..' <<')
end
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] Sorry, you don\'t have enough capacity to receive >> '..name..' << (You need: '..getItemInfo(id).weight * count..' Capacity)')
end
elseif tipe == 6 or tipe == 7 then
local bid, bcap =
tipe == 6 and 1987 or 1988,
tipe == 6 and 8 or 20
local w = getItemInfo(bid).weight + (getItemInfo(id).weight * count * bcap)
if getPlayerFreeCap(cid) >= w then
local c = doCreateItemEx(bid)
for i = 1, bcap do
doAddContainerItem(c, id, count)
end
if doPlayerAddItemEx(getPlayerSlotItem(cid, 3).uid, c) == RETURNVALUE_NOERROR then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] You have received >> '..name..' << from our shop system')
db.executeQuery('UPDATE shop_history SET processed=1 WHERE id='..tid)
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] Sorry, you don\'t have enough space to receive >> '..name..' <<')
end
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] Sorry, you don\'t have enough capacity to receive >> '..name..' << (You need: '..w..' Capacity)')
end
end
j:free()
end
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, '[SHOP POKEMAX] You don\'t have a container in your backpack slot.')
end
end
until not r:next()
r:free()
end
return true
end