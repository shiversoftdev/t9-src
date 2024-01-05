#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace namespace_8ae4bc7d;

/*
	Name: function_63bbc43d
	Namespace: namespace_8ae4bc7d
	Checksum: 0x1A9D7540
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_63bbc43d()
{
	level notify(1416655489);
}

#namespace teleport;

/*
	Name: team
	Namespace: teleport
	Checksum: 0xF8CB8A69
	Offset: 0x108
	Size: 0x340
	Parameters: 3
	Flags: Linked
*/
function team(kvp, var_dad37549, var_b095575e)
{
	if(!isdefined(var_b095575e))
	{
		var_b095575e = 0;
	}
	level function_1d2a3300();
	var_bac46abd = self function_166effac(kvp, var_dad37549);
	if(!isdefined(var_bac46abd))
	{
		return 0;
	}
	if(var_bac46abd.a_s_players.size < level.players.size)
	{
		/#
			assertmsg("");
		#/
		return undefined;
	}
	foreach(e_player in level.players)
	{
		foreach(s_teleport in var_bac46abd.a_s_players)
		{
			if(!is_true(s_teleport.b_used))
			{
				e_player function_29305761(s_teleport, var_bac46abd.var_dad37549, var_b095575e);
				break;
			}
		}
	}
	if(isdefined(level.heroes))
	{
		foreach(ai_hero in level.heroes)
		{
			foreach(s_teleport in var_bac46abd.a_s_heroes)
			{
				if(isdefined(s_teleport.var_f7486b69) && s_teleport.var_f7486b69 != ai_hero.targetname)
				{
					continue;
				}
				if(!is_true(s_teleport.b_used))
				{
					ai_hero function_df1911b9(s_teleport, var_bac46abd.var_dad37549);
					break;
				}
			}
		}
	}
	function_ff8a7a3(kvp);
	return 1;
}

/*
	Name: player
	Namespace: teleport
	Checksum: 0x4F5D6895
	Offset: 0x450
	Size: 0x178
	Parameters: 4
	Flags: Linked
*/
function player(e_player, kvp, var_dad37549, var_b095575e)
{
	if(!isdefined(var_b095575e))
	{
		var_b095575e = 0;
	}
	if(!isalive(e_player))
	{
		return;
	}
	level function_1d2a3300();
	var_20212d26 = self function_e6615993(kvp, var_dad37549);
	str_key = var_20212d26.str_key;
	str_value = var_20212d26.str_value;
	foreach(s_teleport in level.a_s_teleport_players)
	{
		if(s_teleport.(str_key) === str_value && !is_true(s_teleport.b_used))
		{
			e_player function_29305761(s_teleport, var_20212d26.var_dad37549, var_b095575e);
			return true;
		}
	}
	return false;
}

/*
	Name: hero
	Namespace: teleport
	Checksum: 0x3BC7789D
	Offset: 0x5D0
	Size: 0x178
	Parameters: 3
	Flags: Linked
*/
function hero(ai_hero, kvp, var_dad37549)
{
	level function_1d2a3300();
	var_20212d26 = self function_e6615993(kvp, var_dad37549);
	str_key = var_20212d26.str_key;
	str_value = var_20212d26.str_value;
	foreach(s_teleport in level.var_c89d2304)
	{
		if(isdefined(s_teleport.var_f7486b69) && s_teleport.var_f7486b69 != ai_hero.targetname)
		{
			continue;
		}
		if(s_teleport.(str_key) === str_value && !is_true(s_teleport.b_used))
		{
			ai_hero function_df1911b9(s_teleport, var_20212d26.var_dad37549);
			return true;
		}
	}
	return false;
}

