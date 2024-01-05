#using scripts\mp_common\dynamic_loadout.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;

#namespace pickup_ammo;

/*
	Name: function_94086288
	Namespace: pickup_ammo
	Checksum: 0x15D9C670
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94086288()
{
	level notify(387305949);
}

/*
	Name: function_cff1656d
	Namespace: pickup_ammo
	Checksum: 0xB643E779
	Offset: 0xF0
	Size: 0x22E
	Parameters: 0
	Flags: None
*/
function function_cff1656d()
{
	pickup_ammos = getentarray("pickup_ammo", "targetname");
	foreach(pickup in pickup_ammos)
	{
		pickup.trigger = spawn("trigger_radius_use", pickup.origin + vectorscale((0, 0, 1), 15), 0, 120, 100);
		pickup.trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
		pickup.trigger triggerignoreteam();
		pickup.gameobject = gameobjects::create_use_object(#"neutral", pickup.trigger, [], (0, 0, 0), "pickup_ammo");
		pickup.gameobject gameobjects::set_objective_entity(pickup.gameobject);
		pickup.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		pickup.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
		pickup.gameobject gameobjects::set_use_time(0);
		pickup.gameobject.usecount = 0;
		pickup.gameobject.var_5ecd70 = pickup;
		pickup.gameobject.onuse = &function_5bb13b48;
	}
}

/*
	Name: function_4827d817
	Namespace: pickup_ammo
	Checksum: 0x115B5EF1
	Offset: 0x328
	Size: 0x2E8
	Parameters: 1
	Flags: None
*/
function function_4827d817(weapon)
{
	if(weapon.maxammo <= 0)
	{
		return false;
	}
	package = getscriptbundle(level.bountypackagelist[0]);
	slot = undefined;
	if(isdefined(self.pers[#"dynamic_loadout"].weapons[0]) && self.pers[#"dynamic_loadout"].weapons[0].name == weapon.name)
	{
		slot = 0;
	}
	else if(isdefined(self.pers[#"dynamic_loadout"].weapons[1]) && self.pers[#"dynamic_loadout"].weapons[1].name == weapon.name)
	{
		slot = 1;
	}
	if(!isdefined(slot))
	{
		return false;
	}
	var_f3e0cb57 = self.pers[#"dynamic_loadout"].clientfields[slot].val - 1;
	package = getscriptbundle(level.bountypackagelist[var_f3e0cb57]);
	var_e6e3de63 = package.var_ef921c3c;
	maxammo = package.refillammo;
	if(!isdefined(maxammo) || maxammo == 0)
	{
		maxammo = weapon.maxammo / weapon.clipsize;
		if(weapon.clipsize == 1)
		{
			maxammo = maxammo + 1;
		}
	}
	clipammo = self getweaponammoclip(weapon);
	stockammo = self getweaponammostock(weapon);
	currentammo = (float(clipammo + stockammo)) / weapon.clipsize;
	if(currentammo >= maxammo)
	{
		return false;
	}
	currentammo = currentammo + var_e6e3de63;
	if(currentammo > maxammo)
	{
		currentammo = maxammo;
	}
	self setweaponammostock(weapon, (int(currentammo * weapon.clipsize)) - clipammo);
	return true;
}

/*
	Name: function_5bb13b48
	Namespace: pickup_ammo
	Checksum: 0xC1D187A2
	Offset: 0x618
	Size: 0x284
	Parameters: 1
	Flags: Private
*/
function private function_5bb13b48(player)
{
	if(isdefined(player) && isplayer(player))
	{
		var_bd3d7a99 = 0;
		primaries = player getweaponslistprimaries();
		foreach(weapon in primaries)
		{
			ammogiven = player function_4827d817(weapon);
			if(ammogiven)
			{
				var_bd3d7a99 = 1;
			}
		}
		if(var_bd3d7a99)
		{
			if(isdefined(self.objectiveid))
			{
				objective_setinvisibletoplayer(self.objectiveid, player);
			}
			self.var_5ecd70 setinvisibletoplayer(player);
			self.trigger setinvisibletoplayer(player);
			self playsoundtoplayer(#"hash_587fec4cf4ba3ebb", player);
			self.usecount++;
			player gestures::function_56e00fbf(#"gestable_grab", undefined, 0);
			if(is_true(level.var_aff59367))
			{
				self thread function_7a80944d(player);
			}
		}
		else
		{
			player iprintlnbold(#"hash_2ea29b19d0e205e7");
			self playsoundtoplayer(#"uin_default_action_denied", player);
		}
	}
	if(!is_true(level.var_aff59367) && self.usecount >= level.var_ad9d03e7)
	{
		self.var_5ecd70 delete();
		self gameobjects::disable_object(1);
	}
}

/*
	Name: function_7a80944d
	Namespace: pickup_ammo
	Checksum: 0xD034F5CD
	Offset: 0x8A8
	Size: 0xC4
	Parameters: 1
	Flags: Private
*/
function private function_7a80944d(player)
{
	level endon(#"game_ended");
	self endon(#"death");
	player endon(#"disconnect");
	wait((isdefined(level.pickup_respawn_time) ? level.pickup_respawn_time : 0));
	if(isdefined(self.objectiveid))
	{
		objective_setvisibletoplayer(self.objectiveid, player);
	}
	self.var_5ecd70 setvisibletoplayer(player);
	self.trigger setvisibletoplayer(player);
}

