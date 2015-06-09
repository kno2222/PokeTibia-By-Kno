function onTimer(cid, interval, lastExecution) 

doBroadcastMessage("Golden Arena 10 Dakika sonra baslayacak! Kendinizi Hazirlayin!")
addEvent(doBroadcastMessage, 300000, "Golden Arena 5 Dakika sonra baslayacak!\nKatilimcilarin Hazir Olduklarini Umuyoruz!") 
addEvent(puxaParticipantes, 480000)  	
addEvent(doWave, 600000, true)            --alterado v2.8       

return true
end