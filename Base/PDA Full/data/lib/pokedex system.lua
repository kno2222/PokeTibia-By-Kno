local skills = specialabilities                                         --alterado v2.9 \/ TUDO!!

function doAddPokemonInDexList(cid, poke)
if getPlayerInfoAboutPokemon(cid, poke).dex then return true end
	local a = newpokedex[poke]                                              
	local b = getPlayerStorageValue(cid, a.storage)
	setPlayerStorageValue(cid, a.storage, b.." dex,")
end

function getPokemonEvolutionDescription(name, next)
	local kev = poevo[name]
	local stt = {}
	if isInArray(specialevo, name) then
       if name == "Poliwhirl" then
          if next then
             return "\nPoliwrath or Politoed, requires level 50."
          end   
          table.insert(stt, "Evolve Stone: Water Stone or King's Rock\n\n")
          table.insert(stt, "Evolutions:\nPoliwrath, requires level 50.\nPolitoed, requires level 50.")
       elseif name == "Shiny Poliwhirl" then
          if next then
             return "\nShiny Poliwrath or Shiny Politoed, requires level 50."
          end   
          table.insert(stt, "Evolve Stone: Water Stone or King's Rock\n\n")
          table.insert(stt, "Evolutions:\nShiny Poliwrath, requires level 50.\nShiny Politoed, requires level 50.")
       elseif name == "Gloom" then
          if next then
             return "\nVileplume or Bellossom, requires level 40."
          end
          table.insert(stt, "Evolve Stone: Leaf Stone or Sun Stone\n\n")
          table.insert(stt, "Evolutions:\nVileplume, requires level 40.\nBellossom, requires level 40.")
       elseif name == "Shiny Gloom" then
          if next then
             return "\nShiny Vileplume or Shiny Bellossom, requires level 40."
          end
          table.insert(stt, "Evolve Stone: Leaf Stone or Sun Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Vileplume, requires level 40.\nShiny Bellossom, requires level 40.")
       elseif name == "Slowpoke" then
          if next then
             return "\nSlowbro, requires level 50.\nSlowking, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Water Stone or King's Rock\n\n")
          table.insert(stt, "Evolutions:\nSlowbro, requires level 50.\nSlowking, requires level 50.")
       elseif name == "Shiny Slowpoke" then
          if next then
             return "\nShiny Slowbro, requires level 50.\nShiny Slowking, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Water Stone or King's Rock\n\n")
          table.insert(stt, "Evolutions:\nShiny Slowbro, requires level 50.\nShiny Slowking, requires level 50.")
       elseif name == "Eevee" then
          if next then
             return "\nVaporeon, requires level 50.\nJolteon, requires level 50.\nFlareon, requires level 50.\nUmbreon, requires level 50.\nEspeon, requires level 50.\nLeafeon, requires level 50.\nGlaceon, requires level 50.\nSylveon, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Water Stone or Thunder Stone or Fire Stone or Dusk Stone or Shiny Stone or Leaf Stone or Dawn Stone or Prism Scale\n\n")
          table.insert(stt, "Evolutions:\nVaporeon, requires level 50.\nJolteon, requires level 50.\nFlareon, requires level 50.\nUmbreon, requires level 50.\nEspeon, requires level 50.\nLeafeon, requires level 50.\nGlaceon, requires level 50.\nSylveon, requires level 50.")
       elseif name == "Shiny Eevee" then
          if next then
             return "\nShiny Vaporeon, requires level 50.\nShiny Jolteon, requires level 50.\nShiny Flareon, requires level 50.\nShiny Umbreon, requires level 50.\nShiny Espeon, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Water Stone or Thunder Stone or Fire Stone or Dusk Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Vaporeon, requires level 50.\nShiny Jolteon, requires level 50.\nShiny Flareon, requires level 50.\nShiny Umbreon, requires level 50.\nShiny Espeon, requires level 50.")
       elseif name == "Tyrogue" then
          if next then
             return "\nHitmonlee, requires level 50.\nHitmonchan, requires level 50.\nHitmontop, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Punch Machine or Kick Machine or Rolling Kick Machine\n\n")   
          table.insert(stt, "Evolutions:\nHitmonlee, requires level 50.\nHitmonchan, requires level 50.\nHitmontop, requires level 50.")
       elseif name == "Shiny Tyrogue" then
          if next then
             return "\nShiny Hitmonlee, requires level 50.\nShiny Hitmonchan, requires level 50.\nShiny Hitmontop, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Punch Machine or Kick Machine or Rolling Kick Machine\n\n")   
          table.insert(stt, "Evolutions:\nShiny Hitmonlee, requires level 50.\nShiny Hitmonchan, requires level 50.\nShiny Hitmontop, requires level 50.")

       end
    elseif kev then
       if next then
          table.insert(stt, "\n"..kev.evolution..", Evolui No Pokelevel "..kev.level..".")
          return table.concat(stt)
       end
       local id = tonumber(kev.stoneid)
       local id2 = tonumber(kev.stoneid2)
       local stone = ""
       if tonumber(kev.count) == 2 then
          stone = doConvertStoneIdToString(id).." (2x)"
       else
          stone = id2 == 0 and doConvertStoneIdToString(id) or doConvertStoneIdToString(id).." and "..doConvertStoneIdToString(id2)
       end
       table.insert(stt, "Evolve Stone: "..stone.."\n\n")
       table.insert(stt, "Evolutions:\n"..kev.evolution..", Evolui No PokeLevel "..kev.level..".")
       table.insert(stt, getPokemonEvolutionDescription(kev.evolution, true))
    else
        if not next then
           table.insert(stt, "Evolutions:\nIt doesn't evolve." )
        end
    end   
