#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_trial_weapon_rotation;

/*
	Name: __init__system__
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x4C67D162
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_weapon_rotation", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x5F24EF34
	Offset: 0x148
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
	zm_trial::register_challenge(#"weapon_rotation", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x7CBFE53E
	Offset: 0x1B0
	Size: 0x558
	Parameters: 2
	Flags: Private
*/
function private on_begin(var_44c4c23d, var_bd332e71)
{
	self.var_ea033f4a = [];
	n_interval = zm_trial::function_5769f26a(var_44c4c23d);
	self.var_bd332e71 = zm_trial::function_5769f26a(var_bd332e71);
	self.var_44c4c23d = n_interval;
	callback::on_spawned(&on_player_spawned);
	foreach(weapon in getarraykeys(level.zombie_weapons))
	{
		if(weapon != level.weaponnone && !weapon.isriotshield && !weapon.isgadget && weapon.weapclass != "melee" && !function_873de196(weapon))
		{
			if(!isdefined(self.var_ea033f4a))
			{
				self.var_ea033f4a = [];
			}
			else if(!isarray(self.var_ea033f4a))
			{
				self.var_ea033f4a = array(self.var_ea033f4a);
			}
			if(!isinarray(self.var_ea033f4a, weapon))
			{
				self.var_ea033f4a[self.var_ea033f4a.size] = weapon;
			}
		}
	}
	foreach(weapon in getarraykeys(level.zombie_weapons_upgraded))
	{
		if(weapon != level.weaponnone && !weapon.isriotshield && !function_873de196(weapon))
		{
			if(!isdefined(self.var_ea033f4a))
			{
				self.var_ea033f4a = [];
			}
			else if(!isarray(self.var_ea033f4a))
			{
				self.var_ea033f4a = array(self.var_ea033f4a);
			}
			if(!isinarray(self.var_ea033f4a, weapon))
			{
				self.var_ea033f4a[self.var_ea033f4a.size] = weapon;
			}
		}
	}
	foreach(weapon in getarraykeys(level.zombie_weapons_upgraded))
	{
		if(weapon != level.weaponnone && !weapon.isriotshield && math::cointoss() && !function_873de196(weapon))
		{
			if(!isdefined(self.var_ea033f4a))
			{
				self.var_ea033f4a = [];
			}
			else if(!isarray(self.var_ea033f4a))
			{
				self.var_ea033f4a = array(self.var_ea033f4a);
			}
			self.var_ea033f4a[self.var_ea033f4a.size] = weapon;
		}
	}
	level zm_trial::function_44200d07(1);
	self.var_f0966a0b = [];
	self.var_6b31b86f = [];
	self.var_45de08d7 = [];
	foreach(e_player in getplayers())
	{
		e_player zm_trial_util::function_9bf8e274();
		self.var_f0966a0b[e_player.clientid] = [];
		self thread take_player_weapons(n_interval, e_player);
	}
}

