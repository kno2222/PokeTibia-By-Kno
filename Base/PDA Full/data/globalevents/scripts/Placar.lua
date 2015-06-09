function onThink(interval)
        for _, uid in pairs(getPlayersOnline()) do
                doScrollMessage(uid,"[TWP] - Comando !Score : RedCTF [".. (getGlobalStorageValue(18888)+1).."] VS ["..(getGlobalStorageValue(18889)+1).. "]  BlueCTF * RedFrag  [".. (getGlobalStorageValue(5001)+1).."] VS ["..(getGlobalStorageValue(5002)+1).."] BlueFrag" )
        end
 
        return true
end