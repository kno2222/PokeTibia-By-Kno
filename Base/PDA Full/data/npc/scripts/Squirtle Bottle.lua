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
--id dos itens{Water Pendant, Squirtle Hull}
local itens = {12170, 12158} 
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
        if getPlayerItemCount(cid, itens[i]) >= 25 then
           check = check + 1
        end       
    end
return check
end
-------------------------------------
if getPlayerStorageValue(cid, 659877) == 3 then
   selfSay("You already completed my missions...", cid)
   talkState[cid] = 0
   return false 
end   

if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659877) == -1 then
       selfSay("You need character level 25, can you do it?", cid)
       talkState[cid] = 1

elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'evet')) and talkState[cid] == 1 and getPlayerStorageValue(cid, 659877) == -1 then
       if getPlayerSkill(cid, 6) >= 1 and getPlayerLevel(cid) >= 25 then
          selfSay("Thank you very much, let me know if you want another mission.", cid)
          setPlayerStorageValue(cid, 659877, 1)
       else
          selfSay("You haven't level 25.", cid)
          talkState[cid] = 0
          return true
       end 
   
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659877) == 1 then
      selfSay("Are you have 25 Water Pendant and 25 Squirtle Hull?", cid)
      talkState[cid] = 2
  
elseif (msgcontains(msg, 'evet') or msgcontains(msg, 'yes')) and talkState[cid] == 2 and getPlayerStorageValue(cid, 659877) == 1 then

local check3 = checkItens(cid, itens)
    if check3 == #itens then
       for a = 1, #itens do
           doPlayerRemoveItem(cid, itens[a], 25)
       end
       selfSay("Thank you very much, let me know if you want another mission.", cid)
       setPlayerStorageValue(cid, 659877, 2)
       doPlayerAddItem(cid, 12594, 1) --squirtle bottle.. altere como quiser...
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