/*
	Name: take_player_weapons
	Namespace: zm_trial_weapon_rotation
	Checksum: 0xC5F02E86
	Offset: 0x710
	Size: 0x314
	Parameters: 2
	Flags: None
*/
function take_player_weapons(n_interval, e_player)
{
	e_player notify(#"hash_c1ae406f049058a");
	e_player endon(#"disconnect", #"hash_c1ae406f049058a");
	level endon(#"hash_7646638df88a3656");
	if(!e_player zm_laststand::laststand_has_players_weapons_returned())
	{
		e_player waittill(#"hash_9b426cce825928d");
	}
	if(is_true(e_player.var_9b0383f5))
	{
		e_player waittill(#"hash_1ac4338b0d419091");
	}
	a_weap = e_player getweaponslistprimaries();
	foreach(weapon in a_weap)
	{
		if(!is_true(e_player.var_a14d2a24))
		{
			if(!isdefined(self.var_f0966a0b[e_player.clientid]))
			{
				self.var_f0966a0b[e_player.clientid] = [];
			}
			else if(!isarray(self.var_f0966a0b[e_player.clientid]))
			{
				self.var_f0966a0b[e_player.clientid] = array(self.var_f0966a0b[e_player.clientid]);
			}
			self.var_f0966a0b[e_player.clientid][self.var_f0966a0b[e_player.clientid].size] = weapon;
			if(isdefined(e_player aat::getaatonweapon(weapon)))
			{
				self.var_6b31b86f[string(e_player.clientid) + weapon.name] = e_player aat::getaatonweapon(weapon);
			}
			self.var_45de08d7[string(e_player.clientid) + weapon.name] = e_player zm_pap_util::function_83c29ddb(weapon);
		}
		e_player takeweapon(weapon);
	}
	e_player.var_a14d2a24 = 1;
	self thread function_413cffae(n_interval, e_player);
}

/*
	Name: function_873de196
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x305AA7C0
	Offset: 0xA30
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_873de196(weapon)
{
	if(weapon.ischargeshot && (!isdefined(weapon.nextchargelevelweapon) || weapon.nextchargelevelweapon == level.weaponnone))
	{
		return true;
	}
	return false;
}

/*
	Name: on_end
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x1701FB00
	Offset: 0xA88
	Size: 0x112
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level zm_trial::function_44200d07(0);
	callback::remove_on_spawned(&on_player_spawned);
	foreach(e_player in level.players)
	{
		if(self.var_bd332e71)
		{
			e_player thread return_weapon(self);
		}
		else
		{
			e_player enableweaponcycling();
		}
		e_player zm_trial_util::function_73ff0096();
		e_player.var_a14d2a24 = undefined;
	}
}

/*
	Name: on_player_spawned
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x2FAD48E6
	Offset: 0xBA8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	s_trial = zm_trial::function_a36e8c38(#"weapon_rotation");
	if(isdefined(s_trial))
	{
		s_trial thread take_player_weapons(s_trial.var_44c4c23d, self);
	}
}

/*
	Name: return_weapon
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x1B4C427
	Offset: 0xC08
	Size: 0x242
	Parameters: 1
	Flags: Private
*/
function private return_weapon(o_trial)
{
	level endon(#"end_game");
	self endon(#"disconnect");
	self function_27cd9d6();
	self val::reset("weapon_rotation", "disable_weapons");
	self enableweaponcycling();
	if(isdefined(self.var_89d523af))
	{
		self takeweapon(self.var_89d523af);
	}
	foreach(weapon in o_trial.var_f0966a0b[self.clientid])
	{
		self zm_weapons::weapon_give(weapon);
		if(isdefined(o_trial.var_6b31b86f[string(self.clientid) + weapon.name]))
		{
			self aat::acquire(weapon, o_trial.var_6b31b86f[string(self.clientid) + weapon.name].name);
		}
		if(o_trial.var_45de08d7[string(self.clientid) + weapon.name] > 0)
		{
			self zm_pap_util::repack_weapon(weapon, o_trial.var_45de08d7[string(self.clientid) + weapon.name]);
		}
	}
	self.var_89d523af = undefined;
}

/*
	Name: function_413cffae
	Namespace: zm_trial_weapon_rotation
	Checksum: 0xD2F5944A
	Offset: 0xE58
	Size: 0x294
	Parameters: 2
	Flags: Private
*/
function private function_413cffae(n_interval, e_player)
{
	e_player notify(#"hash_14795fd12c6dae32");
	level endon(#"hash_7646638df88a3656");
	e_player endon(#"disconnect", #"hash_14795fd12c6dae32");
	while(true)
	{
		e_player function_27cd9d6(0.15);
		do
		{
			weapon = array::random(self.var_ea033f4a);
		}
		while(e_player hasweapon(weapon));
		e_player zm_weapons::weapon_give(weapon);
		e_player.var_89d523af = weapon;
		if(zm_weapons::is_weapon_upgraded(weapon))
		{
			if(math::cointoss())
			{
				if(zm_weapons::weapon_supports_aat(weapon))
				{
					e_player thread aat::acquire(weapon);
					e_player zm_pap_util::repack_weapon(weapon, function_21a3a673(1, 4));
				}
			}
		}
		e_player val::reset("weapon_rotation", "disable_weapons");
		wait(n_interval);
		e_player function_27cd9d6();
		e_player val::set("weapon_rotation", "disable_weapons", 1);
		e_player function_27cd9d6(0.15);
		a_weap = e_player getweaponslistprimaries();
		foreach(weapon in a_weap)
		{
			e_player takeweapon(weapon);
		}
	}
}

/*
	Name: function_579553d8
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x650CB480
	Offset: 0x10F8
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_579553d8(n_interval)
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_7646638df88a3656", #"end_game");
		while(true)
		{
			debug2dtext((8, 400, 0), "" + n_interval, undefined, undefined, undefined, 1);
			waitframe(1);
			n_interval = n_interval - (float(function_60d95f53()) / 1000);
			n_interval = math::clamp(n_interval, 0, 999);
		}
	#/
}

/*
	Name: function_27cd9d6
	Namespace: zm_trial_weapon_rotation
	Checksum: 0x84FA9D80
	Offset: 0x11F8
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function function_27cd9d6(var_41f1a085)
{
	if(!isdefined(var_41f1a085))
	{
		var_41f1a085 = 0;
	}
	self endon(#"disconnect", #"hash_14795fd12c6dae32");
	level endon(#"hash_7646638df88a3656");
	n_time = 0;
	while(!isalive(self) || self laststand::player_is_in_laststand() || self isusingoffhand() || self function_55acff10() || self zm_laststand::is_reviving_any() || n_time < var_41f1a085)
	{
		waitframe(1);
		n_time = n_time + (float(function_60d95f53()) / 1000);
	}
}

