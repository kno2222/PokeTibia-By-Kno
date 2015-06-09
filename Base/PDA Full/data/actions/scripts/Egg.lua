local a = {
[12227] = {level = {50, 50}, balltype = "normal", ballid = 11826,    --alterado v1.5
        pokemons = {"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", "Manaphy", 
"Manaphy", "Manaphy", "Manaphy", "Shiny Manaphy"}},
[13318] = {level = {5, 5}, balltype = "normal", ballid = 11826,
        pokemons = {"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", 
"Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Magikarp", "Shiny Magikarp"}}
}

local extrastrength = 1.1        

function onUse(cid, item, frompos, item2, topos)
         local b = a[item.itemid]                                    
               if not b then return true end
         local pokemon = b.pokemons[math.random(#b.pokemons)]
               if not pokes[pokemon] then return true end
         local btype = b.balltype
               if not pokeballs[btype] then return true end 
         local level = math.random(b.level[1], b.level[2])
         
        
         doPlayerSendTextMessage(cid, 27, "Congratulations, Your egg was hatched!")
	      doPlayerSendTextMessage(cid, 27, "The prize pokemon was a "..pokemon.." (level "..level.."), congratulations!")
	      doSendMagicEffect(getThingPos(cid), 29)
	      
	      addPokeToPlayer(cid, pokemon, level, 1, nil, 0, btype)     --alterado v2.9               
         doRemoveItem(item.uid, 1)
return true
end