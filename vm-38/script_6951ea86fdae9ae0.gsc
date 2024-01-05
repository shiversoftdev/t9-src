#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_fcd611c3;

/*
	Name: function_4e8f6b31
	Namespace: namespace_fcd611c3
	Checksum: 0xDFC256D1
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4e8f6b31()
{
	level notify(-1255792307);
}

/*
	Name: __init__system__
	Namespace: namespace_fcd611c3
	Checksum: 0x75B6C954
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_281322718ac3cd88", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fcd611c3
	Checksum: 0x5717E838
	Offset: 0x140
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
	zm_trial::register_challenge(#"hash_64d77357e69aee75", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_fcd611c3
	Checksum: 0xA6FA784C
	Offset: 0x1A8
	Size: 0x168
	Parameters: 5
	Flags: Private
*/
function private on_begin(var_c8a36f90, var_a9dd1993, var_2953986a, var_3790b4e4, var_edc5a14f)
{
	level.var_e91491fb = (isdefined(var_c8a36f90) ? var_c8a36f90 : "movement");
	callback::function_33f0ddd3(&function_33f0ddd3);
	level zm_trial::function_25ee130(1);
	if(level.var_e91491fb === #"prone")
	{
		array::thread_all(getplayers(), &zm_trial_util::function_9bf8e274);
	}
	foreach(player in getplayers())
	{
		player thread function_1633056a(var_a9dd1993, var_2953986a, var_3790b4e4, var_edc5a14f);
	}
}

/*
	Name: on_end
	Namespace: namespace_fcd611c3
	Checksum: 0xADB57E5A
	Offset: 0x318
	Size: 0x9E
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	callback::function_824d206(&function_33f0ddd3);
	level zm_trial::function_25ee130(0);
	if(level.var_e91491fb === #"prone")
	{
		array::thread_all(getplayers(), &zm_trial_util::function_73ff0096);
	}
	level.var_e91491fb = undefined;
}

/*
	Name: is_active
	Namespace: namespace_fcd611c3
	Checksum: 0x9B7B629F
	Offset: 0x3C0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	s_challenge = zm_trial::function_a36e8c38(#"hash_64d77357e69aee75");
	return isdefined(s_challenge);
}

/*
	Name: function_1633056a
	Namespace: namespace_fcd611c3
	Checksum: 0x67A7877F
	Offset: 0x400
	Size: 0x266
	Parameters: 4
	Flags: Private
*/
function private function_1633056a(var_a9dd1993, var_2953986a, var_3790b4e4, var_edc5a14f)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	if(isdefined(var_a9dd1993))
	{
		var_3b058622 = getweapon(var_a9dd1993);
	}
	if(isdefined(var_2953986a))
	{
		var_4dcaabac = getweapon(var_2953986a);
	}
	if(isdefined(var_3790b4e4))
	{
		var_cdd02bb5 = getweapon(var_3790b4e4);
	}
	if(isdefined(var_edc5a14f))
	{
		var_df94cf3e = getweapon(var_edc5a14f);
	}
	wait(1);
	var_407eb07 = 0;
	while(true)
	{
		if(self function_26f124d8() && var_407eb07)
		{
			var_9d590e70 = 1;
			if(isdefined(var_3b058622))
			{
				var_9d590e70 = 0;
				self function_936adaa1(var_3b058622);
			}
			if(isdefined(var_4dcaabac))
			{
				var_9d590e70 = 0;
				self function_936adaa1(var_4dcaabac);
			}
			if(isdefined(var_cdd02bb5))
			{
				var_9d590e70 = 0;
				self function_936adaa1(var_cdd02bb5);
			}
			if(isdefined(var_df94cf3e))
			{
				var_9d590e70 = 0;
				self function_936adaa1(var_df94cf3e);
			}
			if(var_9d590e70)
			{
				var_3940c585 = level.var_e91491fb !== #"prone";
				self zm_trial_util::function_dc0859e(var_3940c585);
			}
			var_407eb07 = 0;
		}
		else if(!self function_26f124d8() && !var_407eb07)
		{
			self zm_trial_util::function_bf710271();
			var_407eb07 = 1;
		}
		waitframe(1);
	}
}

/*
	Name: function_936adaa1
	Namespace: namespace_fcd611c3
	Checksum: 0xFAE13287
	Offset: 0x670
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function function_936adaa1(weapon)
{
	foreach(weapon_inventory in self getweaponslist(1))
	{
		w_root = zm_weapons::function_386dacbc(weapon_inventory);
		if(weapon === w_root)
		{
			self unlockweapon(weapon_inventory);
			if(weapon_inventory.dualwieldweapon != level.weaponnone)
			{
				self unlockweapon(weapon_inventory.dualwieldweapon);
			}
			self zm_trial_util::function_7dbb1712(1);
		}
	}
}

/*
	Name: function_26f124d8
	Namespace: namespace_fcd611c3
	Checksum: 0x8C52C855
	Offset: 0x790
	Size: 0x20C
	Parameters: 0
	Flags: None
*/
function function_26f124d8()
{
	if(!isdefined(level.var_e91491fb))
	{
		return true;
	}
	switch(level.var_e91491fb)
	{
		case "ads":
		{
			var_389b3ef1 = self playerads();
			if(self adsbuttonpressed() && var_389b3ef1 > 0)
			{
				return true;
			}
			return false;
		}
		case "jump":
		{
			if(self zm_utility::is_jumping())
			{
				return true;
			}
			return false;
		}
		case "slide":
		{
			if(self issliding())
			{
				return true;
			}
			return false;
		}
		case "hash_6c6c8f6b349b8751":
		{
			if(self zm_utility::is_jumping() || self issliding())
			{
				return true;
			}
			return false;
		}
		case "crouch":
		{
			if(self getstance() === "crouch")
			{
				return true;
			}
			return false;
		}
		case "prone":
		{
			if(self getstance() === "prone")
			{
				return true;
			}
			return false;
		}
		case "movement":
		default:
		{
			v_velocity = self getvelocity();
			if(length(v_velocity) != 0)
			{
				return true;
			}
			return false;
		}
	}
	return false;
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_fcd611c3
	Checksum: 0x886A2D56
	Offset: 0x9A8
	Size: 0x12C
	Parameters: 1
	Flags: Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		if(!self function_26f124d8() && !zm_loadout::function_2ff6913(s_event.weapon))
		{
			self function_28602a03(s_event.weapon, 1, 1);
			if(s_event.weapon.dualwieldweapon != level.weaponnone)
			{
				self function_28602a03(s_event.weapon.dualwieldweapon, 1, 1);
			}
			if(s_event.weapon.altweapon != level.weaponnone)
			{
				self function_28602a03(s_event.weapon.altweapon, 1, 1);
			}
		}
	}
}

