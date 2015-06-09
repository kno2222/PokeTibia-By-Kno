local skill25 = 25    -- Mude aqui a chance de capiturar
local skill50 = 50-- Mude aqui a chance de capiturar
local skill75 = 75 -- Mude aqui a chance de capiturar
local skill100 = 100 -- Mude aqui a chance de capiturar

local ballcatch = {                    --id normal, id da ball shiy
[2394] = {cr = 10, on = 24, off = 23, ball = 11826, send = 47, typeee = "normal"},  --alterado v2.9  \/
[2391] = {cr = 20, on = 198, off = 197, ball = 11832, send = 48, typeee = "great"},  --Moon v3.1  \/
[2393] = {cr = 30, on = 202, off = 201, ball = 11835, send = 47, typeee = "super"},  --Fast v3.1  \/
[2392] = {cr = 40, on = 200, off = 199, ball = 11829, send = 49, typeee = "ultra"},  --Heavy v3.2  \/
[12617] = {cr = 50, on = 204, off = 203, ball = 10975, send = 35, typeee = "saffari"},  --Saffari v3.1  \/
[12971] = {cr = 60, on = 193, off = 192, ball = 11737, send = 46, typeee = "love"},  --Love v3.2  \/
[13258] = {cr = 500, on = 193, off = 192, ball = 11740, send = 46, typeee = "master"},  --Master v3.2  \/
}



function onUse(cid, item, frompos, item3, topos)

local item2 = getTopCorpse(topos)
if item2 == null then
	return true
end

if getItemAttribute(item2.uid, "catching") == 1 then
   return true
end



local name = string.lower(getItemNameById(item2.itemid))  --alterado v2.9 \/
      name = string.gsub(name, "fainted ", "")
      name = string.gsub(name, "defeated ", "")
      name = doCorrectPokemonName(name)
local x = pokecatches[name]
	

local storage = newpokedex[doCorrectPokemonName(name)].stoCatch            --alterado v2.9 \/
if getPlayerStorageValue(cid, storage) == -1 or not string.find(getPlayerStorageValue(cid, storage), ";") then  
   setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, love = 0, master = 0;")              
end    
    
if not x then return true end

local owner = getItemAttribute(item2.uid, "corpseowner")
	
if owner and isCreature(owner) and isPlayer(owner) and cid ~= owner then  --alterado v2.5
   doPlayerSendCancel(cid, "[Owner] Voce Nao Pode Capturar o Pokemon de outro Jogador!.")
   return true
end

local newidd = ballcatch[item.itemid].ball  --alterado v2.9       
local typeee = ballcatch[item.itemid].typeee

   
local catchinfo = {}
if getPlayerSkillLevel(cid, 2) <= 50 then ---- Skill Cathing 0 a 25
catchinfo.rate = ballcatch[item.itemid].cr + skill25
doPlayerSendTextMessage(cid, 19, "Catch Rate: [Ball: "..ballcatch[item.itemid].cr.." + Bonus: "..skill25.."]")

else
if getPlayerSkillLevel(cid, 2) >= 51 then ---- Skill Cathing 26 a 50
catchinfo.rate = ballcatch[item.itemid].cr + skill50
doPlayerSendTextMessage(cid, 19, "Catch Rate: [Ball: "..ballcatch[item.itemid].cr.." + Bonus: "..skill50.."]")
else
if getPlayerSkillLevel(cid, 2) >= 101 then ---- Skill Cathing 51 a 75
catchinfo.rate = ballcatch[item.itemid].cr + skill75
doPlayerSendTextMessage(cid, 19, "Catch Rate: [Ball: "..ballcatch[item.itemid].cr.." + Bonus: "..skill75.."]")
else
if getPlayerSkillLevel(cid, 2) >= 150 then ---- Skill Cathing 76 a 100......
catchinfo.rate = ballcatch[item.itemid].cr + skill100
doPlayerSendTextMessage(cid, 19, "Catch Rate: [Ball: "..ballcatch[item.itemid].cr.." + Bonus: "..skill100.."]")
else
catchinfo.rate = ballcatch[item.itemid].cr
end
end
end
end
catchinfo.catch = ballcatch[item.itemid].on
catchinfo.fail = ballcatch[item.itemid].off
catchinfo.newid = newidd
catchinfo.name = doCorrectPokemonName(name)
catchinfo.topos = topos
catchinfo.chance = x.chance


doSendDistanceShoot(getThingPos(cid), topos, ballcatch[item.itemid].send)
doRemoveItem(item.uid, 1)

local d = getDistanceBetween(getThingPos(cid), topos)


addEvent(doSendPokeBall, d * 70 + 100 - (d * 14) , cid, catchinfo, false, false, typeee)
addEvent(doSendMagicEffect, (d * 70 + 100 - (d * 14)) - 100, topos, 3)
return true
end