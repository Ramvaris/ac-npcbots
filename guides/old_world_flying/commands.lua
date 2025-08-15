-- (C)2025 by Ramvaris
-- THIS script only works if you use the Eluna API!

local function CommandHandlerFunction(event, player, command)
  if command == "mountup" then	
    -- Get Riding Level
    ridingLevel = player:GetSkillValue(762)
	-- Get current MapID
	currentMapId = player:GetMapId()
	
	if player:IsMounted() then
		player:Dismount()
		player:CastSpell(self, 81003, false)
		
		return false
	end
	
	-- The casted spells are the different BROOM Mounts of the 'Halloween Event' - with a speed matching the riding skill!
	if currentMapId == 530 or currentMapId == 571 or currentMapId == 0 or currentMapId == 1 or currentMapId == 401 or currentMapId == 443 or currentMapId == 461 or currentMapId == 482 or currentMapId == 512 or currentMapId == 540 then  
	  if ridingLevel >= 300 then
	    -- Lets the player mount a 300% movespeed carpet
		player:CastSpell(self,42668,true)
	  elseif ridingLevel >= 225 then
        -- Lets the player mount a 150% movespeed carpet
		player:CastSpell(self,42667,true)
	  else
	    -- Lets the player mount a 100% movespeed broom
		player:CastSpell(self,42683,true)
	  end
	else
		-- Lets the player mount a 100% movespeed broom (which is always even without riding - adapt it if you don't want that)
		player:CastSpell(self,42683,true)
	end
	
	return false
  end
  
  return true
end

RegisterPlayerEvent(42, CommandHandlerFunction)