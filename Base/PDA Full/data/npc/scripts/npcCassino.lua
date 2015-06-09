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

------------------------------------------------------------
local function buyPoke(cid, pokemon, price, lvl)            --alterado v2.9 TUDO!! \/
if pokemon == "" then return true end

local btype = "normal"
local gender = getRandomGenderByName(pokemon)
local mypoke = getPokemonStatus(pokemon)
if not mypoke then return true end

local level = lvl
local extrastr = 1
local offense = mypoke.off * level * extrastr
local defense = mypoke.def * level * extrastr
local speed = mypoke.agi * level * extrastr
local vit = mypoke.vit * level * extrastr
local spatk = mypoke.spatk * level * extrastr
local happy = 250
local leveltable = getPokemonExperienceTable(pokemon)

if (getPlayerFreeCap(cid) >= 6 and not isInArray({5, 6}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then  
   item = doCreateItemEx(11826)
else
    item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, 11826, 1)   
end

doItemSetAttribute(item, "poke", pokemon)
doItemSetAttribute(item, "hp", 1)
doItemSetAttribute(item, "level", level)
doItemSetAttribute(item, "exp", leveltable[level])
doItemSetAttribute(item, "nextlevelexp", leveltable[level+1] - leveltable[level])
doItemSetAttribute(item, "offense", offense)
doItemSetAttribute(item, "defense", defense)
doItemSetAttribute(item, "speed", speed)
doItemSetAttribute(item, "vitality", vit)
doItemSetAttribute(item, "specialattack", spatk)
doItemSetAttribute(item, "happy", happy)
doItemSetAttribute(item, "gender", gender)
doItemSetAttribute(item, "description", "Contains a "..pokemon..".")
doItemSetAttribute(item, "fakedesc", "Contains a "..pokemon..".")

if getPlayerFreeCap(cid) <= 6 or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
   doPlayerSendMailByName(getCreatureName(cid), item, 1)
   selfSay("Your pokemon was sent to Pokemon Center!", cid)
end
   setPlayerStorageValue(cid, 23254, getPlayerStorageValue(cid, 23254) - price)
end

local pokes = {
["eevee"] = {poke = "Eevee", lvl = 20, price = 2500000},
["porygon"] = {poke = "Porygon", lvl = 30, price = 7000000},
["ditto"] = {poke = "Ditto", lvl = 30, price = 6000000},
["mr. mime"] = {poke = "Mr. Mime", lvl = 40, price = 5000000},
}
local msg = tonumber(msg) and msg or msg:lower()
------------------------------------------------------------------------------

if msgcontains(msg, 'pokemon') or msgcontains(msg, 'prizes') then
   selfSay("Tenho quatro Pokemons para escolher um entre eles: {Eevee}, {Porygon}, {Ditto} and {Mr. Mime}, Qual voce Quer? ", cid)
   talkState[cid] = 1
   return true
   
elseif pokes[msg] and talkState[cid] == 1 then
   pokemon = pokes[msg]
   selfSay("Tem certeza de que quer comprar um ".. doCorrectString(msg) .." por ".. pokemon.price .." cassino coins?", cid)
   talkState[cid] = 2
   return true
   
elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) and talkState[cid] == 2 then
   if getPlayerStorageValue(cid, 23254) >= pokemon.price then
      selfSay("Aqui esta! Você acabou de comprar um "..pokemon.poke.." por "..pokemon.price.." casino coins!", cid)
      buyPoke(cid, pokemon.poke, pokemon.price, pokemon.lvl)
      talkState[cid] = 0
      return true
   else
      selfSay("Voce nao Tem Cassino Coins Suficientes", cid)
      talkState[cid] = 0
      return true 
   end
end

if (msgcontains(msg, "buy coins") or msgcontains(msg, "buy cassino coins")) and (not talkState[cid] or talkState[cid] == 0) then
   selfSay("Entao ... voce quer comprar moedas. Quantos? Digamos que um numero entre 1 e 10 milhoes!", cid)
   talkState[cid] = 3
   return true
   
elseif tonumber(msg) and tonumber(msg) >= 1 and tonumber(msg) <= 10000000 and talkState[cid] == 3 then
   coins = tonumber(msg)
   price = tonumber(msg) / 100
   moneyMsg = price < 1 and price*100 .. " cent(s)" or price .. " dollar(s)" 
   
   selfSay("Isso Vai Custar ".. moneyMsg ..",voce tem certeza que quer isso?", cid)
   talkState[cid] = 4
   return true
   
elseif (msgcontains(msg, "yes") or msgcontains(msg, "evet")) and talkState[cid] == 4 then
   if doPlayerRemoveMoney(cid, coins) then
      selfSay("Aproveite  com sabedoria...", cid)
      if getPlayerStorageValue(cid, 23254) < 0 then setPlayerStorageValue(cid, 23254, 0) end
      setPlayerStorageValue(cid, 23254, getPlayerStorageValue(cid, 23254) + coins)
      talkState[cid] = 0
      return true
   else
      selfSay("Você nao tem ".. moneyMsg .."...", cid)
      talkState[cid] = 0
      return true
   end
end

if (msgcontains(msg, "sell coins") or msgcontains(msg, "sell cassino coins")) and (not talkState[cid] or talkState[cid] == 0) then
   selfSay("Quantas moedas voce quer voltar para o dinheiro? Digamos que um numero entre 1 e 10 milhoes!", cid)
   talkState[cid] = 5
   return true
   
elseif tonumber(msg) and tonumber(msg) >= 1 and tonumber(msg) <= 10000000 and talkState[cid] == 5 then
   coinsBack = tonumber(msg)
   selfSay("Voce Quer ".. coinsBack .." Coins Para Voltar em Dinheiro?", cid)
   talkState[cid] = 6
   return true
  
elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) and talkState[cid] == 6 then
   if getPlayerStorageValue(cid, 23254) >= coinsBack then
      setPlayerStorageValue(cid, 23254, getPlayerStorageValue(cid, 23254) - coinsBack)
      doPlayerAddMoney(cid, coinsBack)
      selfSay("Aqui esta o seu dinheiro.", cid)
      talkState[cid] = 0
      return true
   else
      selfSay("Voce nao Tem Muitos Casino Coins!", cid)
      talkState[cid] = 0
      return true
   end
end

if (msgcontains(msg, "no") or msgcontains(msg, "nao")) then
   selfSay("Ok, entao, voltar se voce quiser algo...", cid)
   talkState[cid] = 0
   return true     
end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())