-----------------------------------
-- Area: FeiYin
--   NM: Dabotz's Ghost
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:hasKeyItem(tpz.ki.AQUAFLORA3) then
        player:setCharVar("DabotzKilled", 1)
    end
end
