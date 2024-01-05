#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_trial_acquire_weapon;

/*
	Name: __init__system__
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xA0CBEC91
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_acquire_weapon", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_acquire_weapon
	Checksum: 0x6398114C
	Offset: 0x198
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
	zm_trial::register_challenge(#"acquire_weapon", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xF656A71C
	Offset: 0x200
	Size: 0x964
	Parameters: 5
	Flags: Private
*/
function private on_begin(weapon_name, var_eaa7f0ba, var_957937ee, var_9c56c5a9, var_b896fe29)
{
	if(isdefined(var_eaa7f0ba))
	{
		self.var_eaa7f0ba = zm_trial::function_5769f26a(var_eaa7f0ba);
	}
	if(weapon_name == #"hero_lv3_weapon")
	{
		var_789e79cc = array(#"hero_chakram_lv3", #"hero_hammer_lv3", #"hero_scepter_lv3", #"hero_sword_pistol_lv3");
		level.var_ab9d0ec6 = [];
		foreach(var_ae209633 in var_789e79cc)
		{
			if(!isdefined(level.var_ab9d0ec6))
			{
				level.var_ab9d0ec6 = [];
			}
			else if(!isarray(level.var_ab9d0ec6))
			{
				level.var_ab9d0ec6 = array(level.var_ab9d0ec6);
			}
			if(!isinarray(level.var_ab9d0ec6, getweapon(var_ae209633)))
			{
				level.var_ab9d0ec6[level.var_ab9d0ec6.size] = getweapon(var_ae209633);
			}
		}
	}
	else
	{
		if(weapon_name == #"upgraded_weapon")
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
		}
		else
		{
			if(weapon_name == #"hash_74285cd06483f6da")
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
				level.var_407e1afc = 1;
			}
			else
			{
				if(weapon_name == #"mansion_primary_weapons")
				{
					level.var_19b2578f = 1;
					level.var_14c8992d = 1;
					level.var_ab9d0ec6 = array(getweapon(#"tr_powersemi_t8"), getweapon(#"ar_accurate_t8"));
				}
				else
				{
					level.var_ab9d0ec6 = array(getweapon(weapon_name));
					if(isdefined(var_957937ee))
					{
						weapon = getweapon(var_957937ee);
						if(!isdefined(level.var_ab9d0ec6))
						{
							level.var_ab9d0ec6 = [];
						}
						else if(!isarray(level.var_ab9d0ec6))
						{
							level.var_ab9d0ec6 = array(level.var_ab9d0ec6);
						}
						level.var_ab9d0ec6[level.var_ab9d0ec6.size] = weapon;
					}
					if(isdefined(var_9c56c5a9))
					{
						weapon = getweapon(var_9c56c5a9);
						if(!isdefined(level.var_ab9d0ec6))
						{
							level.var_ab9d0ec6 = [];
						}
						else if(!isarray(level.var_ab9d0ec6))
						{
							level.var_ab9d0ec6 = array(level.var_ab9d0ec6);
						}
						level.var_ab9d0ec6[level.var_ab9d0ec6.size] = weapon;
					}
					if(isdefined(var_b896fe29))
					{
						weapon = getweapon(var_b896fe29);
						if(!isdefined(level.var_ab9d0ec6))
						{
							level.var_ab9d0ec6 = [];
						}
						else if(!isarray(level.var_ab9d0ec6))
						{
							level.var_ab9d0ec6 = array(level.var_ab9d0ec6);
						}
						level.var_ab9d0ec6[level.var_ab9d0ec6.size] = weapon;
					}
				}
			}
		}
	}
	/#
		/#
			assert(isdefined(level.var_ab9d0ec6), "");
		#/
		foreach(weapon in level.var_ab9d0ec6)
		{
			/#
				assert(isdefined(weapon), "");
			#/
			/#
				assert(weapon != level.weaponnone, "");
			#/
		}
	#/
	if(is_true(self.var_eaa7f0ba))
	{
		level thread function_fa5e5e08();
	}
	else
	{
		foreach(player in getplayers())
		{
			player thread function_e73fbbf7();
		}
	}
	setup_objective(weapon_name, self);
}

/*
	Name: on_end
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xBFC40F6E
	Offset: 0xB70
	Size: 0x406
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
	foreach(player in getplayers())
	{
		player zm_trial_util::function_f3aacffb();
	}
	if(isarray(self.a_n_objective_ids))
	{
		foreach(n_objective_id in self.a_n_objective_ids)
		{
			gameobjects::release_obj_id(n_objective_id);
		}
		self.a_n_objective_ids = undefined;
	}
	/#
		assert(isdefined(level.var_ab9d0ec6));
	#/
	/#
		assert(isdefined(level.var_ab9d0ec6.size > 0));
	#/
	if(!round_reset)
	{
		var_57807cdc = [];
		foreach(player in getplayers())
		{
			/#
				assert(isdefined(player.var_4ced1fcf));
			#/
			if(!player.var_4ced1fcf)
			{
				array::add(var_57807cdc, player, 0);
			}
		}
		if(is_true(self.var_eaa7f0ba))
		{
			if(var_57807cdc.size == getplayers().size)
			{
				if(var_57807cdc.size == 1)
				{
					zm_trial::fail(#"hash_753fe45bee19e131", var_57807cdc);
				}
				else
				{
					zm_trial::fail(#"hash_3539a53b7cf9ea2", var_57807cdc);
				}
			}
		}
		else
		{
			if(var_57807cdc.size == 1)
			{
				zm_trial::fail(#"hash_753fe45bee19e131", var_57807cdc);
			}
			else if(var_57807cdc.size > 1)
			{
				zm_trial::fail(#"hash_3539a53b7cf9ea2", var_57807cdc);
			}
		}
	}
	foreach(player in getplayers())
	{
		player.var_4ced1fcf = undefined;
	}
	level.var_ab9d0ec6 = undefined;
	level.var_407e1afc = undefined;
}

/*
	Name: setup_objective
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xD8A25665
	Offset: 0xF80
	Size: 0x360
	Parameters: 2
	Flags: None
*/
function setup_objective(str_weapon, s_challenge)
{
	var_6cc77d4e = #"hash_423a75e2700a53ab";
	if(str_weapon === "sniper_quickscope_t8_upgraded")
	{
		a_weapons[0] = getweapon("sniper_quickscope_t8");
		s_wallbuy = struct::get("sniper_quickscope_t8", "zombie_weapon_upgrade");
		if(isdefined(s_wallbuy))
		{
			var_fda63ae3[a_weapons[0].name] = s_wallbuy.origin;
		}
		level.var_14c8992d = 1;
	}
	else if(str_weapon === "mansion_primary_weapons")
	{
		a_weapons[0] = getweapon("tr_powersemi_t8");
		a_weapons[1] = getweapon("ar_accurate_t8");
		s_wallbuy = struct::get("tr_powersemi_t8", "zombie_weapon_upgrade");
		if(isdefined(s_wallbuy))
		{
			var_fda63ae3[a_weapons[0].name] = s_wallbuy.origin;
		}
		s_wallbuy = struct::get("ar_accurate_t8", "zombie_weapon_upgrade");
		if(isdefined(s_wallbuy))
		{
			var_fda63ae3[a_weapons[1].name] = s_wallbuy.origin;
		}
	}
	if(isdefined(var_fda63ae3))
	{
		if(!isdefined(var_fda63ae3))
		{
			var_fda63ae3 = [];
		}
		else if(!isarray(var_fda63ae3))
		{
			var_fda63ae3 = array(var_fda63ae3);
		}
		foreach(var_6bb4a364 in var_fda63ae3)
		{
			n_obj_id = gameobjects::get_next_obj_id();
			s_challenge.a_n_objective_ids[var_b35c3e47] = n_obj_id;
			objective_add(n_obj_id, "active", var_6bb4a364, var_6cc77d4e);
			function_6da98133(n_obj_id);
		}
		foreach(player in getplayers())
		{
			player thread monitor_objective(s_challenge, a_weapons);
		}
	}
}

/*
	Name: monitor_objective
	Namespace: zm_trial_acquire_weapon
	Checksum: 0x284E486C
	Offset: 0x12E8
	Size: 0x22A
	Parameters: 2
	Flags: Private
*/
function private monitor_objective(s_challenge, a_weapons)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	foreach(n_objective_id in s_challenge.a_n_objective_ids)
	{
		objective_setinvisibletoplayer(n_objective_id, self);
	}
	wait(12);
	while(true)
	{
		foreach(weapon in a_weapons)
		{
			weapon_upgraded = zm_weapons::get_upgrade_weapon(weapon);
			if(self hasweapon(weapon, 1) || (is_true(level.var_14c8992d) && isdefined(weapon_upgraded) && self hasweapon(weapon_upgraded, 1)))
			{
				objective_setinvisibletoplayer(s_challenge.a_n_objective_ids[weapon.name], self);
				continue;
			}
			objective_setvisibletoplayer(s_challenge.a_n_objective_ids[weapon.name], self);
		}
		waitframe(1);
	}
}

/*
	Name: function_fa5e5e08
	Namespace: zm_trial_acquire_weapon
	Checksum: 0x9D7EFE6B
	Offset: 0x1520
	Size: 0x1BC
	Parameters: 0
	Flags: Private
*/
function private function_fa5e5e08()
{
	level endon(#"hash_7646638df88a3656", #"end_game");
	var_629c4c4a = 0;
	zm_trial_util::function_7d32b7d0(0);
	while(true)
	{
		var_5cb7ddf1 = 0;
		foreach(player in getplayers())
		{
			if(is_true(level.var_19b2578f))
			{
				player function_52f6931d();
			}
			else
			{
				player function_46feb36d();
			}
			if(is_true(player.var_4ced1fcf))
			{
				var_5cb7ddf1++;
			}
		}
		if(var_5cb7ddf1 > 0 && !var_629c4c4a)
		{
			zm_trial_util::function_7d32b7d0(1);
			var_629c4c4a = 1;
		}
		else if(var_5cb7ddf1 == 0 && var_629c4c4a)
		{
			zm_trial_util::function_7d32b7d0(0);
			var_629c4c4a = 0;
		}
		waitframe(1);
	}
}

/*
	Name: function_52f6931d
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xF9589E3D
	Offset: 0x16E8
	Size: 0x152
	Parameters: 0
	Flags: Private
*/
function private function_52f6931d()
{
	if(self.sessionstate != "spectator")
	{
		self.var_4ced1fcf = 0;
		foreach(weapon in level.var_ab9d0ec6)
		{
			if(is_true(level.var_14c8992d))
			{
				weapon_upgraded = zm_weapons::get_upgrade_weapon(weapon);
				if(!self hasweapon(weapon, 1) && isdefined(weapon_upgraded) && !self hasweapon(weapon_upgraded, 1))
				{
					return;
				}
				continue;
			}
			if(!self hasweapon(weapon, 1))
			{
				return;
			}
		}
		self.var_4ced1fcf = 1;
	}
}

/*
	Name: function_46feb36d
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xCBC3E8DC
	Offset: 0x1848
	Size: 0x172
	Parameters: 0
	Flags: Private
*/
function private function_46feb36d()
{
	if(self.sessionstate != "spectator")
	{
		self.var_4ced1fcf = 0;
		foreach(weapon in level.var_ab9d0ec6)
		{
			weapon_upgraded = zm_weapons::get_upgrade_weapon(weapon);
			if(self hasweapon(weapon, 1) || (is_true(level.var_14c8992d) && isdefined(weapon_upgraded) && self hasweapon(weapon_upgraded, 1)))
			{
				if(is_true(level.var_407e1afc))
				{
					if(isdefined(self aat::getaatonweapon(weapon)))
					{
						self.var_4ced1fcf = 1;
					}
					continue;
				}
				self.var_4ced1fcf = 1;
			}
		}
	}
}

/*
	Name: function_e73fbbf7
	Namespace: zm_trial_acquire_weapon
	Checksum: 0xC43E6838
	Offset: 0x19C8
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private function_e73fbbf7()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	self.var_4ced1fcf = 0;
	var_fa5d7ea0 = 0;
	while(true)
	{
		if(is_true(level.var_19b2578f))
		{
			self function_52f6931d();
		}
		else
		{
			self function_46feb36d();
		}
		if(self.var_4ced1fcf)
		{
			if(!var_fa5d7ea0)
			{
				self zm_trial_util::function_63060af4(1);
				var_fa5d7ea0 = 1;
			}
		}
		else
		{
			self zm_trial_util::function_63060af4(0);
			var_fa5d7ea0 = 0;
		}
		waitframe(1);
	}
}

