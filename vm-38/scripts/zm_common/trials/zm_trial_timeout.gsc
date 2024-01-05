#using script_2595527427ea71eb;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_trial_timeout;

/*
	Name: function_947f5429
	Namespace: zm_trial_timeout
	Checksum: 0x30B21880
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_947f5429()
{
	level notify(-207449920);
}

/*
	Name: __init__system__
	Namespace: zm_trial_timeout
	Checksum: 0x4B7295F5
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_timeout", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_timeout
	Checksum: 0x89D92406
	Offset: 0x228
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"timeout", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_timeout
	Checksum: 0xF02591E1
	Offset: 0x290
	Size: 0x34C
	Parameters: 8
	Flags: Private
*/
function private on_begin(timer_label, var_1215371f, grace_period, var_29cadcde, var_c811984d, var_26be3f81, var_6b594c52, var_afb6cb74)
{
	timer_value = 0;
	switch(getplayers().size)
	{
		case 1:
		{
			timer_value = zm_trial::function_5769f26a(var_29cadcde);
			break;
		}
		case 2:
		{
			timer_value = zm_trial::function_5769f26a(var_c811984d);
			break;
		}
		case 3:
		{
			timer_value = zm_trial::function_5769f26a(var_26be3f81);
			break;
		}
		case 4:
		{
			timer_value = zm_trial::function_5769f26a(var_6b594c52);
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
	level thread function_8b87e57c(timer_label, grace_period, timer_value, var_1215371f);
	callback::on_spawned(&function_31f197c2);
	callback::add_callback(#"on_host_migration_end", &function_ff66b979);
}

/*
	Name: on_end
	Namespace: zm_trial_timeout
	Checksum: 0x17CDC000
	Offset: 0x5E8
	Size: 0x2AA
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player zm_trial_util::stop_timer();
		}
	}
	callback::remove_on_spawned(&function_31f197c2);
	callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
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
	Checksum: 0x9E13A828
	Offset: 0x8A0
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
	Checksum: 0xE79767DC
	Offset: 0x8F0
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
	Checksum: 0xB1246215
	Offset: 0xA28
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
	Checksum: 0x8FB2351B
	Offset: 0xA50
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
	Checksum: 0x72555A73
	Offset: 0xDB0
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
	Checksum: 0x28B69167
	Offset: 0xF30
	Size: 0x254
	Parameters: 4
	Flags: Private
*/
function private function_8b87e57c(timer_label, grace_period, timer_value, var_1215371f)
{
	level endon(#"end_of_round", #"host_migration_begin", #"hash_7646638df88a3656", #"end_game");
	if(!isdefined(level.var_489d6aa2))
	{
		level.var_489d6aa2 = timer_label;
	}
	if(!isdefined(level.var_869f4c31))
	{
		level.var_869f4c31 = timer_value;
	}
	wait(grace_period);
	timer_label = (isdefined(timer_label) ? timer_label : #"");
	level thread function_14a98a41(timer_label, timer_value);
	foreach(player in getplayers())
	{
		if(!level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::open(player);
			level.var_f995ece6 zm_trial_timer::set_timer_text(player, timer_label);
			level.var_f995ece6 zm_trial_timer::set_under_round_rules(player, 1);
		}
		player zm_trial_util::start_timer(timer_value);
		if(level.var_f6f33e5f === #"melee_only")
		{
			player val::reset("zm_trial_timeout", "freezecontrols");
		}
	}
	wait(timer_value);
	zm_trial::fail(var_1215371f);
}

/*
	Name: function_31f197c2
	Namespace: zm_trial_timeout
	Checksum: 0x9957A437
	Offset: 0x1190
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
		level.var_f995ece6 zm_trial_timer::set_timer_text(self, level.var_489d6aa2);
		level.var_f995ece6 zm_trial_timer::set_under_round_rules(self, 1);
		self zm_trial_util::start_timer(level.var_869f4c31);
	}
}

/*
	Name: function_14a98a41
	Namespace: zm_trial_timeout
	Checksum: 0xA0C8DED3
	Offset: 0x1290
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
	Checksum: 0x53FEB388
	Offset: 0x1338
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

