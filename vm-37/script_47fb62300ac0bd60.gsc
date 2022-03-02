#using script_18f0d22c75b141a7;
#using script_7bafaa95bb1b427e;
#using scripts\core_common\util_shared.gsc;

#namespace stats;

/*
	Name: function_d92cb558
	Namespace: stats
	Checksum: 0x513EF4EC
	Offset: 0xD0
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_d92cb558(result, vararg)
{
	/#
		if(!isdefined(result))
		{
			var_2f3fa528 = (function_7a600918(vararg[0]) ? function_9e72a96(vararg[0]) : vararg[0]);
			if(!isdefined(var_2f3fa528))
			{
				return;
			}
			for(i = 1; i < vararg.size; i++)
			{
				var_2f3fa528 = (var_2f3fa528 + "") + (function_7a600918(vararg[i]) ? function_9e72a96(vararg[i]) : vararg[i]);
			}
			println("" + var_2f3fa528);
		}
	#/
}

/*
	Name: function_f94325d3
	Namespace: stats
	Checksum: 0xC704749B
	Offset: 0x1E0
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
	Name: function_8921af36
	Namespace: stats
	Checksum: 0x98A237FC
	Offset: 0x2B8
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
	Checksum: 0xBABBEBC9
	Offset: 0x2D0
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
		result = self function_d0fed49d(0, vararg);
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
	Checksum: 0xA313A811
	Offset: 0x3A8
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
		result = self function_d0fed49d(1, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return result;
}

/*
	Name: function_1bb1c57c
	Namespace: stats
	Checksum: 0x36C51340
	Offset: 0x470
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
		result = self function_d0fed49d(2, vararg);
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
	Checksum: 0x687081B5
	Offset: 0x548
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
		result = self function_d0fed49d(3, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return result;
}

/*
	Name: function_ff8f4f17
	Namespace: stats
	Checksum: 0xAAA3C843
	Offset: 0x610
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
		result = self function_d0fed49d(4, vararg);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return result;
}

/*
	Name: set_stat
	Namespace: stats
	Checksum: 0x62600C84
	Offset: 0x6D8
	Size: 0x13A
	Parameters: 1
	Flags: Linked, Variadic
*/
function set_stat(...)
{
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
		result = self function_e14338da(0, vararg, value);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return is_true(result);
}

/*
	Name: function_505387a6
	Namespace: stats
	Checksum: 0x7BB4B4DC
	Offset: 0x820
	Size: 0x13A
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_505387a6(...)
{
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
		result = self function_e14338da(1, vararg, value);
		/#
			function_d92cb558(result, vararg);
		#/
	}
	return is_true(result);
}

/*
	Name: inc_stat
	Namespace: stats
	Checksum: 0x386ED714
	Offset: 0x968
	Size: 0x15A
	Parameters: 1
	Flags: Linked, Variadic
*/
function inc_stat(...)
{
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
	result = player function_3a535064(0, vararg, value);
	/#
		function_d92cb558(result, vararg);
	#/
	return is_true(result);
}

