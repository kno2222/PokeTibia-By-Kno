local shinys = {
"Bulbasaur" , "Ivysaur" , "Venusaur" , "Charmander" , "Charmeleon" , "Charizard" , "Squirtle" , "Wartortle" , "Blastoise" , "Caterpie" , "Metapod" , "Butterfree" , "Weedle" , "Kakuna" , "Beedrill" , 
"Pidgey" , "Pidgeotto" , "Pidgeot" , "Rattata" , "Raticate" , "Spearow" , "Fearow" , "Ekans" , "Arbok"  , "Pikachu" , "Raichu" , "Sandshrew" , "Sandslash" , "Nidoran female" , "Nidorina" , "Nidoqueen" , 
"Nidoran male" , "Nidorino" , "Nidoking" , "Clefairy" , "Clefable" , "Vulpix" , "Ninetales" , "Jigglypuff" , "Wigglytuff" , "Zubat" , "Golbat" , "Oddish" , "Gloom" , "Vileplume" , "Paras" , "Parasect" , 
"Venonat" , "Venomoth" , "Diglett" , "Dugtrio" , "Meowth" , "Persian" , "Psyduck" , "Golduck" , "Mankey" , "Primeape" , "Growlithe" , "Arcanine" , "Poliwag" , "Poliwhirl" , "Poliwrath" , "Abra" , "Kadabra" , 
"Alakazam" , "Machop" , "Machoke" , "Machamp" , "Bellsprout" , "Weepinbell" , "Victreebel" , "Tentacool" , "Tentacruel" , "Geodude" , "Graveler" , "Golem" , "Ponyta" , "Rapidash" , "Slowpoke" , "Slowbro" , 
"Magnemite" , "Magneton" ," Farfetch'd" , "Doduo" , "Dodrio" , "Seel" , "Dewgong" , "Grimer" , "Muk" , "Shellder" , "Cloyster" , "Gastly" , "Haunter" , "Gengar" , "Onix" , "Drowzee" , "Hypno" , "Krabby" , 
"Kingler" , "Voltorb" , "Electrode" , "Exeggcute" , "Exeggutor" , "Cubone" , "Marowak" , "Hitmonlee" , "Hitmonchan" , "Lickitung" , "Koffing" , "Weezing" , "Rhyhorn" , "Rhydon" , "Chansey" , "Tangela" , 
"Kangaskhan" , "Horsea" , "Seadra" , "Goldeen" , "Seaking" , "Staryu" , "Starmie" , "Mr. mime" , "Scyther" , "Jynx" , "Electabuzz" , "Magmar" , "Pinsir" , "Tauros" , "Magikarp" , "Gyarados" , "Lapras" , 
"Ditto" , "Eevee" , "Vaporeon" , "Jolteon" , "Flareon" , "Porygon" , "Omanyte" , "Omastar" , "Kabuto" , "Kabutops" , "Aerodactyl" ," Snorlax" , "Dratini" , "Dragonair" , "Dragonite" , 
"Chikorita" , "Bayleef" , "Meganium" , "Cyndaquil" , "Quilava" , "Typhlosion" , "Totodile" , "Croconaw" , "Feraligatr" , "Sentret" , "Furret" , "Hoothoot" , "Noctowl" , "Ledyba" , "Ledian" , "Spinarak" , 
"Ariados" , "Crobat" , "Chinchou" , "Lanturn" , "Pichu" , "Cleffa" , "Igglybuff" , "Togepi" , "Togetic" , "Natu" , "Xatu" , "Mareep" , "Flaaffy" , "Ampharos" , "Bellossom" , "Marill" , "Azumarill" , 
"Sudowoodo" , "Politoed" , "Hoppip" , "Skiploom" , "Jumpluff" , "Aipom" , "Sunkern" , "Sunflora" , "Yanma" , "Wooper" , "Quagsire" , "Espeon" , "Umbreon" , "Murkrow" , "Slowking" , "Misdreavus" , "Unown" , 
"Wobbuffet" , "Girafarig" , "Pineco" , "Forretress" , "Dunsparce" , "Gligar" , "Steelix" , "Snubbull" , "Granbull" , "Qwilfish" ,  "Scizor" , "Shuckle" , "Heracross" , "Sneasel" , "Teddiursa" , "Ursaring" , 
"Slugma" , "Magcargo" , "Swinub" , "Piloswine" , "Corsola" , "Remoraid" , "Octillery" , "Delibird" , "Mantine" , "Skarmory" , "Houndour" , "Houndoom" , "Kingdra" , "Phanpy" , "Donphan" , "Porygon2" , 
"Stantler" , "Smeargle" , "Tyrogue" , "Hitmontop" , "Smoochum" , "Elekid" , "Magby" , "Miltank" , "Blissey" , "Larvitar" , "Pupitar" , "Tyranitar"
}
local raros = {"Articuno" , "Zapdos" , "Moltres" , "Mewtwo" , "Mew" , "Raikou" , "Entei" , "Suicune" , "Lugia" , "Ho-oh" , "Celebi", "Rayquaza"}                               --alterado v2.5

