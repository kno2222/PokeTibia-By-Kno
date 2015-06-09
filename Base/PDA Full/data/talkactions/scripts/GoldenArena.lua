function onSay(cid, words, param, channel)

if param and (param == "register" or param == "Register") then

if getGlobalStorageValue(22549) ~= -1 then
   s = string.explode(getGlobalStorageValue(22549), ",")
   for i = 1, #s do
       if getCreatureName(cid) == s[i] then
          doPlayerSendTextMessage(cid, 20, "Sen Zaten Kayitlisin Golden Arena'ya!")
          return true
       end                                                               --alterado!!
   end
   if #s > 15 then
      doPlayerSendTextMessage(cid, 20, "Üzgünüm, ama biz maximum kisi sayisina ulastik, Golden Arena!")
      return true
   end
end
                           --alterado v1.3
   doPlayerSendTextMessage(cid, 20, "Golden Arena'ya Kayitiniz Basariliyla Gerceklesmistir!")
   if getGlobalStorageValue(22549) == -1 then
      setGlobalStorageValue(22549, getCreatureName(cid)..",")
   else                                                                            --alterado!!
      setGlobalStorageValue(22549, getGlobalStorageValue(22549)..""..getCreatureName(cid)..",")
   end
   
elseif param and (param == "horarios" or param == "Horarios") then

   local hours = ""
   local c = 0
   for i = 1, #horas do
       hours = hours..((i == #horas and c ~= 0) and " and " or i ~= 1 and ", " or "")..horas[i]  --alterado v2.7
       c = c+1
   end
   hours = hours.." hours."
   doPlayerSendTextMessage(cid, 20, "The golden arena occurs at "..hours)
   timeDiff = showTimeDiff(nextHorario(cid))                                                         
   doPlayerSendTextMessage(cid, 20, "Next Event in "..timeDiff..".")   
end

return true
end