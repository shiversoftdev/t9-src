#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_d46e694c;

/*
	Name: function_89f2df9
	Namespace: namespace_d46e694c
	Checksum: 0xD87B4E7F
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_56fdbf7338674899", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d46e694c
	Checksum: 0x85A1DE31
	Offset: 0xE8
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
	zm_trial::register_challenge(#"hash_6fd9b42462e3c33c", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_d46e694c
	Checksum: 0xCBD452C
	Offset: 0x150
	Size: 0x260
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(n_count, n_repacks)
{
	/#
		assert(isdefined(level.zombie_weapons_upgraded));
	#/
	level.var_ab9d0ec6 = [];
	foreach(weapon in getarraykeys(level.zombie_weapons_upgraded))
	{
		if(weapon != level.weaponnone)
		{
			if(!isdefined(level.var_ab9d0ec6))
			{
				level.var_ab9d0ec6 = [];
			}
			else if(!isarray(level.var_ab9d0ec6))
			{
				level.var_ab9d0ec6 = array(level.var_ab9d0ec6);
			}
			if(!isinarray(level.var_ab9d0ec6, weapon))
			{
				level.var_ab9d0ec6[level.var_ab9d0ec6.size] = weapon;
			}
		}
	}
	self.var_5ba20db5 = zm_trial::function_5769f26a(n_count);
	if(isdefined(n_repacks))
	{
		self.var_5027af68 = zm_trial::function_5769f26a(n_repacks);
	}
	else
	{
		self.var_5027af68 = 0;
	}
	foreach(player in getplayers())
	{
		player thread function_e73fbbf7(self.var_5ba20db5, self.var_5027af68);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_d46e694c
	Checksum: 0x3147BAFD
	Offset: 0x3B8
	Size: 0x25E
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
	}
	/#
		assert(isdefined(level.var_ab9d0ec6));
	#/
	/#
		assert(isdefined(level.var_ab9d0ec6.size > 0));
	#/
	if(!round_reset)
	{
		var_696c3b4 = [];
		foreach(player in getplayers())
		{
			if(player.var_c2490d61 === 0)
			{
				if(!isdefined(var_696c3b4))
				{
					var_696c3b4 = [];
				}
				else if(!isarray(var_696c3b4))
				{
					var_696c3b4 = array(var_696c3b4);
				}
				if(!isinarray(var_696c3b4, player))
				{
					var_696c3b4[var_696c3b4.size] = player;
				}
			}
			player.var_c2490d61 = undefined;
		}
		if(var_696c3b4.size == 1)
		{
			zm_trial::fail(#"hash_753fe45bee19e131", var_696c3b4);
		}
		else if(var_696c3b4.size > 1)
		{
			zm_trial::fail(#"hash_3539a53b7cf9ea2", var_696c3b4);
		}
	}
	self.var_5ba20db5 = undefined;
}

/*
	Name: function_e73fbbf7
	Namespace: namespace_d46e694c
	Checksum: 0xA286629D
	Offset: 0x620
	Size: 0x1D6
	Parameters: 2
	Flags: Private
*/
function private function_e73fbbf7(var_5ba20db5, var_27f8d634)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	self.var_c2490d61 = 0;
	var_fa5d7ea0 = 0;
	while(true)
	{
		self function_46feb36d(var_5ba20db5, var_27f8d634);
		var_f2a06582 = self getcurrentweapon();
		if(self.var_c2490d61)
		{
			if(!var_fa5d7ea0)
			{
				self namespace_b22c99a5::function_63060af4(1);
				var_fa5d7ea0 = 1;
			}
		}
		else
		{
			if(zm_weapons::weapon_supports_aat(var_f2a06582))
			{
				self namespace_b22c99a5::function_63060af4(0);
				self namespace_b22c99a5::function_f3aacffb();
				n_repacks = zm_pap_util::function_83c29ddb(var_f2a06582);
				self namespace_b22c99a5::function_c2cd0cba(var_27f8d634);
				self namespace_b22c99a5::function_2190356a(n_repacks);
				var_fa5d7ea0 = 0;
			}
			else
			{
				if(zm_weapons::is_weapon_upgraded(var_f2a06582))
				{
					self namespace_b22c99a5::function_63060af4(1);
				}
				else
				{
					self namespace_b22c99a5::function_63060af4(0);
				}
				var_fa5d7ea0 = 0;
			}
		}
		self waittill(#"weapon_change_complete");
	}
}

/*
	Name: function_46feb36d
	Namespace: namespace_d46e694c
	Checksum: 0x797A6911
	Offset: 0x800
	Size: 0x15A
	Parameters: 2
	Flags: Private
*/
function private function_46feb36d(var_5ba20db5, var_27f8d634)
{
	if(self.sessionstate != "spectator")
	{
		var_6c114dfb = 0;
		self.var_c2490d61 = 0;
		foreach(weapon in level.var_ab9d0ec6)
		{
			if(self hasweapon(weapon, 1))
			{
				if(zm_weapons::weapon_supports_aat(weapon) && zm_pap_util::function_83c29ddb(weapon) >= var_27f8d634 || (!zm_weapons::weapon_supports_aat(weapon) && zm_weapons::is_weapon_upgraded(weapon)))
				{
					var_6c114dfb++;
				}
			}
		}
		if(var_6c114dfb >= var_5ba20db5)
		{
			self.var_c2490d61 = 1;
		}
	}
}

