#using script_47fb62300ac0bd60;
#using script_67c87580908a0a00;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace activecamo;

/*
	Name: function_89f2df9
	Namespace: activecamo
	Checksum: 0x5EE69D
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"activecamo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: activecamo
	Checksum: 0xBDA02485
	Offset: 0x118
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_loadout(&on_player_loadout);
	callback::function_f77ced93(&function_f77ced93);
	/#
		thread function_265047c1();
	#/
}

/*
	Name: function_f77ced93
	Namespace: activecamo
	Checksum: 0x71715877
	Offset: 0x180
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_f77ced93(params)
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
	Checksum: 0x72498588
	Offset: 0x228
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
	Checksum: 0x9A252777
	Offset: 0x270
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
			self function_d005b26d(activecamo, 0, 1);
		}
	}
}

/*
	Name: on_player_loadout
	Namespace: activecamo
	Checksum: 0xFD0C2774
	Offset: 0x400
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
	Checksum: 0xE0D3C440
	Offset: 0x4D8
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function function_8d3b94ea(weapon, owned, b_has_weapon)
{
	weapon = function_94c2605(weapon);
	var_f4eb4a50 = function_155299d(weapon, b_has_weapon);
	if(isdefined(var_f4eb4a50))
	{
		self function_6f08b691(weapon, var_f4eb4a50, owned);
	}
}

/*
	Name: function_6f08b691
	Namespace: activecamo
	Checksum: 0x2154BA28
	Offset: 0x560
	Size: 0x274
	Parameters: 3
	Flags: Linked
*/
function function_6f08b691(weapon, var_f4eb4a50, owned)
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
		activecamo.var_dd54a13b[activecamo.baseweapon].var_d1a848d9 = undefined;
		if(!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].owned))
		{
			activecamo.var_dd54a13b[activecamo.baseweapon].owned = 0;
		}
		activecamo.var_dd54a13b[activecamo.baseweapon].owned = activecamo.var_dd54a13b[activecamo.baseweapon].owned | owned;
		self function_d005b26d(activecamo, 0, 0);
		self callback::on_death(&on_player_death);
	}
}

/*
	Name: function_8a6ced15
	Namespace: activecamo
	Checksum: 0x486798B2
	Offset: 0x7E0
	Size: 0x5FA
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
						self function_8530ef96(((("" + var_13949c61.name) + "") + function_9e72a96((isdefined(var_3594168e.var_879c8798) ? var_3594168e.var_879c8798 : "")) + "") + key);
					}
					else
					{
						activecamoname = function_11c873a(stage.var_19b6044e);
						var_7216636e = undefined;
						if(isdefined(activecamoname) && activecamoname != #"")
						{
							var_7216636e = getscriptbundle(activecamoname);
						}
						if(!isdefined(var_7216636e))
						{
							self function_8530ef96((((("" + var_13949c61.name) + "") + stage.var_19b6044e) + "") + key);
						}
						else if(!isdefined(var_7216636e.name) || var_7216636e.name != var_13949c61.name)
						{
							self function_8530ef96(((((("" + var_13949c61.name) + "") + stage.var_19b6044e) + "") + (isdefined(var_7216636e.name) ? var_7216636e.name : "") + "") + key);
						}
						activecamoname = undefined;
						var_7216636e = undefined;
					}
				#/
				stage.permanent = var_3594168e.permanent;
				stage.statname = var_3594168e.statname;
				stage.var_d2eac588 = var_3594168e.var_d2eac588;
				stage.var_e2dbd42d = (isdefined(var_3594168e.var_e2dbd42d) ? var_3594168e.var_e2dbd42d : 0);
				stage.var_bf8f1a70 = (isdefined(var_3594168e.var_bf8f1a70) ? var_3594168e.var_bf8f1a70 : 0);
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
	Checksum: 0x75791EF8
	Offset: 0xDE8
	Size: 0xC2
	Parameters: 2
	Flags: Linked
*/
function function_37a45562(camoindex, activecamo)
{
	foreach(var_d1a848d9, stage in activecamo.var_13949c61.stages)
	{
		if(isdefined(stage) && isdefined(stage.var_19b6044e) && stage.var_19b6044e == camoindex)
		{
			return var_d1a848d9;
		}
	}
	return undefined;
}

