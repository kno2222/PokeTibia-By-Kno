function executeClean()
	doCleanMap()
	doBroadcastMessage("[Clean] O Mapa Foi Limpo! Proxima Limpeza daki a 36 Hrs")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("[Clean] O Mapa Vai ser Limpo em [2] Minutos. Guarde Seus Items!")
	addEvent(executeClean, 160000)
	return true
end
