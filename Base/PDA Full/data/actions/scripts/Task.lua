function onUse(cid, item)
    local stt = ""
    
    for pika, tasks in pairs(amoebaTask) do

    for i = 1, (#amoebaTask) do
        nomes = amoebaTask[i].nome
        storages = amoebaTask[i].storagecount
        counts = amoebaTask[i].count
        stt = stt .. nomes .. " [" .. taskKills(cid, storages) .. "/" .. counts .. "]\n"
    end        
            doShowTextDialog(cid, 12161, "Task De Todos os Pokemons Por Elementos: \n" .. stt .. "")
            break
    end
   return true
end