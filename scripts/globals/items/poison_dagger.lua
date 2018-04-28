-----------------------------------------
-- ID: 16496
-- Item: Poison Dagger
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(dsp.effect.POISON, 4, 3, 30);
        return SUBEFFECT_POISON, msgBasic.ADD_EFFECT_STATUS, dsp.effect.POISON;
    end
end;