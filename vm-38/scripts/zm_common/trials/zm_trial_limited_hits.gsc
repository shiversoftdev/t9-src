#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_limited_hits;

/*
	Name: function_368fb39f
	Namespace: zm_trial_limited_hits
	Checksum: 0x7015928F
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_368fb39f()
{
	level notify(-1934169725);
}

/*
	Name: __init__system__
	Namespace: zm_trial_limited_hits
	Checksum: 0xFDE6EE3F
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_limited_hits", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_limited_hits
	Checksum: 0xBBA7BFFC
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
	zm_trial::register_challenge(#"limited_hits", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_limited_hits
	Checksum: 0x278F8B26
	Offset: 0x160
	Size: 0xD4
	Parameters: 2
	Flags: Private
*/
function private on_begin(var_85af3be4, var_752d90ad)
{
	if(getplayers().size == 1)
	{
		level.var_b529249b = zm_trial::function_5769f26a(var_752d90ad);
	}
	else
	{
		level.var_b529249b = zm_trial::function_5769f26a(var_85af3be4);
	}
	level.var_4b9163d5 = 0;
	zm_trial_util::function_2976fa44(level.var_b529249b);
	zm_trial_util::function_dace284(level.var_b529249b, 1);
	callback::on_player_damage(&on_player_damage);
}

/*
	Name: on_end
	Namespace: zm_trial_limited_hits
	Checksum: 0x92E02818
	Offset: 0x240
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
	level.var_b529249b = undefined;
	level.var_4b9163d5 = undefined;
	callback::remove_on_player_damage(&on_player_damage);
}

/*
	Name: is_active
	Namespace: zm_trial_limited_hits
	Checksum: 0xE5F4B1E4
	Offset: 0x2A0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"limited_hits");
	return isdefined(challenge);
}

/*
	Name: on_player_damage
	Namespace: zm_trial_limited_hits
	Checksum: 0xB6495415
	Offset: 0x2E0
	Size: 0x9C
	Parameters: 1
	Flags: Private
*/
function private on_player_damage(params)
{
	if(params.idamage >= 0)
	{
		level.var_4b9163d5++;
		zm_trial_util::function_dace284(level.var_b529249b - level.var_4b9163d5);
		if(level.var_4b9163d5 >= level.var_b529249b)
		{
			zm_trial::fail(#"hash_404865fbf8dd5cc2", array(self));
		}
	}
}

