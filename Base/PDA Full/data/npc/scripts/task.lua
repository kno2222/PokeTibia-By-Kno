-- Script por Killua, antigo Amoeba13 --

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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

for varm, tasks in pairs(amoebaTask) do
    local msg = string.lower(msg)
    if isInArray(tasks.nome, msg) then
        if getPlayerStorageValue(cid, tasks.storagecount) == tasks.count then
            local esperiencia = tasks.exp > 0 and "" ..tasks.exp.. " exp e " or ""
            local dineiro = tasks.money > 0 and "" .. tasks.money .. " gold coins e " or ""
            selfSay("Voce conseguiu completar a task de ".. tasks.nome .. ", parabens! Eu vou te dar " .. esperiencia .. "" .. dineiro .."alguns itens como recompensa.", cid)
            doPlayerAddExperience(cid, tasks.exp)
            doPlayerAddMoney(cid, tasks.money)
            doPlayerSetStorageValue(cid, tasks.storagecount, 0)
            for juba, prize in pairs(tasks.premios) do
                doPlayerAddItem(cid, prize[1], prize[2])
        end
        else
            selfSay("Desculpe, mas voce ainda nao matou todos os " .. tasks.nome .. "s. Voce so matou " .. taskKills(cid, tasks.storagecount) .. " de " .. tasks.count .. " " .. tasks.nome .. "s.", cid)
            break
        end
end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())