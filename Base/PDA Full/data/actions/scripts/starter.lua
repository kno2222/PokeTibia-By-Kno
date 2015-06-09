

function onUse(cid, item, frompos, item2, topos)
doPlayerAddItem(cid,10503,1)
doPlayerSendTextMessage(cid, 19, "[VIP QUEST] Voce Fez a Quest VIP!")
doPlayerAddPremiumDays(cid, 1)
end
if isPremium(cid) == TRUE then
doPlayerSendTextMessage(cid, 19, "[VIP QUEST] Voce Ja Fez a Quest!")

return true
end