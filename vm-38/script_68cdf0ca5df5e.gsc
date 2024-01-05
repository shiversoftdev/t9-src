#using script_5133d88c555e460;
#using script_36fc02e86719d0f5;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_3bbf85ab4cb9f3c2;
#using script_40f967ad5d18ea74;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_634ae70c663d1cc9;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_5549681e1669c11a;
#using script_f38dc50f0e82277;
#using script_413ab8fe25a61c50;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

class class_f4bf8a8 
{
	var var_961441d1;
	var var_af599afa;
	var var_622da539;
	var var_7c7691d6;
	var var_74297693;
	var m_name;
	var var_5d3a1;
	var var_63f7cb8f;
	var var_73c16a24;
	var var_a1fa7529;
	var var_79baa471;
	var var_486c1553;
	var var_b198ac5a;
	var var_36f9408;
	var maxs;
	var origin;
	var var_c0023851;
	var var_35760f46;
	var var_60821378;
	var var_73ab8b47;
	var var_be31d6d6;
	var var_b60ab5fd;
	var var_613b7253;
	var var_5e72455f;
	var var_9cd25248;
	var script_noteworthy;
	var var_2e06f9d4;
	var var_694b395b;
	var var_e2a6dd61;
	var var_5479b5f3;
	var var_81e9b5ca;
	var var_24df6bfb;
	var var_bedb7d90;
	var script_int;
	var script_parameters;
	var angles;
	var var_80292cd;

	/*
		Name: constructor
		Namespace: namespace_f4bf8a8
		Checksum: 0xBB0B39D8
		Offset: 0xC70
		Size: 0xB6
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self.var_81e9b5ca = [];
		self.var_c0023851 = undefined;
		self.var_73ab8b47 = [];
		self.var_486c1553 = undefined;
		self.var_622da539 = undefined;
		self.var_9cd25248 = undefined;
		self.var_2e06f9d4 = 1;
		self.var_961441d1 = 1;
		self.var_24df6bfb = 28;
		self.var_e2a6dd61 = [];
		self.var_5d3a1 = [];
		self.var_bedb7d90 = 5;
		self.var_5e72455f = 10;
		self.var_35760f46 = 0;
		self.var_60821378 = 3;
	}

	/*
		Name: destructor
		Namespace: namespace_f4bf8a8
		Checksum: 0xDFB6BE74
		Offset: 0xD30
		Size: 0x98
		Parameters: 0
		Flags: 128
	*/
	destructor()
	{
		foreach(exit in var_b198ac5a)
		{
			if(isdefined(exit.fakemodel))
			{
				exit.fakemodel delete();
			}
		}
	}

	/*
		Name: function_806bba
		Namespace: namespace_f4bf8a8
		Checksum: 0x65FAE75E
		Offset: 0x1F28
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_806bba()
	{
		return var_961441d1;
	}

	/*
		Name: function_1f47a68
		Namespace: namespace_f4bf8a8
		Checksum: 0x257D0D77
		Offset: 0x1F00
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_1f47a68(val)
	{
		self.var_961441d1 = val;
	}

	/*
		Name: function_ffcf1d1
		Namespace: namespace_f4bf8a8
		Checksum: 0x8416B2CB
		Offset: 0x1B20
		Size: 0x12
		Parameters: 0
		Flags: None
	*/
	function function_ffcf1d1()
	{
		return var_af599afa.origin;
	}

	/*
		Name: function_14b480d1
		Namespace: namespace_f4bf8a8
		Checksum: 0x52533082
		Offset: 0x1E68
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_14b480d1()
	{
		return var_622da539;
	}

	/*
		Name: function_19a90502
		Namespace: namespace_f4bf8a8
		Checksum: 0x145BBAD7
		Offset: 0x1F90
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_19a90502(val)
	{
		self.var_60821378 = val;
	}

	/*
		Name: ispaused
		Namespace: namespace_f4bf8a8
		Checksum: 0xEB1D610E
		Offset: 0x1D90
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function ispaused()
	{
		return var_7c7691d6;
	}

	/*
		Name: function_1e4d7a0c
		Namespace: namespace_f4bf8a8
		Checksum: 0x1DC9027E
		Offset: 0x2158
		Size: 0x1A8
		Parameters: 1
		Flags: None
	*/
	function function_1e4d7a0c(var_4983b208)
	{
		function_e87bab7b(var_4983b208);
		foreach(spot in var_74297693)
		{
			if(isdefined(spot.mdl))
			{
				continue;
			}
			if((spot.var_4983b208 & var_4983b208) == 0)
			{
				continue;
			}
			spot.mdl = namespace_ec06fe4a::function_e22ae9b3(spot.origin, spot.modelname, spot.angles, m_name + "_decor_item");
			if(isdefined(spot.mdl))
			{
				spot.mdl setscale(spot.scale);
				if(is_true(spot.var_bfbc537c))
				{
					spot.mdl disconnectpaths();
					spot.mdl solid();
					continue;
				}
				spot.mdl notsolid();
			}
		}
	}

