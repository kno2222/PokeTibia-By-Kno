function onSay(cid, words, param)

 
local clans = {"Volcanic", "Seavell", "Orebound", "Wingeon", "Malefic", "Gardestrike", "Psycraft", "Naturia", "Raibolt"}
 
local t = string.explode(param, ",")
 
    if words == "!entrarclan" then
    
        if param == "" then
            return doPlayerSendCancel(cid, "Estão faltando os parâmetros!")
        end
        
        local clan = t[1]
        
        if getPlayerLevel(cid) < 80 then
            return doPlayerSendCancel(cid, "Você precisa ser level 80 para entrar em um clan.")
        end
        
        if not isInArray(clans, t[1]) then
            return doPlayerSendCancel(cid, ""..clan.." não é um clan válido.")
        end
        
        if getPlayerStorageValue(cid, 86228) >= 1 then
            return doPlayerSendCancel(cid, "Você já está em um clan.")
        end
        
        setPlayerClan(cid, clan)
        doPlayerSendTextMessage(cid, 19, "Agora você pertence ao Clan ["..clan.."], rank: 1")
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
            return doPlayerSendTextMessage(cid, 19, "[Clan] Você já passou desse rank.")
        end
        
        if tonumber(t[1]) >= tonumber((getPlayerStorageValue(cid, 862281)) + 2) then
            return doPlayerSendTextMessage(cid, 19, "[Clan] Você não pode fazer isso!")
        end
        
        if getPlayerStorageValue(cid, 86228) <= 1 then
            return doPlayerSendTextMessage(cid, 27, "[Clan] Você nao tem Clan!")
            
        end
        
        
        if getPlayerLevel(cid) < lv then
            return doPlayerSendTextMessage(cid, 19,"[Clan] Você não possui o level necessário.")
        end
 
        if getPlayerItemCount(cid, money) >= qntt then  
            doPlayerRemoveItem(cid, money, qntt)  
        else
            return doPlayerSendTextMessage(cid, 19,"[Clan] Você não Tem [5] Thousand Dollars Para Avançar de Rank!.")
            end

        
        setPlayerClanRank(cid, getPlayerStorageValue(cid, 862281) + 1)
        doPlayerSendTextMessage(cid, 27, "[Clan] Você avançou de rank! Rank atual: ["..getPlayerStorageValue(cid, 862281).."].")
    
    elseif words == "!trocarclan" then
    
        local item = 2160   --ID do item.
        local qnt = 1    --Quantidade do item.
        local to_go = t[1]
        
        if param == "" then
            return doPlayerSendCancel(cid, "Estão faltando os parâmetros!")
        end
        
        if not isInArray(clans, t[1]) then
            return doPlayerSendCancel(cid, ""..t[1].." não é um clan válido.")
        end
        
        if getPlayerStorageValue(cid, 86228) < 1 then
            return doPlayerSendCancel(cid, "Você não pertence a clan algum!")
        end
        
        if getPlayerItemCount(cid, item) >= qnt then
            doPlayerRemoveItem(cid, item, qnt)
            doPlayerSendTextMessage(cid, 27, "Você trocou de clan, pertencendo agora ao clan: "..t[1]..".")
            setPlayerClan(cid, to_go)
            setPlayerClanRank(cid, 1)    
        else
            return doPlayerSendCancel(cid, "Você não tem o item necessário! ITEM: "..item.." QUANTIDADE: "..qnt..".")
        end
    end
    return true

end