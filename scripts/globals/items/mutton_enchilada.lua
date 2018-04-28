-----------------------------------------
-- ID: 4348
-- Item: mutton_enchilada
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 10
-- Strength 3
-- Vitality 1
-- Intelligence -1
-- Attack % 27
-- Attack Cap 35
-- Ranged ATT % 27
-- Ranged ATT Cap 35
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4348);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 27);
    target:addMod(MOD_FOOD_ATT_CAP, 35);
    target:addMod(MOD_FOOD_RATTP, 27);
    target:addMod(MOD_FOOD_RATT_CAP, 35);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 27);
    target:delMod(MOD_FOOD_ATT_CAP, 35);
    target:delMod(MOD_FOOD_RATTP, 27);
    target:delMod(MOD_FOOD_RATT_CAP, 35);
end;
