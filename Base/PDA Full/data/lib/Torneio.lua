   torneio = {
awardTournament = 2160,
awardAmount = 10,
playerTemple = {x = 1096, y = 1009, z = 7},
tournamentFight = {x = 909, y = 978, z = 7},
area = {fromx = 899, fromy = 968, fromz = 7, tox = 919, toy = 989, toz= 7},
waitPlace = {x = 992, y = 998, z = 7},  
waitArea = {fromx = 987, fromy = 993, fromz = 7, tox = 997, toy = 1003, toz= 7},
startHour = "18:00:00",
endHour = "18:10:00",
price = 10000,
revivePoke = 12344,
}

function getPlayersInArea(area)

local players = {}

for x = area.fromx,area.tox do
for y = area.fromy,area.toy do
for z = area.fromz,area.toz do

local m = getTopCreature({x=x, y=y, z=z}).uid

if m ~= 0 and isPlayer(m) then
table.insert(players, m)
end
end
end
end
return players
end