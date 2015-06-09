function onSay(cid, words, param)

 
local clans = {"Volcanic", "Seavell", "Orebound", "Wingeon", "Malefic", "Gardestrike", "Psycraft", "Naturia", "Raibolt"}
 
local t = string.explode(param, ",")
 
    if words == "!entrarclan" then
    
        if param == "" then
            return doPlayerSendCancel(cid, "Est�o faltando os par�metros!")
        end
        
        local clan = t[1]
        
        if getPlayerLevel(cid) < 80 then
            return doPlayerSendCancel(cid, "Voc� precisa ser level 80 para entrar em um clan.")
        end
        
        if not isInArray(clans, t[1]) then
            return doPlayerSendCancel(cid, ""..clan.." n�o � um clan v�lido.")
        end
        
        if getPlayerStorageValue(cid, 86228) >= 1 then
            return doPlayerSendCancel(cid, "Voc� j� est� em um clan.")
        end
        
        setPlayerClan(cid, clan)
        doPlayerSendTextMessage(cid, 19, "Agora voc� pertence ao Clan ["..clan.."], rank: 1")
        setPlayerClanRank(cid, 1)
        
    elseif words == "!rankclan" then
    

        
        if param == "" then
            return doPlayerSendTextMessage(cid, 19, "[Clan] Digita o Numero ex: !rankclan 1!")
        end
        
        local ta = {
             
            [2] = {level = 100},
            [3] = {level = 125},
            [4] = {level = 150},
            [5] = {level = 200},
        }
        local money = 2160
        local qntt = 5

            
        local levels = ta[(getPlayerStorageValue(cid, 862281) + 1)]
        local lv = levels.level
        
        if getPlayerStorageValue(cid, 862281) >= tonumber(t[1]) then
            return doPlayerSendTextMessage(cid, 19, "[Clan] Voc� j� passou desse rank.")
        end
        
        if tonumber(t[1]) >= tonumber((getPlayerStorageValue(cid, 862281)) + 2) then
            return doPlayerSendTextMessage(cid, 19, "[Clan] Voc� n�o pode fazer isso!")
        end
        
        if getPlayerStorageValue(cid, 86228) <= 1 then
            return doPlayerSendTextMessage(cid, 27, "[Clan] Voc� nao tem Clan!")
            
        end
        
        
        if getPlayerLevel(cid) < lv then
            return doPlayerSendTextMessage(cid, 19,"[Clan] Voc� n�o possui o level necess�rio.")
        end
 
        if getPlayerItemCount(cid, money) >= qntt then  
            doPlayerRemoveItem(cid, money, qntt)  
        else
            return doPlayerSendTextMessage(cid, 19,"[Clan] Voc� n�o Tem [5] Thousand Dollars Para Avan�ar de Rank!.")
            end

        
        setPlayerClanRank(cid, getPlayerStorageValue(cid, 862281) + 1)
        doPlayerSendTextMessage(cid, 27, "[Clan] Voc� avan�ou de rank! Rank atual: ["..getPlayerStorageValue(cid, 862281).."].")
    
    elseif words == "!trocarclan" then
    
        local item = 2160   --ID do item.
        local qnt = 1    --Quantidade do item.
        local to_go = t[1]
        
        if param == "" then
            return doPlayerSendCancel(cid, "Est�o faltando os par�metros!")
        end
        
        if not isInArray(clans, t[1]) then
            return doPlayerSendCancel(cid, ""..t[1].." n�o � um clan v�lido.")
        end
        
        if getPlayerStorageValue(cid, 86228) < 1 then
            return doPlayerSendCancel(cid, "Voc� n�o pertence a clan algum!")
        end
        
        if getPlayerItemCount(cid, item) >= qnt then
            doPlayerRemoveItem(cid, item, qnt)
            doPlayerSendTextMessage(cid, 27, "Voc� trocou de clan, pertencendo agora ao clan: "..t[1]..".")
            setPlayerClan(cid, to_go)
            setPlayerClanRank(cid, 1)    
        else
            return doPlayerSendCancel(cid, "Voc� n�o tem o item necess�rio! ITEM: "..item.." QUANTIDADE: "..qnt..".")
        end
    end
    return true

end