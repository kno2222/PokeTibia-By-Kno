function onTimer()
function doBroadSave(delay)
if delay ~= 0 then
doBroadcastMessage("[Global server save] O server será desligado em "..delay.." Minuto"..(delay > 1 and "s" or ""))
addEvent(doBroadSave, 60000, delay -1)
else
doSaveServer()
doShutdown()
end
end
doBroadSave(5)
return true
end