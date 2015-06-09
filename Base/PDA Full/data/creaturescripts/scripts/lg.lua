local Vocs = {
   [1] = {
      h = {

[SKILL_DISTANCE] = 0,
         [SKILL_SHIELD] = 0,

 },
      mana = true
   },

   [8] = {
      h = {

[SKILL_AXE] = 0,
[SKILL_SWORD] = 0,
[SKILL_CLUB] = 0,
         [SKILL_SHIELD] = 0,

 },
   },
}

function onLogin(cid)
   local reqTries = getPlayerRequiredSkillTries

   if (getPlayerStorageValue(cid, 56364) ~= -1) then
      return true
   end

   if (Vocs[getPlayerVocation(cid)]) then
      for i, v in pairs(Vocs[getPlayerVocation(cid)].h) do
         doPlayerAddSkillTry(cid, i, reqTries(cid, i, v))
      end

      if (Vocs[getPlayerVocation(cid)].mana) then
         doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid, 0)))
      end
   else
      doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid, 0)))
   end

   return setPlayerStorageValue(cid, 56364, 1)
end