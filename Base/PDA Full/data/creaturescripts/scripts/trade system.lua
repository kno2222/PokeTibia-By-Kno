function onTradeRequest(cid, target, item)

	for a, b in pairs (pokeballs) do
		if b.use == item.itemid then
			doPlayerSendCancel(cid, "Bu Itemi Takas Edemezsiniz.")
		return false
		end
	end
	
	if isContainer(item.uid) then
	   local bagItems = getItensUniquesInContainer(item.uid)
	   if #bagItems >= 1 then
	      doPlayerSendCancel(cid, "Çanta Içinde Unique Item Vardir, Takas Edemezsiniz.")     --alterado v2.6
	      return false
       end     
	elseif getItemAttribute(item.uid, "unique") then    --alterado v2.6
	   doPlayerSendCancel(cid, "Bu Bir Unique Item, Bunu Takas Edemezsiniz.")
	   return false
	end 
    
    if getPlayerStorageValue(cid, 52480) >= 1 then             --alterado v2.6.1
       doPlayerSendTextMessage(cid, 20, "Duello Yaparken, Takas Yapamazsiniz!")
       return false
    end 
    
    if isPokeball(item.itemid) then
       local name = getItemAttribute(item.uid, "poke")            --alterado v2.8 \/
       local gender = getItemAttribute(item.uid, "gender") or "male" or "female" or "genderless"
       local nick = getItemAttribute(item.uid, "nick") or ""
       local level = getItemAttribute(item.uid, "level")
    
       local str = "Takastaki Pokemon: "
       str = str.."•Name: "..name.."   •Level: "..level.."   •Gender: "..gender.."   "
       if nick ~= "" then str = str.."•Nick: "..nick.."" end
       sendMsgToPlayer(target, 20, str)
    end
    
    if isContainer(item.uid) then                         --alterado v2.8 \/
	   local itens = getPokeballsInContainer(item.uid)
	   if #itens >= 1 then                             
	      for i = 1, #itens do
	          if isPokeball(getThing(itens[i]).itemid) then
	             local name = getItemAttribute(itens[i], "poke")            
                 local gender = getItemAttribute(itens[i], "gender") or "male" or "female" or "genderless"
                 local nick = getItemAttribute(itens[i], "nick") or ""
                 local level = getItemAttribute(itens[i], "level")
    
                 local str = "Takastaki Pokemon: "
                 str = str.."•Name: "..name.."   •Level: "..level.."   •Gender: "..gender.."   "
                 if nick ~= "" then str = str.."•Nick: "..nick.."" end
                 sendMsgToPlayer(target, 20, str)
              end
          end
	   end       
    end

return true
end

local function noCap(cid, sid)
	if isCreature(cid) then
		doPlayerSendCancel(cid, "Yaninizda 6'dan Fazla Pokemon Tasiyamazsiniz, Takas Iptal Edildi.")
	end
	if isCreature(sid) then
		doPlayerSendCancel(sid, "Yaninizda 6'dan Fazla Pokemon Tasiyamazsiniz, Takas Iptal Edildi.")
	end
end

function onTradeAccept(cid, target, item, targetItem)

	local pbs = #getPokeballsInContainer(item.uid)
	local cancel = false
	local p1 = 0
	local p2 = 0
	local itemPokeball = isPokeball(item.itemid) and 1 or 0
	local targetItemPokeball = isPokeball(targetItem.itemid) and 1 or 0
	
	if getPlayerMana(cid) + itemPokeball > 6 then  --alterado v2.6
	   cancel = true
	   p1 = cid
    end
    if getPlayerMana(target) + targetItemPokeball > 6 then  --alterado v2.6
	   cancel = true
	   p2 = target
    end

	if pbs > 0 and getCreatureMana(target) + pbs > 6 + targetItemPokeball then
		cancel = true	
		p1 = target
	end

	pbs = #getPokeballsInContainer(targetItem.uid)

	if pbs > 0 and getCreatureMana(cid) + pbs > 6 + itemPokeball then
		cancel = true
		p2 = cid
	end

	if cancel then
		addEvent(noCap, 20, p1, p2)
	return false
	end

	if itemPokeball == 1 and targetItemPokeball == 1 then
		setPlayerStorageValue(cid, 8900, 1)
		setPlayerStorageValue(target, 8900, 1)
	end

return true
end