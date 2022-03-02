#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_3f9e0dc8454d98e1;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_7519066e;

/*
	Name: function_7548b014
	Namespace: namespace_7519066e
	Checksum: 0x89509D7C
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7548b014()
{
	level notify(1783144320);
}

/*
	Name: function_89f2df9
	Namespace: namespace_7519066e
	Checksum: 0x8D63904E
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5f63e9d9cd6b7fef", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7519066e
	Checksum: 0xC3246C87
	Offset: 0x138
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_3e1f71884b537274", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_7519066e
	Checksum: 0xDF7800BD
	Offset: 0x1A0
	Size: 0x13C
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	callback::function_78ccee50(&function_78ccee50);
	callback::function_33f0ddd3(&function_33f0ddd3);
	callback::function_f77ced93(&namespace_b22c99a5::function_79518194);
	foreach(player in getplayers())
	{
		player thread namespace_b22c99a5::function_bf710271(1, 1, 1, 0, 1);
		player thread namespace_b22c99a5::function_dc9ab223(1, 1);
	}
	level zm_trial::function_25ee130(1);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_7519066e
	Checksum: 0xC46A3F7A
	Offset: 0x2E8
	Size: 0x124
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	callback::function_deba137d(&function_78ccee50);
	callback::function_824d206(&function_33f0ddd3);
	callback::function_5a753d97(&namespace_b22c99a5::function_79518194);
	foreach(player in getplayers())
	{
		player notify(#"hash_1fbfdb0105f48f89");
		player thread namespace_b22c99a5::function_dc0859e();
	}
	level zm_trial::function_25ee130(0);
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_7519066e
	Checksum: 0x8B6E4EAA
	Offset: 0x418
	Size: 0x144
	Parameters: 1
	Flags: Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		if(zm_loadout::is_melee_weapon(s_event.weapon) || zm_loadout::is_lethal_grenade(s_event.weapon) || zm_loadout::is_tactical_grenade(s_event.weapon, 1))
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

/*
	Name: function_78ccee50
	Namespace: namespace_7519066e
	Checksum: 0xAA25A8E4
	Offset: 0x568
	Size: 0x104
	Parameters: 1
	Flags: Private
*/
function private function_78ccee50(params)
{
	self notify("3a8478a97b3babfa");
	self endon("3a8478a97b3babfa");
	self endon(#"disconnect", #"hash_1fbfdb0105f48f89");
	n_clip_size = self function_f09c133d(params.weapon);
	var_2cf11630 = self getweaponammoclip(params.weapon);
	if(n_clip_size > 1 && var_2cf11630 < n_clip_size)
	{
		if(params.weapon.isburstfire)
		{
			while(self isfiring())
			{
				waitframe(1);
			}
		}
		self thread function_29ee24dd(params.weapon);
	}
}

/*
	Name: function_29ee24dd
	Namespace: namespace_7519066e
	Checksum: 0x7573DA81
	Offset: 0x678
	Size: 0x1AC
	Parameters: 1
	Flags: Private
*/
function private function_29ee24dd(weapon)
{
	self endon(#"disconnect");
	self function_28602a03(weapon, 1, 1);
	self namespace_b22c99a5::function_7dbb1712();
	n_clip_ammo = self getweaponammoclip(weapon);
	n_stock_ammo = self getweaponammostock(weapon);
	if(n_stock_ammo > 0)
	{
		while(true)
		{
			var_be17187b = undefined;
			var_be17187b = self waittill(#"reload", #"zmb_max_ammo", #"hash_278526d0bbdb4ce7", #"hash_1fbfdb0105f48f89", #"player_downed", #"death");
			w_current = self getcurrentweapon();
			if(var_be17187b._notify == "reload" && weapon != w_current)
			{
				continue;
			}
			else
			{
				break;
			}
		}
	}
	if(isdefined(self))
	{
		self unlockweapon(weapon);
		self namespace_b22c99a5::function_7dbb1712(1);
	}
}

