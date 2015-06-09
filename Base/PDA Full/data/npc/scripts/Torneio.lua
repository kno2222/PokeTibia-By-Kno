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

if msgcontains(msg, 'torneio') or msgcontains(msg, 'enter') then



selfSay('Voc� quer participar do torneio por ['..torneio.price..']  dollars? [Sim/Yes]', cid)
talkState[talkUser] = 2


elseif talkState[talkUser] == 2 then

if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then

if os.date("%X") < torneio.startHour or os.date("%X") > torneio.endHour then
selfSay('As inscri��es para o torneio terminaram, volte Amanha AS 18:00 para nova inscri�ao!.', cid)
return true
end

if doPlayerRemoveMoney(cid, torneio.price) then
doTeleportThing(cid, torneio.waitPlace)
setPlayerStorageValue(cid,130130,1) 
doPlayerSendTextMessage(cid, 21, "Bem-vindo, esta � a sala de espera, voc� espera aqui enquanto o torneio n�o come�a. hora de in�cio: {"..torneio.endHour.."}.")
else

selfSay('Voce nao Tem Dinheiro ('..torneio.price..').', cid)
end
else
selfSay('Voce nao quer participar do Torneio? Vem no Proximo Dia / Todos os Dias as [15:00]!', cid)
talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())