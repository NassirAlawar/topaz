-----------------------------------
--
-- Zone: Den_of_Rancor (160)
--
-----------------------------------

package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17433086,17433087,17433088,17433089,17433090,17433091};
    
    SetGroundsTome(tomes);

    UpdateTreasureSpawnPoint(17433073);
    
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(196.421,34.595,-60.319,110);
	end	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
end;	

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	
