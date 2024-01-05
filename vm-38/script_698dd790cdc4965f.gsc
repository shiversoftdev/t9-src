#using script_35d3717bf2cbee8f;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_83dc3729;

/*
	Name: function_d2a28a03
	Namespace: namespace_83dc3729
	Checksum: 0xD9C15FF1
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d2a28a03()
{
	level notify(-876905365);
}

/*
	Name: __init__system__
	Namespace: namespace_83dc3729
	Checksum: 0x8F79BACE
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_491590ee8fe06753", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_83dc3729
	Checksum: 0x43FE0B7A
	Offset: 0xF0
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_7dd35595d2a7953a", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_83dc3729
	Checksum: 0x76222A6F
	Offset: 0x158
	Size: 0x1DC
	Parameters: 0
	Flags: Linked, Private
*/
function private on_begin()
{
	/#
		assert(isdefined(level.zombie_weapons_upgraded));
	#/
	level.var_af806901 = [];
	foreach(upgraded_weapon in getarraykeys(level.zombie_weapons_upgraded))
	{
		level.var_af806901[upgraded_weapon.name] = upgraded_weapon;
	}
	foreach(player in getplayers())
	{
		player function_6a8979c9();
		player callback::function_33f0ddd3(&function_33f0ddd3);
		player zm_trial_util::function_7dbb1712(1);
		player callback::on_weapon_change(&zm_trial_util::function_79518194);
	}
	zm_trial_util::function_eea26e56();
	level zm_trial::function_8e2a923(1);
}

/*
	Name: on_end
	Namespace: namespace_83dc3729
	Checksum: 0x9A664A0B
	Offset: 0x340
	Size: 0x1EC
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		player callback::function_824d206(&function_33f0ddd3);
		player callback::remove_on_weapon_change(&zm_trial_util::function_79518194);
		foreach(weapon in player getweaponslist(1))
		{
			player unlockweapon(weapon);
			if(weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone)
			{
				player unlockweapon(weapon.dualwieldweapon);
			}
		}
		player zm_trial_util::function_7dbb1712(1);
	}
	level.var_af806901 = undefined;
	zm_trial_util::function_ef1fce77();
	level zm_trial::function_8e2a923(0);
}

/*
	Name: is_active
	Namespace: namespace_83dc3729
	Checksum: 0xA8C6CECD
	Offset: 0x538
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_7dd35595d2a7953a");
	return isdefined(challenge);
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_83dc3729
	Checksum: 0x827E74D9
	Offset: 0x578
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_33f0ddd3(eventstruct)
{
	self function_6a8979c9();
}

/*
	Name: function_6a8979c9
	Namespace: namespace_83dc3729
	Checksum: 0x686D8A5E
	Offset: 0x5A8
	Size: 0x1C0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6a8979c9()
{
	/#
		assert(isdefined(level.var_af806901));
	#/
	foreach(weapon in self getweaponslist(1))
	{
		if(isdefined(level.var_af806901[weapon.name]))
		{
			self function_28602a03(weapon);
		}
		else if(!namespace_fc5170d1::is_active() || !isarray(level.var_3e2ac3b6) || !isdefined(level.var_3e2ac3b6[weapon.name]))
		{
			self unlockweapon(weapon);
		}
		if(weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone)
		{
			if(self function_635f9c02(weapon))
			{
				self function_28602a03(weapon.dualwieldweapon);
				continue;
			}
			self unlockweapon(weapon.dualwieldweapon);
		}
	}
}

