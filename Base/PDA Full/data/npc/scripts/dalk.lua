local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
msg = string.lower(msg)
---------
local configs = {
diamondsID = 2145,  --id do diamond no items.xml/otb... (achu q vais ter q criar, ou pegar algum item q ja tenha ae...)
VIP = {days = 360, cost = 10},    --days = qnts dias de VIP o player compra por vez.... cost = custo para virar VIP...
SEX = {cost = 3},   --cost = custo para trocar de sexo...
TOWN = {cost = 3},  --cost = custo para trocar de city...
}  

local places = {
["saffron"] = 1,    --tens q por o id do RME das tuas citys aki...
["cerulean"] = 1,
["lavender"] = 1,
["fuchsia"] = 1,
["celadon"] = 1, 
["viridian"] = 1, 
["vermilion"] = 1, 
["pewter"] = 1,                      
["cinnabar"] = 1,
}

       
        if (msgcontains(msg, 'diamond account') or msgcontains(msg, 'diamond')) then  
           selfSay("You want to buy a diamond account and be VIP for "..configs.VIP.days.." days? It will cost "..configs.VIP.cost.." diamonds!", cid)   
           talkState[talkUser] = 2
           return true    
          
        elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then
           if getPlayerItemCount(cid, configs.diamondsID) >= configs.VIP.cost then
              selfSay("Ok then, now you have "..configs.VIP.days.." days of VIP! Enjoy!", cid)
              doPlayerAddPremiumDays(cid, configs.VIP.days)
              doPlayerRemoveItem(cid, configs.diamondsID, configs.VIP.cost)
              talkState[talkUser] = 0
              return true
           else
              selfSay("You need atleast "..configs.VIP.cost.." diamonds to do that!", cid)
              talkState[talkUser] = 0
              return true
           end
           
        elseif (msgcontains(msg, 'sex change') or msgcontains(msg, 'sex')) then
           selfSay("So you want to change of sex? It will cost "..configs.SEX.cost.." diamonds", cid) 
           talkState[talkUser] = 3
           return true
        
        elseif msgcontains(msg, 'yes') and talkState[talkUser] == 3 then
           if getPlayerItemCount(cid, configs.diamondsID) >= configs.SEX.cost then
              local sex = getPlayerSex(cid)
              selfSay("Ok then, now you are of the sex "..(sex == 0 and "female" or "male")..". Enjoy!", cid)
              doPlayerSetSex(cid, (sex == 0 and 1 or 0))
              doPlayerRemoveItem(cid, configs.diamondsID, configs.SEX.cost)
              talkState[talkUser] = 0
              return true
           else
              selfSay("You need atleast "..configs.SEX.cost.." diamonds to do that!", cid)
              talkState[talkUser] = 0
              return true
           end
           

return true
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             