	/*
		Name: function_20b2a1e4
		Namespace: namespace_f4bf8a8
		Checksum: 0x1AC0FDA0
		Offset: 0x33A0
		Size: 0xA0
		Parameters: 1
		Flags: None
	*/
	function function_20b2a1e4(mask)
	{
		self endon(#"deactivate");
		while(true)
		{
			if(level.doa.var_ecff3871)
			{
				self triggerenable((mask & 2) != 0);
			}
			else
			{
				self triggerenable((mask & 1) != 0);
			}
			level waittill(#"hash_180d4d3b6b7ea3f3");
		}
	}

	/*
		Name: function_20b4ef55
		Namespace: namespace_f4bf8a8
		Checksum: 0xA545EFE5
		Offset: 0x3BB0
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_20b4ef55(side)
	{
		return var_5d3a1[side].size;
	}

	/*
		Name: function_21d1be3d
		Namespace: namespace_f4bf8a8
		Checksum: 0xBF49A98D
		Offset: 0x1CD0
		Size: 0x7A
		Parameters: 1
		Flags: None
	*/
	function function_21d1be3d(side)
	{
		/#
			assert(isdefined(var_63f7cb8f[side]), (("" + side) + "") + m_name);
		#/
		return var_63f7cb8f[side][randomint(var_63f7cb8f[side].size)];
	}

	/*
		Name: function_23476287
		Namespace: namespace_f4bf8a8
		Checksum: 0x21540B33
		Offset: 0x1C20
		Size: 0xA2
		Parameters: 2
		Flags: None
	*/
	function function_23476287(idx, side)
	{
		/#
			assert(isdefined(var_73c16a24[side]), (("" + side) + "") + m_name);
		#/
		/#
			assert(idx < var_73c16a24.size, (("" + side) + "") + m_name);
		#/
		return var_73c16a24[side][idx];
	}

	/*
		Name: function_242886d5
		Namespace: namespace_f4bf8a8
		Checksum: 0x993F5769
		Offset: 0x2560
		Size: 0xC0
		Parameters: 1
		Flags: None
	*/
	function function_242886d5(type)
	{
		if(!isdefined(type))
		{
			return var_a1fa7529;
		}
		hazards = [];
		foreach(hazard in var_a1fa7529)
		{
			if(hazard.script_noteworthy === type)
			{
				hazards[hazards.size] = hazard;
			}
		}
		return hazards;
	}

	/*
		Name: function_25962665
		Namespace: namespace_f4bf8a8
		Checksum: 0xF11F05A3
		Offset: 0x3A60
		Size: 0xC6
		Parameters: 1
		Flags: None
	*/
	function function_25962665(wave)
	{
		if(!isdefined(var_5d3a1[wave.spawn_side]))
		{
			self.var_5d3a1[wave.spawn_side] = [];
		}
		else if(!isarray(var_5d3a1[wave.spawn_side]))
		{
			self.var_5d3a1[wave.spawn_side] = array(var_5d3a1[wave.spawn_side]);
		}
		self.var_5d3a1[wave.spawn_side][var_5d3a1[wave.spawn_side].size] = wave;
	}

	/*
		Name: getname
		Namespace: namespace_f4bf8a8
		Checksum: 0xA201D971
		Offset: 0x1AC0
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function getname()
	{
		return m_name;
	}

	/*
		Name: getcenter
		Namespace: namespace_f4bf8a8
		Checksum: 0xA0C4EDE5
		Offset: 0x1B08
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function getcenter()
	{
		return var_af599afa;
	}

	/*
		Name: function_3476ff6d
		Namespace: namespace_f4bf8a8
		Checksum: 0x5CA1C04
		Offset: 0x1B78
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_3476ff6d()
	{
		return var_79baa471;
	}

	/*
		Name: function_3bf5b85d
		Namespace: namespace_f4bf8a8
		Checksum: 0x9F0F7D9E
		Offset: 0x1DF8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_3bf5b85d()
	{
		return var_486c1553;
	}

	/*
		Name: function_3e91f789
		Namespace: namespace_f4bf8a8
		Checksum: 0x2F48853B
		Offset: 0x1E80
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_3e91f789(val)
	{
		self.var_9cd25248 = val;
	}

	/*
		Name: initialize
		Namespace: namespace_f4bf8a8
		Checksum: 0xAE5A7640
		Offset: 0xDD0
		Size: 0xCE4
		Parameters: 2
		Flags: None
	*/
	function initialize(arena_struct, index)
	{
		self.var_af599afa = arena_struct;
		self.m_name = arena_struct.script_noteworthy;
		self.var_613b7253 = hash(m_name);
		self.var_be31d6d6 = index;
		self.var_b60ab5fd = struct::get_array(m_name + "_safe_spot", "targetname");
		self.var_74297693 = struct::get_array(m_name + "_decor", "targetname");
		self.var_79baa471 = struct::get_array(m_name + "_rise_spot", "targetname");
		self.var_5479b5f3 = struct::get_array(m_name + "_pickup", "targetname");
		self.var_a1fa7529 = struct::get_array(m_name + "_hazard", "targetname");
		self.var_80292cd = struct::get_array(m_name + "_player_spawnpoint", "targetname");
		self.var_73ab8b47 = struct::get_array(m_name + "_silverback_spawn", "targetname");
		self.var_b198ac5a = [];
		exits = getentarray(m_name + "_doa_exit", "targetname");
		self.var_c0023851 = struct::get(m_name + "_wild_spot", "targetname");
		self.var_e2a6dd61 = getentarray(m_name + "_camera_tweak", "targetname");
		foreach(exit in exits)
		{
			self.var_b198ac5a[exit.script_noteworthy] = exit;
		}
		/#
			assert(var_b198ac5a.size == 4, "");
		#/
		self.var_63f7cb8f = [];
		self.var_63f7cb8f[#"bottom"] = struct::get_array(m_name + "_enemy_spawn_bottom", "targetname");
		self.var_63f7cb8f[#"left"] = struct::get_array(m_name + "_enemy_spawn_left", "targetname");
		self.var_63f7cb8f[#"top"] = struct::get_array(m_name + "_enemy_spawn_top", "targetname");
		self.var_63f7cb8f[#"right"] = struct::get_array(m_name + "_enemy_spawn_right", "targetname");
		foreach(spot in var_63f7cb8f[#"bottom"])
		{
			spot.origin = namespace_ec06fe4a::function_65ee50ba(spot.origin);
		}
		foreach(spot in var_63f7cb8f[#"left"])
		{
			spot.origin = namespace_ec06fe4a::function_65ee50ba(spot.origin);
		}
		foreach(spot in var_63f7cb8f[#"top"])
		{
			spot.origin = namespace_ec06fe4a::function_65ee50ba(spot.origin);
		}
		foreach(spot in var_63f7cb8f[#"right"])
		{
			spot.origin = namespace_ec06fe4a::function_65ee50ba(spot.origin);
		}
		foreach(spot in var_74297693)
		{
			spot.var_4983b208 = 15;
			if(isdefined(spot.script_int))
			{
				spot.var_4983b208 = int(spot.script_int);
			}
			/#
				assert(spot.var_4983b208 >= 1 && spot.var_4983b208 <= 15);
			#/
			toks = strtok(spot.script_string, ";");
			/#
				assert(toks.size >= 3);
			#/
			spot.modelname = toks[0];
			spot.scale = float(toks[1]);
			spot.var_bfbc537c = int(toks[2]);
		}
		self.var_73c16a24 = [];
		self.var_73c16a24[#"bottom"] = struct::get_array(m_name + "_exit_start_bottom", "targetname");
		self.var_73c16a24[#"left"] = struct::get_array(m_name + "_exit_start_left", "targetname");
		self.var_73c16a24[#"top"] = struct::get_array(m_name + "_exit_start_top", "targetname");
		self.var_73c16a24[#"right"] = struct::get_array(m_name + "_exit_start_right", "targetname");
		self.var_36f9408 = [];
		self.var_36f9408[#"bottom"] = getent(m_name + "_blocker_bottom", "targetname");
		self.var_36f9408[#"left"] = getent(m_name + "_blocker_left", "targetname");
		self.var_36f9408[#"top"] = getent(m_name + "_blocker_top", "targetname");
		self.var_36f9408[#"right"] = getent(m_name + "_blocker_right", "targetname");
		var_36f9408[#"bottom"].original_location = var_36f9408[#"bottom"].origin;
		var_36f9408[#"left"].original_location = var_36f9408[#"left"].origin;
		var_36f9408[#"top"].original_location = var_36f9408[#"top"].origin;
		var_36f9408[#"right"].original_location = var_36f9408[#"right"].origin;
		var_36f9408[#"bottom"].side = "bottom";
		var_36f9408[#"left"].side = "left";
		var_36f9408[#"top"].side = "top";
		var_36f9408[#"right"].side = "right";
		self.var_5d3a1[#"top"] = [];
		self.var_5d3a1[#"bottom"] = [];
		self.var_5d3a1[#"left"] = [];
		self.var_5d3a1[#"right"] = [];
		self.var_694b395b = getent(m_name + "_safezone", "targetname");
		self.var_cb3e8eba = getentarray(m_name + "_doa_exit", "targetname");
		self.var_7c7691d6 = 0;
		deactivate();
	}

	/*
		Name: function_464d882c
		Namespace: namespace_f4bf8a8
		Checksum: 0x21874B64
		Offset: 0x27C0
		Size: 0x84
		Parameters: 0
		Flags: None
	*/
	function function_464d882c()
	{
		foreach(hazard in var_a1fa7529)
		{
			hazard notify(#"hash_3e251384a5400dce");
		}
	}

	/*
		Name: function_4774f263
		Namespace: namespace_f4bf8a8
		Checksum: 0xC03D60A8
		Offset: 0x2F10
		Size: 0x276
		Parameters: 4
		Flags: None
	*/
	function function_4774f263(type, trigger, var_6a1dbbf3, var_fe263624)
	{
		if(!isdefined(var_6a1dbbf3))
		{
			var_6a1dbbf3 = 0;
		}
		if(!isdefined(var_fe263624))
		{
			var_fe263624 = 0;
		}
		self notify("70fc3d3ef7119d4c");
		self endon("70fc3d3ef7119d4c");
		self endon(#"disconnect");
		var_6a1dbbf3 = int(var_6a1dbbf3);
		var_425999f6 = int(var_fe263624);
		maxamount = 32 - 1;
		var_753de10b = trigger.maxs[var_6a1dbbf3];
		var_974c88c7 = maxs[var_fe263624];
		while(isdefined(trigger) && self istouching(trigger) && trigger istriggerenabled())
		{
			var_a738da71 = origin - trigger.origin;
			var_9fa53333 = rotatepoint(var_a738da71, trigger.angles * -1);
			var_605440f7 = var_9fa53333 + trigger.origin;
			dist2 = (abs(trigger.origin[var_fe263624] - var_605440f7[var_fe263624])) - var_974c88c7;
			var_85322688 = 1 - (dist2 / var_753de10b);
			var_7ead8893 = int(mapfloat(0, 1, 0, maxamount, var_85322688));
			self clientfield::set_to_player(type, var_7ead8893);
			util::wait_network_frame();
		}
		self clientfield::set_to_player(type, 0);
		self.tweakcam = undefined;
	}

	/*
		Name: function_4aca7529
		Namespace: namespace_f4bf8a8
		Checksum: 0x2B8C2AE9
		Offset: 0x1DA8
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_4aca7529(val)
	{
		self.var_7c7691d6 = val;
	}

	/*
		Name: function_51dd0a59
		Namespace: namespace_f4bf8a8
		Checksum: 0x519CF89
		Offset: 0x2308
		Size: 0x1A
		Parameters: 0
		Flags: None
	*/
	function function_51dd0a59()
	{
		if(!isdefined(var_c0023851))
		{
			return;
		}
		return var_c0023851;
	}

	/*
		Name: function_55916d40
		Namespace: namespace_f4bf8a8
		Checksum: 0xC579DD5B
		Offset: 0x1E28
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_55916d40()
	{
		return var_35760f46;
	}

	/*
		Name: function_59fc184c
		Namespace: namespace_f4bf8a8
		Checksum: 0xC3960A89
		Offset: 0x1B40
		Size: 0x2C
		Parameters: 0
		Flags: None
	*/
	function function_59fc184c()
	{
		return var_79baa471[randomint(var_79baa471.size)];
	}

	/*
		Name: function_62d5e1be
		Namespace: namespace_f4bf8a8
		Checksum: 0x220BED36
		Offset: 0x1FB8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_62d5e1be()
	{
		return var_60821378;
	}

	/*
		Name: function_635991ca
		Namespace: namespace_f4bf8a8
		Checksum: 0x650BEBB8
		Offset: 0x24C0
		Size: 0x92
		Parameters: 0
		Flags: None
	*/
	function function_635991ca()
	{
		if(var_73ab8b47.size)
		{
			return var_73ab8b47[randomint(var_73ab8b47.size)];
		}
		sides = array("top", "bottom", "left", "right");
		return function_21d1be3d(sides[randomint(sides.size)]);
	}

	/*
		Name: getid
		Namespace: namespace_f4bf8a8
		Checksum: 0x9DB3F11E
		Offset: 0x1AF0
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function getid()
	{
		return var_be31d6d6;
	}

	/*
		Name: function_68400720
		Namespace: namespace_f4bf8a8
		Checksum: 0x84A1F8BB
		Offset: 0x1EC0
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_68400720(val)
	{
		self.var_2e06f9d4 = val;
	}

	/*
		Name: function_6d5262dc
		Namespace: namespace_f4bf8a8
		Checksum: 0x1450C43B
		Offset: 0x1F40
		Size: 0x2E
		Parameters: 1
		Flags: None
	*/
	function function_6d5262dc(val)
	{
		if(val > 40)
		{
			val = 40;
		}
		self.var_24df6bfb = val;
	}

	/*
		Name: function_70fb5745
		Namespace: namespace_f4bf8a8
		Checksum: 0x6156A36F
		Offset: 0x23C8
		Size: 0xEE
		Parameters: 4
		Flags: None
	*/
	function function_70fb5745(nearby, min, max, getclosest)
	{
		if(!isdefined(min))
		{
			min = 256;
		}
		if(!isdefined(max))
		{
			max = 512;
		}
		if(!isdefined(getclosest))
		{
			getclosest = 0;
		}
		if(!isdefined(nearby))
		{
			return var_b60ab5fd[randomint(var_b60ab5fd.size)];
		}
		spots = arraysortclosest(var_b60ab5fd, nearby, undefined, min, max);
		if(getclosest)
		{
			return spots[0];
		}
		if(spots.size > 0)
		{
			return spots[randomint(spots.size)];
		}
		return var_af599afa;
	}

	/*
		Name: function_73ec120c
		Namespace: namespace_f4bf8a8
		Checksum: 0x81B19601
		Offset: 0x2E40
		Size: 0x84
		Parameters: 1
		Flags: None
	*/
	function function_73ec120c(side)
	{
		var_36f9408[side].origin = var_36f9408[side].original_location + (vectorscale((0, 0, -1), 50000));
		namespace_1e25ad94::debugmsg((("Moving blocker: " + side) + " to origin ") + var_36f9408[side].origin);
	}

	/*
		Name: function_774497ee
		Namespace: namespace_f4bf8a8
		Checksum: 0xCC0E99B9
		Offset: 0x1E40
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_774497ee(var_49983302)
	{
		self.var_622da539 = var_49983302;
	}

	/*
		Name: function_7856fdb6
		Namespace: namespace_f4bf8a8
		Checksum: 0xF9398F32
		Offset: 0x1AD8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_7856fdb6()
	{
		return var_613b7253;
	}

	/*
		Name: function_786b9d39
		Namespace: namespace_f4bf8a8
		Checksum: 0x5C9DC77E
		Offset: 0x2020
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_786b9d39()
	{
		return var_5e72455f;
	}

	/*
		Name: function_7ce9bb97
		Namespace: namespace_f4bf8a8
		Checksum: 0x950BEAC5
		Offset: 0x3448
		Size: 0x132
		Parameters: 1
		Flags: None
	*/
	function function_7ce9bb97(deactivate)
	{
		objective_setstate(10, "invisible");
		foreach(exit in var_b198ac5a)
		{
			exit triggerenable(0);
			exit.enabled = 0;
			namespace_1e25ad94::debugmsg("Disabling trigger: " + exit.script_noteworthy);
			if(isdefined(exit.fakemodel))
			{
				exit.fakemodel namespace_83eb6304::turnofffx("exit_fog_marker");
			}
		}
		level notify(#"hash_69b4bed202ddfa69");
		self.var_81e9b5ca = [];
	}

	/*
		Name: function_8054e011
		Namespace: namespace_f4bf8a8
		Checksum: 0x80DD0C35
		Offset: 0x2358
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_8054e011()
	{
		return var_b60ab5fd;
	}

	/*
		Name: function_82fd5391
		Namespace: namespace_f4bf8a8
		Checksum: 0x9E41813E
		Offset: 0x2ED0
		Size: 0x34
		Parameters: 0
		Flags: None
	*/
	function function_82fd5391()
	{
		self waittill(#"deactivate");
		self triggerenable(0);
	}

	/*
		Name: function_8a7cec70
		Namespace: namespace_f4bf8a8
		Checksum: 0x97F32DEA
		Offset: 0x1EA8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_8a7cec70()
	{
		return var_9cd25248;
	}

	/*
		Name: function_8bca81f0
		Namespace: namespace_f4bf8a8
		Checksum: 0xE7F684E7
		Offset: 0x3728
		Size: 0x200
		Parameters: 0
		Flags: None
	*/
	function function_8bca81f0()
	{
		self notify("6b1ff9708b61ce06");
		self endon("6b1ff9708b61ce06");
		level endon(#"hash_69b4bed202ddfa69");
		wait(1);
		while(true)
		{
			result = undefined;
			result = self waittilltimeout(10, #"trigger");
			if(result._notify == #"timeout")
			{
				continue;
			}
			if(isbot(result.activator) || is_true(result.activator.var_c497caa3))
			{
				continue;
			}
			break;
		}
		namespace_1e25ad94::debugmsg("Exit Taken Trigger: " + script_noteworthy);
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			player notify(#"hash_279998c5df86c04d");
			player thread namespace_7f5aeb59::turnplayershieldon();
		}
		result.activator notify(#"doa_exit_taken");
		level notify(#"doa_exit_taken", {#direction:script_noteworthy, #activator:result.activator});
	}

	/*
		Name: function_90de0b96
		Namespace: namespace_f4bf8a8
		Checksum: 0xF9B464DE
		Offset: 0x2670
		Size: 0x144
		Parameters: 0
		Flags: None
	*/
	function function_90de0b96()
	{
		level thread namespace_268747c0::function_3874b272("explo_barrel");
		level thread namespace_268747c0::function_3874b272("killbox");
		level thread namespace_268747c0::function_3874b272("killzone");
		level thread namespace_268747c0::function_3874b272("pungi");
		level thread namespace_268747c0::function_3874b272("flogger");
		level thread namespace_268747c0::function_3874b272("logdrop");
		level thread namespace_268747c0::function_3874b272("physicsbox");
		level thread namespace_268747c0::function_3874b272("fireball");
		level thread namespace_268747c0::function_3874b272("dragonhead");
		level thread namespace_268747c0::function_3874b272("platform");
	}

	/*
		Name: function_9485c2a9
		Namespace: namespace_f4bf8a8
		Checksum: 0xC38CCF99
		Offset: 0x1EE8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_9485c2a9()
	{
		return var_2e06f9d4;
	}

	/*
		Name: function_94e37da2
		Namespace: namespace_f4bf8a8
		Checksum: 0xE0BD435D
		Offset: 0x1D58
		Size: 0x2A
		Parameters: 1
		Flags: None
	*/
	function function_94e37da2(player)
	{
		return player istouching(var_694b395b);
	}

	/*
		Name: function_9f494a87
		Namespace: namespace_f4bf8a8
		Checksum: 0xB69015CE
		Offset: 0x2D80
		Size: 0xB8
		Parameters: 0
		Flags: None
	*/
	function function_9f494a87()
	{
		foreach(blocker in var_36f9408)
		{
			blocker.origin = blocker.original_location;
			namespace_1e25ad94::debugmsg((("Moving blocker: " + blocker.side) + " to origin ") + blocker.origin);
		}
	}

	/*
		Name: function_a95693e1
		Namespace: namespace_f4bf8a8
		Checksum: 0xB6013EAF
		Offset: 0x2630
		Size: 0x34
		Parameters: 0
		Flags: None
	*/
	function function_a95693e1()
	{
		level thread namespace_268747c0::function_3874b272("elec_pole", function_8a7cec70());
	}

	/*
		Name: function_aad69885
		Namespace: namespace_f4bf8a8
		Checksum: 0x739E9C2F
		Offset: 0x3708
		Size: 0x18
		Parameters: 1
		Flags: None
	*/
	function function_aad69885(side)
	{
		return var_b198ac5a[side];
	}

	/*
		Name: deactivate
		Namespace: namespace_f4bf8a8
		Checksum: 0x39A229E8
		Offset: 0x2B40
		Size: 0x236
		Parameters: 0
		Flags: None
	*/
	function deactivate()
	{
		level notify(#"hash_25b8523c402831e5");
		function_464d882c();
		function_7ce9bb97(1);
		function_9f494a87();
		function_e87bab7b();
		objective_setstate(10, "invisible");
		foreach(exit in var_b198ac5a)
		{
			if(isdefined(exit.fakemodel))
			{
				exit.fakemodel delete();
			}
		}
		foreach(var_f0ce243e in var_e2a6dd61)
		{
			if(isdefined(var_f0ce243e))
			{
				var_f0ce243e notify(#"deactivate");
			}
		}
		self.var_5d3a1[#"top"] = [];
		self.var_5d3a1[#"bottom"] = [];
		self.var_5d3a1[#"left"] = [];
		self.var_5d3a1[#"right"] = [];
		var_ac834eea = function_14b480d1();
		if(isdefined(var_ac834eea))
		{
			level thread [[var_ac834eea]]();
		}
	}

	/*
		Name: function_b2f9e813
		Namespace: namespace_f4bf8a8
		Checksum: 0xF8107F1F
		Offset: 0x1E10
		Size: 0xE
		Parameters: 0
		Flags: None
	*/
	function function_b2f9e813()
	{
		self.var_35760f46 = gettime();
	}

	/*
		Name: function_b6954aba
		Namespace: namespace_f4bf8a8
		Checksum: 0xF162CB4B
		Offset: 0x1DD0
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_b6954aba(var_e74c8f7)
	{
		self.var_486c1553 = var_e74c8f7;
	}

	/*
		Name: function_c0402c8a
		Namespace: namespace_f4bf8a8
		Checksum: 0x95BED538
		Offset: 0x2370
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_c0402c8a()
	{
		return var_5479b5f3;
	}

	/*
		Name: activate
		Namespace: namespace_f4bf8a8
		Checksum: 0x60641D33
		Offset: 0x2850
		Size: 0x2E2
		Parameters: 0
		Flags: None
	*/
	function activate()
	{
		level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_ARENANUMBER", getid());
		objective_setstate(10, "invisible");
		foreach(exit in var_b198ac5a)
		{
			origin = exit namespace_ec06fe4a::function_65ee50ba(exit.origin, 12);
			if(!isdefined(exit.fakemodel))
			{
				exit.fakemodel = namespace_ec06fe4a::function_e22ae9b3(origin + vectorscale((0, 0, 1), 16), "tag_origin");
				exit.fakemodel.targetname = (m_name + "_exit_") + exit.script_noteworthy;
			}
		}
		foreach(var_f0ce243e in var_e2a6dd61)
		{
			var_f0ce243e thread function_e7bbc8d1();
		}
		function_90de0b96();
		function_7ce9bb97();
		function_9f494a87();
		while(!function_6a6f39a2(m_name))
		{
			waitframe(1);
		}
		self.var_5d3a1[#"top"] = [];
		self.var_5d3a1[#"bottom"] = [];
		self.var_5d3a1[#"left"] = [];
		self.var_5d3a1[#"right"] = [];
		var_2f0b512f = [[ level.doa.var_39e3fa99 ]]->function_3bf5b85d();
		if(isdefined(var_2f0b512f))
		{
			level thread [[var_2f0b512f]]();
		}
	}

	/*
		Name: function_c8300b0e
		Namespace: namespace_f4bf8a8
		Checksum: 0x4323445E
		Offset: 0x3588
		Size: 0x15C
		Parameters: 1
		Flags: None
	*/
	function function_c8300b0e(side)
	{
		exit = function_aad69885(side);
		function_73ec120c(exit.script_noteworthy);
		exit triggerenable(1);
		exit.enabled = 1;
		namespace_1e25ad94::debugmsg("Enabling trigger: " + exit.script_noteworthy);
		exit thread function_8bca81f0();
		exit.fakemodel namespace_83eb6304::function_3ecfde67("exit_fog_marker");
		exit.fakemodel namespace_83eb6304::turnofffx("arena_barrier");
		objective_setstate(10, "active");
		objective_onentity(10, exit.fakemodel);
		objective_setprogress(10, 1);
		self.var_81e9b5ca[var_81e9b5ca.size] = exit;
	}

	/*
		Name: function_c892290a
		Namespace: namespace_f4bf8a8
		Checksum: 0xF7E97B53
		Offset: 0x1F78
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_c892290a()
	{
		return var_24df6bfb;
	}

	/*
		Name: function_c9f6682b
		Namespace: namespace_f4bf8a8
		Checksum: 0xEB12B63A
		Offset: 0x3930
		Size: 0x122
		Parameters: 0
		Flags: None
	*/
	function function_c9f6682b()
	{
		playsoundatposition(#"hash_2021d3391e72675c", (0, 0, 0));
		self.var_81e9b5ca = [];
		num = 1;
		var_41629194 = [];
		while(num)
		{
			side = namespace_8c04284b::function_7802d126();
			if(!isinarray(var_41629194, side))
			{
				var_41629194[var_41629194.size] = side;
				num--;
			}
		}
		foreach(side in var_41629194)
		{
			function_c8300b0e(side);
		}
	}

	/*
		Name: function_cb179d87
		Namespace: namespace_f4bf8a8
		Checksum: 0xB4A4524
		Offset: 0x2330
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_cb179d87(set)
	{
		self.var_c0023851 = set;
	}

	/*
		Name: function_cc773c53
		Namespace: namespace_f4bf8a8
		Checksum: 0x296A0193
		Offset: 0x2008
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_cc773c53()
	{
		return var_bedb7d90;
	}

	/*
		Name: function_dfb49846
		Namespace: namespace_f4bf8a8
		Checksum: 0xD39CBE0E
		Offset: 0x36F0
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_dfb49846()
	{
		return var_81e9b5ca;
	}

	/*
		Name: function_e0de916a
		Namespace: namespace_f4bf8a8
		Checksum: 0x9418DA3E
		Offset: 0x1FD0
		Size: 0x2E
		Parameters: 2
		Flags: None
	*/
	function function_e0de916a(var_cc6976cf, var_fd3fce8b)
	{
		self.var_bedb7d90 = var_cc6976cf;
		self.var_5e72455f = var_fd3fce8b;
	}

	/*
		Name: function_e7bbc8d1
		Namespace: namespace_f4bf8a8
		Checksum: 0x9AD76FBE
		Offset: 0x3190
		Size: 0x208
		Parameters: 0
		Flags: None
	*/
	function function_e7bbc8d1()
	{
		self endon(#"deactivate");
		self triggerenable(1);
		self thread function_82fd5391();
		type = (isdefined(script_noteworthy) ? script_noteworthy : "setCameraDown");
		if(isdefined(script_int))
		{
			self thread function_20b2a1e4(int(script_int));
		}
		var_6a1dbbf3 = 0;
		var_fe263624 = 0;
		if(isdefined(script_parameters))
		{
			toks = strtok(script_parameters, ";");
			/#
				assert(toks.size >= 2);
			#/
			var_6a1dbbf3 = int(toks[0]);
			var_fe263624 = int(toks[1]);
		}
		self.angles = angleclamp180(angles);
		while(true)
		{
			result = undefined;
			result = self waittill(#"trigger");
			if(isplayer(result.activator) && !isdefined(result.activator.tweakcam))
			{
				result.activator.tweakcam = self;
				result.activator thread function_4774f263(type, self, var_6a1dbbf3, var_fe263624);
			}
		}
	}

	/*
		Name: function_e87bab7b
		Namespace: namespace_f4bf8a8
		Checksum: 0x8891EC5B
		Offset: 0x2038
		Size: 0x112
		Parameters: 1
		Flags: None
	*/
	function function_e87bab7b(var_4983b208)
	{
		if(!isdefined(var_4983b208))
		{
			var_4983b208 = 0;
		}
		foreach(spot in var_74297693)
		{
			if(!isdefined(spot.mdl))
			{
				continue;
			}
			if(spot.var_4983b208 & var_4983b208)
			{
				continue;
			}
			if(is_true(spot.var_bfbc537c))
			{
				spot.mdl connectpaths();
			}
			spot.mdl delete();
			spot.mdl = undefined;
		}
	}

	/*
		Name: function_eca91fd8
		Namespace: namespace_f4bf8a8
		Checksum: 0xE810752D
		Offset: 0x2388
		Size: 0x34
		Parameters: 1
		Flags: None
	*/
	function function_eca91fd8(origin)
	{
		return arraysort(var_b60ab5fd, origin)[var_b60ab5fd.size - 1];
	}

	/*
		Name: function_ee30f092
		Namespace: namespace_f4bf8a8
		Checksum: 0x72AC84E8
		Offset: 0x3B30
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function function_ee30f092(side)
	{
		if(function_20b4ef55(side) > 0)
		{
			wave = var_5d3a1[side][0];
			arrayremoveindex(var_5d3a1[side], 0);
			return wave;
		}
		return undefined;
	}

	/*
		Name: function_f231126a
		Namespace: namespace_f4bf8a8
		Checksum: 0x86B29F26
		Offset: 0x3BD8
		Size: 0x64
		Parameters: 0
		Flags: None
	*/
	function function_f231126a()
	{
		return (function_20b4ef55("top") + function_20b4ef55("bottom")) + function_20b4ef55("left") + function_20b4ef55("right");
	}

	/*
		Name: function_fc81ec00
		Namespace: namespace_f4bf8a8
		Checksum: 0x8AD753E0
		Offset: 0x1BC8
		Size: 0x50
		Parameters: 1
		Flags: None
	*/
	function function_fc81ec00(idx)
	{
		/#
			assert(idx < var_80292cd.size, "" + m_name);
		#/
		return var_80292cd[idx];
	}

	/*
		Name: function_fdea25f1
		Namespace: namespace_f4bf8a8
		Checksum: 0x19E9EBBF
		Offset: 0x1B90
		Size: 0x2C
		Parameters: 0
		Flags: None
	*/
	function function_fdea25f1()
	{
		return var_5479b5f3[randomint(var_5479b5f3.size)];
	}

}

#namespace namespace_8c04284b;

/*
	Name: function_22d46c6b
	Namespace: namespace_8c04284b
	Checksum: 0xF4EE9774
	Offset: 0xC50
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_22d46c6b()
{
	level notify(-1261175656);
}

/*
	Name: function_b97739d8
	Namespace: namespace_8c04284b
	Checksum: 0x613002FC
	Offset: 0x4900
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_b97739d8(idx)
{
	if(!isdefined(idx))
	{
		idx = 0;
	}
	/#
		assert(idx >= 0 && idx < 4);
	#/
	if(idx < 0 || idx > 3)
	{
		return;
	}
	if(isdefined(level.doa.var_39e3fa99))
	{
		return [[ level.doa.var_39e3fa99 ]]->function_fc81ec00(idx);
	}
	return level.doa.var_9c14d513[idx];
}

/*
	Name: init
	Namespace: namespace_8c04284b
	Checksum: 0xE09EEB87
	Offset: 0x49B8
	Size: 0x3B4
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("world", "setArena", 1, 5, "int");
	clientfield::register("world", "setTOD", 1, 3, "int");
	level flag::init("arena_zero_rounds", 0);
	level flag::init("arena_hold_presentation", 0);
	level flag::init("arena_hold_banner_presentation", 0);
	level flag::init("arena_pauseAdvancement", 0);
	level.doa.arenas = [];
	level.doa.var_7f0b4a69 = 0;
	level.doa.var_8f91d36b = 0;
	level.doa.var_654a3ea9 = 0;
	level.doa.var_23ce73 = 0;
	level.doa.var_39459d49 = 0;
	level.doa.var_4e554b79 = &function_b97739d8;
	level.doa.var_9c14d513 = struct::get_array("island_player_spawnpoint", "targetname");
	arenas = struct::get_array("arena_center", "targetname");
	var_7f6c6c04 = [];
	foreach(arena in arenas)
	{
		/#
			assert(isdefined(arena.script_parameters), "");
		#/
		args = strtok(arena.script_parameters, ";");
		order = int(args[0]);
		/#
			assert(!isdefined(var_7f6c6c04[order]), "" + arena.script_noteworthy);
		#/
		var_7f6c6c04[order] = arena;
	}
	id = 0;
	for(index = 0; index < 100; index++)
	{
		if(isdefined(var_7f6c6c04[index]))
		{
			function_afa7d50a(var_7f6c6c04[index], id);
			id++;
		}
	}
	objective_add(10, "invisible", (0, 0, 0), #"hash_428c6cab9076a611");
	level clientfield::set("setArena", 32 - 1);
}

/*
	Name: main
	Namespace: namespace_8c04284b
	Checksum: 0x7CE657DD
	Offset: 0x4D78
	Size: 0x814
	Parameters: 0
	Flags: None
*/
function main()
{
	level.doa.var_e5ef2ab4 = 0;
	level.doa.var_8f91d36b = 0;
	level.doa.var_654a3ea9 = 0;
	level.doa.var_23ce73 = 0;
	level.doa.var_a598a835 = undefined;
	level.doa.var_a77e4601 = [];
	level.doa.var_39459d49 = 0;
	level.doa.var_11623c49 = randomintrange(200, 600);
	level flag::clear("arena_zero_rounds");
	level flag::clear("arena_hold_presentation");
	level flag::clear("arena_hold_banner_presentation");
	function_a70ff03e(0, 1);
	if(level.doa.arenas.size == 0)
	{
		return;
	}
	foreach(arena in level.doa.arenas)
	{
		[[ arena ]]->deactivate();
	}
	level.doa.var_39e3fa99 = undefined;
	level endon(#"game_over");
	level waittill(#"hash_671684f03a58b3a3");
	level namespace_a6ddb172::function_7a0e5387();
	waitframe(1);
	if(is_true(level.var_65efe052))
	{
		util::wait_network_frame();
		level namespace_a6ddb172::function_7a0e5387(49);
	}
	level.doa.var_23fd3659 = 0;
	level clientfield::set("setArena", level.doa.var_23fd3659);
	while(true)
	{
		level thread function_6d6bfe1f(level.doa.var_23fd3659);
		result = undefined;
		result = level waittill(#"waiting_on_player_exit_teleporteronly", #"waiting_on_player_exit_decidechoice");
		if(result._notify == "waiting_on_player_exit_teleporterOnly")
		{
			nextarena = level.doa.var_23fd3659 + 1;
			if(nextarena >= level.doa.arenas.size)
			{
				nextarena = 0;
			}
			arena = level.doa.arenas[nextarena];
			level thread namespace_ec06fe4a::function_87612422([[ arena ]]->function_ffcf1d1(), undefined, 0.5, 999999);
		}
		result = undefined;
		result = level waittill(#"teleporter_taken", #"enter_the_wild");
		if(result._notify == #"enter_the_wild")
		{
			level thread doa_wild::function_7c5bc025(result.param, result.data);
			level waittill(#"hash_325440d5433be263");
		}
		namespace_d2efac9a::function_47498d07();
		level namespace_a6ddb172::function_7a0e5387();
		while(flag::get("arena_pauseAdvancement"))
		{
			waitframe(1);
		}
		level.doa.var_23fd3659++;
		/#
			if(getdvarint(#"hash_d874e4e73e9f18") == 4)
			{
				level.doa.var_23fd3659--;
			}
		#/
		if(level.doa.var_23fd3659 >= level.doa.arenas.size)
		{
			level.doa.var_23fd3659 = 0;
			level.doa.var_6c58d51++;
			level.doa.var_e5ef2ab4 = 0;
			level.doa.var_3e7292fc = math::clamp(100 - (level.doa.var_6c58d51 * 25), 20, 100);
			foreach(var_94f3b914 in level.doa.var_329c97a3)
			{
				chance = [[ var_94f3b914 ]]->function_17454656();
				chance = math::clamp(chance + (level.doa.var_6c58d51 * 2), 6, 100);
				[[ var_94f3b914 ]]->function_7edd7727(chance);
			}
		}
		level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_ARENANUMBER", level.doa.var_23fd3659);
		players = getplayers();
		foreach(player in players)
		{
			player clientfield::set_to_player("showMap", 1);
		}
		wait(5);
		players = getplayers();
		foreach(player in players)
		{
			player clientfield::set_to_player("showMap", 0);
			player clientfield::increment_to_player("resetCamera");
		}
	}
}

/*
	Name: function_afa7d50a
	Namespace: namespace_8c04284b
	Checksum: 0x35EBEF2C
	Offset: 0x5598
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_afa7d50a(arena_struct, index)
{
	arena = new class_f4bf8a8();
	[[ arena ]]->initialize(arena_struct, index);
	level.doa.arenas[[[ arena ]]->getid()] = arena;
	var_663588d = "Zombietron/Arenas/";
	var_59ea00e = ("scr_arena_activate " + ([[ arena ]]->getname())) + "; zombie_devgui arena";
	util::add_devgui(((var_663588d + ([[ arena ]]->getname())) + ":") + ([[ arena ]]->getid()), var_59ea00e);
}

/*
	Name: function_a7c5291d
	Namespace: namespace_8c04284b
	Checksum: 0x654C0556
	Offset: 0x5688
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_a7c5291d(name)
{
	foreach(arena in level.doa.arenas)
	{
		if(([[ arena ]]->getname()) == name)
		{
			return [[ arena ]]->getid();
		}
	}
	return -1;
}

/*
	Name: function_85c7d70e
	Namespace: namespace_8c04284b
	Checksum: 0xADE00002
	Offset: 0x5740
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_85c7d70e(name)
{
	foreach(arena in level.doa.arenas)
	{
		if(([[ arena ]]->getname()) == name)
		{
			return arena;
		}
	}
}

/*
	Name: function_1ced05a1
	Namespace: namespace_8c04284b
	Checksum: 0x360FF073
	Offset: 0x57F0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_1ced05a1(id)
{
	foreach(arena in level.doa.arenas)
	{
		if(([[ arena ]]->getid()) == id)
		{
			return [[ arena ]]->getname();
		}
	}
}

/*
	Name: function_27960a04
	Namespace: namespace_8c04284b
	Checksum: 0x62685258
	Offset: 0x58A8
	Size: 0x250
	Parameters: 1
	Flags: None
*/
function function_27960a04(var_e1dd1170)
{
	/#
		assert(isdefined(level.doa.arenas[var_e1dd1170]), "" + var_e1dd1170);
	#/
	level notify(#"arena_switching");
	level clientfield::set("setArena", var_e1dd1170);
	level clientfield::set("setTOD", 0);
	level util::set_lighting_state(0, 0);
	level.doa.var_a598a835 = undefined;
	util::wait_network_frame();
	level.doa.var_39e3fa99 = level.doa.arenas[var_e1dd1170];
	[[ level.doa.var_39e3fa99 ]]->activate();
	[[ level.doa.var_39e3fa99 ]]->function_4aca7529(1);
	[[ level.doa.var_39e3fa99 ]]->function_68400720(1);
	level thread namespace_ec06fe4a::function_87612422([[ level.doa.var_39e3fa99 ]]->function_ffcf1d1());
	function_8405d534();
	function_a70ff03e(0, 1);
	level util::streamer_wait(undefined, 0, 2);
	namespace_9fc66ac::function_5beeba99();
	namespace_1e25ad94::debugmsg((("Arena " + var_e1dd1170) + " activated (") + ([[ level.doa.var_39e3fa99 ]]->getname()) + ")");
	level notify(#"hash_2a3cff0bb22ed26d");
}

/*
	Name: function_a70ff03e
	Namespace: namespace_8c04284b
	Checksum: 0xDB33BD18
	Offset: 0x5B00
	Size: 0x1F0
	Parameters: 2
	Flags: None
*/
function function_a70ff03e(flip, reset)
{
	if(!isdefined(flip))
	{
		flip = 0;
	}
	if(!isdefined(reset))
	{
		reset = 0;
	}
	players = getplayers();
	if(reset)
	{
		level.doa.var_ecff3871 = 0;
		foreach(player in players)
		{
			if(isdefined(player))
			{
				player namespace_b59ddbce::function_a48eea2b(level.doa.var_ecff3871, 1);
			}
		}
	}
	else
	{
		level.doa.var_ecff3871 = flip;
		foreach(player in players)
		{
			if(isdefined(player))
			{
				player namespace_b59ddbce::function_a48eea2b(level.doa.var_ecff3871);
			}
		}
	}
	level notify(#"hash_180d4d3b6b7ea3f3", {#hash_5078f168:level.doa.var_ecff3871});
}

/*
	Name: function_8405d534
	Namespace: namespace_8c04284b
	Checksum: 0x8D768E4F
	Offset: 0x5CF8
	Size: 0x32C
	Parameters: 1
	Flags: None
*/
function function_8405d534(side)
{
	players = namespace_7f5aeb59::function_23e1f90f();
	idx = 0;
	foreach(player in players)
	{
		player.doa.var_3cf36932 = 1;
		if(isdefined(side))
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_23476287(idx, side);
			/#
				assert(isdefined(spot), "");
			#/
		}
		else
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_fc81ec00(idx);
			/#
				assert(isdefined(spot), "");
			#/
		}
		player notify(#"hash_279998c5df86c04d");
		player setorigin(spot.origin);
		player setplayerangles(spot.angles);
		if(is_true(level.doa.var_67d8328d))
		{
			if(isdefined(player.doa.var_46b45756))
			{
				level thread [[player.doa.var_46b45756]](spot.origin + vectorscale((0, 0, 1), 100), player);
				player.doa.var_46b45756 = undefined;
			}
			level.doa.var_67d8328d = undefined;
		}
		player notify(#"hash_7893364bd228d63e", {#hash_cff8d1e:1});
		player namespace_83eb6304::turnofffx("firstPersonMarker");
		player clientfield::increment_to_player("controlBinding");
		player clientfield::increment_to_player("setCompassVis");
		player namespace_7f5aeb59::function_61d74d57();
		idx++;
	}
	level.doa.var_67d8328d = undefined;
	level.doa.var_dcbded2 = [];
	level namespace_7f5aeb59::function_d0251f76();
	level thread function_37dc18ca();
}

/*
	Name: function_37dc18ca
	Namespace: namespace_8c04284b
	Checksum: 0xA675A917
	Offset: 0x6030
	Size: 0x274
	Parameters: 0
	Flags: None
*/
function function_37dc18ca()
{
	self notify("58aa885c9ccdb726");
	self endon("58aa885c9ccdb726");
	level endon(#"game_over");
	util::wait_network_frame();
	while(true)
	{
		if(isdefined(level.doa.var_39e3fa99))
		{
			players = namespace_7f5aeb59::function_23e1f90f();
			foreach(player in players)
			{
				if(player isinmovemode("ufo", "noclip"))
				{
					continue;
				}
				if(isdefined(level.doa.var_6f3d327))
				{
					continue;
				}
				if(!is_true(player.doa.var_3cf36932))
				{
					continue;
				}
				if(isdefined(level.doa.var_a77e6349))
				{
					continue;
				}
				if(![[ level.doa.var_39e3fa99 ]]->function_94e37da2(player))
				{
					player notify(#"hash_279998c5df86c04d");
					spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745();
					namespace_1e25ad94::debugmsg(((((("Safe Zone Monitor teleporting player (" + player.doa.color) + ") at: ") + player.origin) + " to a safe spot in (") + ([[ level.doa.var_39e3fa99 ]]->getname()) + ") at :") + spot.origin, 1);
					player setorigin(spot.origin);
				}
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_9f0eb43e
	Namespace: namespace_8c04284b
	Checksum: 0xB27994E7
	Offset: 0x62B0
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_9f0eb43e()
{
	if(is_true(level.doa.var_8f710e5d) || (level.doa.roundnumber > 4 && randomint(100) < 15 || (level.doa.roundnumber - level.doa.var_7f0b4a69) > 7))
	{
		level thread namespace_58e19d6::function_571bb3ac();
		level.doa.var_7f0b4a69 = level.doa.roundnumber;
		level thread namespace_9fc66ac::announce(70);
	}
}

/*
	Name: function_aad0c9db
	Namespace: namespace_8c04284b
	Checksum: 0x31B6E241
	Offset: 0x63A0
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_aad0c9db()
{
	level thread function_e1916608();
	level thread function_16902251();
	level thread function_17e79564();
	level thread function_1b42a0bb();
	level thread doa_enemy::function_7495bd30();
}

/*
	Name: function_962e9d92
	Namespace: namespace_8c04284b
	Checksum: 0x7D9611DF
	Offset: 0x6428
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function function_962e9d92(roundnumber)
{
	if(roundnumber >= 30 && level.doa.var_6c58d51 == 0)
	{
		return int((1000 + (29 * 100)) + ((roundnumber - 29) * 50) + (level.doa.var_997a0313 * (250 + (getplayers().size * 250))));
	}
	return (1000 + ((roundnumber - 1) * 100)) + (level.doa.var_997a0313 * (250 + (getplayers().size * 250)));
}

/*
	Name: function_f15b9f04
	Namespace: namespace_8c04284b
	Checksum: 0x4CDBAF41
	Offset: 0x6520
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_f15b9f04(roundnumber)
{
	return 24 + ((roundnumber - 1) * 2);
}

/*
	Name: function_ef369bae
	Namespace: namespace_8c04284b
	Checksum: 0xB44CB529
	Offset: 0x6550
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_ef369bae()
{
	if(!isdefined(level.doa.var_39459d49) || level.doa.var_39459d49 == 0)
	{
		level.doa.var_39459d49 = getplayers().size;
	}
	var_737826ee = math::clamp(level.doa.roundnumber, 1, level.doa.roundnumber);
	avg = level.doa.var_39459d49 / var_737826ee;
	return avg;
}

/*
	Name: function_6d6bfe1f
	Namespace: namespace_8c04284b
	Checksum: 0xE854605E
	Offset: 0x6620
	Size: 0x10E8
	Parameters: 2
	Flags: None
*/
function function_6d6bfe1f(var_e1dd1170, rounds)
{
	if(!isdefined(rounds))
	{
		rounds = 4;
	}
	self notify("35d70d7c9005910b");
	self endon("35d70d7c9005910b");
	level endon(#"game_over", #"arena_completed");
	level flag::clear("arena_zero_rounds");
	namespace_4dae815d::function_e22d3978(level.doa.roundnumber + 1);
	/#
		assert(var_e1dd1170 != -1, "");
	#/
	namespace_4dae815d::function_21cd3890(0);
	function_a70ff03e(0, 1);
	var_4c9d3462 = 0;
	namespace_ec06fe4a::function_de70888a();
	function_27960a04(var_e1dd1170);
	if(is_true(level.var_65efe052))
	{
		wait(5);
	}
	level namespace_a6ddb172::function_7a0e5387();
	level.var_65efe052 = undefined;
	level function_aad0c9db();
	var_d0cb8cd4 = gettime();
	var_4a140058 = function_1ced05a1(var_e1dd1170);
	level.doa.var_4cfbc260 = rounds;
	var_406866b1 = 0;
	[[ level.doa.var_39e3fa99 ]]->function_1e4d7a0c(1);
	while(level.doa.var_4cfbc260 > 0)
	{
		level.doa.var_39459d49 = level.doa.var_39459d49 + getplayers().size;
		if(getdvarint(#"hash_23f1ebb21fe023b", 3) != 3)
		{
			level.doa.var_6a0340ad = getdvarint(#"hash_23f1ebb21fe023b", 3);
		}
		else
		{
			level.doa.var_6a0340ad = [[ level.doa.var_39e3fa99 ]]->function_62d5e1be();
		}
		level.doa.roundstarttime = gettime();
		level.doa.var_9fcf26ea = 0;
		level.doa.var_de939ab7 = 0;
		level.doa.var_cde5274e = 0;
		level.doa.var_2b4e2465 = 0;
		level.doa.var_5de71250 = 0;
		level.doa.var_f66b524a = 0;
		level.doa.var_aa7fba18 = 0;
		level.doa.challengeactive = 0;
		level.doa.var_465867b = 0;
		namespace_1e25ad94::debugmsg((((((("Arena (" + var_4a140058) + ") round starting at: ") + level.doa.roundstarttime) + " RoundNumber: ") + level.doa.roundnumber) + " Rounds Left on this Arena: ") + level.doa.var_4cfbc260);
		[[ level.doa.var_39e3fa99 ]]->function_9f494a87();
		[[ level.doa.var_39e3fa99 ]]->function_7ce9bb97();
		[[ level.doa.var_39e3fa99 ]]->function_a95693e1();
		wait(1.5);
		level notify(#"round_about_to_start");
		util::function_21678f2c(getplayers());
		level namespace_7f5aeb59::function_836aeb74();
		function_1eaaceab(level.doa.var_5598fe58);
		/#
			assert(level.doa.var_5598fe58.size == 0, "");
		#/
		if(namespace_77eccc4f::function_379191c(var_4a140058))
		{
			result = undefined;
			result = level waittill(#"hash_145c9457d2598ba");
			level.doa.challengeactive = 1;
		}
		switch(level.doa.var_6a0340ad)
		{
			case 1:
			{
				level function_3d25cb06();
				level thread function_81282ad3();
				break;
			}
			case 2:
			{
				level function_3d25cb06();
				level thread function_9e0d71e5();
				break;
			}
			case 3:
			{
				level thread function_7655afe();
				break;
			}
			default:
			{
				/#
					assert(0, "");
				#/
				break;
			}
		}
		[[ level.doa.var_39e3fa99 ]]->function_4aca7529(0);
		level notify(#"hash_28b51ed78ee920f1");
		level namespace_7f5aeb59::function_ec758d18();
		level flag::wait_till_clear("doa_round_spawning");
		[[ level.doa.var_39e3fa99 ]]->function_4aca7529(1);
		namespace_ec06fe4a::function_b6b79fd1();
		while(level flag::get("doa_round_paused") || is_true(level.hostmigrationtimer))
		{
			waitframe(1);
		}
		level flag::set("doa_round_over");
		level.doa.roundendtime = gettime();
		level.doa.var_f66b524a = level.doa.roundendtime - level.doa.roundstarttime;
		if(!is_true(level.doa.var_3ec3c9aa))
		{
			eventparams = {#hash_49a074e7:int(float(level.doa.var_f66b524a) / 1000), #roundnumber:level.doa.roundnumber};
			function_92d1707f(#"hash_70c149ea78c8a7ac", eventparams);
		}
		else
		{
			namespace_1e25ad94::debugmsg(((("Arena (" + var_4a140058) + ") round [") + level.doa.roundnumber) + "] skipping DLOG event due to interference");
		}
		level.doa.var_3ec3c9aa = undefined;
		namespace_1e25ad94::debugmsg(((((("Arena (" + var_4a140058) + ") round [") + level.doa.roundnumber) + "] finished at: ") + gettime() + " Total Time:") + (float(level.doa.var_f66b524a) / 1000) + " seconds");
		if(is_true(level.doa.var_7ada373e))
		{
			namespace_1e25ad94::function_4e3cfad(((((((("\tArena (" + var_4a140058) + ") round [") + level.doa.roundnumber) + "] finished at: ") + gettime() + " Total Time:") + (float(level.doa.var_f66b524a) / 1000) + " seconds") + " AI Spawned:") + level.doa.var_9fcf26ea, undefined, undefined, undefined, 10);
		}
		level notify(#"round_over");
		waitframe(1);
		if(level flag::get("arena_zero_rounds"))
		{
			level.doa.var_4cfbc260 = 0;
		}
		if(level.doa.var_4cfbc260 > 1)
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
			roll = randomint(100);
			radius = spot.radius;
			if(!isdefined(radius))
			{
				radius = 32;
			}
			if(roll == 0)
			{
				doa_pickups::function_68442ee7(spot.origin, 1, radius, 1);
			}
			doa_pickups::function_68442ee7(spot.origin, randomintrange(4, 10), radius, 0);
			playsoundatposition(#"hash_2021d3391e72675c", (0, 0, 0));
			if([[ level.doa.var_39e3fa99 ]]->function_806bba())
			{
				[[ level.doa.var_39e3fa99 ]]->function_c9f6682b();
				function_9f0eb43e();
			}
			level thread function_6932cdb4();
			namespace_1e25ad94::debugmsg(("Arena (" + var_4a140058) + ") waiting for doa_exit_taken");
			level namespace_a6ddb172::function_7a0e5387(10);
			result = undefined;
			result = level waittill(#"doa_exit_taken");
			playsoundatposition(#"evt_doa_travel_doors_chosen", (0, 0, 0));
			namespace_1e25ad94::debugmsg(("Arena (" + var_4a140058) + ") waiting for doa_exit_taken recieved");
			[[ level.doa.var_39e3fa99 ]]->function_7ce9bb97();
			var_1075516b = result.direction;
			level thread namespace_7f5aeb59::function_67f054d7();
			level waittill(#"hash_1b322de3d2e3e781");
			level namespace_a6ddb172::function_7a0e5387();
			level notify(#"hash_2282d796a1f7533a");
			waitframe(1);
			if(namespace_5a917022::function_7230f033())
			{
				level waittill(#"hash_7dd47c99b7707b1c");
			}
			function_a70ff03e(!level.doa.var_ecff3871);
			var_4c9d3462++;
			if(var_4c9d3462 > 3)
			{
				var_4c9d3462 = 0;
			}
			level util::set_lighting_state(var_4c9d3462, 0);
			level clientfield::set("setTOD", var_4c9d3462);
			doa_pickups::function_19fa261e();
			namespace_ec06fe4a::clearallcorpses();
			if(isdefined(var_1075516b))
			{
				var_406866b1++;
				[[ level.doa.var_39e3fa99 ]]->function_1e4d7a0c(1 << var_406866b1);
				function_8405d534(var_1075516b);
			}
		}
		level.doa.var_4cfbc260--;
		level.doa.var_9a86a331 = [];
		level.doa.var_f4cf4e3 = level.doa.var_f4cf4e3 + 2;
		level.doa.zombie_health = level.doa.zombie_health + 100;
		if(level.doa.var_4cfbc260 > 0)
		{
			namespace_4dae815d::function_e22d3978(level.doa.roundnumber + 1);
		}
		namespace_250e9486::function_d1bc3f11(level.doa.roundnumber);
	}
	clusters = 2;
	while(clusters > 0)
	{
		clusters--;
		spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
		radius = spot.radius;
		if(!isdefined(radius))
		{
			radius = 32;
		}
		roll = randomint(100);
		if(roll == 0)
		{
			doa_pickups::function_68442ee7(spot.origin, 1, radius, 1);
		}
		doa_pickups::function_68442ee7(spot.origin, randomintrange(4, 10), radius, 0);
	}
	level thread function_3f18205d();
	level thread function_6932cdb4();
	timesec = (float(gettime() - var_d0cb8cd4)) / 1000;
	level.doa.var_b456a02b = level.doa.var_b456a02b + timesec;
	namespace_1e25ad94::debugmsg(((("Arena (" + var_4a140058) + ") time spent: ") + timesec) + " seconds.");
	level notify(#"arena_completed");
}

/*
	Name: function_6932cdb4
	Namespace: namespace_8c04284b
	Checksum: 0x64214B18
	Offset: 0x7710
	Size: 0xDC
	Parameters: 0
	Flags: Private
*/
function private function_6932cdb4()
{
	wait(1);
	var_370ac26d = getdvarint(#"hash_b6131d2b653429b", 50) + (level.doa.roundnumber * getdvarint(#"hash_58e9d99a358668d8", 50));
	if(var_370ac26d > getdvarint(#"hash_2f1edc610eb9f340", 1500))
	{
		var_370ac26d = getdvarint(#"hash_2f1edc610eb9f340", 1500);
	}
	namespace_7f5aeb59::function_f8645db3(var_370ac26d);
}

/*
	Name: function_3f18205d
	Namespace: namespace_8c04284b
	Checksum: 0xC2793D96
	Offset: 0x77F8
	Size: 0xDCE
	Parameters: 0
	Flags: None
*/
function function_3f18205d()
{
	self notify("5be01603503cfcde");
	self endon("5be01603503cfcde");
	level endon(#"game_over", #"hash_4a13bd350867b4ae");
	level notify(#"hash_de33bd076cde122");
	foreach(player in getplayers())
	{
		player notify(#"hash_279998c5df86c04d");
	}
	waitframe(1);
	while(level flag::get("arena_hold_presentation"))
	{
		waitframe(1);
	}
	/#
		assert(isdefined(level.doa.var_39e3fa99), "");
	#/
	var_dd3eca11 = [[ level.doa.var_39e3fa99 ]]->function_9485c2a9();
	var_c6906ae1 = undefined;
	if(level.doa.var_6c58d51 == 0)
	{
		var_c6906ae1 = [[ level.doa.var_39e3fa99 ]]->function_51dd0a59();
	}
	if(isdefined(var_c6906ae1))
	{
		var_9f6855ea = (isdefined(level.doa.var_e15152e6) ? level.doa.var_e15152e6 : var_c6906ae1.script_noteworthy);
		var_c4f905c2 = (isdefined(level.doa.var_baeb966b) ? level.doa.var_baeb966b : (isdefined(var_c6906ae1.script_int) ? int(var_c6906ae1.script_int) : 0));
		wild = doa_wild::function_e5e987ae(var_9f6855ea);
		var_82dd2bd0 = (isdefined(var_c6906ae1) ? var_c6906ae1.origin : [[ level.doa.var_39e3fa99 ]]->function_70fb5745([[ level.doa.var_39e3fa99 ]]->function_ffcf1d1()).origin);
		if(isdefined(wild))
		{
			var_ec67aff2 = [[ wild ]]->function_70111aa4(var_c4f905c2);
			level thread namespace_ec06fe4a::function_87612422(var_ec67aff2.origin, var_ec67aff2.angles, 0.1, 999999, [[ wild ]]->function_c8fbcc3f(var_c4f905c2));
		}
	}
	else
	{
		var_dd3eca11 = 1;
	}
	/#
		if(getdvarint(#"hash_d874e4e73e9f18") != 0 || is_true(level.doa.var_1f2c7d5f))
		{
			var_dd3eca11 = 1;
			wild = undefined;
		}
	#/
	id = [[ level.doa.var_39e3fa99 ]]->getid();
	if(var_dd3eca11)
	{
		namespace_1e25ad94::debugmsg(("Arena " + id) + " spawning teleporter");
		origin = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
		var_45041f7 = namespace_ec06fe4a::function_e22ae9b3(origin + (vectorscale((0, 0, -1), 115)), "zombietron_teleporter");
		if(isdefined(var_45041f7))
		{
			var_45041f7 thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
			var_45041f7 setmodel("zombietron_teleporter");
			var_45041f7 solid();
			var_45041f7 setmovingplatformenabled(1);
			var_45041f7 namespace_83eb6304::function_3ecfde67("teleporter_dungeon_light");
			var_45041f7 namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_spawn");
			var_45041f7 thread namespace_ec06fe4a::function_f506b4c7();
			var_45041f7 moveto(origin + vectorscale((0, 0, 1), 12), 1.5);
			level notify(#"teleporter_spawned", {#teleporter:var_45041f7});
			var_45041f7 waittill(#"movedone");
			var_45041f7 namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_lp");
			level.doa.teleporter = var_45041f7;
			var_45041f7.trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", var_45041f7.origin + (vectorscale((0, 0, -1), 100)), 0, 20, 200);
			if(isdefined(var_45041f7.trigger))
			{
				var_45041f7.trigger thread namespace_ec06fe4a::function_d55f042c(var_45041f7, "death");
			}
			else
			{
				/#
					assert(0, "");
				#/
			}
			while(level flag::get("arena_hold_banner_presentation"))
			{
				waitframe(1);
			}
			var_c2366736 = (isdefined(wild) ? 12 : 11);
			level namespace_a6ddb172::function_7a0e5387(var_c2366736);
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
	}
	else
	{
		/#
			assert(isdefined(wild));
		#/
		while(level flag::get("arena_hold_banner_presentation"))
		{
			waitframe(1);
		}
		level namespace_a6ddb172::function_7a0e5387(13);
	}
	note = "teleporter_taken";
	param = undefined;
	data = undefined;
	if(isdefined(wild))
	{
		var_6c225512 = namespace_ec06fe4a::function_e22ae9b3(var_82dd2bd0, "tag_origin");
		if(isdefined(var_6c225512))
		{
			var_6c225512 namespace_83eb6304::function_3ecfde67("wild_portal");
			var_6c225512 namespace_83eb6304::function_3ecfde67("wild_portal_elec_burst");
			var_6c225512 namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_spawn");
			var_6c225512 namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_lp");
			var_6c225512 thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
		var_6c225512.trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", var_6c225512.origin + (vectorscale((0, 0, -1), 30)), 0, 40, 100);
		level.doa.var_6c225512 = var_6c225512;
		if(isdefined(var_6c225512.trigger))
		{
			var_6c225512.trigger thread namespace_ec06fe4a::function_d55f042c(var_6c225512, "death");
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
		wait(1);
		var_6c225512 namespace_83eb6304::function_3ecfde67("wild_portal_radial_burst");
		var_6c225512 namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_burst");
		var_6c225512.trigger thread function_ba702ab7("enter_the_wild");
		if(isdefined(var_45041f7) && !is_true(var_45041f7.malfunction))
		{
			var_45041f7.trigger thread function_ba702ab7("teleporter_taken");
		}
		level notify(#"waiting_on_player_exit_decidechoice");
		result = function_df020ff4();
		note = result.note;
		if(note == "enter_the_wild")
		{
			param = var_9f6855ea;
			data = var_c4f905c2;
		}
	}
	else
	{
		/#
			assert(isdefined(var_45041f7));
		#/
		level notify(#"waiting_on_player_exit_teleporteronly");
		result = undefined;
		result = var_45041f7.trigger waittill(#"trigger");
		var_45041f7.trigger delete();
	}
	if(note === "teleporter_taken")
	{
		playsoundatposition(#"hash_44baccb35f91eeb6", (0, 0, 0));
		foreach(player in getplayers())
		{
			player namespace_d2efac9a::function_9a8fff78();
		}
	}
	level thread namespace_7f5aeb59::function_67f054d7();
	level waittill(#"hash_1b322de3d2e3e781");
	[[ level.doa.var_39e3fa99 ]]->deactivate();
	if(isdefined(var_45041f7))
	{
		var_45041f7 namespace_83eb6304::turnofffx("teleporter_dungeon_light");
		var_45041f7 namespace_83eb6304::turnofffx("glow_red");
		var_45041f7 namespace_83eb6304::turnofffx("glow_green");
		var_45041f7 namespace_83eb6304::turnofffx("glow_blue");
		util::wait_network_frame();
		var_45041f7 delete();
	}
	if(isdefined(var_6c225512))
	{
		var_6c225512.trigger delete();
		var_6c225512 delete();
		level.doa.var_6c225512 = undefined;
	}
	if(note === #"enter_the_wild")
	{
		level.doa.zombie_health = level.doa.zombie_health + (250 + (getplayers().size * 250));
	}
	level.doa.teleporter = undefined;
	level.doa.var_a5e5c622 = level.doa.var_39e3fa99;
	level.doa.var_39e3fa99 = undefined;
	level clientfield::set("setArena", 32 - 1);
	doa_pickups::function_19fa261e();
	namespace_ec06fe4a::clearallcorpses();
	level notify(note, {#data:data, #param:param});
}

/*
	Name: function_ba702ab7
	Namespace: namespace_8c04284b
	Checksum: 0xDC332B09
	Offset: 0x85D0
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_ba702ab7(note)
{
	self endon(#"death");
	level endon(#"hash_45f77908e3043522");
	result = undefined;
	result = self waittill(#"trigger");
	level notify(#"hash_45f77908e3043522", {#activator:result.activator, #note:note});
}

/*
	Name: function_df020ff4
	Namespace: namespace_8c04284b
	Checksum: 0x337E7578
	Offset: 0x8670
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_df020ff4()
{
	result = undefined;
	result = level waittill(#"hash_45f77908e3043522");
	return result;
}

/*
	Name: function_e1916608
	Namespace: namespace_8c04284b
	Checksum: 0x35B741FC
	Offset: 0x86B0
	Size: 0x258
	Parameters: 0
	Flags: None
*/
function function_e1916608()
{
	self notify("4be7ec828ba36fcd");
	self endon("4be7ec828ba36fcd");
	level endon(#"arena_completed");
	level endon(#"game_over");
	level endon(#"hash_1cf1c429bb1c9a07");
	wait(randomint(3) + 1);
	var_339523da = 4;
	var_4e7bdb02 = 10;
	minwait = 10;
	maxwait = 20;
	var_627acedf = undefined;
	while(true)
	{
		wait(randomfloatrange(minwait, maxwait));
		if(isdefined(var_627acedf))
		{
			if(gettime() > var_627acedf)
			{
				while([[ level.doa.var_39e3fa99 ]]->ispaused())
				{
					wait(1);
				}
			}
		}
		else if([[ level.doa.var_39e3fa99 ]]->ispaused())
		{
			var_627acedf = gettime() + 30000;
		}
		if(doa_enemy::function_e7e91016())
		{
			/#
				namespace_1e25ad94::function_4e3cfad("", (1, 0, 0), undefined, 1.5);
				namespace_1e25ad94::debugmsg("");
			#/
			continue;
		}
		spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
		radius = spot.radius;
		if(!isdefined(radius))
		{
			radius = 72;
		}
		doa_pickups::function_68442ee7(spot.origin, randomintrange(var_339523da, var_4e7bdb02), radius, randomint(100) > 98);
	}
}

/*
	Name: function_16902251
	Namespace: namespace_8c04284b
	Checksum: 0x6747B62F
	Offset: 0x8910
	Size: 0x3D0
	Parameters: 0
	Flags: None
*/
function function_16902251()
{
	self notify("19d4dbfee86304");
	self endon("19d4dbfee86304");
	level endon(#"arena_completed");
	level endon(#"game_over");
	level endon(#"hash_25b8523c402831e5");
	level endon(#"hash_1cf1c429bb1c9a07");
	minwait = 12;
	maxwait = 24;
	wait(randomint(8));
	var_46b5961c = 0;
	var_4b444556 = [[ level.doa.var_39e3fa99 ]]->getcenter();
	var_9bb0a315 = arraycombine([[ level.doa.var_39e3fa99 ]]->function_8054e011(), [[ level.doa.var_39e3fa99 ]]->function_c0402c8a());
	while(true)
	{
		wait(0.25);
		while([[ level.doa.var_39e3fa99 ]]->ispaused())
		{
			wait(1);
		}
		if(doa_enemy::function_e7e91016())
		{
			/#
				namespace_1e25ad94::function_4e3cfad("", (1, 0, 0), undefined, 1.5);
				namespace_1e25ad94::debugmsg("");
			#/
			continue;
		}
		var_4d842336 = doa_pickups::function_57160cba();
		type = [[ var_4d842336 ]]->function_5ce4fb28();
		spot = var_9bb0a315[randomint(var_9bb0a315.size)];
		if(!doa_pickups::function_ae609287(var_4d842336, spot.origin))
		{
			continue;
		}
		if(type == var_46b5961c)
		{
			var_46b5961c = 0;
			wait(1);
			continue;
		}
		var_46b5961c = type;
		qty = 1;
		if(type == 3)
		{
			qty = getplayers().size;
		}
		var_9994cd6e = 5;
		while(qty)
		{
			if(var_9994cd6e > 0 && distancesquared(var_4b444556.origin, spot.origin) < sqr(512))
			{
				spot = var_9bb0a315[randomint(var_9bb0a315.size)];
				waitframe(1);
				var_9994cd6e--;
				continue;
			}
			var_4b444556 = spot;
			radius = spot.radius;
			if(!isdefined(radius))
			{
				radius = 0;
			}
			doa_pickups::function_83aea294(spot.origin, 1, radius, var_4d842336);
			qty--;
			spot = var_9bb0a315[randomint(var_9bb0a315.size)];
			var_9994cd6e = 5;
		}
		wait(randomfloatrange(minwait, maxwait));
	}
}

/*
	Name: function_17e79564
	Namespace: namespace_8c04284b
	Checksum: 0x20571AFD
	Offset: 0x8CE8
	Size: 0x2D8
	Parameters: 0
	Flags: None
*/
function function_17e79564()
{
	self notify("6738e4dc3a868713");
	self endon("6738e4dc3a868713");
	level endon(#"arena_completed");
	level endon(#"game_over");
	level endon(#"hash_1cf1c429bb1c9a07");
	wait(5);
	minwait = 30;
	maxwait = 40;
	nextweapon = 0;
	var_e36d70e2 = undefined;
	var_d7f489eb = array::randomize(arraycombine([[ level.doa.var_39e3fa99 ]]->function_8054e011(), [[ level.doa.var_39e3fa99 ]]->function_c0402c8a()));
	var_9a572c4e = 0;
	while(true)
	{
		if(isdefined(var_e36d70e2))
		{
			if(gettime() > var_e36d70e2)
			{
				while([[ level.doa.var_39e3fa99 ]]->ispaused())
				{
					wait(1);
				}
			}
		}
		else if([[ level.doa.var_39e3fa99 ]]->ispaused())
		{
			var_e36d70e2 = gettime() + 30000;
		}
		if(gettime() > nextweapon)
		{
			if(isdefined(level.doa.var_cfa10fcf))
			{
				qty = level.doa.var_cfa10fcf;
				level.doa.var_cfa10fcf = undefined;
			}
			else
			{
				qty = 1;
				if(randomint(100) > 98)
				{
					qty = qty + randomint(3);
				}
			}
			def = doa_pickups::function_57160cba(6);
			spot = var_d7f489eb[var_9a572c4e];
			var_9a572c4e++;
			if(var_9a572c4e >= var_d7f489eb.size)
			{
				var_9a572c4e = 0;
			}
			radius = spot.radius;
			if(!isdefined(radius))
			{
				radius = 36;
			}
			doa_pickups::function_83aea294(spot.origin, qty, radius, def);
			nextweapon = gettime() + (randomintrange(minwait, maxwait) * 1000);
		}
		waitframe(1);
	}
}

/*
	Name: function_80bb0f94
	Namespace: namespace_8c04284b
	Checksum: 0x602A7A75
	Offset: 0x8FC8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_80bb0f94(name)
{
	return true;
}

/*
	Name: function_1b42a0bb
	Namespace: namespace_8c04284b
	Checksum: 0x4D86C2
	Offset: 0x8FE0
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function function_1b42a0bb()
{
	self notify("1a41bf1e9493063e");
	self endon("1a41bf1e9493063e");
	level endon(#"arena_completed");
	level endon(#"game_over");
	if((function_80bb0f94([[ level.doa.var_39e3fa99 ]]->getname())) == 0)
	{
		return;
	}
	while(true)
	{
		while(!is_true(level.doa.var_a6cd0cb7) && (isdefined(level.doa.var_39e3fa99) && [[ level.doa.var_39e3fa99 ]]->ispaused()) || isdefined(level.doa.var_6f3d327))
		{
			wait(1);
		}
		level.doa.var_11623c49--;
		if(level.doa.var_11623c49 <= 0)
		{
			level.doa.var_a6cd0cb7 = undefined;
			level function_8f63849();
			while(isdefined(level.doa.weaponcharger))
			{
				wait(1);
			}
			level.doa.var_11623c49 = randomintrange(200, 600);
		}
		wait(1);
	}
}

/*
	Name: function_8f63849
	Namespace: namespace_8c04284b
	Checksum: 0xEC1C822
	Offset: 0x91A0
	Size: 0x354
	Parameters: 0
	Flags: None
*/
function function_8f63849()
{
	self notify("165decddaa9c07bf");
	self endon("165decddaa9c07bf");
	level endon(#"arena_completed");
	level endon(#"game_over");
	if(isdefined(level.doa.weaponcharger))
	{
		level.doa.weaponcharger delete();
	}
	spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745();
	var_d6e32de9 = [[ level.doa.var_39e3fa99 ]]->function_70fb5745(spot.origin, 24, 256);
	if(isdefined(var_d6e32de9))
	{
		def = doa_pickups::function_57160cba(6);
		doa_pickups::function_83aea294(var_d6e32de9.origin, 1, 8, def);
	}
	origin = namespace_ec06fe4a::function_65ee50ba(spot.origin) + vectorscale((0, 0, 1), 6);
	var_70527f67 = namespace_ec06fe4a::function_e22ae9b3(origin + (vectorscale((0, 0, -1), 115)), "zombietron_weapon_charging_pad");
	if(isdefined(var_70527f67))
	{
		var_70527f67.targetname = "weaponCharger";
		var_70527f67 solid();
		var_70527f67 namespace_83eb6304::function_3ecfde67("glow_yellow");
		var_70527f67.juice = 120;
		var_70527f67 moveto(origin, 1.5);
		var_70527f67 waittill(#"movedone");
		var_70527f67 connectpaths();
		var_70527f67.trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", origin + (vectorscale((0, 0, -1), 20)), 0, 20, 72);
		var_70527f67 namespace_83eb6304::function_3ecfde67("weaponChargerActive");
		var_70527f67 namespace_e32bb68::function_3a59ec34("evt_doa_weapon_charge_start");
		var_70527f67 namespace_e32bb68::function_3a59ec34("evt_doa_weapon_charge_lp");
		level.doa.weaponcharger = var_70527f67;
		level.doa.weaponcharger thread function_6aa1d6a();
		level.doa.weaponcharger thread function_b0a158d7();
		level.doa.weaponcharger thread function_f39d5561();
	}
}

/*
	Name: function_b0a158d7
	Namespace: namespace_8c04284b
	Checksum: 0x92C98511
	Offset: 0x9500
	Size: 0x3D0
	Parameters: 0
	Flags: None
*/
function function_b0a158d7()
{
	self endon(#"death");
	if(!isdefined(self.trigger))
	{
		level notify(#"hash_bc1b9c6675b1faa");
		return;
	}
	var_666e15ce = 150;
	def = doa_pickups::function_2c9923d7(36);
	var_7cc1c2b2 = array(def, def, def, def);
	while(self.juice > 0 && isdefined(self.trigger))
	{
		players = namespace_7f5aeb59::function_23e1f90f();
		foreach(player in players)
		{
			entnum = player.doa.entnum;
			player.doa.var_57eaec6e = 0;
			if(player istouching(self.trigger))
			{
				if(is_true(player.laststand))
				{
					continue;
				}
				if(player.doa.weaponlevel == 2 && player.doa.var_d8955419 == 1024)
				{
					continue;
				}
				player.doa.var_57eaec6e = 1;
				if(player.doa.weaponlevel == 0)
				{
					player.doa.var_d8955419 = 1024;
				}
				switch(player.doa.weaponlevel)
				{
					case 0:
					{
						type = 36;
						glow = "glow_white";
						break;
					}
					case 1:
					{
						type = 37;
						glow = "glow_red";
						break;
					}
					case 2:
					{
						type = 38;
						glow = "glow_blue";
						break;
					}
				}
				if(type === ([[ var_7cc1c2b2[entnum] ]]->function_5ce4fb28()))
				{
					def = var_7cc1c2b2[entnum];
				}
				else
				{
					def = doa_pickups::function_2c9923d7(type);
					var_7cc1c2b2[entnum] = def;
				}
				doa_pickups::itemspawn(def, player.origin, player.angles, undefined, 1, glow, undefined, undefined, player, 0);
				player.doa.var_6b4163f1 = 0;
				self.juice = self.juice - 5;
			}
		}
		wait(1);
	}
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	level notify(#"hash_bc1b9c6675b1faa");
}

/*
	Name: function_f39d5561
	Namespace: namespace_8c04284b
	Checksum: 0xD5954230
	Offset: 0x98D8
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_f39d5561()
{
	self endon(#"death");
	wait(30);
	level notify(#"hash_bc1b9c6675b1faa");
}

/*
	Name: function_6aa1d6a
	Namespace: namespace_8c04284b
	Checksum: 0xA94606E5
	Offset: 0x9910
	Size: 0x26C
	Parameters: 0
	Flags: None
*/
function function_6aa1d6a()
{
	self endon(#"death");
	level waittill(#"arena_completed", #"game_over", #"exit_taken", #"hash_bc1b9c6675b1faa", #"round_over", #"hash_7ebdbe412d2fed17");
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	wait(1);
	self namespace_83eb6304::turnofffx("weaponChargerActive");
	self namespace_e32bb68::function_ae271c0b("evt_doa_weapon_charge_lp");
	self namespace_83eb6304::function_3ecfde67("weaponChargerDone");
	self namespace_e32bb68::function_3a59ec34("evt_doa_weapon_charge_end");
	self moveto(self.origin + (vectorscale((0, 0, -1), 115)), 1.5);
	self waittill(#"movedone");
	self connectpaths();
	self namespace_83eb6304::turnofffx("weaponChargerActive");
	level.doa.weaponcharger = undefined;
	players = namespace_7f5aeb59::function_23e1f90f();
	foreach(player in players)
	{
		player.doa.var_57eaec6e = 0;
	}
	self delete();
}

/*
	Name: function_81282ad3
	Namespace: namespace_8c04284b
	Checksum: 0x4C5015A9
	Offset: 0x9B88
	Size: 0x34E
	Parameters: 2
	Flags: None
*/
function function_81282ad3(delay, infinite)
{
	if(!isdefined(delay))
	{
		delay = 0;
	}
	if(!isdefined(infinite))
	{
		infinite = 0;
	}
	self notify("30f25fa7f69bd821");
	self endon("30f25fa7f69bd821");
	level endon(#"game_over");
	level endon(#"round_over");
	level flag::set("doa_round_spawning");
	level flag::clear("doa_round_over");
	if(delay > 0)
	{
		wait(delay);
	}
	starttime = gettime();
	if(level flag::get("challenge_round_spawnOverride"))
	{
		level flag::wait_till_clear("challenge_round_spawnOverride");
	}
	else
	{
		namespace_1e25ad94::debugmsg((((("Round " + level.doa.roundnumber) + " starting at: ") + starttime) + " Waves expected: ") + level.doa.var_9a86a331.size);
		level.doa.var_aa7fba18 = level.doa.var_9a86a331.size;
		do
		{
			for(wave = 0; wave < level.doa.var_9a86a331.size; wave++)
			{
				while(level flag::get("doa_round_paused") || is_true(level.hostmigrationtimer))
				{
					waitframe(1);
				}
				if(level flag::get("doa_game_is_over"))
				{
					break;
				}
				level thread function_a87190c4(level.doa.var_9a86a331[wave]);
				wait(level.doa.var_9a86a331[wave].time_till_next_group);
			}
		}
		while(infinite);
	}
	while(level.doa.var_aa7fba18 > 0 || level.doa.var_dcbded2.size)
	{
		wait(1);
	}
	endtime = gettime();
	namespace_1e25ad94::debugmsg((("Round " + level.doa.roundnumber) + " took (") + ((endtime - starttime) / 1000) + ") seconds to complete.");
	level flag::clear("doa_round_spawning");
	level.doa.var_9a86a331 = [];
}

/*
	Name: function_24058346
	Namespace: namespace_8c04284b
	Checksum: 0xFBA83736
	Offset: 0x9EE0
	Size: 0x242
	Parameters: 1
	Flags: None
*/
function function_24058346(spot)
{
	if(level.doa.var_a77e4601.size)
	{
		var_7a8f2a62 = level.doa.var_a77e4601[randomint(level.doa.var_a77e4601.size)];
	}
	else
	{
		var_7a8f2a62 = level.doa.var_329c97a3[randomint(level.doa.var_329c97a3.size)];
	}
	if(var_7a8f2a62 != level.doa.var_65a70dc)
	{
		if([[ var_7a8f2a62 ]]->function_baae6c9d([[ level.doa.var_39e3fa99 ]]->getname()))
		{
			var_7a8f2a62 = level.doa.var_65a70dc;
		}
		var_9d97ad8e = [[ var_7a8f2a62 ]]->function_7f3e577e(level.doa.var_3e7292fc) || (gettime() - ([[ level.doa.var_39e3fa99 ]]->function_55916d40())) > 15000;
		if(!isinarray(level.doa.var_a77e4601, var_7a8f2a62) && var_9d97ad8e == 0)
		{
			var_7a8f2a62 = level.doa.var_65a70dc;
		}
		if(([[ var_7a8f2a62 ]]->canspawn()) == 0)
		{
			var_7a8f2a62 = level.doa.var_65a70dc;
		}
		if(var_7a8f2a62 != level.doa.var_65a70dc)
		{
			[[ level.doa.var_39e3fa99 ]]->function_b2f9e813();
		}
	}
	return doa_enemy::function_4e8ae191(var_7a8f2a62, 1, spot.origin, 0, undefined, undefined, undefined, level.doa.var_39e3fa99);
}

/*
	Name: function_a87190c4
	Namespace: namespace_8c04284b
	Checksum: 0xF9DDF4B3
	Offset: 0xA130
	Size: 0x1A0
	Parameters: 1
	Flags: None
*/
function function_a87190c4(wave)
{
	level endon(#"round_over");
	level endon(#"game_over");
	endtime = gettime() + (wave.spawn_duration * 1000);
	while(gettime() < endtime || wave.var_3ed31a82 > 0)
	{
		while(level flag::get("doa_round_paused") || is_true(level.hostmigrationtimer))
		{
			waitframe(1);
		}
		if(level flag::get("doa_game_is_over"))
		{
			break;
		}
		if(is_true(level.hostmigrationtimer))
		{
			waitframe(1);
			continue;
		}
		wait(0.35);
		spot = [[ level.doa.var_39e3fa99 ]]->function_21d1be3d(wave.spawn_side);
		ai = function_24058346(spot);
		if(isdefined(ai))
		{
			wave.var_3ed31a82--;
		}
	}
	level.doa.var_aa7fba18--;
	wave notify(#"hash_6af26e86a712142f");
}

/*
	Name: function_3d25cb06
	Namespace: namespace_8c04284b
	Checksum: 0x93047468
	Offset: 0xA2D8
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function function_3d25cb06(roundnumber)
{
	if(!isdefined(roundnumber))
	{
		roundnumber = level.doa.roundnumber;
	}
	level.doa.var_9a86a331 = [];
	max = 30 + (level.doa.var_6c58d51 * 30);
	waves = 6 + (int(roundnumber * 1.2));
	if(waves > max)
	{
		waves = max;
	}
	for(i = 0; i < waves; i++)
	{
		level.doa.var_9a86a331[i] = function_2419e70a(i, roundnumber);
	}
}

/*
	Name: function_7802d126
	Namespace: namespace_8c04284b
	Checksum: 0x624C7113
	Offset: 0xA3D0
	Size: 0x9A
	Parameters: 0
	Flags: None
*/
function function_7802d126()
{
	switch(randomint(4))
	{
		case 0:
		{
			return "bottom";
			break;
		}
		case 1:
		{
			return "top";
			break;
		}
		case 2:
		{
			return "right";
			break;
		}
		case 3:
		{
			return "left";
			break;
		}
	}
}

/*
	Name: function_d60e0e9a
	Namespace: namespace_8c04284b
	Checksum: 0xFA1354F6
	Offset: 0xA478
	Size: 0x92
	Parameters: 1
	Flags: None
*/
function function_d60e0e9a(side)
{
	switch(side)
	{
		case "top":
		{
			return "bottom";
			break;
		}
		case "bottom":
		{
			return "top";
			break;
		}
		case "left":
		{
			return "right";
			break;
		}
		case "right":
		{
			return "left";
			break;
		}
	}
}

/*
	Name: function_2419e70a
	Namespace: namespace_8c04284b
	Checksum: 0xD8E62E56
	Offset: 0xA518
	Size: 0x13A
	Parameters: 2
	Flags: Private
*/
function private function_2419e70a(wave_number, round_number)
{
	wave = spawnstruct();
	wave.spawn_duration = (1 + (randomfloatrange(0, 1 + (wave_number * 0.3)))) + (randomfloatrange(0, 1 + (round_number * 0.2)));
	wave.spawn_side = function_7802d126();
	wave.time_till_next_group = 1 + (randomfloatrange(wave.spawn_duration * 0.3, wave.spawn_duration * 0.9));
	wave.var_3ed31a82 = int((wave.spawn_duration / 0.35) * 0.35);
	wave.var_517688b4 = wave_number;
	return wave;
}

/*
	Name: function_3af22009
	Namespace: namespace_8c04284b
	Checksum: 0x112F7B0B
	Offset: 0xA660
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_3af22009()
{
	if(!isdefined(self.endtime))
	{
		return 0;
	}
	return gettime() > self.endtime || self.var_3ed31a82 <= 0;
}

/*
	Name: function_67a3bb43
	Namespace: namespace_8c04284b
	Checksum: 0x4E7AD5D6
	Offset: 0xA698
	Size: 0x46E
	Parameters: 0
	Flags: None
*/
function function_67a3bb43()
{
	level endon(#"round_over");
	level endon(#"game_over");
	self notify("73b9fc35bfe3e292");
	self endon("73b9fc35bfe3e292");
	result = undefined;
	result = self waittill(#"hash_b1f03f83d7dde45");
	if(!isdefined(self.starttime))
	{
		self.starttime = gettime();
		self.endtime = self.starttime + (self.spawn_duration * 1000);
	}
	while(!self function_3af22009())
	{
		self.groupnumber = result.groupnumber;
		self.wanted = result.wanted;
		while(self.wanted > 0)
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_21d1be3d(self.spawn_side);
			if(level.doa.var_a77e4601.size)
			{
				var_7a8f2a62 = level.doa.var_a77e4601[randomint(level.doa.var_a77e4601.size)];
				var_7d992156 = 1;
			}
			else
			{
				var_7a8f2a62 = level.doa.var_329c97a3[randomint(level.doa.var_329c97a3.size)];
				var_7d992156 = undefined;
			}
			qty = self.wanted;
			if(var_7a8f2a62 != level.doa.var_65a70dc)
			{
				if([[ var_7a8f2a62 ]]->function_baae6c9d([[ level.doa.var_39e3fa99 ]]->getname()))
				{
					var_7a8f2a62 = level.doa.var_65a70dc;
				}
				var_9d97ad8e = [[ var_7a8f2a62 ]]->function_7f3e577e(level.doa.var_3e7292fc) || (gettime() - ([[ level.doa.var_39e3fa99 ]]->function_55916d40())) > 15000;
				if(!isinarray(level.doa.var_a77e4601, var_7a8f2a62) && var_9d97ad8e == 0)
				{
					var_7a8f2a62 = level.doa.var_65a70dc;
				}
				if(([[ var_7a8f2a62 ]]->canspawn()) == 0)
				{
					var_7a8f2a62 = level.doa.var_65a70dc;
				}
				if(var_7a8f2a62 != level.doa.var_65a70dc)
				{
					[[ level.doa.var_39e3fa99 ]]->function_b2f9e813();
					if(!is_true(var_7d992156))
					{
						qty = 1;
					}
				}
			}
			self.var_3ed31a82 = self.var_3ed31a82 - qty;
			self.wanted = self.wanted - qty;
			doa_enemy::function_a6b807ea(var_7a8f2a62, qty, spot.origin, 0, undefined, undefined, undefined, level.doa.var_39e3fa99, self.groupnumber, 0, self.endtime);
			wait(randomfloatrange(0.5, 2));
		}
		/#
			if(is_true(level.doa.var_2409dcb5))
			{
				level thread namespace_1e25ad94::debugline(spot.origin, [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1(), self.var_7f9fdec7, (1, 0, 0));
			}
		#/
	}
	self.var_f5a8d3a4 = 1;
}

/*
	Name: function_9e0d71e5
	Namespace: namespace_8c04284b
	Checksum: 0xCEC049D8
	Offset: 0xAB10
	Size: 0x7C4
	Parameters: 0
	Flags: None
*/
function function_9e0d71e5()
{
	self notify("57ae2dcd9d813f12");
	self endon("57ae2dcd9d813f12");
	level endon(#"game_over");
	level endon(#"round_over");
	level flag::set("doa_round_spawning");
	level flag::clear("doa_round_over");
	starttime = gettime();
	var_d517bf3a = 1;
	if(level flag::get("challenge_round_spawnOverride"))
	{
		level flag::wait_till_clear("challenge_round_spawnOverride");
		var_d517bf3a = level.doa.var_6c58d51 > 0;
	}
	if(var_d517bf3a)
	{
		namespace_1e25ad94::debugmsg((((("Round " + level.doa.roundnumber) + " starting at: ") + starttime) + " Waves expected: ") + level.doa.var_9a86a331.size);
		level.doa.var_aa7fba18 = level.doa.var_9a86a331.size;
		for(wave = 0; wave < level.doa.var_9a86a331.size; wave++)
		{
			[[ level.doa.var_39e3fa99 ]]->function_25962665(level.doa.var_9a86a331[wave]);
		}
		level.doa.var_9a86a331 = [];
		var_68280a24 = [[ level.doa.var_39e3fa99 ]]->function_cc773c53();
		var_fe3c2d16 = [[ level.doa.var_39e3fa99 ]]->function_786b9d39();
		waves = [];
		waves[#"top"] = [[ level.doa.var_39e3fa99 ]]->function_ee30f092("top");
		if(isdefined(waves[#"top"]))
		{
			waves[#"top"] thread function_67a3bb43();
		}
		waves[#"bottom"] = [[ level.doa.var_39e3fa99 ]]->function_ee30f092("bottom");
		if(isdefined(waves[#"bottom"]))
		{
			waves[#"bottom"] thread function_67a3bb43();
		}
		waves[#"left"] = [[ level.doa.var_39e3fa99 ]]->function_ee30f092("left");
		if(isdefined(waves[#"left"]))
		{
			waves[#"left"] thread function_67a3bb43();
		}
		waves[#"right"] = [[ level.doa.var_39e3fa99 ]]->function_ee30f092("right");
		if(isdefined(waves[#"right"]))
		{
			waves[#"right"] thread function_67a3bb43();
		}
		done = 0;
		groupnumber = 100;
		while(!done)
		{
			waves = array::randomize(waves);
			foreach(wave in waves)
			{
				wave notify(#"hash_b1f03f83d7dde45", {#wanted:randomintrange(var_68280a24, var_fe3c2d16), #groupnumber:groupnumber});
				level.doa.var_aa7fba18 = math::clamp(level.doa.var_aa7fba18 - 1, 0, level.doa.var_aa7fba18);
				groupnumber++;
				while(wave.time_till_next_group > 0)
				{
					wait(0.2);
					wave.time_till_next_group = wave.time_till_next_group - 0.2;
				}
			}
			waitframe(1);
			done = 1;
			var_77fcdba0 = [];
			foreach(wave in waves)
			{
				var_96fd970d = undefined;
				if(is_true(wave.var_f5a8d3a4))
				{
					var_96fd970d = [[ level.doa.var_39e3fa99 ]]->function_ee30f092(wave.spawn_side);
					if(isdefined(var_96fd970d))
					{
						var_96fd970d thread function_67a3bb43();
						if(!isdefined(var_77fcdba0))
						{
							var_77fcdba0 = [];
						}
						else if(!isarray(var_77fcdba0))
						{
							var_77fcdba0 = array(var_77fcdba0);
						}
						var_77fcdba0[var_77fcdba0.size] = var_96fd970d;
					}
					continue;
				}
				if(!isdefined(var_77fcdba0))
				{
					var_77fcdba0 = [];
				}
				else if(!isarray(var_77fcdba0))
				{
					var_77fcdba0 = array(var_77fcdba0);
				}
				var_77fcdba0[var_77fcdba0.size] = wave;
			}
			waves = var_77fcdba0;
			if(waves.size)
			{
				done = 0;
			}
		}
	}
	level flag::clear("doa_round_spawning");
	level notify(#"hash_7ebdbe412d2fed17");
	wait(1);
	while(level.doa.var_dcbded2.size)
	{
		waitframe(1);
	}
	endtime = gettime();
	namespace_1e25ad94::debugmsg((("Round " + level.doa.roundnumber) + " took (") + ((endtime - starttime) / 1000) + ") seconds to complete.");
}

/*
	Name: function_53678480
	Namespace: namespace_8c04284b
	Checksum: 0x4CBD59C0
	Offset: 0xB2E0
	Size: 0x1D6
	Parameters: 0
	Flags: None
*/
function function_53678480()
{
	avail = [];
	if(level.doa.var_23ce73 & 1)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = "top";
	}
	if(level.doa.var_23ce73 & 2)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = "left";
	}
	if(level.doa.var_23ce73 & 4)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = "right";
	}
	if(level.doa.var_23ce73 & 8)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = "bottom";
	}
	return avail;
}

/*
	Name: function_32d53491
	Namespace: namespace_8c04284b
	Checksum: 0x6335888B
	Offset: 0xB4C0
	Size: 0x1D2
	Parameters: 0
	Flags: None
*/
function function_32d53491()
{
	avail = [];
	if((level.doa.var_23ce73 & 1) == 0)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = 1;
	}
	if((level.doa.var_23ce73 & 2) == 0)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = 2;
	}
	if((level.doa.var_23ce73 & 4) == 0)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = 4;
	}
	if((level.doa.var_23ce73 & 8) == 0)
	{
		if(!isdefined(avail))
		{
			avail = [];
		}
		else if(!isarray(avail))
		{
			avail = array(avail);
		}
		avail[avail.size] = 8;
	}
	return avail;
}

/*
	Name: function_a30ab289
	Namespace: namespace_8c04284b
	Checksum: 0x508C9EF6
	Offset: 0xB6A0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_a30ab289(side)
{
	switch(side)
	{
		case "top":
		{
			return 1;
		}
		case "left":
		{
			return 2;
		}
		case "right":
		{
			return 4;
		}
		case "bottom":
		{
			return 8;
		}
	}
	return 0;
}

/*
	Name: function_dc848b36
	Namespace: namespace_8c04284b
	Checksum: 0x9F5C735C
	Offset: 0xB728
	Size: 0x1D0
	Parameters: 1
	Flags: None
*/
function function_dc848b36(side)
{
	level endon(#"game_over", #"round_over");
	var_612922db = function_a30ab289(side);
	while(level flag::get("doa_round_spawning"))
	{
		while(level flag::get("doa_round_paused") || is_true(level.hostmigrationtimer))
		{
			waitframe(1);
		}
		if(level.doa.var_23ce73 & var_612922db)
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_21d1be3d(side);
			ai = function_24058346(spot);
			if(isdefined(ai))
			{
				level.doa.var_3ed31a82 = math::clamp(level.doa.var_3ed31a82 - 1, 0, level.doa.var_3ed31a82);
				wait(0.35);
			}
			else
			{
				wait(randomfloatrange(0.15, 0.35));
			}
		}
		else
		{
			wait(randomfloatrange(0.15, 0.5));
		}
	}
}

/*
	Name: function_870f7b82
	Namespace: namespace_8c04284b
	Checksum: 0x5BAACE0C
	Offset: 0xB900
	Size: 0x298
	Parameters: 1
	Flags: None
*/
function function_870f7b82(probability)
{
	level endon(#"game_over", #"round_over");
	probability = math::clamp(probability, 0, 100);
	if(probability == 0)
	{
		return;
	}
	var_912bdf32 = getdvarint(#"hash_3679fe3f1521db3d", 5);
	var_c7befab = getdvarint(#"hash_2b73855c34966f6b", 12);
	minwaittime = getdvarint(#"hash_2209051f3a7463fc", 1);
	maxwaittime = getdvarint(#"hash_7150d4531dfb10c6", 5);
	var_5689c058 = undefined;
	while(level flag::get("doa_round_spawning"))
	{
		if(randomint(100) < probability)
		{
			var_49261ce3 = function_32d53491();
			if(var_49261ce3.size)
			{
				if(isdefined(var_5689c058) && var_49261ce3.size > 1 && isinarray(var_49261ce3, var_5689c058))
				{
					arrayremovevalue(var_49261ce3, var_5689c058);
				}
				var_5689c058 = var_49261ce3[randomint(var_49261ce3.size)];
				level.doa.var_23ce73 = level.doa.var_23ce73 | var_5689c058;
				var_936be0c2 = randomfloatrange(var_912bdf32, var_c7befab);
				wait(var_936be0c2);
				level.doa.var_23ce73 = level.doa.var_23ce73 & (~var_5689c058);
			}
		}
		wait(randomfloatrange(minwaittime, maxwaittime));
	}
}

/*
	Name: function_cc48fee6
	Namespace: namespace_8c04284b
	Checksum: 0x393EB648
	Offset: 0xBBA0
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_cc48fee6()
{
	var_30d7b69b = {};
	var_30d7b69b.var_dcf9fac7 = getdvarint(#"hash_4c0888d26878c503", 3);
	var_30d7b69b.var_39a29169 = getdvarint(#"hash_6bb8a71eee3d3d15", 47);
	var_30d7b69b.var_5bb9bdea = 0;
	probability = 100;
	for(var_dcf9fac7 = var_30d7b69b.var_dcf9fac7; var_dcf9fac7; var_dcf9fac7--)
	{
		var_30d7b69b.var_5bb9bdea = var_30d7b69b.var_5bb9bdea + (int(level.doa.var_8bf23c51 * (probability / 100)));
		probability = math::clamp(probability - var_30d7b69b.var_39a29169, 5, 100);
	}
	return var_30d7b69b;
}

/*
	Name: function_70a9cb95
	Namespace: namespace_8c04284b
	Checksum: 0xC3C186DC
	Offset: 0xBCC0
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_70a9cb95(var_30d7b69b)
{
	level.doa.var_23ce73 = 0;
	var_dcf9fac7 = var_30d7b69b.var_dcf9fac7;
	var_39a29169 = var_30d7b69b.var_39a29169;
	probability = 100;
	while(var_dcf9fac7)
	{
		level thread function_870f7b82(probability);
		probability = probability - var_39a29169;
		var_dcf9fac7--;
	}
	level thread function_dc848b36("top");
	level thread function_dc848b36("left");
	level thread function_dc848b36("right");
	level thread function_dc848b36("bottom");
}

/*
	Name: function_c8462f96
	Namespace: namespace_8c04284b
	Checksum: 0xB7AB761A
	Offset: 0xBDD0
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_c8462f96()
{
	level.doa.var_8f91d36b = 0;
	level.doa.var_3ed31a82 = 0;
}

/*
	Name: function_7655afe
	Namespace: namespace_8c04284b
	Checksum: 0xFE9C43EB
	Offset: 0xBE08
	Size: 0x44C
	Parameters: 0
	Flags: None
*/
function function_7655afe()
{
	self notify("12ad1ef4f73a4594");
	self endon("12ad1ef4f73a4594");
	level endon(#"game_over", #"round_over");
	level flag::set("doa_round_spawning");
	level flag::clear("doa_round_over");
	starttime = gettime();
	var_d517bf3a = 1;
	if(level flag::get("challenge_round_spawnOverride"))
	{
		level.doa.var_3ed31a82 = 0;
		level flag::wait_till_clear("challenge_round_spawnOverride");
		var_d517bf3a = level.doa.var_6c58d51 > 0;
	}
	if(var_d517bf3a)
	{
		level.doa.var_8bf23c51 = (20 + (level.doa.roundnumber * 2.5)) + (180 * level.doa.var_6c58d51);
		var_319ab9be = function_cc48fee6();
		level function_70a9cb95(var_319ab9be);
		level.doa.var_3ed31a82 = int((var_319ab9be.var_5bb9bdea / 0.35) * 0.35);
		level.doa.var_8f91d36b = starttime + (level.doa.var_8bf23c51 * 1000);
		quarter = (level.doa.var_8bf23c51 / 4) * 1000;
		var_1ba263be = starttime + quarter;
		var_6889287c = var_1ba263be + quarter;
		var_dc22600b = var_6889287c + quarter;
		level.doa.var_654a3ea9 = 0;
		last = starttime;
		do
		{
			wait(1);
			time = gettime();
			if(time > level.doa.var_8f91d36b && level.doa.var_3ed31a82 > 0)
			{
				level.doa.var_654a3ea9++;
			}
			if(last < var_1ba263be && time >= var_1ba263be)
			{
				level notify(#"hash_5b8b8bf728571b12");
			}
			if(last < var_6889287c && time >= var_6889287c)
			{
				level notify(#"hash_73d11f98f78c29be");
			}
			if(last < var_dc22600b && time >= var_dc22600b)
			{
				level notify(#"hash_c57f3f18a005e45");
			}
			last = time;
		}
		while(time < level.doa.var_8f91d36b || level.doa.var_3ed31a82 > 0);
	}
	level.doa.var_23ce73 = 0;
	level flag::clear("doa_round_spawning");
	level notify(#"hash_7ebdbe412d2fed17");
	wait(1);
	while(level.doa.var_dcbded2.size)
	{
		waitframe(1);
	}
	endtime = gettime();
	namespace_1e25ad94::debugmsg((("Round " + level.doa.roundnumber) + " took (") + ((endtime - starttime) / 1000) + ") seconds to complete.");
}

/*
	Name: function_41e097fc
	Namespace: namespace_8c04284b
	Checksum: 0xAA4EB6D9
	Offset: 0xC260
	Size: 0x244
	Parameters: 1
	Flags: None
*/
function function_41e097fc(var_e1dd1170)
{
	level notify(#"round_over");
	level notify(#"arena_completed");
	level.doa.var_3ec3c9aa = 1;
	namespace_ec06fe4a::function_de70888a();
	level namespace_ec06fe4a::function_b6b79fd1();
	namespace_ec06fe4a::clearallcorpses();
	level thread namespace_7f5aeb59::function_67f054d7();
	level waittill(#"hash_1b322de3d2e3e781");
	if(isdefined(level.doa.var_39e3fa99))
	{
		[[ level.doa.var_39e3fa99 ]]->function_9f494a87();
		[[ level.doa.var_39e3fa99 ]]->function_7ce9bb97();
		[[ level.doa.var_39e3fa99 ]]->deactivate();
	}
	level notify(#"arena_completed");
	level.doa.var_23fd3659 = var_e1dd1170;
	level.doa.var_f4cf4e3 = function_f15b9f04(level.doa.var_23fd3659 * 4);
	level.doa.zombie_health = function_962e9d92(level.doa.var_23fd3659 * 4);
	namespace_4dae815d::function_e22d3978(level.doa.var_23fd3659 * 4);
	namespace_250e9486::function_d1bc3f11(level.doa.roundnumber, 1);
	level thread function_6d6bfe1f(level.doa.var_23fd3659);
}

