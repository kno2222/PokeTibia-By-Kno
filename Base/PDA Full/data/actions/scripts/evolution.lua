local special = specialevo

local types = {
[leaf] = {"Bulbasaur", "Ivysaur", "Oddish", "Gloom", "Bellsprout", "Weepinbell", "Exeggcute", "Chikorita", "Bayleef", "Hoppip", "Skiploom", "Sunkern"},
[water] = {"Squirtle", "Wartortle", "Horsea", "Goldeen", "Magikarp", "Psyduck", "Poliwag", "Poliwhirl", "Tentacool", "Krabby", "Staryu", "Omanyte", "Eevee", "Totodile", "Croconow", "Chinchou", "Marill", "Wooper", "Slowpoke", "Remoraid", "Seadra"},
[dusk] = {"Zubat", "Ekans", "Nidoran male", "Nidoran female", "Nidorino", "Nidorina", "Gloom", "Venonat", "Tentacool", "Grimer", "Koffing", "Spinarak", "Golbat"},
[thunder] = {"Magnemite", "Pikachu", "Voltorb", "Eevee", "Chinchou", "Pichu", "Mareep", "Flaaffy", "Elekid"},
[moon] = {"Geodude", "Graveler", "Rhyhorn", "Kabuto", "Slugma", "Pupitar"},
[electirizer] = {"Machop", "Machoke", "Mankey", "Poliwhirl", "Tyrogue"},
[fire] = {"Charmander", "Charmeleon", "Vulpix", "Growlithe", "Ponyta", "Eevee", "Cyndaquil", "Quilava", "Slugma", "Houndour", "Magby"},
[magmarizer] = {"Caterpie", "Metapod", "Weedle", "Kakuna", "Paras", "Venonat", "Scyther", "Ledyba", "Spinarak", "Pineco"},
[prismscale] = {"Dratini", "Dragonair", "Magikarp", "Omanyte", "Kabuto", "Seadra"},
[dubiousdisc] = {"Gastly", "Haunter", "Eevee", "Houndour", "Pupitar"},
[protector] = {"Cubone", "Sandshrew", "Nidorino", "Nidorina", "Diglett", "Onix", "Rhyhorn", "Wooper", "Swinub", "Phanpy", "Larvitar"},
[shiny] = {"Abra", "Kadabra", "Psyduck", "Slowpoke", "Drowzee", "Eevee", "Natu", "Smoochum"},
[heart] = {"Rattata", "Pidgey", "Pidgeotto", "Spearow", "Clefairy", "Jigglypuff", "Meowth", "Doduo", "Porygon", "Chansey", "Sentret", "Hoothoot", "Cleffa", "Igglybuff", "Togepi", "Snubull", "Teddiursa"},
[dawn] = {"Seel", "Shellder", "Smoochum", "Swinub"},
[king] = {"Slowpoke", "Poliwhirl"},
[metal] = {"Onix", "Scyther"},
[dragon] = {"Seadra"},
[upgrade] = {"Porygon"},
[sun] = {"Sunkern", "Gloom"},
--[sfire] = {"Shiny Charmander", "Shiny Charmeleon", "Shiny Vulpix", "Shiny Growlithe", "Shiny Ponyta", "Shiny Eevee"},
[swater] = {"Shiny Squirtle", "Shiny Wartortle", "Shiny Horsea", "Shiny Goldeen", "Shiny Magikarp", "Shiny Psyduck", "Shiny Poliwag", "Shiny Poliwhirl", "Shiny Tentacool", "Shiny Krabby", "Shiny Staryu", "Shiny Omanyte", "Shiny Eevee"},
[sleaf] = {"Shiny Bulbasaur", "Shiny Ivysaur", "Shiny Oddish", "Shiny Gloom", "Shiny Bellsprout", "Shiny Weepinbell", "Shiny Exeggcute"},
[sheart] = {"Shiny Rattata", "Shiny Pidgey", "Shiny Pidgeotto", "Shiny Spearow", "Shiny Clefairy", "Shiny Jigglypuff", "Shiny Meowth", "Shiny Doduo", "Shiny Porygon", "Shiny Chansey"},
[senigma] = {"Shiny Abra", "Shiny Kadabra", "Shiny Psyduck", "Shiny Slowpoke", "Shiny Drowzee", "Shiny Eevee"},
[srock] = {"Shiny Geodude", "Shiny Graveler", "Shiny Rhyhorn", "Shiny Kabuto"},
[svenom] = {"Shiny Zubat", "Shiny Ekans", "Shiny Nidoran male", "Shiny Nidoran female", "Shiny Nidorino", "Shiny Nidorina", "Shiny Gloom", "Shiny Venonat", "Shiny Tentacool", "Shiny Grimer", "Shiny Koffing"},
[sice] = {"Shiny Seel", "Shiny Shellder"},
[sthunder] = {"Shiny Magnemite", "Shiny Pikachu", "Shiny Voltorb", "Shiny Eevee"},
[scrystal] = {"Shiny Dratini", "Shiny Dragonair", "Shiny Magikarp", "Shiny Omanyte", "Shiny Kabuto"},
[scoccon] = {"Shiny Caterpie", "Shiny Metapod", "Shiny Weedle", "Shiny Kakuna", "Shiny Paras", "Shiny Venonat", "Shiny Scyther"},
[sdarkness] = {"Shiny Gastly", "Shiny Haunter", "Shiny Eevee"},
[spunch] = {"Shiny Machop", "Shiny Machoke", "Shiny Mankey", "Shiny Poliwhirl"},
[searth] = {"Shiny Cubone", "Shiny Sandshrew", "Shiny Nidorino", "Shiny Nidorina", "Shiny Diglett", "Shiny Onix", "Shiny Rhyhorn"}

}

