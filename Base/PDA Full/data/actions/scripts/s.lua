function onUse(cid, item, fromPosition, itemEx, toPosition)

if getGlobalStorageValue(22549) ~= -1 then
   s = string.explode(getGlobalStorageValue(22549), ",")
   for i = 1, #s do
       if getCreatureName(cid) == s[i] then
          doPlayerSendTextMessage(cid, 20, "Zaten Golden Arena'ya Kayitlisiniz!")
          return true
       end                                                              
   end
   if #s > 15 then
      doPlayerSendTextMessage(cid, 20, "Üzgünüz, Golden Arena Limiti Doldu!")
      return true
   end
end
                  --alterado v2.3
   doPlayerSendTextMessage(cid, 20, "Meowth Coin Kazandiniz, Siradaki Bölgeye Geçebilirsiniz 'Golden Survival Arena'.") 
   doPlayerSendTextMessage(cid, 20, "Check the time for the next event in the billboard on the CP or say /golden horarios.")
   doRemoveItem(item.uid, 1)                                           --alterado v1.2
   
   if getGlobalStorageValue(22549) == -1 then
      setGlobalStorageValue(22549, getCreatureName(cid)..",")
   else                                                                            
      setGlobalStorageValue(22549, getGlobalStorageValue(22549)..""..getCreatureName(cid)..",")
   end
end