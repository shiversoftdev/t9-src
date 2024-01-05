#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_b43e152a;

/*
	Name: __init__system__
	Namespace: namespace_b43e152a
	Checksum: 0xC8A19311
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_77f93374658c46e4", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b43e152a
	Checksum: 0xAE3237AC
	Offset: 0x100
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
	zm_trial::register_challenge(#"hash_10949a7065d076ef", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_b43e152a
	Checksum: 0x53642609
	Offset: 0x168
	Size: 0x13C
	Parameters: 8
	Flags: Private
*/
function private on_begin(n_max_zombies, var_2ec39966, str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9, var_a7a5a6ef)
{
	level endon(#"hash_7646638df88a3656");
	a_str_zones = array(str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9, var_a7a5a6ef);
	arrayremovevalue(a_str_zones, undefined);
	if(isdefined(n_max_zombies))
	{
		n_max_zombies = zm_trial::function_5769f26a(n_max_zombies);
	}
	wait(5);
	if(isdefined(var_2ec39966))
	{
		self.var_2ec39966 = var_2ec39966;
		zm_utility::function_75fd65f9(self.var_2ec39966, 1);
	}
	/#
		assert(a_str_zones.size, "");
	#/
	level thread function_65e6d40c(a_str_zones, n_max_zombies);
}

/*
	Name: on_end
	Namespace: namespace_b43e152a
	Checksum: 0xE342CB5F
	Offset: 0x2B0
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
	if(isdefined(self.var_2ec39966))
	{
		zm_utility::function_b1f3be5c(undefined, self.var_2ec39966);
		self.var_2ec39966 = undefined;
	}
}

/*
	Name: function_65e6d40c
	Namespace: namespace_b43e152a
	Checksum: 0x4544F16A
	Offset: 0x308
	Size: 0x320
	Parameters: 2
	Flags: Private
*/
function private function_65e6d40c(a_str_zones, n_max_zombies)
{
	if(!isdefined(n_max_zombies))
	{
		n_max_zombies = 0;
	}
	level endon(#"hash_7646638df88a3656", #"end_game");
	level waittill(#"zombie_total_set");
	a_s_locs = zm_utility::function_9f7fd525("zombie_location", a_str_zones, 0);
	foreach(s_loc in a_s_locs)
	{
		if(level.zombie_total > 0)
		{
			ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], undefined, s_loc);
			if(isdefined(ai))
			{
				ai.b_ignore_cleanup = 1;
				ai.var_45cec07d = 1;
				level.zombie_total--;
				util::wait_network_frame();
			}
		}
	}
	while(true)
	{
		a_ai_enemies = getaiteamarray(level.zombie_team);
		var_d1d851f3 = 0;
		foreach(ai in a_ai_enemies)
		{
			if(isalive(ai) && is_true(ai.completed_emerging_into_playable_area))
			{
				str_zone_name = ai zm_utility::get_current_zone();
				if(isdefined(str_zone_name) && isinarray(a_str_zones, hash(str_zone_name)))
				{
					var_d1d851f3++;
				}
			}
			if(n_max_zombies > 0)
			{
				zm_trial_util::function_dace284(var_d1d851f3, 1);
				zm_trial_util::function_2976fa44(n_max_zombies + 1);
			}
			if(var_d1d851f3 > n_max_zombies)
			{
				zm_trial::fail(#"hash_622e72c9731cca58");
				return;
			}
		}
		wait(0.5);
	}
}

