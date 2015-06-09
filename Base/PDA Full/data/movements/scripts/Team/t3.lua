function onStepIn(cid, item, position, fromPosition)
if isSummon(cid) then
return false
end
        if isPremium(cid) == FALSE then
                doTeleportThing(cid, fromPosition, false)
                doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[VIP] Somente Jogadores VIPS Podem Passar!")
                else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[VIP] Bem Vindo!")
                
        end
        return TRUE
end