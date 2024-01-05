#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_close_quarters;

/*
	Name: function_9130c875
	Namespace: zm_trial_close_quarters
	Checksum: 0xC0648917
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9130c875()
{
	level notify(-2091468997);
}

/*
	Name: __init__system__
	Namespace: zm_trial_close_quarters
	Checksum: 0x85DC6C3A
	Offset: 0xB0
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
	Checksum: 0xA9F6C14E
	Offset: 0xF8
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
	Checksum: 0xCFCD438D
	Offset: 0x160
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
	Checksum: 0xD132EB14
	Offset: 0x190
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
	Checksum: 0xF1BF767B
	Offset: 0x200
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
	Checksum: 0x3E5ED2F0
	Offset: 0x240
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
	Checksum: 0xE7706DAB
	Offset: 0x370
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