/*
	Name: function_d005b26d
	Namespace: activecamo
	Checksum: 0xDD75C6B1
	Offset: 0xEB8
	Size: 0x9EC
	Parameters: 3
	Flags: Linked
*/
function function_d005b26d(activecamo, var_3a8a1e00, isdeath)
{
	if(isdefined(activecamo.var_13949c61.stages))
	{
		weaponoptions = self function_ade49959(activecamo.weapon);
		var_da075c23 = function_5442be13(weaponoptions);
		camoindex = getcamoindex(weaponoptions);
		var_76184e59 = function_37a45562(camoindex, activecamo);
		var_7491ec51 = activecamo.var_dd54a13b[activecamo.baseweapon].owned !== 1;
		if(!var_7491ec51)
		{
			var_7491ec51 = isdefined(var_76184e59);
			if(var_7491ec51)
			{
				var_da075c23 = var_76184e59;
			}
		}
		if(!isdefined(activecamo.stages))
		{
			activecamo.stages = [];
		}
		foreach(var_62b564ee in activecamo.var_13949c61.stages)
		{
			if(!isdefined(activecamo.stages[var_d1a848d9]))
			{
				activecamo.stages[var_d1a848d9] = {};
			}
			stage = activecamo.stages[var_d1a848d9];
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
				else if(is_true(stage.var_62b564ee.resetondeath) || stage.var_62b564ee.var_bf8f1a70 > 0)
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
					reset = 1;
				}
			}
			if(isdefined(stage.var_62b564ee.var_d2eac588))
			{
				var_b4b21bd = self stats::function_441050ca(stage.var_62b564ee.var_d2eac588);
				if(isdefined(var_b4b21bd) && var_b4b21bd < stage.var_62b564ee.var_e2dbd42d)
				{
					var_7dfd59c3 = (isdefined(stats::function_af5584ca(stage.var_62b564ee.var_d2eac588)) ? stats::function_af5584ca(stage.var_62b564ee.var_d2eac588) : 0);
					if(var_7dfd59c3 > 0)
					{
						var_b4b21bd = stage.var_62b564ee.var_e2dbd42d;
						self stats::function_4db3fba1(stage.var_62b564ee.var_d2eac588, var_b4b21bd);
						self stats::function_efbbc38f(stage.var_62b564ee.var_d2eac588, var_b4b21bd);
					}
				}
				if(isdefined(var_b4b21bd))
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = var_b4b21bd;
				}
			}
			else if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
			{
				var_b4b21bd = self stats::function_441050ca(stage.var_62b564ee.statname);
				if(isdefined(var_b4b21bd))
				{
					stage.var_dd54a13b[activecamo.baseweapon].statvalue = var_b4b21bd;
				}
			}
			if(!reset && is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared))
			{
				if(is_true(activecamo.var_13949c61.var_cd82182a))
				{
					if(var_da075c23 > var_d1a848d9)
					{
						stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
					}
				}
				if(is_true(activecamo.var_13949c61.var_2034fabe))
				{
					if(isdefined(stage.var_62b564ee.var_d2eac588))
					{
						if(var_da075c23 > var_d1a848d9)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
					else
					{
						if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
						{
							if(var_da075c23 > var_d1a848d9)
							{
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
							}
						}
						else if(var_da075c23 == var_d1a848d9)
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
					if(var_da075c23 > var_d1a848d9)
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
						if(var_da075c23 > var_d1a848d9)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
					else
					{
						if(is_true(stage.var_62b564ee.permanent) && isdefined(stage.var_62b564ee.statname))
						{
							if(var_da075c23 > var_d1a848d9)
							{
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
							}
						}
						else if(var_da075c23 == var_d1a848d9)
						{
							stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_62b564ee.var_e2dbd42d;
						}
					}
				}
			}
			if(is_true(activecamo.var_13949c61.var_e639aa37))
			{
				self thread function_f0d83504(activecamo, stage, var_d1a848d9);
			}
		}
		self function_e44edbd1(activecamo);
	}
}

