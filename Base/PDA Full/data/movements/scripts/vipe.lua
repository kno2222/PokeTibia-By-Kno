-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Vip Degilsiniz.",
msgWelcome = "Vip Alanina Hosgeldiniz."
}

if getPlayerStorageValue(cid, 13540) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end