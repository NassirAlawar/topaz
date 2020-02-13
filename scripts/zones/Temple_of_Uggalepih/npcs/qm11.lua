-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (San dOria Mission 8-2)
-- !pos -13 -17 -151 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(SANDORIA) == tpz.mission.id.sandoria.LIGHTBRINGER and player:getCharVar("MissionStatus") == 2 then
        player:setCharVar("MissionStatus", 3)
        player:addKeyItem(tpz.ki.PIECE_OF_A_BROKEN_KEY1)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.PIECE_OF_A_BROKEN_KEY1)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end