/*
	Name: function_ff8a7a3
	Namespace: teleport
	Checksum: 0xD173D532
	Offset: 0x750
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_ff8a7a3(kvp)
{
	var_20212d26 = self function_e6615993(kvp);
	foreach(s_teleport in struct::get_array(var_20212d26.str_value, var_20212d26.str_key))
	{
		s_teleport.b_used = undefined;
	}
}

/*
	Name: function_1d2a3300
	Namespace: teleport
	Checksum: 0x33730141
	Offset: 0x820
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1d2a3300()
{
	if(!isdefined(level.a_s_teleport_players))
	{
		if(!isdefined(level.a_s_teleport_players))
		{
			level.a_s_teleport_players = struct::get_array("teleport_player", "variantname");
		}
		if(!isdefined(level.var_c89d2304))
		{
			level.var_c89d2304 = struct::get_array("teleport_hero", "variantname");
		}
	}
}

/*
	Name: function_e6615993
	Namespace: teleport
	Checksum: 0x21836785
	Offset: 0x8B0
	Size: 0x134
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e6615993(kvp, var_dad37549)
{
	if(isdefined(self.script_teleport_location))
	{
		str_value = self.script_teleport_location;
		str_key = "script_teleport_location";
		if(!isdefined(var_dad37549) && isdefined(self.var_3e93c0f9))
		{
			var_dad37549 = self.var_3e93c0f9;
		}
	}
	else
	{
		if(isdefined(kvp) && isarray(kvp))
		{
			str_value = kvp[0];
			str_key = kvp[1];
		}
		else
		{
			str_value = kvp;
			str_key = "script_teleport_location";
		}
	}
	if(!isdefined(var_dad37549))
	{
		var_dad37549 = 0;
	}
	if(!isdefined(str_value) || !isdefined(str_key))
	{
		/#
			assertmsg("");
		#/
		return undefined;
	}
	return {#hash_dad37549:var_dad37549, #str_key:str_key, #str_value:str_value};
}

/*
	Name: function_166effac
	Namespace: teleport
	Checksum: 0x27AE1FA8
	Offset: 0x9F0
	Size: 0x2E4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_166effac(kvp, var_dad37549)
{
	var_20212d26 = self function_e6615993(kvp, var_dad37549);
	if(!isdefined(var_20212d26))
	{
		return undefined;
	}
	str_key = var_20212d26.str_key;
	str_value = var_20212d26.str_value;
	a_s_players = [];
	foreach(s_teleport_player in level.a_s_teleport_players)
	{
		if(s_teleport_player.(str_key) === str_value)
		{
			if(!isdefined(a_s_players))
			{
				a_s_players = [];
			}
			else if(!isarray(a_s_players))
			{
				a_s_players = array(a_s_players);
			}
			if(!isinarray(a_s_players, s_teleport_player))
			{
				a_s_players[a_s_players.size] = s_teleport_player;
			}
		}
	}
	a_s_heroes = [];
	if(isdefined(level.heroes))
	{
		foreach(s_teleport_hero in level.var_c89d2304)
		{
			if(s_teleport_hero.(str_key) === str_value)
			{
				if(!isdefined(a_s_heroes))
				{
					a_s_heroes = [];
				}
				else if(!isarray(a_s_heroes))
				{
					a_s_heroes = array(a_s_heroes);
				}
				if(!isinarray(a_s_heroes, s_teleport_hero))
				{
					a_s_heroes[a_s_heroes.size] = s_teleport_hero;
				}
			}
		}
		if(a_s_heroes.size < level.heroes.size)
		{
			/#
				assertmsg("");
			#/
			return undefined;
		}
	}
	return {#hash_dad37549:var_20212d26.var_dad37549, #a_s_heroes:a_s_heroes, #a_s_players:a_s_players};
}

/*
	Name: function_29305761
	Namespace: teleport
	Checksum: 0x897ADED4
	Offset: 0xCE0
	Size: 0x216
	Parameters: 3
	Flags: Linked, Private
*/
function private function_29305761(s_teleport, var_dad37549, var_b095575e)
{
	if(!isdefined(var_b095575e))
	{
		var_b095575e = 0;
	}
	self endon(#"death");
	if(distancesquared(s_teleport.origin, self.origin) < var_dad37549 * var_dad37549)
	{
		return;
	}
	s_teleport.b_used = 1;
	if(!var_b095575e)
	{
		self thread lui::screen_flash(0, 0.3, 0.3);
	}
	if(self isinvehicle())
	{
		vehicle = self getvehicleoccupied();
		if(is_true(s_teleport.var_ae20ad9b))
		{
			vehicle.origin = s_teleport.origin;
			vehicle.angles = s_teleport.angles;
			self notify(#"teleported");
			vehicle notify(#"teleported");
			return;
		}
		vehicle makevehicleunusable();
	}
	if(isdefined(self._scene_object))
	{
		[[ self._scene_object ]]->stop();
	}
	else if(self isplayinganimscripted())
	{
		self animation::stop();
	}
	self setorigin(s_teleport.origin);
	self setplayerangles(s_teleport.angles);
	if(isdefined(vehicle))
	{
		vehicle thread util::auto_delete();
	}
	self notify(#"teleported");
}

/*
	Name: function_df1911b9
	Namespace: teleport
	Checksum: 0x7214CB13
	Offset: 0xF00
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function function_df1911b9(s_teleport, var_dad37549)
{
	if(distancesquared(s_teleport.origin, self.origin) < var_dad37549 * var_dad37549)
	{
		return;
	}
	s_teleport.b_used = 1;
	self forceteleport(s_teleport.origin, s_teleport.angles);
	if(isdefined(s_teleport.target))
	{
		e_target = struct::get(s_teleport.target);
		if(!isdefined(e_target))
		{
			e_target = getnode(s_teleport.target, "targetname");
		}
		self thread spawner::go_to_node(e_target);
	}
	else
	{
		self setgoal(s_teleport.origin);
	}
	self notify(#"teleported");
}

