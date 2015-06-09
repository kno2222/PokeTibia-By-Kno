torneioo = {
awardTournament = 2160,
awardAmount = 10,
playerTemple = {x = 1096, y = 1009, z = 7},
tournamentFight = {x = 981, y = 903, z = 7},
area = {fromx = 970, fromy = 893, fromz = 7, tox = 991, toy = 913, toz= 7},
waitPlace = {x = 992, y = 998, z = 7},  
waitArea = {fromx = 987, fromy = 993, fromz = 7, tox = 997, toy = 1003, toz= 7},
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