/*
	Name: function_896ac347
	Namespace: activecamo
	Checksum: 0x333C8D8
	Offset: 0x18B0
	Size: 0x61C
	Parameters: 3
	Flags: Linked
*/
function function_896ac347(var_8659b480, statname, value)
{
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(self.pers) || !isdefined(self.pers[#"activecamo"]))
	{
		return;
	}
	if(!isdefined(var_8659b480))
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return;
	}
	weapon = function_94c2605(var_8659b480);
	if(!isdefined(weapon))
	{
		/#
			/#
				assertmsg("" + function_9e72a96(var_8659b480.name));
			#/
		#/
		return;
	}
	activecamoname = function_b004e227(weapon);
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
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = self stats::function_441050ca(stage.var_62b564ee.var_d2eac588);
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
								stage.var_dd54a13b[activecamo.baseweapon].statvalue = self stats::function_441050ca(statname);
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
	Checksum: 0xC9808D1B
	Offset: 0x1ED8
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
	Checksum: 0xF1F4ADA
	Offset: 0x20A0
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_f0d83504(activecamo, stage, var_d1a848d9)
{
	self function_a6fc2979(activecamo.weapon, var_d1a848d9, 1, is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared));
}

/*
	Name: function_e44edbd1
	Namespace: activecamo
	Checksum: 0x251B3C42
	Offset: 0x2118
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_e44edbd1(activecamo)
{
	if(is_true(activecamo.var_13949c61.var_cd82182a))
	{
		var_e92afc26 = 0;
		for(var_d1a848d9 = activecamo.stages.size - 1; var_d1a848d9 >= 0; var_d1a848d9--)
		{
			stage = activecamo.stages[var_d1a848d9];
			if(stage.var_62b564ee.var_e2dbd42d > 0 && stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
			{
				if(var_e92afc26 < var_d1a848d9)
				{
					var_e92afc26 = var_d1a848d9;
				}
			}
			if(var_d1a848d9 < var_e92afc26)
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
	Checksum: 0x390BDC5B
	Offset: 0x22B0
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
	Checksum: 0xA105BFF6
	Offset: 0x2370
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function function_5d692cf(activecamo)
{
	var_d1a848d9 = 0;
	var_c70461e6 = 0;
	foreach(key, stage in activecamo.stages)
	{
		if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
		{
			continue;
		}
		var_d1a848d9 = key;
		if(stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
		{
			stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
			if(activecamo.var_13949c61.var_9ae5a2b8 === 1 && var_d1a848d9 == (activecamo.stages.size - 1))
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
					var_d1a848d9 = key;
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
			function_d2f57b97(activecamo, var_d1a848d9);
		}
	}
	else
	{
		weaponoptions = self function_ade49959(activecamo.weapon);
		var_da075c23 = function_5442be13(weaponoptions);
		if(var_da075c23 != var_d1a848d9 || activecamo.var_dd54a13b[activecamo.baseweapon].var_d1a848d9 !== var_d1a848d9)
		{
			function_d2f57b97(activecamo, var_d1a848d9);
		}
	}
}

/*
	Name: function_8eac065
	Namespace: activecamo
	Checksum: 0x5D51BA32
	Offset: 0x2680
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
		for(var_d1a848d9 = activecamo.stages.size - 1; var_d1a848d9 >= 0; var_d1a848d9--)
		{
			stage = activecamo.stages[var_d1a848d9];
			if(!isdefined(stage.var_dd54a13b[activecamo.baseweapon]))
			{
				continue;
			}
			if(!is_true(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.var_62b564ee.var_e2dbd42d)
			{
				stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
				var_42d9b149 = var_d1a848d9;
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
	var_da075c23 = function_5442be13(weaponoptions);
	if(var_da075c23 != var_42d9b149 || activecamo.var_dd54a13b[activecamo.baseweapon].var_d1a848d9 !== var_42d9b149)
	{
		function_d2f57b97(activecamo, var_42d9b149);
	}
}

/*
	Name: function_d2f57b97
	Namespace: activecamo
	Checksum: 0x18DAA324
	Offset: 0x2AB8
	Size: 0x154
	Parameters: 2
	Flags: Linked
*/
function function_d2f57b97(activecamo, var_d1a848d9)
{
	stage = activecamo.stages[var_d1a848d9];
	if(!isdefined(stage))
	{
		return;
	}
	activecamo.var_dd54a13b[activecamo.baseweapon].var_d1a848d9 = var_d1a848d9;
	self function_a6fc2979(activecamo.weapon, var_d1a848d9);
	if(isdefined(stage.var_62b564ee.var_19b6044e))
	{
		self function_bd3cce02(activecamo.weapon, stage.var_62b564ee.var_19b6044e);
	}
	/#
		self debug_print((((("" + activecamo.var_13949c61.name) + "") + var_d1a848d9) + "") + (isdefined(stage.var_62b564ee.var_19b6044e) ? stage.var_62b564ee.var_19b6044e : ""));
	#/
	self thread function_a80cb651(activecamo, var_d1a848d9);
}

/*
	Name: function_a80cb651
	Namespace: activecamo
	Checksum: 0x14B0BFA4
	Offset: 0x2C18
	Size: 0x2AC
	Parameters: 2
	Flags: Linked
*/
function function_a80cb651(activecamo, var_d1a848d9)
{
	self notify("7511883100af680c");
	self endon("7511883100af680c");
	self endon(#"death");
	stage = activecamo.stages[var_d1a848d9];
	weapon = activecamo.weapon;
	baseweapon = function_c14cb514(weapon);
	if(isdefined(stage.var_62b564ee.resetnotify))
	{
		var_5bf85ac5 = undefined;
		while(true)
		{
			if(stage.var_62b564ee.var_bf8f1a70 > 0)
			{
				if(!isdefined(var_5bf85ac5))
				{
					var_5bf85ac5 = gettime() + stage.var_62b564ee.var_bf8f1a70;
				}
				waittime = (float(var_5bf85ac5 - gettime())) / 1000;
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
		if(stage.var_62b564ee.var_bf8f1a70 > 0)
		{
			wait(float(stage.var_62b564ee.var_bf8f1a70) / 1000);
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
	self function_d005b26d(activecamo, 1, 0);
}

/*
	Name: function_155299d
	Namespace: activecamo
	Checksum: 0xB81BBF87
	Offset: 0x2ED0
	Size: 0x9A
	Parameters: 2
	Flags: Linked
*/
function function_155299d(weapon, b_has_weapon)
{
	if(!isdefined(b_has_weapon))
	{
		b_has_weapon = 1;
	}
	var_f4eb4a50 = undefined;
	if(b_has_weapon)
	{
		var_6f2ae9c0 = self function_ade49959(weapon);
	}
	else
	{
		var_6f2ae9c0 = self getbuildkitweaponoptions(weapon);
	}
	var_f4eb4a50 = function_edd6511(var_6f2ae9c0);
	return var_f4eb4a50;
}

/*
	Name: function_b004e227
	Namespace: activecamo
	Checksum: 0xFF8277EB
	Offset: 0x2F78
	Size: 0x9A
	Parameters: 2
	Flags: Linked
*/
function function_b004e227(weapon, b_has_weapon)
{
	if(!isdefined(b_has_weapon))
	{
		b_has_weapon = 1;
	}
	activecamoname = undefined;
	if(b_has_weapon)
	{
		var_6f2ae9c0 = self function_ade49959(weapon);
	}
	else
	{
		var_6f2ae9c0 = self getbuildkitweaponoptions(weapon);
	}
	activecamoname = function_5af7df72(var_6f2ae9c0);
	return activecamoname;
}

/*
	Name: function_8530ef96
	Namespace: activecamo
	Checksum: 0x62F8F379
	Offset: 0x3020
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_8530ef96(message, weapon)
{
	/#
		if(getdvarint(#"hash_518dde27e19a971b", 0) > 0)
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
	Checksum: 0x9EA356D2
	Offset: 0x3110
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function debug_print(message, weapon)
{
	/#
		if(getdvarint(#"hash_518dde27e19a971b", 0) > 0)
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
	Checksum: 0xF4A87866
	Offset: 0x3200
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
	Checksum: 0x273310A4
	Offset: 0x32D0
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
	Checksum: 0xD77CECCB
	Offset: 0x3310
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
	Checksum: 0xD406040F
	Offset: 0x3350
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
	Checksum: 0x2C1DFDC6
	Offset: 0x3418
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
		thread util::function_345e5b9a(cmd);
	#/
}

/*
	Name: devgui_add_player_commands
	Namespace: activecamo
	Checksum: 0xBF0D13B5
	Offset: 0x3498
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
	Checksum: 0xFB072945
	Offset: 0x3550
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_1039ce5c(root)
{
	/#
		cmd = (root + "") + "";
		thread util::function_345e5b9a(cmd);
	#/
}

/*
	Name: function_f1d01720
	Namespace: activecamo
	Checksum: 0xD047C35C
	Offset: 0x35A0
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
		thread util::function_345e5b9a(cmd);
		cmd = (((root + "") + "") + index) + "";
		thread util::function_345e5b9a(cmd);
	#/
}

/*
	Name: function_85cb822d
	Namespace: activecamo
	Checksum: 0x7A0B8EEA
	Offset: 0x3668
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
			thread util::function_345e5b9a(cmd);
		}
	#/
}

/*
	Name: function_de358bfd
	Namespace: activecamo
	Checksum: 0x33F7FAC8
	Offset: 0x37C8
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
			thread util::function_345e5b9a(cmd);
		}
	#/
}

/*
	Name: function_50d79d31
	Namespace: activecamo
	Checksum: 0x6B434A4D
	Offset: 0x3918
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
			thread util::function_345e5b9a(cmd);
		}
	#/
}

/*
	Name: devgui_think
	Namespace: activecamo
	Checksum: 0xD6590564
	Offset: 0x3A88
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
				case "hash_495e6030523ead94":
				{
					setdvar(#"hash_518dde27e19a971b", !getdvarint(#"hash_518dde27e19a971b", 0));
					break;
				}
				case "reset":
				{
					function_cc5baf7f(&function_58719455);
					break;
				}
				case "hash_6985742982f8702b":
				{
					function_cc5baf7f(&function_3ac4d286, 0);
					break;
				}
				case "hash_e0ffa943d37b40b":
				{
					function_cc5baf7f(&function_3ac4d286, 1);
					break;
				}
				case "hash_2f348f94b0a396c4":
				{
					function_cc5baf7f(&function_9c361e56, getdvarstring(#"hash_3fe8dd280c325e8"));
					break;
				}
				case "give_weapon":
				{
					function_cc5baf7f(&function_cc486b05, getdvarstring(#"hash_3fe8dd280c325e8"));
					break;
				}
				case "hash_2f056683aacb9de2":
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
	Checksum: 0x41A05B4C
	Offset: 0x3DC0
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
	Checksum: 0x75312BF0
	Offset: 0x3F20
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
	Checksum: 0x98E1D8D8
	Offset: 0x3F88
	Size: 0x47C
	Parameters: 1
	Flags: None
*/
function function_779a9561(var_d1a848d9)
{
	/#
		weapon = self getcurrentweapon();
		weapon = function_94c2605(weapon);
		activecamoname = function_b004e227(weapon);
		if(isdefined(activecamoname))
		{
			activecamo = self.pers[#"activecamo"][activecamoname];
			if(isdefined(activecamo) && isdefined(activecamo.stages) && var_d1a848d9 < activecamo.stages.size)
			{
				activecamo.weapon = weapon;
				activecamo.baseweapon = function_c14cb514(activecamo.weapon);
				if(is_true(activecamo.var_13949c61.var_cd82182a))
				{
					foreach(stage in activecamo.stages)
					{
						var_33bbde4f = 0;
						if(key < var_d1a848d9)
						{
							var_33bbde4f = stage.var_62b564ee.var_e2dbd42d;
						}
						if(isdefined(stage.var_62b564ee.var_d2eac588))
						{
							self stats::function_4db3fba1(stage.var_62b564ee.var_d2eac588, var_33bbde4f);
						}
						else if(isdefined(stage.var_62b564ee.statname))
						{
							if(is_true(stage.var_62b564ee.permanent))
							{
								self stats::function_4db3fba1(stage.var_62b564ee.statname, var_33bbde4f);
							}
						}
						stage.var_dd54a13b[activecamo.baseweapon].statvalue = var_33bbde4f;
						stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
					}
				}
				else if(is_true(activecamo.var_13949c61.var_2034fabe))
				{
					activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = undefined;
					foreach(stage in activecamo.stages)
					{
						var_33bbde4f = 0;
						if(key < var_d1a848d9)
						{
							var_33bbde4f = stage.var_62b564ee.var_e2dbd42d;
						}
						if(isdefined(stage.var_62b564ee.var_d2eac588))
						{
							self stats::function_4db3fba1(stage.var_62b564ee.var_d2eac588, var_33bbde4f);
						}
						else if(isdefined(stage.var_62b564ee.statname))
						{
							var_33bbde4f = 0;
							if(key == var_d1a848d9)
							{
								var_33bbde4f = stage.var_62b564ee.var_e2dbd42d;
							}
							if(is_true(stage.var_62b564ee.permanent))
							{
								self stats::function_4db3fba1(stage.var_62b564ee.statname, var_33bbde4f);
							}
						}
						stage.var_dd54a13b[activecamo.baseweapon].statvalue = var_33bbde4f;
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
	Checksum: 0x1EB084E0
	Offset: 0x4410
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
			self function_6f08b691(weapon, var_f4eb4a50, 1);
		}
	#/
}

/*
	Name: function_3ac4d286
	Namespace: activecamo
	Checksum: 0xFBEF3F82
	Offset: 0x4490
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
	Checksum: 0xF3503FE7
	Offset: 0x44E8
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
			activecamoname = function_b004e227(weapon);
			if(isdefined(activecamoname))
			{
				activecamo = self.pers[#"activecamo"][activecamoname];
				if(isdefined(activecamo))
				{
					if(isdefined(activecamo.stages))
					{
						activecamo.weapon = weapon;
						activecamo.baseweapon = function_c14cb514(activecamo.weapon);
						var_ee939e0c = (isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].var_d1a848d9) ? activecamo.var_dd54a13b[activecamo.baseweapon].var_d1a848d9 : -1);
						if(back)
						{
							var_632b0128 = ((var_ee939e0c - 1) + activecamo.stages.size) % activecamo.stages.size;
						}
						else
						{
							var_632b0128 = (var_ee939e0c + 1) % activecamo.stages.size;
						}
						self function_779a9561(var_632b0128);
					}
				}
			}
		}
	#/
}

/*
	Name: function_58719455
	Namespace: activecamo
	Checksum: 0x816F439
	Offset: 0x46A0
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
	Checksum: 0x9A1185C6
	Offset: 0x46E8
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
			activecamoname = function_b004e227(weapon);
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
	Checksum: 0x2EF10EF7
	Offset: 0x47E8
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
				self function_d005b26d(activecamo, 1, 0);
			}
		}
	#/
}

/*
	Name: function_dc6014e8
	Namespace: activecamo
	Checksum: 0x707CF817
	Offset: 0x48C0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_dc6014e8(stage)
{
	/#
		if(isdefined(stage.var_62b564ee.var_d2eac588))
		{
			self stats::function_4db3fba1(stage.var_62b564ee.var_d2eac588, 0);
		}
		else if(isdefined(stage.var_62b564ee.statname))
		{
			if(is_true(stage.var_62b564ee.permanent))
			{
				self stats::function_4db3fba1(stage.var_62b564ee.statname, 0);
			}
		}
	#/
}

/*
	Name: function_12e53b2d
	Namespace: activecamo
	Checksum: 0x4E6B916D
	Offset: 0x4988
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
						player function_6f08b691(activecamo.weapon, var_f4eb4a50, 1);
					}
				}
			}
		}
	#/
}

/*
	Name: function_b008f9e9
	Namespace: activecamo
	Checksum: 0x47E30311
	Offset: 0x4BA0
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
			self function_6f08b691(weapon, var_f4eb4a50, 1);
			waitframe(1);
		}
	#/
}

