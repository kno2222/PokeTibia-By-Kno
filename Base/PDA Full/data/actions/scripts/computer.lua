local ranks = {
['level'] = {8},
}
function onUse(cid, item, frompos, item2, topos)
if ranks[msg] ~= nil then
str = getHighscoreString((ranks[msg][1]))
else
str = getHighscoreString((8))
end
doShowTextDialog(cid,2160, str)
return TRUE
end