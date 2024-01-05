#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_headshots_only;

/*
	Name: function_e78c17ad
	Namespace: zm_trial_headshots_only
	Checksum: 0x58FFAF61
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e78c17ad()
{
	level notify(-719428827);
}

/*
	Name: __init__system__
	Namespace: zm_trial_headshots_only
	Checksum: 0x8F00BF35
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_headshots_only", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_headshots_only
	Checksum: 0xBDAA25D
	Offset: 0x138
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
	zm_trial::register_challenge(#"headshots_only", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_headshots_only
	Checksum: 0x44981BEA
	Offset: 0x1A0
	Size: 0x234
	Parameters: 1
	Flags: Linked, Private
*/
function private on_begin(weapon_name)
{
	level.var_b38bb71 = 1;
	level.var_ef0aada0 = 1;
	zm_traps::function_6966417b();
	foreach(player in getplayers())
	{
		foreach(var_5a1e3e5b in level.hero_weapon)
		{
			foreach(w_hero in var_5a1e3e5b)
			{
				player function_28602a03(w_hero, 1, 1);
			}
		}
		player zm_trial_util::function_9bf8e274();
		player zm_trial_util::function_dc9ab223(1);
	}
	callback::function_33f0ddd3(&function_33f0ddd3);
	level zm_trial::function_44200d07(1);
	level zm_trial::function_cd75b690(1);
}

/*
	Name: on_end
	Namespace: zm_trial_headshots_only
	Checksum: 0x71A525DC
	Offset: 0x3E0
	Size: 0x2CC
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	level.var_b38bb71 = 0;
	level.var_ef0aada0 = 0;
	zm_traps::function_9d0c9706();
	foreach(player in getplayers())
	{
		foreach(var_5a1e3e5b in level.hero_weapon)
		{
			foreach(w_hero in var_5a1e3e5b)
			{
				player unlockweapon(w_hero);
			}
		}
		player zm_trial_util::function_73ff0096();
		foreach(w_equip in level.zombie_weapons)
		{
			if(w_equip.weapon_classname === "equipment")
			{
				player unlockweapon(w_equip.weapon);
			}
		}
		player zm_trial_util::function_dc9ab223(0);
	}
	callback::function_824d206(&function_33f0ddd3);
	level zm_trial::function_44200d07(0);
	level zm_trial::function_cd75b690(0);
}

/*
	Name: is_active
	Namespace: zm_trial_headshots_only
	Checksum: 0x5FE6B073
	Offset: 0x6B8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"headshots_only");
	return isdefined(challenge);
}

/*
	Name: function_33f0ddd3
	Namespace: zm_trial_headshots_only
	Checksum: 0xC5E78D69
	Offset: 0x6F8
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		if(zm_loadout::function_59b0ef71("lethal_grenade", s_event.weapon))
		{
			self function_28602a03(s_event.weapon, 1, 1);
		}
	}
}