/*
	Name: function_f5859f81
	Namespace: stats
	Checksum: 0x6F9BB444
	Offset: 0xAD0
	Size: 0x15A
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_f5859f81(...)
{
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
	result = player function_3a535064(1, vararg, value);
	/#
		function_d92cb558(result, vararg);
	#/
	return is_true(result);
}

/*
	Name: function_e6106f3b
	Namespace: stats
	Checksum: 0x11A85C61
	Offset: 0xC38
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
	Checksum: 0x4F44B910
	Offset: 0xD48
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
	Checksum: 0x4743236F
	Offset: 0xDC0
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
	Checksum: 0x5559CE7F
	Offset: 0xE20
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
	Checksum: 0x97CFEFCC
	Offset: 0xEA0
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
	Checksum: 0x1654FDD2
	Offset: 0xEF0
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
	Checksum: 0x76222EBB
	Offset: 0xF70
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
	Checksum: 0xB4EA5A0E
	Offset: 0xFD0
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
	Checksum: 0x76A6A58E
	Offset: 0x11E8
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
	Checksum: 0x819BC024
	Offset: 0x1238
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
	Checksum: 0xD7B6124F
	Offset: 0x12A8
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
	Checksum: 0x86F32475
	Offset: 0x1318
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
	Name: function_80099ca1
	Namespace: stats
	Checksum: 0x92E399C4
	Offset: 0x1398
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
	Checksum: 0xC811801
	Offset: 0x1528
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
	Checksum: 0xBE8B79A
	Offset: 0x1578
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_3f64434(weapon)
{
	weaponname = weapon.name;
	if(weaponname === #"hash_23dd6039fe2f36c6")
	{
		weaponname = #"eq_molotov";
	}
	return weaponname;
}

/*
	Name: function_c8da9a88
	Namespace: stats
	Checksum: 0xD97607E8
	Offset: 0x15D0
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
	Checksum: 0x23B73B2B
	Offset: 0x1640
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
	Checksum: 0x834D1AF1
	Offset: 0x16B0
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
	Checksum: 0xA681A7FF
	Offset: 0x1840
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
	Checksum: 0x8E4CCE06
	Offset: 0x1890
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
	Checksum: 0xEE35A6B9
	Offset: 0x1900
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
	Checksum: 0x6608E31D
	Offset: 0x1970
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
	Checksum: 0x9EDFFC0
	Offset: 0x1B00
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
	Checksum: 0xA144392E
	Offset: 0x1B50
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
	Checksum: 0x6EE0BD24
	Offset: 0x1BC0
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
	Checksum: 0xC10B8CB0
	Offset: 0x1C30
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
	Checksum: 0x38B0EA24
	Offset: 0x1C90
	Size: 0x1FC
	Parameters: 2
	Flags: Linked
*/
function function_62b271d8(statname, value)
{
	if(!function_f99d2668())
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
		var_7606c13d = get_stat(#"afteractionreportstats", #"hash_57b65eb93c6dfe20");
		if(!isdefined(var_7606c13d))
		{
			return;
		}
		playerxuid = int(self getxuid(1));
		for(i = 0; i < var_7606c13d; i++)
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
	Checksum: 0x73C4F5E9
	Offset: 0x1E98
	Size: 0x1FC
	Parameters: 2
	Flags: None
*/
function function_b7f80d87(statname, value)
{
	if(!function_f99d2668())
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
		var_7606c13d = get_stat(#"afteractionreportstats", #"hash_57b65eb93c6dfe20");
		if(!isdefined(var_7606c13d))
		{
			return;
		}
		playerxuid = int(self getxuid(1));
		for(i = 0; i < var_7606c13d; i++)
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
	Checksum: 0x80676424
	Offset: 0x20A0
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
	map = util::function_53bbf9d2();
	var_96e39f1 = (gamemodeisarena() ? #"hash_2935ab25a7444ebf" : #"hash_42205318c6f41220");
	return self inc_stat(var_96e39f1, map, #"hash_1a3dbc08fc5d3627", gametype, statname, value);
}

/*
	Name: function_4db3fba1
	Namespace: stats
	Checksum: 0x7F9DB2C4
	Offset: 0x2178
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function function_4db3fba1(statname, value)
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
	Name: function_441050ca
	Namespace: stats
	Checksum: 0x401CE74F
	Offset: 0x2228
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_441050ca(statname)
{
	if(sessionmodeiscampaigngame())
	{
		return self function_e3eb9a8b(#"playerstatslist", statname, #"statvalue");
	}
	return self get_stat(#"playerstatslist", statname, #"statvalue");
}

/*
	Name: function_efbbc38f
	Namespace: stats
	Checksum: 0x8E2B6365
	Offset: 0x22B0
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function function_efbbc38f(statname, value)
{
	if(!function_f94325d3())
	{
		return 0;
	}
	return self set_stat(#"playerstatslist", statname, #"challengevalue", value);
}

/*
	Name: function_222de31d
	Namespace: stats
	Checksum: 0x87B9E9A9
	Offset: 0x2318
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_222de31d(statname)
{
	return self get_stat(#"playerstatslist", statname, #"challengevalue");
}

/*
	Name: function_af5584ca
	Namespace: stats
	Checksum: 0xD578B50
	Offset: 0x2360
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
	Checksum: 0x555962F0
	Offset: 0x23A8
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
	Checksum: 0x5E67B0FF
	Offset: 0x2410
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
	Checksum: 0xF58660C1
	Offset: 0x2470
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
	Checksum: 0x7F852FAD
	Offset: 0x2520
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_bb7eedf0(statname, value)
{
	var_d9f57650 = self function_dad108fa(statname, value);
	return self addgametypestat(statname, value);
}

/*
	Name: function_d0de7686
	Namespace: stats
	Checksum: 0xDBF64D3B
	Offset: 0x2580
	Size: 0x54
	Parameters: 3
	Flags: None
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
	Checksum: 0x37CAEBD1
	Offset: 0x25E0
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
				self function_dad108fa(#"hash_3e934a4d2ecdedfd", 1);
			}
			break;
		}
	}
}

/*
	Name: function_e24eec31
	Namespace: stats
	Checksum: 0x49EE44BD
	Offset: 0x2728
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function function_e24eec31(weapon, statname, value)
{
	self function_eec52333(weapon, statname, value, undefined, undefined, undefined);
}

