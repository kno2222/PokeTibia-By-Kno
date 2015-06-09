local i = {
["09:00"] = {nome = "Dragonite", pos = {x=1096, y=1025, z=7}, monster = {"3 Dragonite","5 Dragonair"}},
["18:00"] = {nome = "Shiny Snorlax", pos = {x=1096, y=1025, z=7}, monster = {"1 Shiny Snorlax","8 Electabuzz"}},
}

function onTimer()
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " [Invasao] Invasao de (" .. tb.nome .. ") iníciou Pela Cidade Tomem Cuidado!.",22)
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end