#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_5f342394;

/*
	Name: function_91482f4
	Namespace: namespace_5f342394
	Checksum: 0x2EC69180
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_91482f4()
{
	level notify(543393146);
}

/*
	Name: __init__system__
	Namespace: namespace_5f342394
	Checksum: 0xAAAD38A5
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6c9de9db7f3e44a3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5f342394
	Checksum: 0x3E7A24A3
	Offset: 0x108
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
	zm_trial::register_challenge(#"hash_6c9de9db7f3e44a3", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_5f342394
	Checksum: 0x6F5C8AD7
	Offset: 0x170
	Size: 0x25C
	Parameters: 9
	Flags: Private
*/
function private on_begin(var_a84ac7c8, str_archetype, n_kill_count, str_destination, str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9)
{
	str_zones = [4:var_84245fe9, 3:var_91e2fb66, 2:var_588808b1, 1:str_zone2, 0:str_zone1];
	arrayremovevalue(str_zones, undefined, 0);
	level.var_8c6f70d0 = [];
	foreach(str_zone in str_zones)
	{
		if(!isdefined(level.var_8c6f70d0))
		{
			level.var_8c6f70d0 = [];
		}
		else if(!isarray(level.var_8c6f70d0))
		{
			level.var_8c6f70d0 = array(level.var_8c6f70d0);
		}
		if(!isinarray(level.var_8c6f70d0, str_zone))
		{
			level.var_8c6f70d0[level.var_8c6f70d0.size] = str_zone;
		}
	}
	level.var_c23449d8 = zm_trial::function_5769f26a(str_destination);
	self.var_925854c7 = n_kill_count;
	level.var_fbca3288 = 0;
	zm_trial_util::function_2976fa44(level.var_c23449d8);
	zm_trial_util::function_dace284(0);
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: on_end
	Namespace: namespace_5f342394
	Checksum: 0x1A39FA46
	Offset: 0x3D8
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
	n_remaining = level.var_c23449d8;
	level.var_c23449d8 = undefined;
	level.var_925854c7 = undefined;
	level.var_fbca3288 = undefined;
	callback::remove_on_ai_killed(&on_ai_killed);
	if(n_remaining > 0)
	{
		zm_trial::fail(self.var_925854c7, level.players);
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_5f342394
	Checksum: 0x6DAC9A57
	Offset: 0x488
	Size: 0x11C
	Parameters: 1
	Flags: Private
*/
function private on_ai_killed(params)
{
	if(self.archetype === #"gladiator" && level.var_c23449d8 > 0)
	{
		var_d217c89e = 0;
		foreach(str_zone in level.var_8c6f70d0)
		{
			if(self zm_zonemgr::entity_in_zone(str_zone, 1))
			{
				var_d217c89e = 1;
			}
		}
		if(var_d217c89e)
		{
			level.var_c23449d8--;
			level.var_fbca3288++;
			zm_trial_util::function_dace284(level.var_fbca3288);
		}
	}
}

/*
	Name: function_492f4c79
	Namespace: namespace_5f342394
	Checksum: 0x9E5F4FDA
	Offset: 0x5B0
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_492f4c79()
{
	level endon(#"hash_7646638df88a3656");
	wait(12);
	zm_utility::function_75fd65f9(self.var_f7f308cd, 1);
}