return table.concat(stt)
end

local function getMoveDexDescr(cid, name, number)
	local x = movestable[name]
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12, x.tmove1, x.tmove2, x.tmove3}
	local y = tables[number]
	if not y then return "" end
	
if getTableMove(cid, y.name) == "" then
   print(""..y.name.." faltando")
   return "unknown error"
end
local txt = ""..z..""..y.name.." - m"..number.." - level "..y.level.." - "..(y.t) 
return txt
end   
                                                                                                                                 --alterado v2.8
local skillcheck = {"fly", "ride", "surf", "teleport", "rock smash", "cut", "dig", "light", "blink", "control mind", "transform", "levitate_fly", "mining", "headbutt", "harvest"}
local passivas = {
["Electricity"] = {"Electabuzz", "Shiny Electabuzz", "Elekid", "Shiny Elekid", "Joltik", "Galvantula", "Zekrom", tpw = "electric"},
["Lava Counter"] = {"Magmar", "Shiny Magmar", "Magby", "Shiny Magby", "Reshiram", tpw = "fire"},
["Bone Counter"] = {"Cubone", "Marowak", "Shiny Cubone", "Shiny Marowak", tpw = "ground"},
["Counter Helix"] = {tpw = "bug"},
["Giroball"] = {"Pineco", "Forretress", "Shiny Pineco", "Shiny Forretress", tpw = "steel"},
["Counter Claw"] = {"Scizor", "Shiny Scizor", tpw = "bug"},
["Counter Spin"] = {"Hitmontop", "Shiny Hitmontop", tpw = "fighting"},
["Demon Kicker"] = {"Hitmonlee", "Shiny Hitmonlee", tpw = "fighting"},
["Demon Puncher"] = {"Hitmonchan", "Shiny Hitmonchan", tpw = "unknow"},               --alterado v2.6
["Stunning Confusion"] = {"Psyduck", "Golduck", "Shiny Psyduck", "Shiny Golduck", "Wobbuffet", "Shiny Wobbuffet", tpw = "psychic"},
["Groundshock"] = {"Kangaskhan", "Shiny Kangaskhan", tpw = "normal"},
["Electric Charge"] = {"Pikachu", "Raichu", "Shiny Pikachu", "Shiny Raichu", tpw = "electric"},
["Melody"] = {"Wigglytuff", "Shiny Wigglytuff", tpw = "normal"},
["Dragon Fury"] = {"Dratini", "Dragonair", "Dragonite", "Shiny Dratini", "Shiny Dragonair", "Shiny Dragonite", tpw = "dragon"},
["Fury"] = {"Persian", "Raticate", "Shiny Persian", "Shiny Raticate", tpw = "normal"},
["Mega Drain"] = {"Oddish", "Gloom", "Vileplume", "Kabuto", "Kabutops", "Parasect", "Tangela", "Shiny Oddish", "Shiny Gloom", "Shiny Vileplume", "Shiny Kabuto", "Shiny Kabutops", "Shiny Parasect", "Shiny Tangela", tpw = "grass"},
["Spores Reaction"] = {"Oddish", "Gloom", "Vileplume", "Shiny Oddish", "Shiny Gloom", "Shiny Vileplume", tpw = "grass"},
["Amnesia"] = {"Wooper", "Quagsire", "Swinub", "Piloswine", "Mamoswine", "Shiny Wooper", "Shiny Quagsire", "Shiny Swinub", "Shiny Piloswine", "Shiny Mamoswine",  tpw = "psychic"},
["Zen Mind"] = {"Slowking", "Shiny Slowking", tpw = "psychic"}, 
["Mirror Coat"] = {"Wobbuffet", "Shiny Wobbuffet", tpw = "psychic"},
["Lifesteal"] = {"Crobat", "Shiny Crobat", tpw = "normal"},
["Evasion"] = {"Scyther", "Scizor", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue", "Shiny Tyrogue", "Shiny Scyther", "Pink Scyther", "Shiny Scizor", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Ledian", "Ledyba", "Sneasel", "Shiny Ledian", "Shiny Ledyba", "Shiny Sneasel", tpw = "normal"},
["Foresight"] = {"Machamp", "Shiny Machamp", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Hitmontop", "Hitmonlee", "Hitmonchan", tpw = "fighting"},
["Levitate"] = {"Gengar", "Haunter", "Gastly", "Misdreavus", "Weezing", "Koffing", "Unown", "Mismagius", "Shiny Mismagius", "Shiny Unown", "Shiny Misdreavus", "Shiny Weezing", "Shiny Koffing", "Shiny Haunter", "Shiny Gastly", "Shiny Gengar", tpw = "ghost"},
}


function doShowPokedexRegistration(cid, pokemon, ball)
local item2 = pokemon
local virtual = false
   if type(pokemon) == "string" then
      virtual = true
   end
local myball = ball
local name = virtual and pokemon or getCreatureName(item2.uid)


local v = fotos[name]
local stt = {}
table.insert(stt, "Name: "..name.."\n")

if pokes[name].type2 and pokes[name].type2 ~= "no type" then
   table.insert(stt, "Type: "..pokes[name].type.."/"..pokes[name].type2.."")
else
    table.insert(stt, "Type: "..pokes[name].type.."")
end

if virtual then
   table.insert(stt, "\nLevel Base: "..pokes[name].level.."\n")
else
   table.insert(stt, "\nPokeLevel: "..getPokemonLevel(item2.uid).."\n")  
end    

table.insert(stt, "\n"..getPokemonEvolutionDescription(name).."\n")

table.insert(stt, "\nMoves:")

if name == "Ditto" then
   if virtual then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   elseif getPlayerStorageValue(item2.uid, 1010) == "Ditto" or getPlayerStorageValue(item2.uid, 1010) == -1 then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   else
      for a = 1, 15 do
         table.insert(stt, getMoveDexDescr(item2.uid, getPlayerStorageValue(item2.uid, 1010), a).."")
      end
   end
elseif name == "Shiny Ditto" then
   if virtual then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   elseif getPlayerStorageValue(item2.uid, 1010) == "Shiny Ditto" or getPlayerStorageValue(item2.uid, 1010) == -1 then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   else
      for a = 1, 15 do
         table.insert(stt, getMoveDexDescr(item2.uid, getPlayerStorageValue(item2.uid, 1010), a).."")
      end
   end
else
   for a = 1, 15 do
      table.insert(stt, getMoveDexDescr(item2.uid, name, a).."")
   end
end

for e, f in pairs(passivas) do
   if isInArray(passivas[e], name) then
      local tpw = passivas[e].tpw
      if name == "Pineco" and passivas[e] == "Giroball" then
         tpw = "bug"
      end
      table.insert(stt, "\n"..e.." - passive - "..tpw.."")
   end
end
            
table.insert(stt, "\n\nAbility:\n") 
local abilityNONE = true                   
			
for b, c in pairs(skills) do
   if isInArray(skillcheck, b) then
      if isInArray(c, name) then
         table.insert(stt, (b == "levitate_fly" and "Levitate" or doCorrectString(b)).."\n")
         abilityNONE = false
      end
   end
end
if abilityNONE then
   table.insert(stt, "None")
end
		
if string.len(table.concat(stt)) > 8192 then
   print("Error while making pokedex info with pokemon named "..name..".\n   Pokedex registration has more than 8192 letters (it has "..string.len(stt).." letters), it has been blocked to prevent fatal error.")
   doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
return true
end	

doShowTextDialog(cid, v, table.concat(stt))
end