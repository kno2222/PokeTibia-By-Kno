--[[
 * Autor: Skyen Hasus
 * Versão: 1.00.18
 * Sintaxe: doScrollMessage(uid, message)
 * Exemplo: doScrollMessage(cid, "Seja bem-vindo!")
]]--

--[[ Configuração: ]]--
--[[ Display: Número de letras mostradas durante o scrolling! ]]--
local display = 350

--[[ Delay: Tempo em milisegundos de espera entre cada scrolling! (Aviso: Se for menos que 100 pode causar 'throttle') ]]--
local delay = 100

function doScrollMessage(uid, message)

    if message == nil or uid == nil then
      return TRUE
    end
    
  local chars = {}
    
    for i = 1, display do
      table.insert(chars, " ")
    end
    
    for i = 1, string.len(message) do
      table.insert(chars, string.sub(message, i, i))
    end
    
    for i = 1, display+1 do
      table.insert(chars, " ")
    end
    
    function doScroll(uid, message, i, j)
        if isPlayer(uid) == TRUE then
          f = display + i
            if f > #chars then
              f = display + string.len(message)
            end
          doPlayerSendCancel(uid, table.concat(chars, "", i, f))
            if i <= j then
              addEvent(doScroll, delay, uid, message, i+1, j)
            end
        end
    end
    
  doScroll(uid, chars, 1, display + string.len(message))
  return TRUE

end 