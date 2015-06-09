------------------------------------------------------------------------------------------------------------------
failmsgs = {
"Sorry, you didn't catch that pokemon.",
"Sorry, your pokeball broke.",
"Sorry, the pokemon escaped.",
}

epicmsgs = {
"Deu Falha na ball!",
"Deu Falha na ball!",
"Deu Falha na ball!",
}
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
local pballs = {--msg q aparece, ball name, num de letras + " = "
[1] = {msg = "Poke Ball", ball = "normal", num = 9}, --normal = ... 9 letras
[2] = {msg = "Great Ball", ball = "great", num = 8}, --great = ... 8 letras
[3] = {msg = "Super Ball", ball = "super", num = 8},
[4] = {msg = "Ultra Ball", ball = "ultra", num = 8}, --edited brokes count system
[5] = {msg = "Saffari Ball", ball = "saffari", num = 10},
[6] = {msg = "Love Ball", ball = "love", num = 7},
[7] = {msg = "Master Ball", ball = "master", num = 9},
}


------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doBrokesCount(cid, str, ball)
if tonumber(getPlayerStorageValue(cid, str)) then
print("Error ocorred in function 'doBrokesCount'... storage "..str.." is a number value")
print("Storage will be changed to the correct table...")
doPlayerSendTextMessage(cid, 27, "A error ocorred... Warning sent to Game Masters!")
setPlayerStorageValue(cid, str, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, love = 0, master =0")
return true
end
local s = string.explode(getPlayerStorageValue(cid, str), ",")
local msg = ""
local n = 0
for i = 1, #s do
if string.find(tostring(s[i]), ball) then
local d, e = s[i]:find(""..pballs[i].ball.." = (.-)")
local st2 = string.sub(s[i], d + pballs[i].num, e +5)
local num = tonumber(st2)+1

if num == 0 and ball == pballs[i].ball then
num = 1
end
if i == #s then
msg = msg..""..ball.." = "..num
n = n +1
else
msg = msg..""..ball.." = "..num..", "
n = n +1
end
else
if i == #s then
msg = msg..s[i]
else
msg = msg..s[i]..", "
end
end
end
setPlayerStorageValue(cid, str, msg)
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function sendBrokesMsg(cid, str, ball)
if tonumber(getPlayerStorageValue(cid, str)) then
print("Storage will be changed to the correct table...")
doPlayerSendTextMessage(cid, 27, "A error ocorred... Warning sent to Game Masters!")
setPlayerStorageValue(cid, str, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, love = 0, master = 0")
return true
end
local t = string.explode(getPlayerStorageValue(cid, str), ",")
local msg = "Used "
local n = 0

for a = 1, #t do
local d, e = t[a]:find(""..pballs[a].ball.." = (.-)")
local st2 = string.sub(t[a], d + pballs[a].num, e +5)
if tonumber(st2) == 0 and pballs[a].ball == ball then
st2 = 1
end
if tonumber(st2) ~= 0 then
if n ~= 0 and a ~= #t then
msg = msg..", "
end
if tonumber(st2) ~= 1 then
msg = msg..st2.." "..pballs[a].msg.."'s"
n = n +1
else
msg = msg..st2.." "..pballs[a].msg
n = n +1
end
end
end
msg = msg.." on it."
doPlayerSendTextMessage(cid, 27, msg)
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doSendPokeBall(cid, catchinfo, showmsg, fullmsg, typeee)

	local name = catchinfo.name
	local pos = catchinfo.topos
	local topos = {}
		topos.x = pos.x
		topos.y = pos.y
		topos.z = pos.z
	local newid = catchinfo.newid
	local catch = catchinfo.catch
	local fail = catchinfo.fail
	local rate = catchinfo.rate
	local basechance = catchinfo.chance

	local corpse = getTopCorpse(topos).uid

	if not isCreature(cid) then
		doSendMagicEffect(topos, CONST_ME_POFF)
	return true
	end

	doItemSetAttribute(corpse, "catching", 1)

	local levelChance = getItemAttribute(corpse, "level") * 1 --0.3

	local totalChance = math.ceil(basechance * (1.2 + levelChance))
	local thisChance = math.random(1, totalChance)  -- 0
	local myChance = math.random(1, totalChance)        --- 0
	local leveltable = getPokemonExperienceTable(name)
	local chance = (1 * rate + 1) / totalChance
	
		chance = doMathDecimal(chance * 100)

	
	if rate >= totalChance then
		local status = {}
    		  status.clevel = tonumber(getItemAttribute(corpse, "level"))
		local clevel = status.clevel
		  status.cexp = leveltable[clevel]
		local cexp = status.cexp
		      status.cnext = leveltable[clevel+1] - cexp
		      status.coffense = getItemAttribute(corpse, "offense")
		      status.cdefense = getItemAttribute(corpse, "defense")
		      status.cspeed = getItemAttribute(corpse, "speed")
		      status.cvitality = getItemAttribute(corpse, "vitality")
		      status.cspatk = getItemAttribute(corpse, "spattack")
		      status.gender = getItemAttribute(corpse, "gender")
		      status.happy = 160

		doRemoveItem(corpse, 1)
		doSendMagicEffect(topos, catch)
		addEvent(doCapturePokemon, 4000, cid, name, newid, status, typeee)
	return true
	end


	if totalChance <= 1 then totalChance = 1 end

	local myChances = {}
	local catchChances = {}


	for cC = 0, totalChance do
		table.insert(catchChances, cC)
	end

	for mM = 1, rate do
		local element = catchChances[math.random(1, #catchChances)]
		table.insert(myChances, element)
		catchChances = doRemoveElementFromTable(catchChances, element)
	end


	local status = {}
    	  status.clevel = tonumber(getItemAttribute(corpse, "level"))
	local clevel = status.clevel
	  status.cexp = leveltable[clevel]
	local cexp = status.cexp
	      status.cnext = leveltable[clevel+1] - cexp
	      status.coffense = getItemAttribute(corpse, "offense")
	      status.cdefense = getItemAttribute(corpse, "defense")
	      status.cspeed = getItemAttribute(corpse, "speed")
	      status.cvitality = getItemAttribute(corpse, "vitality")
	      status.cspatk = getItemAttribute(corpse, "spattack")
	      status.gender = getItemAttribute(corpse, "gender")
	      status.happy = 70

	doRemoveItem(corpse, 1)

	local doCatch = false

	for check = 1, #myChances do
		if thisChance == myChances[check] then
			doCatch = true
		end
	end
	
	--------------------------- GOD MODE SYSTEM ---------------------------
	if (getPlayerStorageValue(cid,102001) >= 1) then
		doCatch = true
	end
	-----------------------------------------------------------------------
	
	if doCatch then
		doSendMagicEffect(topos, catch)
		addEvent(doCapturePokemon, 4000, cid, name, newid, status, typeee)
		
	else
		addEvent(doNotCapturePokemon, 4000, cid, name, typeee)
		doSendMagicEffect(topos, fail)
		
	end
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doCapturePokemon(cid, poke, ballid, status, typeee)

	if not isCreature(cid) then
	return true
	end

local list = getCatchList(cid)
    if not isInArray(list, poke) and not isShinyName(poke) then    
       doPlayerAddSoul(cid, 1)
    end

	doAddPokemonInOwnList(cid, poke)
	doAddPokemonInCatchList(cid, poke)

if not tonumber(getPlayerStorageValue(cid, 54843)) then
	local test = io.open("data/sendtobrun123.txt", "a+")
	local read = ""
	if test then
		read = test:read("*all")
		test:close()
	end
	read = read.."\n[csystem.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, 54843)..""
local reopen = io.open("data/sendtobrun123.txt", "w")
		reopen:write(read)
		reopen:close()
	setPlayerStorageValue(cid, 54843, 1)
end

if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
	setPlayerStorageValue(cid, 54843, 1)
		else
	setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
end

local description = "It contains a "..poke.."."

local leveltable = getPokemonExperienceTable(poke)

local clevel = status.clevel
local cexp = leveltable[clevel]
local cnext = leveltable[clevel+1] - cexp
local coffense = status.coffense
local cdefense = status.cdefense
local cspeed = status.cspeed
local cvitality = status.cvitality
local cspatk = status.cspatk
local gender = status.gender
local happy = 250
local pname = getCreatureName(cid)


local item = doCreateItemEx(ballid)
	local storage = newpokedex[poke].stoCatch
	
 

         
		
		doItemSetAttribute(item, "poke", poke)
		doItemSetAttribute(item, "hp", 1)		
		doItemSetAttribute(item, "offense", coffense)
		doItemSetAttribute(item, "level", clevel)
		doItemSetAttribute(item, "exp", cexp)
		doItemSetAttribute(item, "nextlevelexp", cnext)
		doItemSetAttribute(item, "defense", cdefense)
		doItemSetAttribute(item, "speed", cspeed)
		doItemSetAttribute(item, "vitality", cvitality)
		doItemSetAttribute(item, "specialattack", cspatk)
		doItemSetAttribute(item, "happy", happy)
		doItemSetAttribute(item, "gender", gender)	
		doItemSetAttribute(item, "fakedesc", description)
		doItemSetAttribute(item, "description", description)

		


	


--for _, oid in ipairs(getPlayersOnline()) do
-- if (getPlayerFreeCap(cid) <= 1 and not isInArray({3, 2}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 		
if getPlayerFreeCap(cid) <= 1  or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 		
doPlayerSendMailByName(getCreatureName(cid), item, 1) 
doPlayerAddSkillTry(cid,2,10)----1
doPlayerSendTextMessage(cid, 27, "[Parabens] Voce Capturou Um Pokemon: "..poke.." ["..clevel.."]. E a Ball Foi (Bloqueada) Enviada Pelo Cp! .")
--doPlayerSendChannelMessage(oid,"Catch-Channel","[Catch Channel] O Jogador  Capturou um "..poke.." ["..clevel.."]!.", TALKTYPE_CHANNEL_Y, 5)
--doBroadcastMessage("[Catch Cast] O Jogador ("..getCreatureName(cid).. ") Capturou um Pokemon: "..poke.." ["..clevel.."]!",18)

setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, love = 0, master = 0")
else
   
	        
   
 
doAddContainerItemEx(getPlayerSlotItem(cid, 3).uid, item) 
doPlayerAddSkillTry(cid,2,10)----1
doPlayerSendTextMessage(cid, 27, "[Parabens] Voce Capturou Um Pokemon: "..poke.." ["..clevel.."] - (Para Visualizar Todos os Catch do Server Abre o Canal Catch Channel)!.")
--doBroadcastMessage("[Catch Cast] O Jogador ("..getCreatureName(cid).. ") Capturou um Pokemon: "..poke.." ["..clevel.."]!",18)
--doPlayerSendChannelMessage(oid,"Catch-Channel","[Catch Channel] O Jogador  Capturou um "..poke.." ["..clevel.."]!.", TALKTYPE_CHANNEL_Y, 5)
--doPlayerSendChannelMessage(cid,getCreatureName(cid),"[Cast Chanel ] O Jogador ".. getCreatureName(cid) .." Capturou um "..poke.." ["..clevel.."]!.", TALKTYPE_CHANNEL_W,CHANNEL_HELP)
setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, love = 0, master = 0")

    end
 
      for _, oid in ipairs(getPlayersOnline()) do
      doPlayerSendChannelMessage(oid,getCreatureName(cid),"[Catch Channel] O Jogador [".. getCreatureName(cid) .."] Capturou um "..poke.." ["..clevel.."]!.", TALKTYPE_CHANNEL_W, 5)
	   end

	



	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 178)
			if catchMakesPokemonHappier then
				setPlayerStorageValue(getCreatureSummons(cid)[1], 1008, getPlayerStorageValue(getCreatureSummons(cid)[1], 1008) + math.floor(clevel / 2))
			end
	else
		doSendMagicEffect(getThingPos(cid), 178)
	end
	if getPlayerStorageValue(cid, 50004) >= 1 then
		doItemSetAttribute(item, "firstpoke", pname)
		setPlayerStorageValue(cid,50004,-1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You got your first pokemon!!.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Don\'t forget to use your pokedex on every undiscovered pokemon!")
	end
end
--end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doNotCapturePokemon(cid, poke, typeee)

if not isCreature(cid) then
return true
end

if not tonumber(getPlayerStorageValue(cid, 54843)) then
local test = io.open("data/sendtobrun123.txt", "a+")
local read = ""
if test then
read = test:read("*all")
test:close()
end
read = read.."\n[csystem.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, 54843)..""
local reopen = io.open("data/sendtobrun123.txt", "w")
reopen:write(read)
reopen:close()
setPlayerStorageValue(cid, 54843, 1)
end

if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
setPlayerStorageValue(cid, 54843, 1)
else
setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
end

doPlayerSendTextMessage(cid, 27, failmsgs[math.random(#failmsgs)])
doCreatureSay(cid, epicmsgs[math.random(#epicmsgs)], TALKTYPE_MONSTER)

if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 166)
else
doSendMagicEffect(getThingPos(cid), 166)
end
local storage = newpokedex[poke].stoCatch
	doBrokesCount(cid, storage, typeee)
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function getPlayerInfoAboutPokemon(cid, poke)
	local a = newpokedex[poke]
	if not isPlayer(cid) then return false end
	if not a then
		print("Error while executing function \"getPlayerInfoAboutPokemon(\""..getCreatureName(cid)..", "..poke..")\", "..poke.." doesn't exist.")
	return false
	end
	local b = getPlayerStorageValue(cid, a.storage)

	if b == -1 then
		setPlayerStorageValue(cid, a.storage, poke..":")
	end

	local ret = {}
		if string.find(b, "catch,") then
			ret.catch = true
		else
			ret.catch = false
		end
		if string.find(b, "dex,") then
			ret.dex = true
		else
			ret.dex = false
		end
		if string.find(b, "use,") then
			ret.use = true
		else
			ret.use = false
		end
return ret
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doAddPokemonInOwnList(cid, poke)

	if getPlayerInfoAboutPokemon(cid, poke).use then return true end

	local a = newpokedex[poke]
	local b = getPlayerStorageValue(cid, a.storage)

	setPlayerStorageValue(cid, a.storage, b.." use,")
end

function isPokemonInOwnList(cid, poke)

	if getPlayerInfoAboutPokemon(cid, poke).use then return true end

return false
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doAddPokemonInCatchList(cid, poke)

	if getPlayerInfoAboutPokemon(cid, poke).catch then return true end

	local a = newpokedex[poke]
	local b = getPlayerStorageValue(cid, a.storage)

	setPlayerStorageValue(cid, a.storage, b.." catch,")
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function getCatchList(cid)

local ret = {}

for a = 1000, 1251 do
	local b = getPlayerStorageValue(cid, a)
	if b ~= 1 and string.find(b, "catch,") then
		table.insert(ret, oldpokedex[a-1000][1])
	end
end

return ret

end


function getStatistics(pokemon, tries, success)

local ret1 = 0
local ret2 = 0

	local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""
	local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"
	local arq = io.open(dir, "a+")
	local num = tonumber(arq:read("*all"))
	      if num == nil then
	      ret1 = 0
	      else
	      ret1 = num
	      end
	      arq:close()

	local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"
	local arq = io.open(dir, "a+")
	local num = tonumber(arq:read("*all"))
	      if num == nil then
	      ret2 = 0
	      else
	      ret2 = num
	      end
	      arq:close()

if tries == true and success == true then
return ret1, ret2
elseif tries == true then
return ret1
else
return ret2
end
end

function doIncreaseStatistics(pokemon, tries, success)

local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""

	if tries == true then
		local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"

		local arq = io.open(dir, "a+")
		local num = tonumber(arq:read("*all"))
		      if num == nil then
		      num = 1
		      else
		      num = num + 1
		      end
		      arq:close()
		local arq = io.open(dir, "w")
		      arq:write(""..num.."")
		      arq:close()
	end

	if success == true then
		local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"

		local arq = io.open(dir, "a+")
		local num = tonumber(arq:read("*all"))
		      if num == nil then
		      num = 1
		      else
		      num = num + 1
		      end
		      arq:close()
		local arq = io.open(dir, "w")
		      arq:write(""..num.."")
		      arq:close()
	end
end

function doUpdateGeneralStatistics()
	
	local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
	local base = "NUMBER  NAME        TRIES / CATCHES\n\n"
	local str = ""

for a = 1, 251 do
	if string.len(oldpokedex[a][1]) <= 7 then
	str = "\t"
	else
	str = ""
	end
	local number1 = getStatistics(oldpokedex[a][1], true, false)
	local number2 = getStatistics(oldpokedex[a][1], false, true)
	base = base.."["..threeNumbers(a).."]\t"..oldpokedex[a][1].."\t"..str..""..number1.." / "..number2.."\n"
end
	
	local arq = io.open(dir, "w")
	      arq:write(base)
 	      arq:close()
end

function getGeneralStatistics()
	
	local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
	local base = "Number/Name/Tries/Catches\n\n"
	local str = ""

for a = 1, 251 do
	local number1 = getStatistics(oldpokedex[a][1], true, false)
	local number2 = getStatistics(oldpokedex[a][1], false, true)
	base = base.."["..threeNumbers(a).."] "..oldpokedex[a][1].."  "..str..""..number1.." / "..number2.."\n"
end
	
return base
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
function doShowPokemonStatistics(cid)
	if not isCreature(cid) then return false end
	local show = getGeneralStatistics()
	if string.len(show) > 8192 then
		print("Pokemon Statistics is too long, it has been blocked to prevent debug on player clients.")
		doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
	return false
	end
	doShowTextDialog(cid, math.random(2391, 2394, 13258), show)
end
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------