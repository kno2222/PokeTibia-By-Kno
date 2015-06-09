items = { 
[0] = {id = 6569, count = 5, chance = 5}, 
[1] = {id = 2160, count = 2, chance = 7}, 
[2] = {id = 12618, count = 2, chance = 3},
[3] = {id = 6569, count = 7, chance = 11},
[4] = {id = 2160, count = 3, chance = 12},
[5] = {id = 12618, count = 3, chance = 16},
[6] = {id = 6569, count = 3, chance = 18.4},
} 
function onUse(cid, item, fromPos, itemEx, toPos) 
for i = 0, #items do 
if (items[i].chance > math.random(1, 30)) then 
doPlayerAddItem(cid, items[i].id, items[i].count) 
doRemoveItem(item.uid, 1) 
doCreatureSay(cid, 'Ae Ganhei um item ['..getItemNameById(items[i].id)..'] ao Alcançar o LVL [50]!', TALKTYPE_MONSTER) 
return true
end 
end
end