local function ShinyName(cid)
if isCreature(cid) then
   if string.find(tostring(getCreatureName(cid)), "Shiny") then
      local newName = tostring(getCreatureName(cid)):match("Shiny (.*)")
      local newNamed = newName.." ["..getPokemonLevel(cid).."]"
   end
end
end


local function doPokemonRegisterLevel(cid)
	if not isCreature(cid) then return true end
	if getWildPokemonLevel(cid) == -1 then
		setWildPokemonLevel(cid)
	end
end

local function doSetRandomGender(cid)
	if not isCreature(cid) then return true end
	local gender = 0
	local name = getCreatureName(cid)
	if not newpokedex[name] then return true end
	local rate = newpokedex[name].gender
		if rate == 0 then
			gender = 3
		elseif rate == 1000 then
			gender = 4
		elseif rate == -1 then
			gender = 0
		elseif math.random(1, 1000) <= rate then
			gender = 4
		else
			gender = 3
		end
	doCreatureSetSkullType(cid, gender)
end

local function doShiny(cid)
if isCreature(cid) then
   if isSummon(cid) then return true end
   if getPlayerStorageValue(cid, 74469) >= 1 then return true end
   if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
   if isNpcSummon(cid) then return true end
   if getPlayerStorageValue(cid, 637500) >= 1 then return true end  --alterado v2.9
   
if isInArray(shinys, getCreatureName(cid)) then  --alterado v2.9 \/
   chance = 1    --0.3% chance        
elseif isInArray(raros, getCreatureName(cid)) then   --n coloquem valores menores que 0.1 !!
   chance = 0.2   --0.03% chance       
else
   return true
end    
    if math.random(1, 1000) <= chance*10 then  
      doSendMagicEffect(getThingPos(cid), 18)               
      local name, pos = "Shiny ".. getCreatureName(cid), getThingPos(cid)
      doRemoveCreature(cid)
      local shi = doCreateMonster(name, pos, false)
      setPlayerStorageValue(shi, 74469, 1)      
   else
       setPlayerStorageValue(cid, 74469, 1)
   end                                        --/\
else                                                            
return true
end
end

function onSpawn(cid)

    registerCreatureEvent(cid, "Experience")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "DirectionSystem")
	registerCreatureEvent(cid, "CastSystem")
	 registerCreatureEvent(cid, "atk")

	if isSummon(cid) then
		registerCreatureEvent(cid, "SummonDeath")
	return true
	end

	addEvent(doPokemonRegisterLevel, 5, cid)
	addEvent(doSetRandomGender, 5, cid)
	addEvent(doShiny, 10, cid)
	addEvent(ShinyName, 15, cid)

return true
end