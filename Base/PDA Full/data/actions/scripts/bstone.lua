function onUse(cid, item, topos, item2, frompos)
local myball = getPlayerSlotItem(cid, 8)
local boost = getItemAttribute(myball.uid, "boost") or 0
local boosts = 0
local summon = getCreatureSummons(cid)[1]
if boost >= 80 then
return doPlayerSendCancel(cid, "[BOOST VIP] Seu Pokemon Esta No Boost Maximo!.")
end

if #getCreatureSummons(cid) >= 1 then
boosts = boosts + 1 ----- Testar Ainda
local pokemon = getItemAttribute(myball.uid, "poke")
local off = pokes[pokemon].offense * boost_rate * boosts
local def = pokes[pokemon].defense * boost_rate * boosts
local agi = pokes[pokemon].agility * boosts
local spatk = pokes[pokemon].specialattack * boost_rate * boosts
local vit = pokes[pokemon].vitality * boost_rate * boosts
doSetItemAttribute(myball.uid, "boost", boost + boosts)
doItemSetAttribute(myball.uid, "offense", getItemAttribute(myball.uid, "offense") + off)
doItemSetAttribute(myball.uid, "defense", getItemAttribute(myball.uid, "defense") + def)
doItemSetAttribute(myball.uid, "speed", getItemAttribute(myball.uid, "speed") + agi)
doItemSetAttribute(myball.uid, "specialattack", getItemAttribute(myball.uid, "specialattack") + spatk)
doItemSetAttribute(myball.uid, "vitality", getItemAttribute(myball.uid, "vitality") + vit)
doRemoveItem(item.uid, 1)
doSendFlareEffect(getThingPos(cid))
doSendFlareEffect(getThingPos(summon))
doSendAnimatedText(getThingPos(summon), "Boost UP!", 215)
doPlayerSendTextMessage(cid, 27, "[BOOST VIP] Parabens, Seu Pokemon "..pokemon..", Foi Boostado .")
doPlayerSendTextMessage(cid, 27, "[BOOST VIP] Agora Seu Pokemon "..pokemon.." Esta com o Boost +["..boosts + boost.."].")
else
return doPlayerSendCancel(cid, "[BOOST VIP] So Pode Usar em Seus Pokemons!.")
end
return true
end