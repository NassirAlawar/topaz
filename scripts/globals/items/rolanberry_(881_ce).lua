-----------------------------------------
-- ID: 4529
-- Item: rolanberry_881_ce)
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -3
-- Intelligence 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4529);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, -3);
    target:addMod(MOD_INT, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, -3);
    target:delMod(MOD_INT, 1);
end;
