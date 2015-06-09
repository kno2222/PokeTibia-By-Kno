function onStepIn(cid, item,pos,fromPosition,toPosition)
if isSummon(cid) then
return false
end
   setPlayerStorageValue(cid,12123,1)   
   return true
end