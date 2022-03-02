#using script_14f4a3c583c77d4b;
#using script_2595527427ea71eb;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace zm_trial_timeout;

/*
	Name: function_89f2df9
	Namespace: zm_trial_timeout
	Checksum: 0x33409BF8
	Offset: 0x1C0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_trial_timeout", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_timeout
	Checksum: 0xCD1CF0FA
	Offset: 0x208
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"timeout", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: zm_trial_timeout
	Checksum: 0x832E1497
	Offset: 0x270
	Size: 0x34C
	Parameters: 8
	Flags: Private
*/
function private function_d1de6a85(var_9eb4b9f8, var_1215371f, grace_period, var_29cadcde, var_c811984d, var_26be3f81, var_6b594c52, var_afb6cb74)
{
	var_690d3062 = 0;
	switch(getplayers().size)
	{
		case 1:
		{
			var_690d3062 = zm_trial::function_5769f26a(var_29cadcde);
			break;
		}
		case 2:
		{
			var_690d3062 = zm_trial::function_5769f26a(var_c811984d);
			break;
		}
		case 3:
		{
			var_690d3062 = zm_trial::function_5769f26a(var_26be3f81);
			break;
		}
		case 4:
		{
			var_690d3062 = zm_trial::function_5769f26a(var_6b594c52);
			break;
		}
		default:
		{
			/#
				assert(0, "");
			#/
			break;
		}
	}
	if(var_afb6cb74 === #"melee_only")
	{
		level.var_f6f33e5f = #"melee_only";
		callback::on_ai_killed(&function_cbd444ad);
		array::thread_all(getplayers(), &val::set, "zm_trial_timeout", "freezecontrols", 1);
	}
	else if(var_afb6cb74 === #"zombie_keep_away")
	{
		level.var_f6f33e5f = #"zombie_keep_away";
		callback::on_ai_spawned(&function_d3eb9969);
		foreach(player in getplayers())
		{
			player val::set("zombie_keep_away", "ignoreme", 1);
		}
	}
	grace_period = zm_trial::function_5769f26a(grace_period);
	level thread function_8b87e57c(var_9eb4b9f8, grace_period, var_690d3062, var_1215371f);
	callback::on_spawned(&function_31f197c2);
	callback::add_callback(#"hash_137b937fd26992be", &function_ff66b979);
}

/*
	Name: function_9e7b3f4d
	Namespace: zm_trial_timeout
	Checksum: 0xB4859963
	Offset: 0x5C8
	Size: 0x2AA
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player namespace_b22c99a5::stop_timer();
		}
	}
	callback::remove_on_spawned(&function_31f197c2);
	callback::remove_callback(#"hash_137b937fd26992be", &function_ff66b979);
	if(level.var_f6f33e5f === #"melee_only")
	{
		callback::remove_on_ai_killed(&function_cbd444ad);
		array::thread_all(getplayers(), &val::reset, "zm_trial_timeout", "freezecontrols");
	}
	else if(level.var_f6f33e5f === #"zombie_keep_away")
	{
		callback::remove_on_ai_spawned(&function_d3eb9969);
		foreach(player in getplayers())
		{
			player val::reset("zombie_keep_away", "ignoreme");
		}
	}
	level.var_f6f33e5f = undefined;
	level.var_489d6aa2 = undefined;
	level.var_869f4c31 = undefined;
}

/*
	Name: function_cbd444ad
	Namespace: zm_trial_timeout
	Checksum: 0x19C3C29E
	Offset: 0x880
	Size: 0x44
	Parameters: 1
	Flags: Private
*/
function private function_cbd444ad(params)
{
	if(!self function_35cda2d8(params))
	{
		zm_trial::fail(#"hash_73d4bcc7d0dd1647");
	}
}

/*
	Name: function_35cda2d8
	Namespace: zm_trial_timeout
	Checksum: 0x78588FF2
	Offset: 0x8D0
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_35cda2d8(params)
{
	if(self.team !== level.zombie_team)
	{
		return true;
	}
	if(is_true(self.nuked))
	{
		return true;
	}
	if(isai(params.eattacker) || isai(params.einflictor))
	{
		return true;
	}
	if(params.weapon === level.var_78032351)
	{
		return true;
	}
	if(zm_loadout::is_melee_weapon(params.weapon))
	{
		return true;
	}
	if(params.smeansofdeath === "MOD_IMPACT" || params.smeansofdeath === "MOD_MELEE" || params.smeansofdeath === "MOD_MELEE_ASSASSINATE" || params.smeansofdeath === "MOD_MELEE_WEAPON_BUTT")
	{
		return true;
	}
	return false;
}

/*
	Name: function_d3eb9969
	Namespace: zm_trial_timeout
	Checksum: 0x764A0353
	Offset: 0xA08
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_d3eb9969()
{
	self thread function_28663a8f();
}

/*
	Name: function_28663a8f
	Namespace: zm_trial_timeout
	Checksum: 0x7007FFFC
	Offset: 0xA30
	Size: 0x356
	Parameters: 0
	Flags: Private
*/
function private function_28663a8f()
{
	self endon(#"death");
	level endon(#"hash_7646638df88a3656");
	wait(1);
	if(!is_true(self.completed_emerging_into_playable_area) && self.archetype === #"zombie")
	{
		self waittill(#"completed_emerging_into_playable_area");
	}
	self.b_ignore_cleanup = 1;
	while(true)
	{
		var_f1b2ce83 = struct::get_array("wait_location", "script_noteworthy");
		var_f1b2ce83 = array::filter(var_f1b2ce83, 0, &function_f22cd3f0, self);
		if(isarray(var_f1b2ce83) && var_f1b2ce83.size)
		{
			var_b8db7c29 = arraygetfarthest(self.origin, var_f1b2ce83);
		}
		if(isdefined(var_b8db7c29) & !is_true(self.aat_turned))
		{
			var_b1756ffd = 20;
			while(var_b1756ffd > 0)
			{
				if(isarray(level.zombie_poi_array) && level.zombie_poi_array.size > 0)
				{
					var_9b06f383 = 0;
					foreach(poi in level.zombie_poi_array)
					{
						if(isentity(poi) || isstruct(poi) && is_true(poi.poi_active))
						{
							var_9b06f383 = 1;
							break;
						}
					}
					if(var_9b06f383)
					{
						wait(1);
						break;
					}
				}
				self setgoal(var_b8db7c29.origin, 0, 0, 16384);
				waitframe(1);
				var_b1756ffd = var_b1756ffd - (float(function_60d95f53()) / 1000);
				if(distance2dsquared(self.origin, var_b8db7c29.origin) < 16384)
				{
					break;
				}
				if(is_true(self.aat_turned))
				{
					break;
				}
			}
			var_b8db7c29 = undefined;
		}
		waitframe(1);
	}
}

/*
	Name: function_f22cd3f0
	Namespace: zm_trial_timeout
	Checksum: 0x3549C6C8
	Offset: 0xD90
	Size: 0x176
	Parameters: 2
	Flags: Private
*/
function private function_f22cd3f0(s_wait_location, ai_zombie)
{
	if(isdefined(s_wait_location.zone_name) && !zm_zonemgr::zone_is_enabled(s_wait_location.zone_name))
	{
		return false;
	}
	vol_light_side = getent("vol_light_side", "targetname");
	vol_dark_side = getent("vol_dark_side", "targetname");
	if(isdefined(vol_light_side) && isdefined(vol_dark_side))
	{
		var_9b9fe2ad = ai_zombie istouching(vol_light_side);
		var_59248979 = ai_zombie istouching(vol_dark_side);
		var_50ee42a5 = istouching(s_wait_location.origin, vol_light_side);
		var_c8b07764 = istouching(s_wait_location.origin, vol_dark_side);
		if(var_9b9fe2ad && var_50ee42a5)
		{
			return true;
		}
		if(var_59248979 && var_c8b07764)
		{
			return true;
		}
		return false;
	}
	return true;
}

/*
	Name: function_8b87e57c
	Namespace: zm_trial_timeout
	Checksum: 0x9691316C
	Offset: 0xF10
	Size: 0x254
	Parameters: 4
	Flags: Private
*/
function private function_8b87e57c(var_9eb4b9f8, grace_period, var_690d3062, var_1215371f)
{
	level endon(#"end_of_round", #"host_migration_begin", #"hash_7646638df88a3656", #"end_game");
	if(!isdefined(level.var_489d6aa2))
	{
		level.var_489d6aa2 = var_9eb4b9f8;
	}
	if(!isdefined(level.var_869f4c31))
	{
		level.var_869f4c31 = var_690d3062;
	}
	wait(grace_period);
	var_9eb4b9f8 = (isdefined(var_9eb4b9f8) ? var_9eb4b9f8 : #"");
	level thread function_14a98a41(var_9eb4b9f8, var_690d3062);
	foreach(player in getplayers())
	{
		if(!level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::open(player);
			level.var_f995ece6 zm_trial_timer::function_8ede8e82(player, var_9eb4b9f8);
			level.var_f995ece6 zm_trial_timer::function_6ad54036(player, 1);
		}
		player namespace_b22c99a5::start_timer(var_690d3062);
		if(level.var_f6f33e5f === #"melee_only")
		{
			player val::reset("zm_trial_timeout", "freezecontrols");
		}
	}
	wait(var_690d3062);
	zm_trial::fail(var_1215371f);
}

/*
	Name: function_31f197c2
	Namespace: zm_trial_timeout
	Checksum: 0x857F7DC6
	Offset: 0x1170
	Size: 0xF4
	Parameters: 0
	Flags: Private
*/
function private function_31f197c2()
{
	self endon(#"disconnect");
	wait(0.5);
	var_9a703be9 = level.var_869f4c31;
	while(var_9a703be9 == level.var_869f4c31)
	{
		waitframe(1);
	}
	if(!level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::open(self);
		level.var_f995ece6 zm_trial_timer::function_8ede8e82(self, level.var_489d6aa2);
		level.var_f995ece6 zm_trial_timer::function_6ad54036(self, 1);
		self namespace_b22c99a5::start_timer(level.var_869f4c31);
	}
}

/*
	Name: function_14a98a41
	Namespace: zm_trial_timeout
	Checksum: 0xB9CAC75A
	Offset: 0x1270
	Size: 0x9C
	Parameters: 2
	Flags: Private
*/
function private function_14a98a41(str_label, n_time_limit)
{
	self notify("4efb28cb64a876c9");
	self endon("4efb28cb64a876c9");
	level endon(#"end_of_round", #"host_migration_begin", #"end_game");
	level.var_489d6aa2 = str_label;
	level.var_869f4c31 = n_time_limit;
	while(true)
	{
		wait(1);
		level.var_869f4c31--;
	}
}

/*
	Name: function_ff66b979
	Namespace: zm_trial_timeout
	Checksum: 0x76B5B5C5
	Offset: 0x1318
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_ff66b979()
{
	level endon(#"end_of_round", #"end_game");
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
		}
	}
	wait(5);
	level thread function_8b87e57c(level.var_489d6aa2, 0, level.var_869f4c31);
}

