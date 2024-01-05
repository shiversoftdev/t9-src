#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_67c87580908a0a00;

#namespace namespace_5a1d6cb0;

/*
	Name: function_bef15a96
	Namespace: namespace_5a1d6cb0
	Checksum: 0xEA2868BE
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bef15a96()
{
	level notify(933294531);
}

#namespace activecamo;

/*
	Name: __init__system__
	Namespace: activecamo
	Checksum: 0x895F032D
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"activecamo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: activecamo
	Checksum: 0x3DBFC5B
	Offset: 0x138
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_loadout(&on_player_loadout);
	callback::on_weapon_change(&on_weapon_change);
	/#
		thread function_265047c1();
	#/
}

/*
	Name: on_weapon_change
	Namespace: activecamo
	Checksum: 0x86F1F447
	Offset: 0x1A0
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function on_weapon_change(params)
{
	if(is_true(level.var_b219667f))
	{
		self function_8d3b94ea(params.weapon, 1);
	}
	else
	{
		self function_8d3b94ea(params.weapon, 0);
	}
	if(isdefined(level.var_3993dc8e))
	{
		self [[level.var_3993dc8e]](params.weapon);
	}
}

/*
	Name: on_player_death
	Namespace: activecamo
	Checksum: 0x861305D
	Offset: 0x248
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_player_death(params)
{
	if(game.state != #"playing")
	{
		return;
	}
	self function_27779784();
}

/*
	Name: function_27779784
	Namespace: activecamo
	Checksum: 0x5276620B
	Offset: 0x290
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_27779784()
{
	if(!isdefined(self) || !isdefined(self.pers) || !isdefined(self.pers[#"activecamo"]))
	{
		return;
	}
	foreach(activecamo in self.pers[#"activecamo"])
	{
		foreach(var_dd54a13b in activecamo.var_dd54a13b)
		{
			activecamo.weapon = var_dd54a13b.weapon;
			activecamo.baseweapon = function_c14cb514(activecamo.weapon);
			self init_stages(activecamo, 0, 1);
		}
	}
}

/*
	Name: on_player_loadout
	Namespace: activecamo
	Checksum: 0xC35A8CB2
	Offset: 0x420
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function on_player_loadout()
{
	self callback::remove_on_death(&on_player_death);
	weapons = self getweaponslist();
	foreach(weapon in weapons)
	{
		self function_8d3b94ea(weapon, 1);
	}
}

/*
	Name: function_8d3b94ea
	Namespace: activecamo
	Checksum: 0x3F27B3AA
	Offset: 0x4F8
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function function_8d3b94ea(weapon, owned, b_has_weapon)
{
	weapon = function_94c2605(weapon);
	var_f4eb4a50 = self function_155299d(weapon, b_has_weapon);
	if(isdefined(var_f4eb4a50))
	{
		self init_activecamo(weapon, var_f4eb4a50, owned);
	}
}

/*
	Name: init_activecamo
	Namespace: activecamo
	Checksum: 0x44F6AF74
	Offset: 0x588
	Size: 0x274
	Parameters: 3
	Flags: Linked
*/
function init_activecamo(weapon, var_f4eb4a50, owned)
{
	if(isdefined(var_f4eb4a50.name))
	{
		if(!isdefined(self.pers[#"activecamo"]))
		{
			self.pers[#"activecamo"] = [];
		}
		if(!isdefined(self.pers[#"activecamo"][var_f4eb4a50.name]))
		{
			self.pers[#"activecamo"][var_f4eb4a50.name] = {};
		}
		activecamo = self.pers[#"activecamo"][var_f4eb4a50.name];
		activecamo.var_13949c61 = function_8a6ced15(var_f4eb4a50);
		/#
			assert(isdefined(activecamo.var_13949c61));
		#/
		activecamo.weapon = weapon;
		activecamo.baseweapon = function_c14cb514(activecamo.weapon);
		if(!isdefined(activecamo.var_dd54a13b))
		{
			activecamo.var_dd54a13b = [];
		}
		if(!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon]))
		{
			activecamo.var_dd54a13b[activecamo.baseweapon] = {};
		}
		activecamo.var_dd54a13b[activecamo.baseweapon].weapon = weapon;
		activecamo.var_dd54a13b[activecamo.baseweapon].stagenum = undefined;
		if(!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].owned))
		{
			activecamo.var_dd54a13b[activecamo.baseweapon].owned = 0;
		}
		activecamo.var_dd54a13b[activecamo.baseweapon].owned = activecamo.var_dd54a13b[activecamo.baseweapon].owned | owned;
		self init_stages(activecamo, 0, 0);
		self callback::on_death(&on_player_death);
	}
}

/*
	Name: function_8a6ced15
	Namespace: activecamo
	Checksum: 0xF1444E36
	Offset: 0x808
	Size: 0x5EA
	Parameters: 1
	Flags: Linked
*/
function function_8a6ced15(var_f4eb4a50)
{
	var_13949c61 = undefined;
	if(isdefined(var_f4eb4a50.name))
	{
		if(!isdefined(level.activecamoinfo))
		{
			level.activecamoinfo = [];
		}
		if(!isdefined(level.activecamoinfo[var_f4eb4a50.name]))
		{
			level.activecamoinfo[var_f4eb4a50.name] = {};
		}
		var_13949c61 = level.activecamoinfo[var_f4eb4a50.name];
		var_13949c61.name = var_f4eb4a50.name;
		var_13949c61.var_e639aa37 = var_f4eb4a50.var_e639aa37;
		var_13949c61.var_cd82182a = var_f4eb4a50.var_cd82182a;
		var_13949c61.var_ed6f91d5 = var_f4eb4a50.var_ed6f91d5;
		var_13949c61.var_bd863267 = var_f4eb4a50.var_bd863267;
		var_13949c61.var_26c1d493 = var_f4eb4a50.var_26c1d493;
		var_13949c61.var_fa0465c6 = var_f4eb4a50.var_fa0465c6;
		var_13949c61.var_2034fabe = var_f4eb4a50.var_2034fabe;
		var_13949c61.var_9ae5a2b8 = var_f4eb4a50.var_9ae5a2b8;
		var_d3daabe = 0;
		if(isdefined(var_f4eb4a50.stages))
		{
			if(!isdefined(var_13949c61.stages))
			{
				var_13949c61.stages = [];
			}
			var_13949c61.var_ae601515 = [];
			foreach(key, var_3594168e in var_f4eb4a50.stages)
			{
				if(is_true(var_3594168e.disabled))
				{
					var_d3daabe++;
					continue;
				}
				if(!isdefined(var_13949c61.stages[key - var_d3daabe]))
				{
					var_13949c61.stages[key - var_d3daabe] = {};
				}
				stage = var_13949c61.stages[key - var_d3daabe];
				if(isdefined(var_3594168e.var_879c8798))
				{
					stage.var_19b6044e = function_8b51d9d1(var_3594168e.var_879c8798);
				}
				/#
					if(!isdefined(stage.var_19b6044e))
					{
						self debug_error(((("" + var_13949c61.name) + "") + function_9e72a96((isdefined(var_3594168e.var_879c8798) ? var_3594168e.var_879c8798 : "")) + "") + key);
					}
					else
					{
						activecamoname = getactivecamo(stage.var_19b6044e);
						var_7216636e = undefined;
						if(isdefined(activecamoname) && activecamoname != #"")
						{
							var_7216636e = getscriptbundle(activecamoname);
						}
						if(!isdefined(var_7216636e))
						{
							self debug_error((((("" + var_13949c61.name) + "") + stage.var_19b6044e) + "") + key);
						}
						else if(!isdefined(var_7216636e.name) || var_7216636e.name != var_13949c61.name)
						{
							self debug_error(((((("" + var_13949c61.name) + "") + stage.var_19b6044e) + "") + (isdefined(var_7216636e.name) ? var_7216636e.name : "") + "") + key);
						}
						activecamoname = undefined;
						var_7216636e = undefined;
					}
				#/
				stage.permanent = var_3594168e.permanent;
				stage.statname = var_3594168e.statname;
				stage.var_d2eac588 = var_3594168e.var_d2eac588;
				stage.var_e2dbd42d = function_54f0afd2(var_3594168e);
				stage.resettimer = (isdefined(var_3594168e.resettimer) ? var_3594168e.resettimer : 0);
				stage.resetnotify = var_3594168e.resetnotify;
				stage.resetondeath = var_3594168e.resetondeath;
				stage.var_825ae630 = var_3594168e.var_c43b3dd3;
				stage.var_c33fcb85 = (isdefined(var_3594168e.var_c33fcb85) ? var_3594168e.var_c33fcb85 : 0);
				if(isdefined(stage.statname))
				{
					if(!isdefined(var_13949c61.var_ae601515[stage.statname]))
					{
						var_13949c61.var_ae601515[stage.statname] = 1;
					}
				}
				if(isdefined(stage.var_d2eac588))
				{
					if(!isdefined(var_13949c61.var_ae601515[stage.var_d2eac588]))
					{
						var_13949c61.var_ae601515[stage.var_d2eac588] = 1;
					}
				}
				/#
					var_1936b16e = getdvarint(#"hash_45e0785aaf2e24af", 0);
					if(var_1936b16e)
					{
						stage.var_e2dbd42d = var_1936b16e;
					}
				#/
			}
		}
	}
	return var_13949c61;
}

/*
	Name: function_37a45562
	Namespace: activecamo
	Checksum: 0x72481627
	Offset: 0xE00
	Size: 0xC2
	Parameters: 2
	Flags: Linked
*/
function function_37a45562(camoindex, activecamo)
{
	foreach(stagenum, stage in activecamo.var_13949c61.stages)
	{
		if(isdefined(stage) && isdefined(stage.var_19b6044e) && stage.var_19b6044e == camoindex)
		{
			return stagenum;
		}
	}
	return undefined;
}

/*
	Name: init_stages
	Namespace: activecamo
	Checksum: 0xCAA6C276
	Offset: 0xED0
	Size: 0x9EC
	Parameters: 3
	Flags: Linked
*/
function init_stages(activecamo, var_3a8a1e00, isdeath)
{
	if(isdefined(activecamo.var_13949c61.stages))
	{
		weaponoptions = self function_ade49959(activecamo.weapon);
		weaponstage = getactivecamostage(weaponoptions);
		camoindex = getcamoindex(weaponoptions);
		camoindexstage = function_37a45562(camoindex, activecamo);
		var_7491ec51 = activecamo.var_dd54a13b[activecamo.baseweapon].owned !== 1;
		if(!var_7491ec51)
		{
			var_7491ec51 = isdefined(camoindexstage);
			if(var_7491ec51)
			{
				weaponstage = camoindexstage;
			}
		}
		if(!isdefined(activecamo.stages))
		{
			activecamo.stages = [];
		}
		foreach(var_62b564ee in activecamo.var_13949c61.stages)
		{
			if(!isdefined(activecamo.stages[stagenum]))
			{
				activecamo.stages[stagenum] = {};
			}
			stage = activecamo.stages[stagenum];
			stage.var_62b564ee = var_62b564ee;
			/#
				assert(isdefined(stage.var_62b564ee));
			#/
			if(!isdefined(stage.var_dd54a13b))
			{
				stage.var_dd54a13b = [];
			}
			if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
			{
				stage.var_dd54a13b[activecamo.baseweapon] = {};
			}
			if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon].statvalue))
			{
				stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
			}
			reset = 0;
			if(var_3a8a1e00)
			{
				stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
				reset = 1;
			}
			else if(isdeath)
			{
				if(is_true(stage.var_62b564ee.var_825ae630) && is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared))
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
				}
				else if(is_true(stage.var_62b564ee.resetondeath) || stage.var_62b564ee.resettimer > 0)
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
					reset = 1;
				}
			}
			if(isdefined(stage.var_62b564ee.var_d2eac588))
			{
				camo_stat = self stats::get_stat_global(stage.var_62b564ee.var_d2eac588);
				if(isdefined(camo_stat) && camo_stat < stage.var_62b564ee.var_e2dbd42d)
				{
					var_7dfd59c3 = (isdefined(stats::function_af5584ca(stage.var_62b564ee.var_d2eac588)) ? stats::function_af5584ca(stage.var_62b564ee.var_d2eac588) : 0);
					if(var_7dfd59c3 > 0)
					{
						camo_stat = stage.var_62b564ee.var_e2dbd42d;
						self stats::set_stat_global(stage.var_62b564ee.var_d2eac588, camo_stat);
						self stats::set_stat_challenge(stage.var_62b564ee.var_d2eac588, camo_stat);
					}
				}
				if(isdefined(camo_stat))
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = camo_stat;
				}
			}
			else if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
			{
				camo_stat = self stats::get_stat_global(stage.var_62b564ee.statname);
				if(isdefined(camo_stat))
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = camo_stat;
				}
			}
			if(!reset && is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared))
			{
				if(is_true(activecamo.var_13949c61.var_cd82182a))
				{
					if(weaponstage > stagenum)
					{
						stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
					}
				}
				if(is_true(activecamo.var_13949c61.var_2034fabe))
				{
					if(isdefined(stage.var_62b564ee.var_d2eac588))
					{
						if(weaponstage > stagenum)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
					else
					{
						if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
						{
							if(weaponstage > stagenum)
							{
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
							}
						}
						else if(weaponstage == stagenum)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
				}
			}
			stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
			if(var_7491ec51)
			{
				if(is_true(activecamo.var_13949c61.var_cd82182a))
				{
					if(weaponstage > stagenum)
					{
						if(isdefined(stage.var_62b564ee.var_d2eac588))
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
						else if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
				}
				if(is_true(activecamo.var_13949c61.var_2034fabe))
				{
					if(isdefined(stage.var_62b564ee.var_d2eac588))
					{
						if(weaponstage > stagenum)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
					else
					{
						if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
						{
							if(weaponstage > stagenum)
							{
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
							}
						}
						else if(weaponstage == stagenum)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
				}
			}
			if(is_true(activecamo.var_13949c61.var_e639aa37))
			{
				self thread function_f0d83504(activecamo, stage, stagenum);
			}
		}
		self function_e44edbd1(activecamo);
	}
}

/*
	Name: function_896ac347
	Namespace: activecamo
	Checksum: 0x6B673DAD
	Offset: 0x18C8
	Size: 0x61C
	Parameters: 3
	Flags: Linked
*/
function function_896ac347(oweapon, statname, value)
{
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(self.pers) || !isdefined(self.pers[#"activecamo"]))
	{
		return;
	}
	if(!isdefined(oweapon))
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return;
	}
	weapon = function_94c2605(oweapon);
	if(!isdefined(weapon))
	{
		/#
			/#
				assertmsg("" + function_9e72a96(oweapon.name));
			#/
		#/
		return;
	}
	activecamoname = self function_b004e227(weapon);
	if(isdefined(activecamoname))
	{
		activecamo = self.pers[#"activecamo"][activecamoname];
		if(isdefined(activecamo))
		{
			if(!isdefined(activecamo.var_13949c61.var_ae601515[statname]))
			{
				return;
			}
			activecamo.weapon = weapon;
			activecamo.baseweapon = function_c14cb514(activecamo.weapon);
			if(!isdefined(activecamo.baseweapon))
			{
				/#
					/#
						assertmsg("" + function_9e72a96(activecamo.weapon.name));
					#/
				#/
				return;
			}
			if(!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon]))
			{
				/#
					/#
						assertmsg(("" + function_9e72a96(activecamo.baseweapon.name)) + "");
					#/
				#/
				return;
			}
			if(isdefined(activecamo.stages))
			{
				var_7a414d4a = 0;
				foreach(stage in activecamo.stages)
				{
					if(is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared))
					{
						continue;
					}
					lastvalue = stage.var_dd54a13b[activecamo.baseweapon].statvalue;
					if(isdefined(stage.var_62b564ee.var_d2eac588) && activecamo.var_dd54a13b[activecamo.baseweapon].owned === 1)
					{
						if(stage.var_62b564ee.statname == statname)
						{
							if(self stats::function_dad108fa(stage.var_62b564ee.var_d2eac588, value))
							{
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = self stats::get_stat_global(stage.var_62b564ee.var_d2eac588);
							}
						}
					}
					else if(isdefined(stage.var_62b564ee.statname))
					{
						if(is_true(activecamo.var_13949c61.var_2034fabe))
						{
							if(!is_true(activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8))
							{
								continue;
							}
						}
						if(is_true(stage.var_62b564ee.permanent) && activecamo.var_dd54a13b[activecamo.baseweapon].owned === 1)
						{
							if(self stats::function_dad108fa(statname, value))
							{
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = self stats::get_stat_global(statname);
							}
						}
						else if(stage.var_62b564ee.statname == statname)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_dd54a13b[activecamo.baseweapon].statvalue + value;
						}
					}
					var_804a253 = stage.var_dd54a13b[activecamo.baseweapon].statvalue > lastvalue;
					if(var_804a253)
					{
						var_7a414d4a = 1;
					}
					if(is_true(activecamo.var_13949c61.var_cd82182a))
					{
						break;
					}
				}
				if(var_7a414d4a)
				{
					self function_b9119037(activecamo);
				}
				if(statname == #"kills")
				{
					self function_e2212969(activecamo, value);
				}
			}
		}
	}
}

/*
	Name: function_e2212969
	Namespace: activecamo
	Checksum: 0xA2834F7D
	Offset: 0x1EF0
	Size: 0x1BA
	Parameters: 2
	Flags: Linked
*/
function function_e2212969(activecamo, value)
{
	if(!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].kills))
	{
		activecamo.var_dd54a13b[activecamo.baseweapon].kills = 0;
	}
	newvalue = activecamo.var_dd54a13b[activecamo.baseweapon].kills + value;
	if(activecamo.var_dd54a13b[activecamo.baseweapon].kills < 5 && newvalue >= 5)
	{
		self function_896ac347(activecamo.weapon, "5th_kill", 1);
	}
	if(activecamo.var_dd54a13b[activecamo.baseweapon].kills < 9 && newvalue >= 9)
	{
		self function_896ac347(activecamo.weapon, "9th_kill", 1);
	}
	if(activecamo.var_dd54a13b[activecamo.baseweapon].kills < 100 && newvalue >= 100)
	{
		self function_896ac347(activecamo.weapon, "100th_kill", 1);
	}
	activecamo.var_dd54a13b[activecamo.baseweapon].kills = newvalue;
}

