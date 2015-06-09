local focus = 0
local talk_start = 0
local conv = 0
local target = 0
local following = false
local attacking = false
local talkState = {}
local finalname = ""

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye sir!')
focus = 0
talk_start = 0
end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msge)
local msg = string.lower(msge)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


	if focus == cid then
		talk_start = os.clock()
	end

local auras = {"red aura", "blue aura", "green aura", "yellow aura", "white aura", "gray aura", "cyan aura", "purple aura", "orange aura"}


if (msgcontains(msg, 'hi') and (focus == 0) and (getDistanceToCreature(cid) <= 4)) then

	focus = cid
	conv = 1
	talk_start = os.clock()
	selfSay("Ola, "..getCreatureName(cid).."!. Eu Coloco Aura em Seu Pokemon Boostado +[50]. Digite [aura]!")

elseif (msgcontains(msg, "no") or msgcontains(msg, "bye")) and focus == cid and conv ~= 3 then

	selfSay("Ate Mais!")
	focus = 0
	
elseif msgcontains(msg, "aura") and focus == cid and conv == 1 then

     if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Desculpe, voce nao tem um pokemon no slot principal!")
        focus = 0
     return true
     end
     
     local pb = getPlayerSlotItem(cid, 8).uid
     if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
        selfSay("Desculpe, Eu So Posso Dar Aura Se o Seu Pokemon For +[50]!")
        focus = 0
     return true
     end  
     
     if getItemAttribute(pb, "aura") and getItemAttribute(pb, "aura") ~= "" then
        selfSay("Desculpe, Seu Pokemon ja Esta com Elemento de Aura!")
        focus = 0
     return true
     end 
     
     if #getCreatureSummons(cid) >= 1 then 
        selfSay("Devolva o seu pokemon para sua pokeball!")
        focus = 0
     return true
     end       
          
     selfSay("Voce pode escolher uma dessas auras: red aura, blue aura, green aura, yellow aura, white aura, gray aura, cyan aura, purple aura, orange aura. Qual Voce Prefere?")
     conv = 9
     
elseif isInArray(auras, msg) and focus == cid and conv == 9 then

       selfSay("Tem certeza que voce quer colocar um "..msg.." No Seu Pokemon?")
       conv = 11 
       local d, e = msg:find('(.-) aura')
	   auraFinal = string.sub(msg, d -1, e - 5)
	   
elseif msgcontains(msg, "yes") and focus == cid and conv == 11 then        

     if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Desculpe, voce não tem um pokemon no slot principal!")
        focus = 0
     return true
     end
     
     local pb = getPlayerSlotItem(cid, 8).uid
     if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
        selfSay("Desculpe, Seu Pokemon nao Esta +[50]!")
        focus = 0
     return true
     end
     
     if #getCreatureSummons(cid) >= 1 then 
        selfSay("RDevolva o seu pokemon para sua pokeball!")
        focus = 0
     return true
     end   
     
     doItemSetAttribute(pb, "aura", auraFinal)   
     selfSay("Feito! Agora seu pokemon tem uma nova aura elemental. Divirta-se!")
	 focus = 0
	 conv = 0
	end
end
 
local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Eu Posso Dar Auras em Seu Pokemon!",
		  "So Basta ter Boost +[50]!",
		 }

function onThink()

	if focus == 0 then
		selfTurn(1)
			delay = delay - 0.5
			if delay <= 0 then
				selfSay(messages[number])
				number = number + 1
					if number > #messages then
						number = 1
					end
				delay = math.random(intervalmin, intervalmax)
			end
		return true
	else

	if not isCreature(focus) then
		focus = 0
	return true
	end

		local npcpos = getThingPos(getThis())
		local focpos = getThingPos(focus)

		if npcpos.z ~= focpos.z then
			focus = 0
		return true
		end

		if (os.clock() - talk_start) > 45 then
			focus = 0
			selfSay("Come back some other time!")
		end

		if getDistanceToCreature(focus) > 3 then
			selfSay("Enjoy!")
			focus = 0
		return true
		end

		local dir = doDirectPos(npcpos, focpos)	
		selfTurn(dir)
	end


return true
end