function onUse(cid, item, frompos, item2, topos)

local pokeball = getPlayerSlotItem(cid, 8)

if not isMonster(item2.uid) or not isSummon(item2.uid) or #getCreatureSummons(cid) > 1 then   --alterado v2.9
	return true
end
if getCreatureCondition(item2.uid, CONDITION_INVISIBLE) then return true end

local pevo = poevo[getCreatureName(item2.uid)]

if not isInArray(specialevo, getCreatureName(item2.uid)) then
   if not pevo then
      doPlayerSendCancel(cid, "[Evolution] O Pokemon Nao Pode Evoluir.")
		return true
   end

   if pevo.level ~= 1 and not allEvolutionsCanBeInduzedByStone then
      doPlayerSendCancel(cid, "[Evolution] Este Pokémon não evolui com Stones.")
		return true
   end

   if not isPlayer(getCreatureMaster(item2.uid)) or getCreatureMaster(item2.uid) ~= cid then
      doPlayerSendCancel(cid, "[Evolution] Você só pode usar Stones em pokemons que você possui.")
		return true
   end

   if pevo.stoneid ~= item.itemid and pevo.stoneid2 ~= item.itemid then 
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone necessária para evoluir este pokemon!")
		return true
   end
end

local minlevel = 0

if getPokemonName(item2.uid) == "Eevee" then
   local eevee = ""
   if item.itemid == thunder then
      eevee = "Jolteon"
   elseif item.itemid == water then
      eevee = "Vaporeon"
   elseif item.itemid == fire then
      eevee = "Flareon"
   elseif item.itemid == leaf then
      eevee = "Leafeon"
   elseif item.itemid == dawn then
      eevee = "Glaceon"
   elseif item.itemid == prismscale then
      eevee = "Sylveon"
   elseif item.itemid == shiny and allEvolutionsCanBeInduzedByStone then
      eevee = "Espeon"
   elseif item.itemid == dusk and allEvolutionsCanBeInduzedByStone then
      eevee = "Umbreon"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerido para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[eevee].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir  (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, eevee, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Shiny Eevee" then
   local eevee = ""
   if item.itemid == thunder then
      eevee = "Shiny Jolteon"
   elseif item.itemid == water then
      eevee = "Shiny Vaporeon"
   elseif item.itemid == fire then
      eevee = "Shiny Flareon"
   elseif item.itemid == shiny and allEvolutionsCanBeInduzedByStone then
      eevee = "Shiny Espeon"
   elseif item.itemid == dusk and allEvolutionsCanBeInduzedByStone then
      eevee = "Shiny Umbreon"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[eevee].level
   if getPlayerLevel(cid) < minlevel then
		doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, eevee, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Gloom" then
   local gloom = ""
   if item.itemid == leaf then
      gloom = "Vileplume"
   elseif item.itemid == sun then
      gloom = "Bellossom"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[gloom].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 40 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (40).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, gloom, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Shiny Gloom" then
   local gloom = ""
   if item.itemid == leaf then
      gloom = "Shiny Vileplume"
   elseif item.itemid == sun then
      gloom = "Shiny Bellossom"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[gloom].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 40 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (40).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, gloom, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Poliwhirl" then
   local poliwhirl = ""
   if item.itemid == water then
      poliwhirl = "Poliwrath"
   elseif item.itemid == king then
      poliwhirl = "Politoed"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[poliwhirl].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, poliwhirl, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Shiny Poliwhirl" then
   local poliwhirl = ""
   if item.itemid == water then
      poliwhirl = "Shiny Poliwrath"
   elseif item.itemid == king then
      poliwhirl = "Shiny Politoed"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[poliwhirl].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, poliwhirl, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Slowpoke" then
   local slowpoke = ""
   if item.itemid == water then
      slowpoke = "Slowbro"
   elseif item.itemid == king then
      slowpoke = "Slowking"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[slowpoke].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, slowpoke, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Shiny Slowpoke" then
   local slowpoke = ""
   if item.itemid == water then
      slowpoke = "Shiny Slowbro"
   elseif item.itemid == king then
      slowpoke = "Shiny Slowking"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[slowpoke].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon  ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, slowpoke, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Tyrogue" then
   local tyrogue = ""
   if item.itemid == punch then
      tyrogue = "Hitmonchan"
   elseif item.itemid == kick then
      tyrogue = "Hitmonlee"
   elseif item.itemid == rolling then
      tyrogue = "Hitmontop"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[tyrogue].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir  (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, tyrogue, 0, 0)
   return true
end

if getPokemonName(item2.uid) == "Shiny Tyrogue" then
   local tyrogue = ""
   if item.itemid == punch then
      tyrogue = "Shiny Hitmonchan"
   elseif item.itemid == kick then
      tyrogue = "Shiny Hitmonlee"
   elseif item.itemid == rolling then
      tyrogue = "Shiny Hitmontop"
   else
      doPlayerSendCancel(cid, "[Evolution] Esta não é a Stone requerida para evoluir seu pokemon.")
      return true
   end
   minlevel = pokes[tyrogue].level
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon ("..minlevel..").")
		return true
   end
   
   if getPokemonLevel(item2.uid) < 50 then
      return doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir  (50).")
   end
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, tyrogue, 0, 0)
   return true
