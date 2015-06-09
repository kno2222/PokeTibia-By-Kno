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
--id dos itens{Punch Machine, Kick Machine, Rolling Kick Machine}
local itens = {13031, 13032, 13033} 
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
        if getPlayerItemCount(cid, itens[i]) >= 1 then
           check = check + 1
        end       
    end
return check
end
-------------------------------------
if getPlayerStorageValue(cid, 659878) == 4 then
   selfSay("You Already Completed My Mission...", cid)
   talkState[cid] = 0
   return false 
end   

if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659878) == -1 then
       selfSay("You need character level 70, can you do it?", cid)
       talkState[cid] = 1

elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'evet')) and talkState[cid] == 1 and getPlayerStorageValue(cid, 659878) == -1 then
       if getPlayerSkill(cid, 6) >= 1 and getPlayerLevel(cid) >= 70 then
          selfSay("Thank you very much, let me know if you want another mission.", cid)
          setPlayerStorageValue(cid, 659878, 1)
       else
          selfSay("You haven't level 70.", cid)
          talkState[cid] = 0
          return true
       end 
   
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659878) == 1 then
       selfSay("You need atleast 50 pokemons in your pokedex, can you do it?", cid)
       talkState[cid] = 2
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'evet')) and talkState[cid] == 2 and getPlayerStorageValue(cid, 659878) == 1 then

local check = checkDex(cid)
	if check >= 50 then
       selfSay("Thank you very much, let me know if you want another mission...", cid)
       setPlayerStorageValue(cid, 659878, 2)
    else
       selfSay("You haven't 50 pokemons in your pokedex yet, come back when you do that...", cid)
       talkState[cid] = 0
       return true
    end
       
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659878) == 2 then
      selfSay("Are you have Punch Machine, Kick Machine and Rolling Kick Machine?", cid)
      talkState[cid] = 3
  
elseif (msgcontains(msg, 'evet') or msgcontains(msg, 'yes')) and talkState[cid] == 3 and getPlayerStorageValue(cid, 659878) == 2 then

local check3 = checkItens(cid, itens)
    if check3 == #itens then
       for a = 1, #itens do
           doPlayerRemoveItem(cid, itens[a], 1)
       end
       selfSay("Thank you very much, let me know if you want another mission.", cid)
       setPlayerStorageValue(cid, 659878, 3)
       doPlayerAddItem(cid, 13004, 1) --Hitmon Box.. altere como quiser...
    else
       selfSay("You don't have some item which i asked for you...", cid)
       talkState[cid] = 0
       return true
    end      
    
elseif (msgcontains(msg, 'no') or msgcontains(msg, 'hayir')) then
     selfSay("So Good Bye...", cid)
     talkState[cid] = 0
     return false 
end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())