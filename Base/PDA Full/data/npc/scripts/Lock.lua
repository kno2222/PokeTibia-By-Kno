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

       
        if msgcontains(msg, 'lock') or msgcontains(msg, 'Lock') then
           selfSay("Ent�o voc� quer bloquear o seu pokemon ... Ok ent�o, coloque o seu pokemon no slot pokeball e dizer quantos dias voc� deseja bloquear, digamos, um n�mero entre 1 e 90!", cid)
           talkState[talkUser] = 1
           return true
           
        elseif tonumber(msg) ~= nil and talkState[talkUser] == 1 then
           local number = tonumber(msg)
           local ball = getPlayerSlotItem(cid, 8)
           if number <= 0 or number >= 91 then
              selfSay("Eu lhe disse para dizer um n�mero entre 1 e 90, repito quantos dias voc� quer?", cid)
              return true
           elseif not isPokeball(ball.itemid) then
              selfSay("Colocar um pokemon no slot correto e dizer novamente o n�mero de dias que voc� quer!", cid)
              return true
           elseif getItemAttribute(ball.uid, "lock") and getItemAttribute(ball.uid, "lock") > 0 then
              selfSay("Este pokeball j� est� bloqueado!", cid)
              talkState[talkUser] = 0
              return true  
           elseif getItemAttribute(ball.uid, "unique") then
              selfSay("Este pokeball j� � um artigo original!", cid)
              talkState[talkUser] = 0
              return true     
           else 
              local days = number * 24 * 60 * 60
              doItemSetAttribute(ball.uid, "lock", os.time()+days)
              doItemSetAttribute(ball.uid, "unique", getCreatureName(cid))
              
              selfSay("There is it, good luck!", cid)
              talkState[talkUser] = 0
              return true
           end
        end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             