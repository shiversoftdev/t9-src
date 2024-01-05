#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_close_quarters;

/*
	Name: __init__system__
	Namespace: zm_trial_close_quarters
	Checksum: 0x2AF3CB4E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_close_quarters", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_close_quarters
	Checksum: 0x743CAF2B
	Offset: 0xD8
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
	zm_trial::register_challenge(#"close_quarters", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_close_quarters
	Checksum: 0xD4129963
	Offset: 0x140
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	zm::register_actor_damage_callback(&range_check);
}

/*
	Name: on_end
	Namespace: zm_trial_close_quarters
	Checksum: 0x1F146005
	Offset: 0x170
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	if(isinarray(level.actor_damage_callbacks, &range_check))
	{
		arrayremovevalue(level.actor_damage_callbacks, &range_check, 0);
	}
}

/*
	Name: is_active
	Namespace: zm_trial_close_quarters
	Checksum: 0x9527CF0C
	Offset: 0x1E0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"close_quarters");
	return isdefined(challenge);
}

/*
	Name: range_check
	Namespace: zm_trial_close_quarters
	Checksum: 0x6A02DFE4
	Offset: 0x220
	Size: 0x122
	Parameters: 13
	Flags: Private
*/
function private range_check(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isplayer(boneindex) && !isplayer(psoffsettime))
	{
		return -1;
	}
	if(is_true(self.aat_turned))
	{
		return surfacetype;
	}
	if(isdefined(boneindex.origin) && isdefined(self.origin) && distance2dsquared(boneindex.origin, self.origin) <= 122500)
	{
		return surfacetype;
	}
	return 0;
}

/*
	Name: function_23d15bf3
	Namespace: zm_trial_close_quarters
	Checksum: 0x426C5F7F
	Offset: 0x350
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_23d15bf3(var_f85889ce)
{
	if(isplayer(var_f85889ce) && distance2dsquared(var_f85889ce.origin, self.origin) <= 122500)
	{
		return true;
	}
	return false;
}

