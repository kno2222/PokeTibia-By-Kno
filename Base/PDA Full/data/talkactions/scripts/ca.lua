------ Script By Linnux for  Users -------
local configs = {
cobrar = "sim", ------ Use sim ou nao para cobrar.
sovip = "nao",  ------ Se somente vip players poderam usar o comando
price = 500000,   ------ Pre�o a pagar se o cobrar estiver ativado.
storage = 98989 ------ Storage Id da sua vip account caso for usar somente vips
}
function onSay(cid, words, param)
local nada = {" "}

         if table.isStrIn(param, nada) or param == "" then
            doPlayerSendCancel(cid,"Voce precisa falar alguma coisa.")    
         return TRUE
         end

         
         if configs.cobrar == "sim" and not doPlayerRemoveMoney(cid,tonumber(configs.price)) then
            doPlayerSendCancel(cid,"Voc� n�o tem dinheiro suficiente.")
         return TRUE
         end
         
         doBroadcastMessage(""..getCreatureName(cid).." ["..getPlayerLevel(cid).."]: " .. param .. "", 19)
         return TRUE
end    