/*
	Name: function_f0d83504
	Namespace: activecamo
	Checksum: 0x62B5A7AE
	Offset: 0x20B8
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_f0d83504(activecamo, stage, stagenum)
{
	self setactivecamostage(activecamo.weapon, stagenum, 1, is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared));
}

/*
	Name: function_e44edbd1
	Namespace: activecamo
	Checksum: 0xD4B01A0B
	Offset: 0x2130
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_e44edbd1(activecamo)
{
	if(is_true(activecamo.var_13949c61.var_cd82182a))
	{
		var_e92afc26 = 0;
		for(stagenum = activecamo.stages.size - 1; stagenum >= 0; stagenum--)
		{
			stage = activecamo.stages[stagenum];
			if(stage.var_62b564ee.var_e2dbd42d > 0 && stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
			{
				if(var_e92afc26 < stagenum)
				{
					var_e92afc26 = stagenum;
				}
			}
			if(stagenum < var_e92afc26)
			{
				stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
			}
		}
		self function_b9119037(activecamo);
	}
	else if(is_true(activecamo.var_13949c61.var_2034fabe))
	{
		activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = 0;
		self function_b9119037(activecamo);
	}
}

/*
	Name: function_b9119037
	Namespace: activecamo
	Checksum: 0x4F8D3992
	Offset: 0x22C8
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_b9119037(activecamo)
{
	if(!isdefined(activecamo.baseweapon) || !isdefined(activecamo.var_dd54a13b[activecamo.baseweapon]))
	{
		return;
	}
	if(is_true(activecamo.var_13949c61.var_cd82182a))
	{
		self function_5d692cf(activecamo);
	}
	else if(is_true(activecamo.var_13949c61.var_2034fabe))
	{
		self function_8eac065(activecamo);
	}
}

/*
	Name: function_5d692cf
	Namespace: activecamo
	Checksum: 0xE8BBE120
	Offset: 0x2388
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function function_5d692cf(activecamo)
{
	stagenum = 0;
	var_c70461e6 = 0;
	foreach(key, stage in activecamo.stages)
	{
		if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
		{
			continue;
		}
		stagenum = key;
		if(stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
		{
			stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
			if(activecamo.var_13949c61.var_9ae5a2b8 === 1 && stagenum == (activecamo.stages.size - 1))
			{
				var_c70461e6 = 1;
				break;
			}
			continue;
		}
		break;
	}
	if(var_c70461e6 == 1)
	{
		var_2cc4646f = 0;
		foreach(key, stage in activecamo.stages)
		{
			if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
			{
				continue;
			}
			if(!var_2cc4646f)
			{
				if(stage.var_62b564ee.var_c33fcb85 === 1)
				{
					var_2cc4646f = 1;
					stagenum = key;
				}
				else
				{
					continue;
				}
			}
			stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
			stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
		}
		if(var_2cc4646f)
		{
			set_stage_activecamo(activecamo, stagenum);
		}
	}
	else
	{
		weaponoptions = self function_ade49959(activecamo.weapon);
		weaponstage = getactivecamostage(weaponoptions);
		if(weaponstage != stagenum || activecamo.var_dd54a13b[activecamo.baseweapon].stagenum !== stagenum)
		{
			set_stage_activecamo(activecamo, stagenum);
		}
	}
}

/*
	Name: function_8eac065
	Namespace: activecamo
	Checksum: 0x3DA6B404
	Offset: 0x2698
	Size: 0x42C
	Parameters: 1
	Flags: Linked
*/
function function_8eac065(activecamo)
{
	if(!is_true(activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8))
	{
		var_8fc208a8 = 1;
		foreach(stage in activecamo.stages)
		{
			if(isdefined(stage.var_62b564ee.var_d2eac588))
			{
				if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
				{
					continue;
				}
				if(stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
				{
					stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
				}
				if(!is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared))
				{
					var_8fc208a8 = 0;
				}
				continue;
			}
			break;
		}
		if(var_8fc208a8)
		{
			activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = 1;
		}
	}
	var_42d9b149 = 0;
	if(is_true(activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8))
	{
		for(stagenum = activecamo.stages.size - 1; stagenum >= 0; stagenum--)
		{
			stage = activecamo.stages[stagenum];
			if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
			{
				continue;
			}
			if(!is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
			{
				stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
				var_42d9b149 = stagenum;
				break;
			}
		}
		foreach(stage in activecamo.stages)
		{
			if(isdefined(stage.var_62b564ee.var_d2eac588))
			{
				continue;
			}
			if(var_42d9b149 == key)
			{
				continue;
			}
			if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
			{
				continue;
			}
			stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
			stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
		}
	}
	weaponoptions = self function_ade49959(activecamo.weapon);
	weaponstage = getactivecamostage(weaponoptions);
	if(weaponstage != var_42d9b149 || activecamo.var_dd54a13b[activecamo.baseweapon].stagenum !== var_42d9b149)
	{
		set_stage_activecamo(activecamo, var_42d9b149);
	}
}

/*
	Name: set_stage_activecamo
	Namespace: activecamo
	Checksum: 0xE3685B31
	Offset: 0x2AD0
	Size: 0x154
	Parameters: 2
	Flags: Linked
*/
function set_stage_activecamo(activecamo, stagenum)
{
	stage = activecamo.stages[stagenum];
	if(!isdefined(stage))
	{
		return;
	}
	activecamo.var_dd54a13b[activecamo.baseweapon].stagenum = stagenum;
	self setactivecamostage(activecamo.weapon, stagenum);
	if(isdefined(stage.var_62b564ee.var_19b6044e))
	{
		self setcamo(activecamo.weapon, stage.var_62b564ee.var_19b6044e);
	}
	/#
		self debug_print((((("" + activecamo.var_13949c61.name) + "") + stagenum) + "") + (isdefined(stage.var_62b564ee.var_19b6044e) ? stage.var_62b564ee.var_19b6044e : ""));
	#/
	self thread function_a80cb651(activecamo, stagenum);
}

/*
	Name: function_a80cb651
	Namespace: activecamo
	Checksum: 0x21D391A1
	Offset: 0x2C30
	Size: 0x2AC
	Parameters: 2
	Flags: Linked
*/
function function_a80cb651(activecamo, stagenum)
{
	self notify("67ea24a96cc60342");
	self endon("67ea24a96cc60342");
	self endon(#"death");
	stage = activecamo.stages[stagenum];
	weapon = activecamo.weapon;
	baseweapon = function_c14cb514(weapon);
	if(isdefined(stage.var_62b564ee.resetnotify))
	{
		resettime = undefined;
		while(true)
		{
			if(stage.var_62b564ee.resettimer > 0)
			{
				if(!isdefined(resettime))
				{
					resettime = gettime() + stage.var_62b564ee.resettimer;
				}
				waittime = (float(resettime - gettime())) / 1000;
				s_result = undefined;
				s_result = self waittilltimeout(waittime, stage.var_62b564ee.resetnotify);
			}
			else
			{
				s_result = undefined;
				s_result = self waittill(stage.var_62b564ee.resetnotify);
			}
			if(s_result._notify == #"timeout")
			{
				break;
			}
			if(isdefined(s_result.weapon) && baseweapon == s_result.weapon)
			{
				break;
			}
		}
	}
	else
	{
		if(stage.var_62b564ee.resettimer > 0)
		{
			wait(float(stage.var_62b564ee.resettimer) / 1000);
		}
		else
		{
			return;
		}
	}
	if(is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared))
	{
		return;
	}
	stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
	stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
	activecamo.weapon = weapon;
	activecamo.baseweapon = baseweapon;
	self init_stages(activecamo, 1, 0);
}

/*
	Name: function_5aa1d2c8
	Namespace: activecamo
	Checksum: 0x9C2B21F7
	Offset: 0x2EE8
	Size: 0x82
	Parameters: 2
	Flags: Linked
*/
function function_5aa1d2c8(weapon, b_has_weapon)
{
	if(b_has_weapon)
	{
		var_f879230e = self function_8cbd254d(weapon);
	}
	else
	{
		var_f879230e = self function_1744e243(weapon);
	}
	activecamoname = function_ad9499dc(weapon, var_f879230e);
	return activecamoname;
}

/*
	Name: function_155299d
	Namespace: activecamo
	Checksum: 0x964EE2B7
	Offset: 0x2F78
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function function_155299d(weapon, b_has_weapon)
{
	if(!isdefined(b_has_weapon))
	{
		b_has_weapon = 1;
	}
	if(b_has_weapon)
	{
		var_6f2ae9c0 = self function_ade49959(weapon);
	}
	else
	{
		var_6f2ae9c0 = self getbuildkitweaponoptions(weapon);
	}
	var_f4eb4a50 = function_edd6511(var_6f2ae9c0);
	if(isdefined(var_f4eb4a50))
	{
		return var_f4eb4a50;
	}
	activecamoname = self function_5aa1d2c8(weapon, b_has_weapon);
	if(isdefined(activecamoname) && activecamoname != #"")
	{
		var_f4eb4a50 = getscriptbundle(activecamoname);
	}
	return var_f4eb4a50;
}

/*
	Name: function_b004e227
	Namespace: activecamo
	Checksum: 0xC119F8CC
	Offset: 0x3080
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function function_b004e227(weapon, b_has_weapon)
{
	if(!isdefined(b_has_weapon))
	{
		b_has_weapon = 1;
	}
	if(b_has_weapon)
	{
		var_6f2ae9c0 = self function_ade49959(weapon);
	}
	else
	{
		var_6f2ae9c0 = self getbuildkitweaponoptions(weapon);
	}
	activecamoname = function_5af7df72(var_6f2ae9c0);
	if(isdefined(activecamoname) && activecamoname != #"")
	{
		return activecamoname;
	}
	activecamoname = self function_5aa1d2c8(weapon, b_has_weapon);
	return activecamoname;
}

/*
	Name: debug_error
	Namespace: activecamo
	Checksum: 0x143272FA
	Offset: 0x3168
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function debug_error(message, weapon)
{
	/#
		if(getdvarint(#"activecamo_debug", 0) > 0)
		{
			weaponname = "";
			if(isdefined(weapon))
			{
				weaponname = "" + function_9e72a96(weapon.name);
			}
			self iprintlnbold(("" + message) + weaponname);
			println(((("" + self.playername) + "") + message) + weaponname);
		}
	#/
}

/*
	Name: debug_print
	Namespace: activecamo
	Checksum: 0x9ADA39FD
	Offset: 0x3258
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function debug_print(message, weapon)
{
	/#
		if(getdvarint(#"activecamo_debug", 0) > 0)
		{
			weaponname = "";
			if(isdefined(weapon))
			{
				weaponname = "" + function_9e72a96(weapon.name);
			}
			self iprintlnbold(("" + message) + weaponname);
			println(((("" + self.playername) + "") + message) + weaponname);
		}
	#/
}

/*
	Name: function_265047c1
	Namespace: activecamo
	Checksum: 0xDFE45E6B
	Offset: 0x3348
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_265047c1()
{
	/#
		callback::on_connect(&on_player_connect);
		callback::on_disconnect(&on_player_disconnect);
		level.var_630fbd77 = ("" + 30) + "";
		root = "" + level.var_630fbd77;
		function_1039ce5c(root);
		thread devgui_think();
		thread function_12e53b2d();
	#/
}

/*
	Name: on_player_connect
	Namespace: activecamo
	Checksum: 0xB26253BE
	Offset: 0x3418
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	/#
		if(self getentnum() < 4)
		{
			self thread devgui_player_connect();
		}
	#/
}

/*
	Name: on_player_disconnect
	Namespace: activecamo
	Checksum: 0xDDDC5BD8
	Offset: 0x3458
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	/#
		if(self getentnum() < 4)
		{
			self thread devgui_player_disconnect();
		}
	#/
}

/*
	Name: devgui_player_connect
	Namespace: activecamo
	Checksum: 0xD039DD48
	Offset: 0x3498
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function devgui_player_connect()
{
	/#
		if(!isdefined(level.var_630fbd77))
		{
			return;
		}
		wait(2);
		root = level.var_630fbd77 + "";
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] != self)
			{
				continue;
			}
			thread devgui_add_player_commands(root, players[i].playername, i + 1);
			return;
		}
	#/
}

/*
	Name: devgui_player_disconnect
	Namespace: activecamo
	Checksum: 0x5DC97F63
	Offset: 0x3560
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function devgui_player_disconnect()
{
	/#
		if(!isdefined(level.var_630fbd77))
		{
			return;
		}
		root = level.var_630fbd77 + "";
		cmd = (("" + root) + self.playername) + "";
		thread util::add_debug_command(cmd);
	#/
}

/*
	Name: devgui_add_player_commands
	Namespace: activecamo
	Checksum: 0x370DD916
	Offset: 0x35E0
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function devgui_add_player_commands(root, pname, index)
{
	/#
		add_cmd_with_root = (("" + root) + pname) + "";
		function_f1d01720(add_cmd_with_root, index);
		function_85cb822d(add_cmd_with_root, index);
		function_de358bfd(add_cmd_with_root, index);
		function_50d79d31(add_cmd_with_root, index);
	#/
}

/*
	Name: function_1039ce5c
	Namespace: activecamo
	Checksum: 0x66D2B93A
	Offset: 0x3698
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_1039ce5c(root)
{
	/#
		cmd = (root + "") + "";
		thread util::add_debug_command(cmd);
	#/
}

/*
	Name: function_f1d01720
	Namespace: activecamo
	Checksum: 0xD292EAB9
	Offset: 0x36E8
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_f1d01720(root, index)
{
	/#
		var_37949de1 = root;
		if(!isdefined(index))
		{
			index = 0;
		}
		cmd = (((root + "") + "") + index) + "";
		thread util::add_debug_command(cmd);
		cmd = (((root + "") + "") + index) + "";
		thread util::add_debug_command(cmd);
	#/
}

/*
	Name: function_85cb822d
	Namespace: activecamo
	Checksum: 0x4626B75E
	Offset: 0x37B0
	Size: 0x158
	Parameters: 2
	Flags: None
*/
function function_85cb822d(root, index)
{
	/#
		var_37949de1 = root + "";
		if(!isdefined(index))
		{
			index = 0;
		}
		activecamos = function_2c48197b();
		foreach(activecamo in activecamos)
		{
			if(activecamo == #"")
			{
				continue;
			}
			activecamoname = function_9e72a96(activecamo);
			cmd = (((((var_37949de1 + activecamoname) + "") + activecamoname) + "") + index) + "";
			thread util::add_debug_command(cmd);
		}
	#/
}

/*
	Name: function_de358bfd
	Namespace: activecamo
	Checksum: 0x4F5A7B0C
	Offset: 0x3910
	Size: 0x148
	Parameters: 2
	Flags: None
*/
function function_de358bfd(root, index)
{
	/#
		var_1520a1da = root + "";
		if(!isdefined(index))
		{
			index = 0;
		}
		weapons = [];
		weapons[0] = "";
		weapons[1] = "";
		weapons[2] = "";
		weapons[3] = "";
		foreach(weapon in weapons)
		{
			cmd = (((((var_1520a1da + weapon) + "") + weapon) + "") + index) + "";
			thread util::add_debug_command(cmd);
		}
	#/
}

/*
	Name: function_50d79d31
	Namespace: activecamo
	Checksum: 0x4D7EBBCA
	Offset: 0x3A60
	Size: 0x168
	Parameters: 2
	Flags: None
*/
function function_50d79d31(root, index)
{
	/#
		var_82c49718 = root + "";
		if(!isdefined(index))
		{
			index = 0;
		}
		stages = [9:9, 8:8, 7:7, 6:6, 5:5, 4:4, 3:3, 2:2, 1:1, 0:0];
		foreach(stage in stages)
		{
			cmd = (((((var_82c49718 + stage) + "") + stage) + "") + index) + "";
			thread util::add_debug_command(cmd);
		}
	#/
}

/*
	Name: devgui_think
	Namespace: activecamo
	Checksum: 0xC48F20F3
	Offset: 0x3BD0
	Size: 0x330
	Parameters: 0
	Flags: None
*/
function devgui_think()
{
	/#
		self notify("");
		self endon("");
		for(;;)
		{
			wait(0.5);
			reset = 1;
			host = util::gethostplayer();
			switch(getdvarstring(#"hash_3e1bb44a57b02ed8"))
			{
				case 0:
				{
					reset = 0;
					break;
				}
				case "debugprints":
				{
					setdvar(#"activecamo_debug", !getdvarint(#"activecamo_debug", 0));
					break;
				}
				case "reset":
				{
					function_cc5baf7f(&function_58719455);
					break;
				}
				case "stage_next":
				{
					function_cc5baf7f(&function_3ac4d286, 0);
					break;
				}
				case "stage_prev":
				{
					function_cc5baf7f(&function_3ac4d286, 1);
					break;
				}
				case "set_camo":
				{
					function_cc5baf7f(&function_9c361e56, getdvarstring(#"hash_3fe8dd280c325e8"));
					break;
				}
				case "give_weapon":
				{
					function_cc5baf7f(&function_cc486b05, getdvarstring(#"hash_3fe8dd280c325e8"));
					break;
				}
				case "set_stage":
				{
					function_cc5baf7f(&function_779a9561, getdvarstring(#"hash_3fe8dd280c325e8"));
					break;
				}
			}
			if(reset)
			{
				setdvar(#"hash_3e1bb44a57b02ed8", "");
				setdvar(#"hash_3fe8dd280c325e8", "");
				setdvar(#"hash_324a391b56cb100", "");
			}
		}
	#/
}

/*
	Name: function_cc5baf7f
	Namespace: activecamo
	Checksum: 0x1AE4D83B
	Offset: 0x3F08
	Size: 0x152
	Parameters: 2
	Flags: None
*/
function function_cc5baf7f(callback, par)
{
	/#
		pid = getdvarint(#"hash_324a391b56cb100", 0);
		if(pid > 0)
		{
			player = getplayers()[pid - 1];
			if(isdefined(player))
			{
				if(isdefined(par))
				{
					player [[callback]](par);
				}
				else
				{
					player [[callback]]();
				}
			}
		}
		else
		{
			players = getplayers();
			foreach(player in players)
			{
				if(isdefined(par))
				{
					player [[callback]](par);
					continue;
				}
				player [[callback]]();
			}
		}
	#/
}

/*
	Name: function_cc486b05
	Namespace: activecamo
	Checksum: 0xB4A604A5
	Offset: 0x4068
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_cc486b05(weaponname)
{
	/#
		weapon = getweapon(weaponname);
		self giveweapon(weapon);
		self switchtoweapon(weapon);
	#/
}

/*
	Name: function_779a9561
	Namespace: activecamo
	Checksum: 0x4A5AE9B8
	Offset: 0x40D0
	Size: 0x47C
	Parameters: 1
	Flags: None
*/
function function_779a9561(stagenum)
{
	/#
		weapon = self getcurrentweapon();
		weapon = function_94c2605(weapon);
		activecamoname = self function_b004e227(weapon);
		if(isdefined(activecamoname))
		{
			activecamo = self.pers[#"activecamo"][activecamoname];
			if(isdefined(activecamo) && isdefined(activecamo.stages) && stagenum < activecamo.stages.size)
			{
				activecamo.weapon = weapon;
				activecamo.baseweapon = function_c14cb514(activecamo.weapon);
				if(is_true(activecamo.var_13949c61.var_cd82182a))
				{
					foreach(stage in activecamo.stages)
					{
						statcount = 0;
						if(key < stagenum)
						{
							statcount = stage.var_62b564ee.var_e2dbd42d;
						}
						if(isdefined(stage.var_62b564ee.var_d2eac588))
						{
							self stats::set_stat_global(stage.var_62b564ee.var_d2eac588, statcount);
						}
						else if(isdefined(stage.var_62b564ee.statname))
						{
							if(is_true(stage.var_62b564ee.permanent))
							{
								self stats::set_stat_global(stage.var_62b564ee.statname, statcount);
							}
						}
						stage.var_dd54a13b[activecamo.baseweapon].statvalue = statcount;
						stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
					}
				}
				else if(is_true(activecamo.var_13949c61.var_2034fabe))
				{
					activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = undefined;
					foreach(stage in activecamo.stages)
					{
						statcount = 0;
						if(key < stagenum)
						{
							statcount = stage.var_62b564ee.var_e2dbd42d;
						}
						if(isdefined(stage.var_62b564ee.var_d2eac588))
						{
							self stats::set_stat_global(stage.var_62b564ee.var_d2eac588, statcount);
						}
						else if(isdefined(stage.var_62b564ee.statname))
						{
							statcount = 0;
							if(key == stagenum)
							{
								statcount = stage.var_62b564ee.var_e2dbd42d;
							}
							if(is_true(stage.var_62b564ee.permanent))
							{
								self stats::set_stat_global(stage.var_62b564ee.statname, statcount);
							}
						}
						stage.var_dd54a13b[activecamo.baseweapon].statvalue = statcount;
						stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
					}
				}
				self function_b9119037(activecamo);
			}
		}
	#/
}

/*
	Name: function_9c361e56
	Namespace: activecamo
	Checksum: 0x538AA77C
	Offset: 0x4558
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_9c361e56(activecamoname)
{
	/#
		var_f4eb4a50 = getscriptbundle(activecamoname);
		weapon = self getcurrentweapon();
		if(isdefined(var_f4eb4a50))
		{
			self init_activecamo(weapon, var_f4eb4a50, 1);
		}
	#/
}

/*
	Name: function_3ac4d286
	Namespace: activecamo
	Checksum: 0x68D97346
	Offset: 0x45D8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_3ac4d286(back)
{
	/#
		weapon = self getcurrentweapon();
		self function_633fbf17(weapon, back);
	#/
}

/*
	Name: function_633fbf17
	Namespace: activecamo
	Checksum: 0xD1DD2915
	Offset: 0x4630
	Size: 0x1AC
	Parameters: 2
	Flags: None
*/
function function_633fbf17(weapon, back)
{
	/#
		if(isdefined(weapon))
		{
			self function_8d3b94ea(weapon, 1);
			weapon = function_94c2605(weapon);
			activecamoname = self function_b004e227(weapon);
			if(isdefined(activecamoname))
			{
				activecamo = self.pers[#"activecamo"][activecamoname];
				if(isdefined(activecamo))
				{
					if(isdefined(activecamo.stages))
					{
						activecamo.weapon = weapon;
						activecamo.baseweapon = function_c14cb514(activecamo.weapon);
						var_ee939e0c = (isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].stagenum) ? activecamo.var_dd54a13b[activecamo.baseweapon].stagenum : -1);
						if(back)
						{
							nextstage = ((var_ee939e0c - 1) + activecamo.stages.size) % activecamo.stages.size;
						}
						else
						{
							nextstage = (var_ee939e0c + 1) % activecamo.stages.size;
						}
						self function_779a9561(nextstage);
					}
				}
			}
		}
	#/
}

/*
	Name: function_58719455
	Namespace: activecamo
	Checksum: 0x6A1024B5
	Offset: 0x47E8
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_58719455()
{
	/#
		weapon = self getcurrentweapon();
		self function_3d928fb4(weapon);
	#/
}

/*
	Name: function_3d928fb4
	Namespace: activecamo
	Checksum: 0xFC312971
	Offset: 0x4830
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_3d928fb4(weapon)
{
	/#
		if(isdefined(weapon))
		{
			self function_8d3b94ea(weapon, 1);
			weapon = function_94c2605(weapon);
			activecamoname = self function_b004e227(weapon);
			if(isdefined(activecamoname))
			{
				activecamo = self.pers[#"activecamo"][activecamoname];
				if(isdefined(activecamo))
				{
					activecamo.weapon = weapon;
					activecamo.baseweapon = function_c14cb514(activecamo.weapon);
					self function_9fc8a57c(activecamo);
				}
			}
		}
	#/
}

/*
	Name: function_9fc8a57c
	Namespace: activecamo
	Checksum: 0xD9C0D40A
	Offset: 0x4930
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_9fc8a57c(activecamo)
{
	/#
		if(isdefined(activecamo))
		{
			if(isdefined(activecamo.stages))
			{
				foreach(stage in activecamo.stages)
				{
					self function_dc6014e8(stage);
				}
				self init_stages(activecamo, 1, 0);
			}
		}
	#/
}

/*
	Name: function_dc6014e8
	Namespace: activecamo
	Checksum: 0xAA8DE0A
	Offset: 0x4A08
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_dc6014e8(stage)
{
	/#
		if(isdefined(stage.var_62b564ee.var_d2eac588))
		{
			self stats::set_stat_global(stage.var_62b564ee.var_d2eac588, 0);
		}
		else if(isdefined(stage.var_62b564ee.statname))
		{
			if(is_true(stage.var_62b564ee.permanent))
			{
				self stats::set_stat_global(stage.var_62b564ee.statname, 0);
			}
		}
	#/
}

/*
	Name: function_12e53b2d
	Namespace: activecamo
	Checksum: 0x9C8A3866
	Offset: 0x4AD0
	Size: 0x20C
	Parameters: 0
	Flags: None
*/
function function_12e53b2d()
{
	/#
		self notify("");
		self endon("");
		while(true)
		{
			var_f4eb4a50 = undefined;
			waitresult = undefined;
			waitresult = level waittill(#"liveupdate");
			if(!isdefined(level.activecamoinfo))
			{
				continue;
			}
			if(isdefined(waitresult.scriptbundlename))
			{
				var_f4eb4a50 = getscriptbundle(waitresult.scriptbundlename);
				if(!isdefined(var_f4eb4a50.name))
				{
					continue;
				}
				if(!isdefined(level.activecamoinfo[var_f4eb4a50.name]))
				{
					continue;
				}
				players = getplayers();
				foreach(player in players)
				{
					if(!isalive(player))
					{
						continue;
					}
					if(!isdefined(player.pers[#"activecamo"][var_f4eb4a50.name]))
					{
						continue;
					}
					activecamo = player.pers[#"activecamo"][var_f4eb4a50.name];
					if(isdefined(activecamo.weapon))
					{
						player init_activecamo(activecamo.weapon, var_f4eb4a50, 1);
					}
				}
			}
		}
	#/
}

/*
	Name: function_b008f9e9
	Namespace: activecamo
	Checksum: 0x53DC06D4
	Offset: 0x4CE8
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function function_b008f9e9(weapon)
{
	/#
		if(!isdefined(level.activecamoinfo))
		{
			return;
		}
		if(self getcurrentweapon() != weapon)
		{
			self switchtoweapon(weapon);
			self waittilltimeout(2, #"weapon_change");
		}
		foreach(var_13949c61 in level.activecamoinfo)
		{
			var_f4eb4a50 = getscriptbundle(var_13949c61.name);
			self init_activecamo(weapon, var_f4eb4a50, 1);
			waitframe(1);
		}
	#/
}

