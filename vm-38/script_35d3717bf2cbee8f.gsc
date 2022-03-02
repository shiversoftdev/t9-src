#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using script_698dd790cdc4965f;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_fc5170d1;

/*
	Name: function_44e65ea3
	Namespace: namespace_fc5170d1
	Checksum: 0xE5E32730
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_44e65ea3()
{
	level notify(2093998870);
}

/*
	Name: function_89f2df9
	Namespace: namespace_fc5170d1
	Checksum: 0xDC9F5FC1
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_388ce832b10c2f83", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fc5170d1
	Checksum: 0x502E1F03
	Offset: 0xF0
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_c2ef6223096d3ca", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_fc5170d1
	Checksum: 0xADE2660E
	Offset: 0x158
	Size: 0x31C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d1de6a85()
{
	weapon_names = array(#"hero_chakram_lv1", #"hero_chakram_lv2", #"hero_chakram_lv3", #"hash_68705e3b85992a56", #"hash_68705d3b859928a3", #"hash_68705c3b859926f0", #"hero_hammer_lv1", #"hero_hammer_lv2", #"hero_hammer_lv3", #"hash_6627879099b8a337", #"hash_6627889099b8a4ea", #"hash_6627899099b8a69d", #"hash_50f35e4cfb775e02", #"hash_50f35d4cfb775c4f", #"hash_50f35c4cfb775a9c", #"hero_sword_pistol_lv1", #"hero_sword_pistol_lv2", #"hero_sword_pistol_lv3", #"hash_65e48a2e69e81a5e", #"hash_65e4892e69e818ab", #"hash_65e4882e69e816f8");
	level.var_3e2ac3b6 = [];
	foreach(weapon_name in weapon_names)
	{
		weapon = getweapon(weapon_name);
		if(isdefined(weapon) && weapon != level.weaponnone)
		{
			level.var_3e2ac3b6[weapon.name] = weapon;
		}
	}
	foreach(player in getplayers())
	{
		player function_6a8979c9();
		player callback::function_33f0ddd3(&function_33f0ddd3);
		player namespace_b22c99a5::function_9bf8e274();
	}
	level zm_trial::function_44200d07(1);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_fc5170d1
	Checksum: 0x3BD279C
	Offset: 0x480
	Size: 0x1B4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player callback::function_824d206(&function_33f0ddd3);
		foreach(weapon in player getweaponslist(1))
		{
			player unlockweapon(weapon);
			if(weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone)
			{
				player unlockweapon(weapon.dualwieldweapon);
			}
		}
		player namespace_b22c99a5::function_73ff0096();
	}
	level.var_3e2ac3b6 = undefined;
	level zm_trial::function_44200d07(0);
}

/*
	Name: is_active
	Namespace: namespace_fc5170d1
	Checksum: 0x51C10A59
	Offset: 0x640
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_c2ef6223096d3ca");
	return isdefined(challenge);
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_fc5170d1
	Checksum: 0x77CB2875
	Offset: 0x680
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
	Namespace: namespace_fc5170d1
	Checksum: 0xE599028
	Offset: 0x6B0
	Size: 0x1C0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6a8979c9()
{
	/#
		assert(isdefined(level.var_3e2ac3b6));
	#/
	foreach(weapon in self getweaponslist(1))
	{
		if(isdefined(level.var_3e2ac3b6[weapon.name]))
		{
			self function_28602a03(weapon);
		}
		else if(!namespace_83dc3729::is_active() || !isarray(level.var_af806901) || !isdefined(level.var_af806901[weapon.name]))
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

