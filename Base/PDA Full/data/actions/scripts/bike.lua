local function BikeSpeedOn(cid, t)                  
setPlayerStorageValue(cid, t.s, t.speed) 
doChangeSpeed(cid, -getCreatureSpeed(cid)) 
doChangeSpeed(cid, t.speed) 
end 

local function BikeSpeedOff(cid, t)
setPlayerStorageValue(cid, t.s, -1) 
doRegainSpeed(cid) 
end 

function onUse(cid, item, fromPosition, itemEx, toPosition)

local pos = getThingPos(cid)
local t = {text='Mount, bike!', dtext='Demount, bike!', s=5700, speed = 675} 

if getPlayerStorageValue(cid, t.s) <= 0 then
   doSendMagicEffect(pos, 177)
   doCreatureSay(cid, t.text, 19)
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'You have mounted in a bike.')
   BikeSpeedOn(cid, t)
   if getPlayerSex(cid) == 1 then
      doSetCreatureOutfit(cid, {lookType = 1394}, -1)
   else
       doSetCreatureOutfit(cid, {lookType = 1393}, -1)
   end
else
   doSendMagicEffect(pos, 177)
   doCreatureSay(cid, t.dtext, 19)
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'You haven demouted of a bike.')
   BikeSpeedOff(cid, t)
   doRemoveCondition(cid, CONDITION_OUTFIT)
end
return true
end