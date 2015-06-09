function onSay(cid, words, param) 
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"PLACAR ATUAL:")
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"   RedCTF    [".. (getGlobalStorageValue(18888)+1).."] VS ["..(getGlobalStorageValue(18889)+1).. "]  BlueCTF")  
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"   RedFrag   [".. (getGlobalStorageValue(5001)+1).."] VS ["..(getGlobalStorageValue(5002)+1).."]  BlueFrag")
return true
end