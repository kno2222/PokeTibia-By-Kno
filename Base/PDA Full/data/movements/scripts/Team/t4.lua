------- pvp go -----

s = {
--[actionID do piso] = {storage}
[33693] = {181778}, -- CTF-Clan
[33696] = {181779}, -- CTF-Clan
[33699] = {181780}, -- CTF-Bosot                2 MAPA CTF
[33702] = {181781}, -- CTF-Quest
[33705] = {181782}, -- CTF-Quest
[33706] = {181783}, -- CTF-Quest
}




local posi = {x=961, y=955, z=7} --posiçao do Clan


function onStepIn(cid, item, pos,fromPosition)
if isSummon(cid) then
return false
end
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, 19, "[TWP] Guarde o Pokemon Para Usar o TP !")
doTeleportThing(cid, fromPosition, false)
else
doPlayerSendTextMessage(cid, 19, "[Trade Center] Voce Esta Na Area Segura (Nao Pode Ser Puxado Pelo Sistema de Change Map)!")
doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)
end
return true
end