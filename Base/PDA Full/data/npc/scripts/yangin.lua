local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function doBuyPokemonWithCasinoCoins(cid, poke) npcHandler:onSellpokemon(cid) end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

-----------------------------------
--id dos itens{Water Pendant, Slowpoke Tail, Psyduck Mug, Ruby, Squirtle Hull, Gyarados Tail, Big Claws, Crab Claw, Water Orb, Pot Of Fresh Water}
local itens = {12170, 12197, 12189, 12188, 12158, 12148, 12269, 12207, 12283, 12288} 
---------
local function checkDex(cid)
local unlock = 0
	for i = 1, #oldpokedex do
		if getPlayerInfoAboutPokemon(cid, oldpokedex[i][1]).dex then
		unlock = unlock + 1
		end
	end
return unlock
end
---------
local function checkItens(cid, itens)
local check = 0
    for i = 1, #itens do
        if getPlayerItemCount(cid, itens[i]) >= 10 then
           check = check + 1
        end       
    end
return check
end
-------------------------------------
if getPlayerStorageValue(cid, 659876) == 4 then
   selfSay("Sen zaten benim gorevimi yaptin...", cid)
   talkState[cid] = 0
   return false 
end   

if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659876) == -1 then
       selfSay("Karakter levelin 50 olmak zorunda, yeterli levele sahip misin?", cid)
       talkState[cid] = 1

elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'evet')) and talkState[cid] == 1 and getPlayerStorageValue(cid, 659876) == -1 then
       if getPlayerSkill(cid, 6) >= 1 and getPlayerLevel(cid) >= 50 then
          selfSay("Tebrikler, yeterli levele sahipsin, bir sonraki soruma geçelim.", cid)
          setPlayerStorageValue(cid, 659876, 1)
       else
          selfSay("Yeterli levele sahip degilsin.", cid)
          talkState[cid] = 0
          return true
       end 
   
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659876) == 1 then
       selfSay("Senin Pokedexine kayitli 50 pokemon olmasi lazim, Yeterince var mi?", cid)
       talkState[cid] = 2
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'evet')) and talkState[cid] == 2 and getPlayerStorageValue(cid, 659876) == 1 then

local check = checkDex(cid)
	if check >= 50 then
       selfSay("Tamamdir, tecrübeli oldugunuzu kanitladiniz, size güvenebiliriz...", cid)
       setPlayerStorageValue(cid, 659876, 2)
    else
       selfSay("Pokedexinde 50 pokemon kayitli degil, lütfen daha sonra gel...", cid)
       talkState[cid] = 0
       return true
    end
       
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659876) == 2 then
      selfSay("Sen 10 Water Pendant, 10 Ruby, 10 Squirtle Hull, 10 Slowpoke Tail, 10 Psyduck Mug, 10 Crab Claw, 10 Big Claws, 10 Water Orb, 10 Pot Of Fresh Water, 10 Gyarados Tail sahip misin?", cid)
      talkState[cid] = 3
  
elseif (msgcontains(msg, 'evet') or msgcontains(msg, 'yes')) and talkState[cid] == 3 and getPlayerStorageValue(cid, 659876) == 2 then

local check3 = checkItens(cid, itens)
    if check3 == #itens then
       for a = 1, #itens do
           doPlayerRemoveItem(cid, itens[a], 10)
       end
       selfSay("Tesekkürler, sayenizde yangini önleyebiliriz, bu ödülüde lütfen kabul edin.", cid)
       setPlayerStorageValue(cid, 659876, 3)
       doPlayerAddItem(cid, 11442, 1) --water stone.. altere como quiser...
    else
       selfSay("Yangini söndürmemiz icin gerekli tüm esyalara sahip degilsiniz...", cid)
       talkState[cid] = 0
       return true
    end      
    
elseif (msgcontains(msg, 'no') or msgcontains(msg, 'hayir')) then
     selfSay("Pekala Gule Gule...", cid)
     talkState[cid] = 0
     return false 
end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())