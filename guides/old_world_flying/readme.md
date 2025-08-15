To enable flying in the old world you need two things.

##First:

	You need to edit the SpellInfo.cpp of your server core. There is no other way. Not even with hooks as far as I know.
	Search for this if-clause:

		// continent limitation (virtual continent)
		if (HasAttribute(SPELL_ATTR4_ONLY_FLYING_AREAS) && (area_id || zone_id))
		
	Change the whole segment to this or just add the || (player->GetMapId() != 0 && player->GetMapId() != 1) part (Do NOT forget the ( ) for !player):

		// Ramvaris override: skip fly check on world maps (MapId 0 and 1)
		// continent limitation (virtual continent)
		if (HasAttribute(SPELL_ATTR4_ONLY_FLYING_AREAS) && (area_id || zone_id))
		{
			AreaTableEntry const* areaEntry = sAreaTableStore.LookupEntry(area_id);
			if (!areaEntry)
			{
				areaEntry = sAreaTableStore.LookupEntry(zone_id);
			}

			if (!areaEntry ||
				(!player || (player->GetMapId() != 0 && player->GetMapId() != 1)) &&
				(!areaEntry->IsFlyable() ||
					(strict && (areaEntry->flags & AREA_FLAG_NO_FLY_ZONE) != 0) ||
					(player && !player->canFlyInZone(map_id, zone_id, this))))
			{
				return SPELL_FAILED_INCORRECT_AREA;
			}
		}
	
	Re-Compile the server.
	
##Second:

	You need to add a possibility for the client to mount on a flying mount. The client has it's own checks, so you can only do it by one of those ways:
		1. Edit the spell.dbc file in the /data/dbc folder for the mounts that should be allowed to be cast (All mounts are basically spells!) in the old world. Restart the server afterwards.
		   Takes much work but is the most vanilla way.
		   To edit .dbc files you need the [WDBX Editor](https://github.com/WowDevTools/WDBXEditor) and you should study the different spell.dbc fields on the AzerothCore documentation.
		   You also need to give this .dbc file to your client - so you have to pack it into a MPQ. I recommend this [MPQEditor](http://www.zezula.net/en/mpq/download.html).
		   
		2. Add a server-side command that the client can use to tell the server 'Hey I cast THIS spell'.
		   This is relatively fast if you know the mound id. I added a Eluna API Lua Script that does exactly that. Use it if you don't want much work.
	