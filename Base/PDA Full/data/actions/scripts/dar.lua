function doPlayerAddDepotItem(cid, item, count)
    local item,count,pid = type(item)=="table" and item or {item},type(count)=="table" and count or {(count or 1)},getPlayerGUID(cid)
    doRemoveCreature(cid)
    for k,v in ipairs(item) do
            local ls = db.getResult("SELECT `sid` FROM `player_depotitems` WHERE `player_id` = "..pid.." ORDER BY `sid` DESC LIMIT 1")
            return db.executeQuery("INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES ("..pid..", "..(ls:getDataInt("sid")+1)..", 101, "..v..", "..count[k]..", '"..(count[k] > 1 and string.format("%x",count[k]) or '').."')") or false
    end
end

function onSay(cid, words, param, channel)
    if(param == '') then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando precisa de parametros: nomedoplayer, iddoitem, quantidade.")
        return true
    end

    local t = string.explode(param, ",")

    local player = getPlayerByNameWildcard(tostring(t[1]))
    if(not isPlayer(player)) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player não existe.")
        return true
    end
    local playername = tostring(t[1])
    local itemid = tonumber(t[2])
    local quant = tonumber(t[3])
    if quant == nil then
        quant = 1
    end
    doPlayerAddDepotItem(player, itemid, quant)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você adicionou "..quant.." "..(getItemNameById(itemid)).." ao jogador: "..playername..".")
    return true
end