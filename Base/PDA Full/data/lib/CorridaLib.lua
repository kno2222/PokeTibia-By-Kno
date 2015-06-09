function resetBattle()
local B = {
{11474,{x=1008, y=906, z=7, stackpos = 1}},
{11474,{x=1008, y=908, z=7, stackpos = 1}},
{11474,{x=1008, y=910, z=7, stackpos = 1}},
{11474,{x=1008, y=912, z=7, stackpos = 1}},
{11474,{x=1008, y=914, z=7, stackpos = 1}},
{11474,{x=1008, y=916, z=7, stackpos = 1}},
{11474,{x=1008, y=918, z=7, stackpos = 1}},
{11474,{x=1008, y=920, z=7, stackpos = 1}},
{11474,{x=1008, y=922, z=7, stackpos = 1}},
{11474,{x=1008, y=924, z=7, stackpos = 1}},
{11474,{x=1008, y=926, z=7, stackpos = 1}},
{11474,{x=1008, y=928, z=7, stackpos = 1}},
{11474,{x=1008, y=930, z=7, stackpos = 1}},
{11474,{x=1008, y=932, z=7, stackpos = 1}},
{11474,{x=1008, y=934, z=7, stackpos = 1}},
{11474,{x=1008, y=936, z=7, stackpos = 1}},
{11474,{x=1008, y=938, z=7, stackpos = 1}}
}
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end

function OpenWallBattle()
local B = {
{11474,{x=1008, y=906, z=7, stackpos = 1}},
{11474,{x=1008, y=908, z=7, stackpos = 1}},
{11474,{x=1008, y=910, z=7, stackpos = 1}},
{11474,{x=1008, y=912, z=7, stackpos = 1}},
{11474,{x=1008, y=914, z=7, stackpos = 1}},
{11474,{x=1008, y=916, z=7, stackpos = 1}},
{11474,{x=1008, y=918, z=7, stackpos = 1}},
{11474,{x=1008, y=920, z=7, stackpos = 1}},
{11474,{x=1008, y=922, z=7, stackpos = 1}},
{11474,{x=1008, y=924, z=7, stackpos = 1}},
{11474,{x=1008, y=926, z=7, stackpos = 1}},
{11474,{x=1008, y=928, z=7, stackpos = 1}},
{11474,{x=1008, y=930, z=7, stackpos = 1}},
{11474,{x=1008, y=932, z=7, stackpos = 1}},
{11474,{x=1008, y=934, z=7, stackpos = 1}},
{11474,{x=1008, y=936, z=7, stackpos = 1}},
{11474,{x=1008, y=938, z=7, stackpos = 1}}
} 
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end