end

local count = poevo[getPokemonName(item2.uid)].count
local stnid = poevo[getPokemonName(item2.uid)].stoneid
local stnid2 = poevo[getPokemonName(item2.uid)].stoneid2
local evo = poevo[getPokemonName(item2.uid)].evolution
local nlevel = poevo[getPokemonName(item2.uid)].level

local count = poevo[getPokemonName(item2.uid)].count
local stnid = poevo[getPokemonName(item2.uid)].stoneid
local stnid2 = poevo[getPokemonName(item2.uid)].stoneid2
local evo = poevo[getPokemonName(item2.uid)].evolution
local nlevel = poevo[getPokemonName(item2.uid)].level


if stnid2 > 1 and (getPlayerItemCount(cid, stnid2) < count or getPlayerItemCount(cid, stnid) < count) then
doPlayerSendCancel(cid, "[Evolution] Você precisa de pelo menos um "..getItemNameById(stnid).." e um "..getItemNameById(stnid2).." Para Evoluir este Pokemon!")
return true
end

if getPlayerItemCount(cid, stnid) < count then
local str = ""
	if count >= 2 then
	str = "s"
	end
return doPlayerSendCancel(cid, "[Evolution] Você precisa de pelo menos "..count.." "..getItemNameById(stnid)..""..str.." Para Evoluir este Pokemon!")
end

minlevel = pokes[evo].level

if getPlayerLevel(cid) < minlevel and evolutionByStoneRequireLevel then
doPlayerSendCancel(cid, "[Evolution] Você não tem Level suficiente para evoluir este pokemon("..minlevel..").")
return true
end

if getPokemonLevel(item2.uid) < nlevel and evolutionByStoneRequireLevel then
doPlayerSendCancel(cid, "[Evolution] Desculpe, seu pokemon não tem o Level necessário para evoluir ("..nlevel..").")
return true
end

if count >= 2 then
stnid2 = stnid
end

doEvolvePokemon(cid, item2, evo, stnid, stnid2)

return TRUE
end