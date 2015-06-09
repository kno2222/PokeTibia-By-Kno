-- Script por Killua, antigo amoeba13 --

function onSay(cid, words, param, channel)
    local stt = ""

    for i = 1, (#amoebaTask) do
         nomes = amoebaTask[i].nome
        storages = amoebaTask[i].storagecount
         counts = amoebaTask[i].count
        stt = stt .. nomes .. " [" .. taskKills(cid, storages) .. "/" .. counts .. "]\n"
    end        
    doShowTextDialog(cid, 6569, "Task De Todos os Pokemons Separados Por Elementos 1 e 2 Geracao:  \n" .. stt .. "")
   return true
end