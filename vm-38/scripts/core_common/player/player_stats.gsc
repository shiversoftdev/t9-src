#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;

#namespace player_stats;

/*
	Name: function_54bca2a1
	Namespace: player_stats
	Checksum: 0xC2B3D174
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_54bca2a1()
{
	level notify(-816101316);
}

#namespace stats;

/*
	Name: function_d92cb558
	Namespace: stats
	Checksum: 0x8FC63E32
	Offset: 0xF0
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_d92cb558(result, vararg)
{
	/#
		if(!isdefined(result))
		{
			pathstr = (ishash(vararg[0]) ? function_9e72a96(vararg[0]) : vararg[0]);
			if(!isdefined(pathstr))
			{
				return;
			}
			for(i = 1; i < vararg.size; i++)
			{
				pathstr = (pathstr + "") + (ishash(vararg[i]) ? function_9e72a96(vararg[i]) : vararg[i]);
			}
			println("" + pathstr);
		}
	#/
}

/*
	Name: function_f94325d3
	Namespace: stats
	Checksum: 0xF65FBBCD
	Offset: 0x200
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_f94325d3()
{
	player = self;
	/#
		assert(isplayer(player), "");
	#/
	if(sessionmodeiscampaigngame())
	{
		return true;
	}
	if(sessionmodeiszombiesgame())
	{
		if(level.gametype === #"doa")
		{
			return true;
		}
	}
	if(isbot(player) || is_true(level.disablestattracking))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ca76d4a
	Namespace: stats
	Checksum: 0x1F804AE3
	Offset: 0x2D8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_ca76d4a()
{
	var_c282197b = gettime() + (int(30 * 1000));
	while(gettime() < var_c282197b)
	{
		if(function_2b9d6412())
		{
			break;
		}
		waitframe(1);
	}
	level.var_87d7c3ab = 1;
}

/*
	Name: function_8921af36
	Namespace: stats
	Checksum: 0x990CE621
	Offset: 0x350
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_8921af36()
{
	return level.var_12323003;
}

/*
	Name: get_stat
	Namespace: stats
	Checksum: 0x22DB158
	Offset: 0x368
	Size: 0xCE
	Parameters: 1
	Flags: Linked, Variadic
*/
function get_stat(...)
{
	/#
		assert(vararg.size > 0);
	#/
	if(vararg.size == 0)
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		result = self readstat(0, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_e3eb9a8b
	Namespace: stats
	Checksum: 0x1C80EC2B
	Offset: 0x440
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_e3eb9a8b(...)
{
	/#
		assert(vararg.size > 0);
	#/
	if(vararg.size == 0)
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		result = self readstat(1, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return result;
}

/*
	Name: function_1bb1c57c
	Namespace: stats
	Checksum: 0xBFDB9815
	Offset: 0x508
	Size: 0xCE
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_1bb1c57c(...)
{
	/#
		assert(vararg.size > 0);
	#/
	if(vararg.size == 0)
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		result = self readstat(2, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_6d50f14b
	Namespace: stats
	Checksum: 0x194DA04B
	Offset: 0x5E0
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_6d50f14b(...)
{
	/#
		assert(vararg.size > 0);
	#/
	if(vararg.size == 0)
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		result = self readstat(3, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return result;
}

/*
	Name: function_ff8f4f17
	Namespace: stats
	Checksum: 0x39D0A0DE
	Offset: 0x6A8
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_ff8f4f17(...)
{
	/#
		assert(vararg.size > 0);
	#/
	if(vararg.size == 0)
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		result = self readstat(4, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return result;
}

/*
	Name: set_stat
	Namespace: stats
	Checksum: 0xB194B2BC
	Offset: 0x770
	Size: 0x16A
	Parameters: 1
	Flags: Linked, Variadic
*/
function set_stat(...)
{
	/#
		assert(!is_true(level.var_87d7c3ab));
	#/
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return 0;
	}
	if(!function_f94325d3())
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		value = vararg[vararg.size - 1];
		arrayremoveindex(vararg, vararg.size - 1);
		result = self writestat(0, vararg, value);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return is_true(result);
}

/*
	Name: function_505387a6
	Namespace: stats
	Checksum: 0x9B4446
	Offset: 0x8E8
	Size: 0x16A
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_505387a6(...)
{
	/#
		assert(!is_true(level.var_87d7c3ab));
	#/
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return 0;
	}
	if(!function_f94325d3())
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		value = vararg[vararg.size - 1];
		arrayremoveindex(vararg, vararg.size - 1);
		result = self writestat(1, vararg, value);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return is_true(result);
}

/*
	Name: inc_stat
	Namespace: stats
	Checksum: 0x1AEC2EE2
	Offset: 0xA60
	Size: 0x18A
	Parameters: 1
	Flags: Linked, Variadic
*/
function inc_stat(...)
{
	/#
		assert(!is_true(level.var_87d7c3ab));
	#/
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return;
	}
	if(!function_f94325d3())
	{
		return;
	}
	player = self;
	/#
		assert(isplayer(player), "");
	#/
	if(!isdefined(player) || !isplayer(player))
	{
		return;
	}
	value = vararg[vararg.size - 1];
	arrayremoveindex(vararg, vararg.size - 1);
	result = player incrementstat(0, vararg, value);
	/#
		function_d92cb558(result, vararg);
	#/
	return is_true(result);
}

/*
	Name: function_f5859f81
	Namespace: stats
	Checksum: 0xD2850F0F
	Offset: 0xBF8
	Size: 0x18A
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_f5859f81(...)
{
	/#
		assert(!is_true(level.var_87d7c3ab));
	#/
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return;
	}
	if(!function_f94325d3())
	{
		return;
	}
	player = self;
	/#
		assert(isplayer(player), "");
	#/
	if(!isdefined(player) || !isplayer(player))
	{
		return;
	}
	value = vararg[vararg.size - 1];
	arrayremoveindex(vararg, vararg.size - 1);
	result = player incrementstat(1, vararg, value);
	/#
		function_d92cb558(result, vararg);
	#/
	return is_true(result);
}

/*
	Name: function_e6106f3b
	Namespace: stats
	Checksum: 0xF15196F1
	Offset: 0xD90
	Size: 0x104
	Parameters: 2
	Flags: Private
*/
function private function_e6106f3b(statname, value)
{
	self set_stat(#"playerstatsbygametype", function_8921af36(), statname, #"statvalue", value);
	self set_stat(#"playerstatsbygametype", function_8921af36(), statname, #"challengevalue", value);
	self set_stat(#"playerstatslist", statname, #"statvalue", value);
	self set_stat(#"playerstatslist", statname, #"challengevalue", value);
}

/*
	Name: function_1d354b96
	Namespace: stats
	Checksum: 0x6BDB934A
	Offset: 0xEA0
	Size: 0x70
	Parameters: 2
	Flags: Private
*/
function private function_1d354b96(statname, value)
{
	var_44becfa9 = self inc_stat(#"playerstatslist", statname, #"statvalue", value);
	self addgametypestat(statname, value);
	return var_44becfa9;
}

/*
	Name: function_ed81f25e
	Namespace: stats
	Checksum: 0xC992D018
	Offset: 0xF18
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_ed81f25e(statname)
{
	return self get_stat(#"playerstatsbygametype", function_8921af36(), statname, #"statvalue");
}

/*
	Name: function_baa25a23
	Namespace: stats
	Checksum: 0x82675D62
	Offset: 0xF78
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function function_baa25a23(statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self set_stat(#"playerstatsbygametype", function_8921af36(), statname, #"statvalue", value);
	return true;
}

/*
	Name: function_d40764f3
	Namespace: stats
	Checksum: 0x479E71A3
	Offset: 0xFF8
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function function_d40764f3(statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self addgametypestat(statname, value);
	return true;
}

/*
	Name: function_cc215323
	Namespace: stats
	Checksum: 0xFB60A814
	Offset: 0x1048
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function function_cc215323(statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"playerstatsbygametype", function_8921af36(), statname, #"statvalue", value);
	return true;
}

/*
	Name: function_a2261724
	Namespace: stats
	Checksum: 0x88BE56E3
	Offset: 0x10C8
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_a2261724(weapon)
{
	statweapon = (isdefined(weapon.statname) ? getweapon(weapon.statname) : undefined);
	return (isdefined(statweapon) ? statweapon : weapon);
}

/*
	Name: function_a431be09
	Namespace: stats
	Checksum: 0xF42BB224
	Offset: 0x1128
	Size: 0x20C
	Parameters: 1
	Flags: Linked
*/
function function_a431be09(weapon)
{
	statweapon = function_a2261724(weapon);
	var_a3884983 = self loadout::function_8435f729(statweapon);
	if(var_a3884983 === "primarygrenade" || var_a3884983 === "secondarygrenade" || var_a3884983 === "specialgrenade")
	{
		weaponname = function_3f64434(statweapon);
		self function_622feb0d(weaponname, #"destructions", 1);
		self function_6fb0b113(weaponname, #"hash_98b8582b08abfa5");
	}
	else
	{
		if(isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](statweapon) && isdefined(level.get_killstreak_for_weapon_for_stats))
		{
			killstreak = [[level.get_killstreak_for_weapon_for_stats]](statweapon);
			if(killstreak === "jetfighter")
			{
				return;
			}
			self function_8fb23f94(killstreak, "destructions", 1);
			self function_b04e7184(killstreak, #"hash_98b8582b08abfa5");
		}
		else
		{
			self function_561716e6(statweapon.name, #"destroyed", 1);
			self function_80099ca1(statweapon.name, #"hash_36be6b672cd9dda3");
		}
	}
}

/*
	Name: function_b2c11cc
	Namespace: stats
	Checksum: 0xC4EFCDFA
	Offset: 0x1340
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_b2c11cc(weapon, statname)
{
	return self get_stat(#"hash_3713686a5fc7b39e", weapon, statname, #"statvalue");
}

/*
	Name: function_53e7d4a5
	Namespace: stats
	Checksum: 0xABDCDC20
	Offset: 0x1390
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function function_53e7d4a5(weapon, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self set_stat(#"hash_3713686a5fc7b39e", weapon, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_561716e6
	Namespace: stats
	Checksum: 0x28F69F87
	Offset: 0x1400
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function function_561716e6(weapon, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"hash_3713686a5fc7b39e", weapon, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_6cdd992f
	Namespace: stats
	Checksum: 0xE697BCE9
	Offset: 0x1470
	Size: 0x78
	Parameters: 3
	Flags: Linked
*/
function function_6cdd992f(weapon, bucket, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"hash_3713686a5fc7b39e", weapon, #"hash_2a1ce63d60556431", bucket, #"statvalue", value);
	return true;
}

/*
	Name: function_328bc34a
	Namespace: stats
	Checksum: 0xE2A41C95
	Offset: 0x14F0
	Size: 0x78
	Parameters: 3
	Flags: Linked
*/
function function_328bc34a(weapon, location, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"hash_3713686a5fc7b39e", weapon, #"hash_5b635080228b9c03", location, #"statvalue", value);
	return true;
}

/*
	Name: function_80099ca1
	Namespace: stats
	Checksum: 0xD91B6133
	Offset: 0x1570
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_80099ca1(weapon, statname)
{
	if(!function_f94325d3())
	{
		return false;
	}
	if(!isdefined(self.pers[#"hash_45ad01f9212e202c"]))
	{
		self.pers[#"hash_45ad01f9212e202c"] = [];
	}
	if(!isdefined(self.pers[#"hash_45ad01f9212e202c"][weapon]))
	{
		self.pers[#"hash_45ad01f9212e202c"][weapon] = [];
	}
	if(!isdefined(self.pers[#"hash_45ad01f9212e202c"][weapon][statname]))
	{
		self.pers[#"hash_45ad01f9212e202c"][weapon][statname] = 0;
	}
	self.pers[#"hash_45ad01f9212e202c"][weapon][statname]++;
	value = self.pers[#"hash_45ad01f9212e202c"][weapon][statname];
	if(value > self function_b2c11cc(weapon, statname))
	{
		self function_53e7d4a5(weapon, statname, value);
		return true;
	}
	return false;
}

/*
	Name: function_97f7728e
	Namespace: stats
	Checksum: 0x701418E2
	Offset: 0x1700
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_97f7728e(equipment, statname)
{
	return self get_stat(#"hash_7a634ccef92080c6", equipment, statname, #"statvalue");
}

/*
	Name: function_3f64434
	Namespace: stats
	Checksum: 0x76FCDDA7
	Offset: 0x1750
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_3f64434(weapon)
{
	weaponname = weapon.name;
	if(weaponname === #"molotov_fire")
	{
		weaponname = #"eq_molotov";
	}
	return weaponname;
}

/*
	Name: function_c8da9a88
	Namespace: stats
	Checksum: 0xC5A42F5E
	Offset: 0x17A8
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function function_c8da9a88(equipment, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self set_stat(#"hash_7a634ccef92080c6", equipment, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_622feb0d
	Namespace: stats
	Checksum: 0x94511345
	Offset: 0x1818
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function function_622feb0d(equipment, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"hash_7a634ccef92080c6", equipment, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_6fb0b113
	Namespace: stats
	Checksum: 0xF579E939
	Offset: 0x1888
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_6fb0b113(equipment, statname)
{
	if(!function_f94325d3())
	{
		return false;
	}
	if(!isdefined(self.pers[#"hash_535ec6a0c26aaa28"]))
	{
		self.pers[#"hash_535ec6a0c26aaa28"] = [];
	}
	if(!isdefined(self.pers[#"hash_535ec6a0c26aaa28"][equipment]))
	{
		self.pers[#"hash_535ec6a0c26aaa28"][equipment] = [];
	}
	if(!isdefined(self.pers[#"hash_535ec6a0c26aaa28"][equipment][statname]))
	{
		self.pers[#"hash_535ec6a0c26aaa28"][equipment][statname] = 0;
	}
	self.pers[#"hash_535ec6a0c26aaa28"][equipment][statname]++;
	value = self.pers[#"hash_535ec6a0c26aaa28"][equipment][statname];
	if(value > self function_97f7728e(equipment, statname))
	{
		self function_c8da9a88(equipment, statname, value);
		return true;
	}
	return false;
}

/*
	Name: function_9792680b
	Namespace: stats
	Checksum: 0x23021A25
	Offset: 0x1A18
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_9792680b(scorestreak, statname)
{
	return self get_stat(#"hash_5d925e2af850ce9e", scorestreak, statname, #"statvalue");
}

/*
	Name: function_1eb9272f
	Namespace: stats
	Checksum: 0x13595C3B
	Offset: 0x1A68
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function function_1eb9272f(scorestreak, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self set_stat(#"hash_5d925e2af850ce9e", scorestreak, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_8fb23f94
	Namespace: stats
	Checksum: 0xF07D390C
	Offset: 0x1AD8
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function function_8fb23f94(scorestreak, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"hash_5d925e2af850ce9e", scorestreak, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_b04e7184
	Namespace: stats
	Checksum: 0xB7AC1E71
	Offset: 0x1B48
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_b04e7184(scorestreak, statname)
{
	if(!function_f94325d3())
	{
		return false;
	}
	if(!isdefined(self.pers[#"hash_5720f063ea8634a8"]))
	{
		self.pers[#"hash_5720f063ea8634a8"] = [];
	}
	if(!isdefined(self.pers[#"hash_5720f063ea8634a8"][scorestreak]))
	{
		self.pers[#"hash_5720f063ea8634a8"][scorestreak] = [];
	}
	if(!isdefined(self.pers[#"hash_5720f063ea8634a8"][scorestreak][statname]))
	{
		self.pers[#"hash_5720f063ea8634a8"][scorestreak][statname] = 0;
	}
	self.pers[#"hash_5720f063ea8634a8"][scorestreak][statname]++;
	value = self.pers[#"hash_5720f063ea8634a8"][scorestreak][statname];
	if(value > self function_9792680b(scorestreak, statname))
	{
		self function_1eb9272f(scorestreak, statname, value);
		return true;
	}
	return false;
}

/*
	Name: function_bd731115
	Namespace: stats
	Checksum: 0x1939D366
	Offset: 0x1CD8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_bd731115(vehicle, statname)
{
	return self get_stat(#"hash_3d466b9663c34ff2", vehicle, statname, #"statvalue");
}

/*
	Name: function_e1c64c80
	Namespace: stats
	Checksum: 0x35A6B009
	Offset: 0x1D28
	Size: 0x68
	Parameters: 3
	Flags: None
*/
function function_e1c64c80(vehicle, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self set_stat(#"hash_3d466b9663c34ff2", vehicle, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_7fd36562
	Namespace: stats
	Checksum: 0xFFBFC175
	Offset: 0x1D98
	Size: 0x68
	Parameters: 3
	Flags: None
*/
function function_7fd36562(vehicle, statname, value)
{
	if(!function_f94325d3())
	{
		return false;
	}
	self inc_stat(#"hash_3d466b9663c34ff2", vehicle, statname, #"statvalue", value);
	return true;
}

/*
	Name: function_7a850245
	Namespace: stats
	Checksum: 0x680F8BBF
	Offset: 0x1E08
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_7a850245(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	return self set_stat(#"afteractionreportstats", statname, value);
}

/*
	Name: function_62b271d8
	Namespace: stats
	Checksum: 0x30C59DE9
	Offset: 0x1E68
	Size: 0x1FC
	Parameters: 2
	Flags: Linked
*/
function function_62b271d8(statname, value)
{
	if(!sessionmodeiswarzonegame())
	{
		return;
	}
	teammates = getplayers(self.team);
	foreach(player in teammates)
	{
		if(!player function_f94325d3())
		{
			continue;
		}
		teammatecount = get_stat(#"afteractionreportstats", #"teammatecount");
		if(!isdefined(teammatecount))
		{
			return;
		}
		playerxuid = int(self getxuid(1));
		for(i = 0; i < teammatecount; i++)
		{
			var_bd8d01a8 = player get_stat(#"afteractionreportstats", #"teammates", i, #"xuid");
			if(var_bd8d01a8 === playerxuid)
			{
				player set_stat(#"afteractionreportstats", #"teammates", i, statname, value);
				break;
			}
		}
	}
}

/*
	Name: function_b7f80d87
	Namespace: stats
	Checksum: 0x8963E0CF
	Offset: 0x2070
	Size: 0x1FC
	Parameters: 2
	Flags: None
*/
function function_b7f80d87(statname, value)
{
	if(!sessionmodeiswarzonegame())
	{
		return;
	}
	teammates = getplayers(self.team);
	foreach(player in teammates)
	{
		if(!player function_f94325d3())
		{
			continue;
		}
		teammatecount = get_stat(#"afteractionreportstats", #"teammatecount");
		if(!isdefined(teammatecount))
		{
			return;
		}
		playerxuid = int(self getxuid(1));
		for(i = 0; i < teammatecount; i++)
		{
			var_bd8d01a8 = player get_stat(#"afteractionreportstats", #"teammates", i, #"xuid");
			if(var_bd8d01a8 === playerxuid)
			{
				player inc_stat(#"afteractionreportstats", #"teammates", i, statname, value);
				break;
			}
		}
	}
}

/*
	Name: function_81f5c0fe
	Namespace: stats
	Checksum: 0x52E3FCC7
	Offset: 0x2278
	Size: 0xCA
	Parameters: 2
	Flags: None
*/
function function_81f5c0fe(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	gametype = level.var_12323003;
	map = util::get_map_name();
	mapstats = (gamemodeisarena() ? #"mapstatsarena" : #"mapstats");
	return self inc_stat(mapstats, map, #"permode", gametype, statname, value);
}

/*
	Name: set_stat_global
	Namespace: stats
	Checksum: 0x6FA47055
	Offset: 0x2350
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function set_stat_global(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	if(sessionmodeiscampaigngame())
	{
		return self function_505387a6(#"playerstatslist", statname, #"statvalue", value);
	}
	return self set_stat(#"playerstatslist", statname, #"statvalue", value);
}

/*
	Name: get_stat_global
	Namespace: stats
	Checksum: 0xF701E727
	Offset: 0x2400
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function get_stat_global(statname)
{
	if(sessionmodeiscampaigngame())
	{
		return self function_e3eb9a8b(#"playerstatslist", statname, #"statvalue");
	}
	return self get_stat(#"playerstatslist", statname, #"statvalue");
}

/*
	Name: set_stat_challenge
	Namespace: stats
	Checksum: 0x275DD698
	Offset: 0x2488
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function set_stat_challenge(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	return self set_stat(#"playerstatslist", statname, #"challengevalue", value);
}

/*
	Name: get_stat_challenge
	Namespace: stats
	Checksum: 0xEDD8E4B1
	Offset: 0x24F0
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function get_stat_challenge(statname)
{
	return self get_stat(#"playerstatslist", statname, #"challengevalue");
}

/*
	Name: function_af5584ca
	Namespace: stats
	Checksum: 0x63F4998D
	Offset: 0x2538
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_af5584ca(statname)
{
	return self get_stat(#"playerstatslist", statname, #"challengetier");
}

/*
	Name: function_8e071909
	Namespace: stats
	Checksum: 0xFE330727
	Offset: 0x2580
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function function_8e071909(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	return self set_stat(#"playerstatslist", statname, #"challengetier", value);
}

/*
	Name: function_878e75b7
	Namespace: stats
	Checksum: 0xE65780F6
	Offset: 0x25E8
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_878e75b7(statname)
{
	return self get_stat(#"playerstatsbygametype", function_8921af36(), statname, #"challengevalue");
}

/*
	Name: function_dad108fa
	Namespace: stats
	Checksum: 0xF6074C99
	Offset: 0x2648
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function function_dad108fa(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	if(sessionmodeiscampaigngame())
	{
		return self function_f5859f81(#"playerstatslist", statname, #"statvalue", value);
	}
	return self inc_stat(#"playerstatslist", statname, #"statvalue", value);
}

/*
	Name: function_bb7eedf0
	Namespace: stats
	Checksum: 0xBD6F4B2F
	Offset: 0x26F8
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_bb7eedf0(statname, value)
{
	setglobal = self function_dad108fa(statname, value);
	return self addgametypestat(statname, value);
}

/*
	Name: function_d0de7686
	Namespace: stats
	Checksum: 0x9DAFBFE7
	Offset: 0x2758
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function function_d0de7686(statname, value, var_4261ca42)
{
	if(getdvarint(var_4261ca42, 0))
	{
		return self function_dad108fa(statname, value);
	}
}

/*
	Name: function_eec52333
	Namespace: stats
	Checksum: 0xA7C82132
	Offset: 0x27B8
	Size: 0x13A
	Parameters: 6
	Flags: Linked
*/
function function_eec52333(weapon, statname, value, classnum, pickedup, var_9ade9f55)
{
	if(sessionmodeiszombiesgame() && level.zm_disable_recording_stats === 1)
	{
		return;
	}
	if(isdefined(level.var_b10e134d))
	{
		[[level.var_b10e134d]](self, weapon, statname, value);
	}
	self addweaponstat(weapon, statname, value, classnum, pickedup, var_9ade9f55);
	switch(statname)
	{
		case "shots":
		case "used":
		{
			self function_f95ea9b6(weapon);
			break;
		}
		case "kills":
		{
			if(weapon.var_ff0b00ba)
			{
				self function_dad108fa(#"kills_equipment", 1);
			}
			break;
		}
	}
}

/*
	Name: function_e24eec31
	Namespace: stats
	Checksum: 0xE51856A9
	Offset: 0x2900
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function function_e24eec31(weapon, statname, value)
{
	self function_eec52333(weapon, statname, value, undefined, undefined, undefined);
}

