function onAdvance(cid, skill, oldlevel, newlevel)
	  
		if(getPlayerStorageValue(cid, 99967) ~= 1 and skill == SKILL__LEVEL and newlevel >= 50) then
				doPlayerAddItem(cid, 8110, 1)
				setPlayerStorageValue(cid, 99967, 1)
				doPlayerSendTextMessage(cid, 22, "[Premio] Voce Ganhou 1 Present Box no Level 50")
	elseif(getPlayerStorageValue(cid, 99968) ~= 1 and skill == SKILL__LEVEL and newlevel >= 100) then
				doPlayerAddItem(cid, 6569, 5)
				doPlayerAddItem(cid, 2160, 5)
				setPlayerStorageValue(cid, 99968, 1)
				doPlayerSendTextMessage(cid, 22, "[Premio] Voce Ganhou 5 Rare Candy + 5 TD no Level 100")
   	elseif(getPlayerStorageValue(cid, 99969) ~= 1 and skill == SKILL__LEVEL and newlevel >= 150) then
				doPlayerAddItem(cid, 9074, 1)
				doPlayerAddItem(cid, 6569, 10)
				setPlayerStorageValue(cid, 99969, 1)
				doPlayerSendTextMessage(cid, 22, "[Premio] Voce Ganhou 1 Box Surpresa + 10 Rare Candy no Level 150")
   	elseif(getPlayerStorageValue(cid, 99970) ~= 1 and skill == SKILL__LEVEL and newlevel >= 200) then
				doPlayerAddItem(cid, 2160, 20)
				doPlayerAddItem(cid, 12618, 5)
				setPlayerStorageValue(cid, 99970, 1)
				doPlayerSendTextMessage(cid, 22, "[Premio] Voce Ganhou 5 Boost Stone + 20 TD no Level 200")
   	elseif(getPlayerStorageValue(cid, 99971) ~= 1 and skill == SKILL__LEVEL and newlevel >= 250) then
				doPlayerAddItem(cid, 12618, 15)
				doPlayerAddItem(cid, 2160, 5)
				doPlayerAddPremiumDays(cid, 2)
				setPlayerStorageValue(cid, 99971, 1)
				doPlayerSendTextMessage(cid, 22, "[Premio] Voce Ganhou 15 Boost Stone + 5 TD + 2 Dia de VIP no Level 250")
elseif(getPlayerStorageValue(cid, 99972) ~= 1 and skill == SKILL__LEVEL and newlevel >= 305) then
				doPlayerAddItem(cid, 12618, 20)
				--doPlayerAddItem(cid, 2160, 25)
				doPlayerAddPremiumDays(cid, 2)
				setPlayerStorageValue(cid, 99972, 1)
				doPlayerSendTextMessage(cid, 22, "[Premio] Voce Ganhou 20 Boost Stone + 2 Dia de VIP no Level 305")						
elseif(getPlayerStorageValue(cid, 99973) ~= 1 and skill == SKILL__LEVEL and newlevel >= 500) then
				doPlayerAddItem(cid, 12618, 30)
				--doPlayerAddItem(cid, 2160, 25)
				doPlayerAddPremiumDays(cid, 5)
				setPlayerStorageValue(cid, 99973, 1)
				doPlayerSendTextMessage(cid, 22, "[Ultimo-Premio] Voce Ganhou 30 Boost Stone + 5 Dia de VIP no Level 500")						
				end
		return TRUE
end