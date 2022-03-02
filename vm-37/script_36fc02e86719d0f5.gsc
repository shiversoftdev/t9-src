#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2474a362752098d2;
#using script_2a5bf5b4a00cee0d;
#using script_2c9915120c137848;
#using script_3bbf85ab4cb9f3c2;
#using script_3faf478d5b0850fe;
#using script_40f967ad5d18ea74;
#using script_4611af4073d18808;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5549681e1669c11a;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_634ae70c663d1cc9;
#using script_683a55734f15d50e;
#using script_68cdf0ca5df5e;
#using script_6b6510e124bad778;
#using script_74a56359b7d02ab6;
#using script_77357b2d180aa2b8;
#using script_774302f762d76254;
#using script_f38dc50f0e82277;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

class class_744b99c 
{
	var var_45e27b4f;
	var var_af599afa;
	var target;
	var doa;
	var m_name;
	var var_6c9ec3e8;
	var visited;
	var script_noteworthy;
	var var_be31d6d6;
	var var_af27fdee;
	var var_2a0f52f3;
	var var_3fe6d9f7;
	var var_a1fa7529;
	var var_c7395a06;
	var var_a26d9c0d;
	var var_767ea0af;
	var var_e2a6dd61;
	var var_622da539;
	var var_7c1b05a1;
	var var_486c1553;

	/*
		Name: constructor
		Namespace: namespace_744b99c
		Checksum: 0xECFC710E
		Offset: 0x668
		Size: 0xC2
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_be31d6d6 = undefined;
		self.var_af599afa = undefined;
		self.m_name = undefined;
		self.var_45e27b4f = [];
		self.var_dc9b8143 = [];
		self.var_2a0f52f3 = [];
		self.var_7c1b05a1 = undefined;
		self.var_a1fa7529 = [];
		self.var_767ea0af = [];
		self.var_af27fdee = [];
		self.var_6c9ec3e8 = undefined;
		self.var_c7395a06 = undefined;
		self.var_e2a6dd61 = [];
		self.var_3fe6d9f7 = [];
		self.var_486c1553 = undefined;
		self.var_622da539 = undefined;
	}

	/*
		Name: destructor
		Namespace: namespace_744b99c
		Checksum: 0x263CA800
		Offset: 0x738
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
		deactivate();
	}

	/*
		Name: function_1137c8bb
		Namespace: namespace_744b99c
		Checksum: 0x3455792A
		Offset: 0x2970
		Size: 0xB0
		Parameters: 0
		Flags: Linked
	*/
	function function_1137c8bb()
	{
		objective_setstate(12, "invisible");
		foreach(exit in var_45e27b4f)
		{
			exit clientfield::set("set_icon", 0);
		}
	}

	/*
		Name: function_1e9525b8
		Namespace: namespace_744b99c
		Checksum: 0x9FB6631E
		Offset: 0xDF0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_1e9525b8()
	{
		return var_af599afa;
	}

	/*
		Name: function_226986c2
		Namespace: namespace_744b99c
		Checksum: 0xEF69B7B4
		Offset: 0x2CF8
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function function_226986c2()
	{
		self waittill(#"deactivate");
		self triggerenable(0);
	}

	/*
		Name: function_2a41670b
		Namespace: namespace_744b99c
		Checksum: 0xC835875E
		Offset: 0x2D38
		Size: 0x100
		Parameters: 0
		Flags: Linked
	*/
	function function_2a41670b()
	{
		self endon(#"deactivate");
		self triggerenable(1);
		self thread function_226986c2();
		var_d2820900 = struct::get(target, "targetname");
		while(true)
		{
			result = undefined;
			result = self waittill(#"trigger");
			if(isdefined(result.activator) && is_true(result.activator.laststand))
			{
				result.activator setorigin(var_d2820900.origin);
			}
		}
	}

	/*
		Name: function_2c3a3e50
		Namespace: namespace_744b99c
		Checksum: 0xE2D2EFB5
		Offset: 0x2F78
		Size: 0x26E
		Parameters: 1
		Flags: Linked
	*/
	function function_2c3a3e50(trigger)
	{
		self endon(#"disconnect");
		/#
			assert(trigger.script_noteworthy == "");
		#/
		if(!isdefined(doa.var_bb4d9604))
		{
			doa.var_bb4d9604 = [];
		}
		else if(!isarray(doa.var_bb4d9604))
		{
			doa.var_bb4d9604 = array(doa.var_bb4d9604);
		}
		doa.var_bb4d9604[doa.var_bb4d9604.size] = trigger;
		if(!is_true(doa.var_3e81d24c))
		{
			self thread namespace_a4bedd45::function_1f704cee(1);
		}
		else
		{
			self thread namespace_a4bedd45::function_1735c657(1);
		}
		doa.var_4f3aee7b = 1;
		if(!isdefined(doa.var_77c540c8))
		{
			doa.var_77c540c8 = 0;
		}
		doa.var_77c540c8 = 5;
		while(trigger istriggerenabled())
		{
			if(self istouching(trigger))
			{
				doa.var_77c540c8 = 5;
			}
			else
			{
				doa.var_77c540c8--;
				if(doa.var_77c540c8 <= 0)
				{
					break;
				}
			}
			wait(0.5);
		}
		self notify(#"hash_7893364bd228d63e", {#hash_cff8d1e:1});
		arrayremovevalue(doa.var_bb4d9604, trigger);
		doa.var_4f3aee7b = 0;
	}

	/*
		Name: getname
		Namespace: namespace_744b99c
		Checksum: 0xB62B203B
		Offset: 0x26D0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getname()
	{
		return m_name;
	}

	/*
		Name: function_31ca9ed1
		Namespace: namespace_744b99c
		Checksum: 0xCC6D5FD5
		Offset: 0x2700
		Size: 0x32
		Parameters: 0
		Flags: Linked
	*/
	function function_31ca9ed1()
	{
		/#
			assert(isdefined(var_6c9ec3e8));
		#/
		return var_6c9ec3e8.flipcamera;
	}

	/*
		Name: function_33300d38
		Namespace: namespace_744b99c
		Checksum: 0x8B45B6F5
		Offset: 0x31F0
		Size: 0x4EC
		Parameters: 0
		Flags: Linked
	*/
	function function_33300d38()
	{
		self notify("28ddbed95a8be03a");
		self endon("28ddbed95a8be03a");
		self triggerenable(!is_true(visited));
		result = undefined;
		result = self waittill(#"hash_7626a6770055d63c", #"deactivate", #"trigger");
		self triggerenable(0);
		if(result._notify == "trigger")
		{
			if(isdefined(level.doa.var_6f3d327))
			{
				self thread function_33300d38();
				return;
			}
			/#
				assert(isdefined(script_noteworthy), "");
			#/
			room = namespace_5a917022::function_c8892b0f(script_noteworthy);
			/#
				assert(isdefined(room), "" + script_noteworthy);
			#/
			foreach(player in namespace_7f5aeb59::function_23e1f90f())
			{
				player notify(#"hash_279998c5df86c04d");
				player notify(#"hash_7893364bd228d63e");
				if(player === result.activator)
				{
					continue;
				}
				if(!isalive(player) || is_true(player.doa.respawning))
				{
					player namespace_7f5aeb59::function_513831e1();
				}
				if(distancesquared(player.origin, result.activator.origin) > sqr(700))
				{
					player setorigin(result.activator.origin + (randomintrange(-40, 40), randomintrange(-40, 40), 0));
				}
			}
			self.visited = 1;
			level thread namespace_7f5aeb59::function_67f054d7();
			level waittill(#"hash_1b322de3d2e3e781");
			level thread namespace_5a917022::function_898ca25f(room);
			level waittill(#"hash_7dd47c99b7707b1c");
			var_4200bfbf = struct::get_array(target);
			/#
				assert(isdefined(var_4200bfbf) && var_4200bfbf.size >= 4, "");
			#/
			players = namespace_7f5aeb59::function_23e1f90f();
			idx = 0;
			foreach(player in players)
			{
				player setorigin(var_4200bfbf[idx].origin);
				player setplayerangles(var_4200bfbf[idx].angles);
				player clientfield::increment_to_player("resetCamera");
				idx++;
			}
			wait(1);
			level thread namespace_7f5aeb59::function_836aeb74();
		}
	}

	/*
		Name: function_39d2eb74
		Namespace: namespace_744b99c
		Checksum: 0xB734D3D5
		Offset: 0x2588
		Size: 0xE4
		Parameters: 6
		Flags: Linked
	*/
	function function_39d2eb74(loc, var_c9d9522c, chance, count, permanent, scale)
	{
		if(!isdefined(scale))
		{
			scale = 1;
		}
		loc.script_noteworthy = var_c9d9522c;
		loc.chance = chance;
		loc.count = count;
		loc.permanent = permanent;
		loc.activated = 0;
		loc.totalspawned = 0;
		loc.var_82725140 = 0;
		loc.scale = scale;
		loc.canspawn = randomint(100) < loc.chance;
		function_d52481d0(loc);
	}

	/*
		Name: function_39f259cc
		Namespace: namespace_744b99c
		Checksum: 0xD53E355
		Offset: 0x2740
		Size: 0x32
		Parameters: 0
		Flags: Linked
	*/
	function function_39f259cc()
	{
		/#
			assert(isdefined(var_6c9ec3e8));
		#/
		return var_6c9ec3e8.var_9045aedc;
	}

	/*
		Name: function_40ee47dc
		Namespace: namespace_744b99c
		Checksum: 0x82FE7C0F
		Offset: 0x2780
		Size: 0x1E8
		Parameters: 1
		Flags: Linked
	*/
	function function_40ee47dc(section)
	{
		self notify("be68ff4784f763d");
		self endon("be68ff4784f763d");
		teleporter = self;
		if(!isdefined(teleporter))
		{
			return;
		}
		teleporter endon(#"death");
		level endon(#"hash_7626a6770055d63c");
		result = undefined;
		result = teleporter.trigger waittill(#"trigger");
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(player === result.activator)
			{
				continue;
			}
			if(!isalive(player) || is_true(player.doa.respawning))
			{
				player namespace_7f5aeb59::function_513831e1();
			}
			player setorigin(teleporter.origin + (randomintrange(-40, 40), randomintrange(-40, 40), 0));
		}
		level notify(#"hash_7626a6770055d63c");
	}

	/*
		Name: initialize
		Namespace: namespace_744b99c
		Checksum: 0xC9C82007
		Offset: 0x758
		Size: 0x68E
		Parameters: 1
		Flags: Linked
	*/
	function initialize(var_96c645bc)
	{
		self.var_af599afa = var_96c645bc;
		self.m_name = var_96c645bc.script_noteworthy;
		self.var_be31d6d6 = int(var_96c645bc.script_int);
		/#
			assert(isdefined(m_name) && isdefined(var_be31d6d6), "");
		#/
		self.var_6c9ec3e8 = undefined;
		self.var_af27fdee = struct::get_array(var_96c645bc.target);
		/#
			assert(var_af27fdee.size > 0);
		#/
		foreach(section in var_af27fdee)
		{
			section.id = int(section.script_int);
			/#
				assert(isdefined(section.id));
			#/
			section.flipcamera = 0;
			section.var_9045aedc = 1;
			section.var_bb7e005a = struct::get_array(section.target);
			/#
				assert(section.var_bb7e005a.size == 4);
			#/
			/#
				assert(isdefined(section.script_string));
			#/
			params = strtok(section.script_string, ";");
			/#
				assert(params.size >= 2);
			#/
			section.flipcamera = int(params[0]);
			section.var_9045aedc = int(params[1]);
			if(params.size > 2)
			{
				section.exit = struct::get(params[2]);
			}
			if(params.size > 3)
			{
				section.var_b52bc3a8 = params[3];
			}
		}
		self.var_a1fa7529 = arraycombine(getentarray(m_name + "_wild_hazard", "targetname"), struct::get_array(m_name + "_wild_hazard", "targetname"));
		self.var_a26d9c0d = getentarray(m_name + "_wild_forced_zone", "targetname");
		self.var_767ea0af = getentarray(m_name + "_wild_deathWarp", "targetname");
		self.var_2a0f52f3 = struct::get_array(m_name + "_wild_dungeons");
		foreach(var_1c59693d in var_2a0f52f3)
		{
			params = strtok(var_1c59693d.script_parameters, ";");
			/#
				assert(params.size == 7, ("" + m_name) + "");
			#/
			var_1c59693d.name = params[0];
			var_1c59693d.type = params[1];
			var_1c59693d.var_c9569a5c = params[2];
			var_1c59693d.var_27264bb4 = params[3];
			var_1c59693d.var_a69f4ab4 = params[4];
			var_1c59693d.var_efa6dcc2 = params[5];
			var_1c59693d.var_7efce95 = params[6];
			var_1c59693d.var_93ed3009 = struct::get_array(var_1c59693d.name + "_dungeon_player_exits");
			/#
				assert(var_1c59693d.var_93ed3009.size >= 4, "");
			#/
		}
		self.var_7c1b05a1 = struct::get_array(m_name + "_wild_object");
		self.var_c7395a06 = struct::get_array(m_name + "_wild_npc");
		self.var_e2a6dd61 = getentarray(m_name + "_wild_camera_tweak", "targetname");
		self.var_3fe6d9f7 = getentarray(m_name + "_wild_room", "targetname");
		foreach(room in var_3fe6d9f7)
		{
			room.visited = 0;
		}
	}

	/*
		Name: function_464d882c
		Namespace: namespace_744b99c
		Checksum: 0xB6541C5
		Offset: 0x1048
		Size: 0x84
		Parameters: 0
		Flags: Linked
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
		Namespace: namespace_744b99c
		Checksum: 0xB5397B63
		Offset: 0x2B20
		Size: 0xCE
		Parameters: 2
		Flags: Linked
	*/
	function function_4774f263(type, trigger)
	{
		self notify("32a8ef93cbc765ab");
		self endon("32a8ef93cbc765ab");
		self endon(#"disconnect");
		self clientfield::set_to_player(type, 32 - 1);
		self.tweakcam = trigger;
		while(trigger istriggerenabled() && self istouching(trigger))
		{
			waitframe(1);
		}
		self clientfield::set_to_player(type, 0);
		self.tweakcam = undefined;
	}

	/*
		Name: function_5dfb6d67
		Namespace: namespace_744b99c
		Checksum: 0x2395133D
		Offset: 0x2690
		Size: 0x32
		Parameters: 0
		Flags: Linked
	*/
	function function_5dfb6d67()
	{
		/#
			assert(isdefined(var_6c9ec3e8));
		#/
		return var_6c9ec3e8.var_bb7e005a;
	}

	/*
		Name: function_60ca2154
		Namespace: namespace_744b99c
		Checksum: 0x55570755
		Offset: 0x10D8
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_60ca2154(id)
	{
		foreach(section in var_af27fdee)
		{
			if(section.id == id)
			{
				return section;
			}
		}
		return undefined;
	}

	/*
		Name: getid
		Namespace: namespace_744b99c
		Checksum: 0x2B9C78D7
		Offset: 0x26E8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getid()
	{
		return var_be31d6d6;
	}

	/*
		Name: function_70111aa4
		Namespace: namespace_744b99c
		Checksum: 0x4AFDCA5E
		Offset: 0x1178
		Size: 0x9C
		Parameters: 1
		Flags: Linked
	*/
	function function_70111aa4(id)
	{
		foreach(section in var_af27fdee)
		{
			if(section.id == id)
			{
				return section.var_bb7e005a[0];
			}
		}
		return undefined;
	}

	/*
		Name: function_774497ee
		Namespace: namespace_744b99c
		Checksum: 0x9FC8E975
		Offset: 0x24B0
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_774497ee(cb)
	{
		self.var_622da539 = cb;
	}

	/*
		Name: function_7c246362
		Namespace: namespace_744b99c
		Checksum: 0x53C798DB
		Offset: 0x12C8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_7c246362()
	{
		return var_6c9ec3e8;
	}

	/*
		Name: function_82fd5391
		Namespace: namespace_744b99c
		Checksum: 0xA0C3BB6E
		Offset: 0x2AE0
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function function_82fd5391()
	{
		self waittill(#"deactivate");
		self triggerenable(0);
	}

	/*
		Name: function_87f950c1
		Namespace: namespace_744b99c
		Checksum: 0x9D4C9AA7
		Offset: 0xE08
		Size: 0xC0
		Parameters: 1
		Flags: Linked
	*/
	function function_87f950c1(type)
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
		Name: function_90de0b96
		Namespace: namespace_744b99c
		Checksum: 0xDBCE6DE5
		Offset: 0xED8
		Size: 0x164
		Parameters: 0
		Flags: Linked
	*/
	function function_90de0b96()
	{
		level thread namespace_268747c0::function_3874b272("explo_barrel");
		level thread namespace_268747c0::function_3874b272("killbox");
		level thread namespace_268747c0::function_3874b272("killzone");
		level thread namespace_268747c0::function_3874b272("pungi");
		level thread namespace_268747c0::function_3874b272("pressureplate");
		level thread namespace_268747c0::function_3874b272("elec_pole");
		level thread namespace_268747c0::function_3874b272("flogger");
		level thread namespace_268747c0::function_3874b272("logdrop");
		level thread namespace_268747c0::function_3874b272("dragonhead");
		level thread namespace_268747c0::function_3874b272("fireball");
		level thread namespace_268747c0::function_3874b272("physicsbox");
	}

	/*
		Name: function_98a61f4e
		Namespace: namespace_744b99c
		Checksum: 0xE4700441
		Offset: 0x12E0
		Size: 0xF4
		Parameters: 1
		Flags: Linked
	*/
	function function_98a61f4e(section)
	{
		if(!isdefined(section))
		{
			section = 0;
		}
		self.var_6c9ec3e8 = function_60ca2154(section);
		var_ec67aff2 = function_70111aa4(section);
		level thread namespace_ec06fe4a::function_87612422(var_ec67aff2.origin, var_ec67aff2.angles);
		if(isdefined(var_6c9ec3e8.exit) && isdefined(var_6c9ec3e8.exit.teleporter))
		{
			objective_onentity(12, var_6c9ec3e8.exit.teleporter);
			objective_setstate(12, "active");
		}
	}

	/*
		Name: function_9b22d331
		Namespace: namespace_744b99c
		Checksum: 0x8854EA62
		Offset: 0x2E40
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function function_9b22d331()
	{
		self waittill(#"deactivate");
		self triggerenable(0);
	}

	/*
		Name: function_a7380338
		Namespace: namespace_744b99c
		Checksum: 0x65E37AE0
		Offset: 0x2E80
		Size: 0xF0
		Parameters: 0
		Flags: Linked
	*/
	function function_a7380338()
	{
		self endon(#"deactivate");
		level waittill(#"hash_5c97c4241ba01be4");
		self triggerenable(1);
		self thread function_9b22d331();
		while(true)
		{
			result = undefined;
			result = self waittill(#"trigger");
			if(isdefined(result.activator))
			{
				if(isinarray(result.activator.doa.var_bb4d9604, self))
				{
					continue;
				}
				result.activator thread function_2c3a3e50(self);
			}
		}
	}

	/*
		Name: function_a9d5a03d
		Namespace: namespace_744b99c
		Checksum: 0x78129503
		Offset: 0x2678
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_a9d5a03d()
	{
		return var_c7395a06;
	}

	/*
		Name: deactivate
		Namespace: namespace_744b99c
		Checksum: 0x3834F84B
		Offset: 0x1FB0
		Size: 0x4D0
		Parameters: 0
		Flags: Linked
	*/
	function deactivate()
	{
		level clientfield::increment("wilddeactivated");
		objective_setstate(12, "invisible");
		function_464d882c();
		foreach(zone in var_a26d9c0d)
		{
			if(isdefined(zone))
			{
				zone notify(#"deactivate");
			}
		}
		foreach(zone in var_767ea0af)
		{
			if(isdefined(zone))
			{
				zone notify(#"deactivate");
			}
		}
		foreach(var_f0ce243e in var_e2a6dd61)
		{
			if(isdefined(var_f0ce243e))
			{
				var_f0ce243e notify(#"deactivate");
			}
		}
		foreach(var_1c59693d in var_2a0f52f3)
		{
			if(isdefined(var_1c59693d.trigger))
			{
				var_1c59693d.trigger delete();
			}
		}
		foreach(exit in var_45e27b4f)
		{
			if(isdefined(exit.trigger))
			{
				exit.trigger delete();
			}
			if(isdefined(exit))
			{
				exit delete();
			}
		}
		self.var_45e27b4f = [];
		foreach(npc in var_c7395a06)
		{
			npc.activated = 0;
			npc.count = (isdefined(npc.script_int) ? int(npc.script_int) : 1);
		}
		foreach(room in var_3fe6d9f7)
		{
			if(isdefined(room))
			{
				room notify(#"deactivate");
			}
		}
		if(isdefined(var_622da539))
		{
			level thread [[var_622da539]](var_6c9ec3e8);
		}
		self.var_6c9ec3e8 = undefined;
		self notify(#"deactivated");
		level notify(#"hash_77e4bcc14697c018");
	}

	/*
		Name: function_b6954aba
		Namespace: namespace_744b99c
		Checksum: 0x876A57BA
		Offset: 0x2488
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_b6954aba(cb)
	{
		self.var_486c1553 = cb;
	}

	/*
		Name: activate
		Namespace: namespace_744b99c
		Checksum: 0x24F56F0D
		Offset: 0x1628
		Size: 0x980
		Parameters: 1
		Flags: Linked
	*/
	function activate(section)
	{
		if(!isdefined(section))
		{
			section = 0;
		}
		level.doa.var_997a0313++;
		level.doa.var_8dc464fe = gettime();
		foreach(var_1c59693d in var_2a0f52f3)
		{
			var_1c59693d.trigger = namespace_ec06fe4a::spawntrigger("trigger_box", var_1c59693d.origin, 2, var_1c59693d.var_27264bb4, var_1c59693d.var_efa6dcc2, var_1c59693d.var_a69f4ab4);
		}
		function_c4836f01();
		function_98a61f4e(section);
		function_90de0b96();
		foreach(zone in var_a26d9c0d)
		{
			zone thread function_a7380338();
		}
		foreach(zone in var_767ea0af)
		{
			zone thread function_2a41670b();
		}
		foreach(loc in var_7c1b05a1)
		{
			loc.chance = 100;
			if(isdefined(loc.script_parameters))
			{
				args = strtok(loc.script_parameters, ";");
				if(args.size > 0)
				{
					loc.chance = int(args[0]);
				}
				if(args.size > 1)
				{
					loc.scale = int(args[1]);
				}
				if(args.size > 2 && loc.script_noteworthy === #"pickone")
				{
					loc.parameters = [];
					for(i = 2; i < args.size; i++)
					{
						if(!isdefined(loc.parameters))
						{
							loc.parameters = [];
						}
						else if(!isarray(loc.parameters))
						{
							loc.parameters = array(loc.parameters);
						}
						loc.parameters[loc.parameters.size] = args[i];
					}
				}
			}
			if(loc.script_noteworthy === "zombietron_skeleton_key")
			{
				loc.chance = loc.chance - (25 * level.doa.var_be74bf2c);
				if(loc.chance < 1)
				{
					loc.chance = 1;
				}
			}
			loc.canspawn = randomint(100) < loc.chance;
			loc.count = (isdefined(loc.script_int) ? int(loc.script_int) : 1);
			loc.activated = 0;
			loc.totalspawned = 0;
			loc.var_82725140 = 0;
			loc.permanent = 0;
			if(isdefined(loc.script_noteworthy) && issubstr(loc.script_noteworthy, "world_"))
			{
				loc.permanent = 1;
			}
		}
		foreach(npc in var_c7395a06)
		{
			npc.activated = 0;
			npc.permanent = 0;
			npc.chance = 100;
			/#
				assert(isdefined(npc.script_parameters));
			#/
			if(isdefined(npc.script_parameters) && isdefined("wild_npc requires script_parameters <type>,[chance],[radius],[permanent],[boss],[notify]"))
			{
				args = strtok(npc.script_parameters, ";");
				/#
					assert(args.size > 0, "");
				#/
				if(args.size > 0)
				{
					npc.type = args[0];
				}
				if(args.size > 1)
				{
					npc.chance = int(args[1]);
				}
				if(args.size > 2)
				{
					npc.radius = int(args[2]);
				}
				if(args.size > 3)
				{
					npc.permanent = (int(args[3]) ? 1 : 0);
				}
				if(args.size > 4)
				{
					npc.var_c7121c91 = (int(args[4]) ? 1 : 0);
				}
				if(args.size > 5)
				{
					npc.var_a4c4ac53 = args[5];
				}
			}
			npc.canspawn = randomint(100) < npc.chance;
			npc.count = (isdefined(npc.script_int) ? int(npc.script_int) : 1);
		}
		foreach(var_f0ce243e in var_e2a6dd61)
		{
			var_f0ce243e thread function_e7bbc8d1();
		}
		foreach(room in var_3fe6d9f7)
		{
			room thread function_33300d38();
		}
		while(!function_6a6f39a2(m_name))
		{
			waitframe(1);
		}
		if(!isnavvolumeloaded())
		{
			var_a82c51e1 = 1;
		}
		level thread doa_wild::function_e8146c4c();
		if(isdefined(var_486c1553))
		{
			level thread [[var_486c1553]](var_6c9ec3e8);
		}
		level notify(#"hash_62332fcf2ebc16d1");
	}

	/*
		Name: function_c4836f01
		Namespace: namespace_744b99c
		Checksum: 0x85390AA8
		Offset: 0x13E0
		Size: 0x240
		Parameters: 0
		Flags: Linked
	*/
	function function_c4836f01()
	{
		foreach(section in var_af27fdee)
		{
			if(isdefined(section.exit))
			{
				var_8f38b15f = 1;
				if(isdefined(section.var_b52bc3a8) && level flag::get(section.var_b52bc3a8) == 0)
				{
					var_8f38b15f = 0;
				}
				if(var_8f38b15f)
				{
					var_b458883a = namespace_ec06fe4a::function_e22ae9b3(section.exit.origin, "zombietron_teleporter");
					section.exit.teleporter = var_b458883a;
					self.var_45e27b4f[var_45e27b4f.size] = var_b458883a;
					var_b458883a namespace_83eb6304::function_3ecfde67("teleporter_dungeon_light");
					var_b458883a clientfield::set("set_icon", 1);
					var_b458883a setmodel("zombietron_teleporter");
					var_b458883a setmovingplatformenabled(1, 1);
					var_b458883a disconnectpaths();
					var_b458883a thread namespace_ec06fe4a::function_f506b4c7();
					var_b458883a.trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", var_b458883a.origin, 0, 40, 80);
					var_b458883a thread function_40ee47dc(var_b458883a.var_d1fc07a7);
				}
			}
		}
	}

	/*
		Name: function_c547fa0e
		Namespace: namespace_744b99c
		Checksum: 0xB14677C0
		Offset: 0x24D8
		Size: 0xC
		Parameters: 0
		Flags: Linked
	*/
	function function_c547fa0e()
	{
		return var_af27fdee.size;
	}

	/*
		Name: function_c8fbcc3f
		Namespace: namespace_744b99c
		Checksum: 0x9C6F55CC
		Offset: 0x1220
		Size: 0x9A
		Parameters: 1
		Flags: Linked
	*/
	function function_c8fbcc3f(id)
	{
		foreach(section in var_af27fdee)
		{
			if(section.id == id)
			{
				return section.var_9045aedc;
			}
		}
		return undefined;
	}

	/*
		Name: function_ce6bb21b
		Namespace: namespace_744b99c
		Checksum: 0x6FB392A7
		Offset: 0x2A28
		Size: 0xB0
		Parameters: 0
		Flags: Linked
	*/
	function function_ce6bb21b()
	{
		objective_setstate(12, "active");
		foreach(exit in var_45e27b4f)
		{
			exit clientfield::set("set_icon", 1);
		}
	}

	/*
		Name: function_d52481d0
		Namespace: namespace_744b99c
		Checksum: 0x8C09BD26
		Offset: 0x2508
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function function_d52481d0(loc)
	{
		if(!isdefined(var_7c1b05a1))
		{
			self.var_7c1b05a1 = [];
		}
		else if(!isarray(var_7c1b05a1))
		{
			self.var_7c1b05a1 = array(var_7c1b05a1);
		}
		self.var_7c1b05a1[var_7c1b05a1.size] = loc;
	}

	/*
		Name: function_d9ad5c49
		Namespace: namespace_744b99c
		Checksum: 0x1BAA22C9
		Offset: 0x24F0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_d9ad5c49()
	{
		return var_7c1b05a1;
	}

	/*
		Name: function_e7bbc8d1
		Namespace: namespace_744b99c
		Checksum: 0x41A31E02
		Offset: 0x2BF8
		Size: 0xF8
		Parameters: 0
		Flags: Linked
	*/
	function function_e7bbc8d1()
	{
		self notify("29c9ed695998b404");
		self endon("29c9ed695998b404");
		self endon(#"deactivate");
		self triggerenable(1);
		self thread function_82fd5391();
		type = (isdefined(script_noteworthy) ? script_noteworthy : "setCameraDown");
		while(true)
		{
			result = undefined;
			result = self waittill(#"trigger");
			if(!isdefined(result.activator.tweakcam))
			{
				result.activator thread function_4774f263(type, self);
			}
		}
	}

}

#namespace doa_wild;

/*
	Name: function_2828aa1
	Namespace: doa_wild
	Checksum: 0x736FBBE4
	Offset: 0x3E60
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_2828aa1()
{
	if((isinarray([[ level.doa.var_a77e6349 ]]->function_d9ad5c49(), level.doa.var_c0036bbd)) == 0)
	{
		loc = level.doa.var_c0036bbd;
		loc.chance = 100;
		loc.canspawn = 1;
		loc.count = 1;
		loc.activated = 0;
		loc.totalspawned = 0;
		loc.var_82725140 = 0;
		loc.permanent = 1;
		loc.script_string = "arcade_machine1";
		loc.radius = 40;
		[[ level.doa.var_a77e6349 ]]->function_d52481d0(loc);
	}
}

/*
	Name: init
	Namespace: doa_wild
	Checksum: 0x39EA4531
	Offset: 0x3F60
	Size: 0x3E0
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "setWild", 1, 2, "int");
	clientfield::register("world", "setWildTOD", 1, 3, "int");
	clientfield::register("world", "setWildSection", 1, 3, "int");
	clientfield::register("world", "wilddeactivated", 1, 1, "counter");
	objective_add(12, "invisible", (0, 0, 0), #"hash_712c19ea98a115ee");
	objective_add(13, "invisible", (0, 0, 0), #"hash_93a5b32fcbc4d3c");
	var_e20c12eb = struct::get_array("zombietron_arcademachine_loc", "targetname");
	level.doa.var_c0036bbd = var_e20c12eb[randomint(var_e20c12eb.size)];
	level flag::init("doa_wild_section_j2_visited", 0);
	var_581c8f9a = struct::get_array("doa_wild");
	level.doa.var_d7dbacba = [];
	foreach(wild in var_581c8f9a)
	{
		var_3d2cc936 = new class_744b99c();
		[[ var_3d2cc936 ]]->initialize(wild);
		level.doa.var_d7dbacba[level.doa.var_d7dbacba.size] = var_3d2cc936;
		var_663588d = "Zombietron/Wilds/";
		sections = [[ var_3d2cc936 ]]->function_c547fa0e();
		if(sections > 1)
		{
			for(i = 0; i < sections; i++)
			{
				var_59ea00e = ((("scr_wild_activate " + ([[ var_3d2cc936 ]]->getname())) + "@") + i) + "; zombie_devgui wild";
				util::function_e2e9d901((((var_663588d + ([[ var_3d2cc936 ]]->getname())) + "    Section ") + (i + 1) + ":") + ([[ var_3d2cc936 ]]->getid()), var_59ea00e);
			}
			continue;
		}
		var_59ea00e = ("scr_wild_activate " + ([[ var_3d2cc936 ]]->getname())) + "; zombie_devgui wild";
		util::function_e2e9d901(((var_663588d + ([[ var_3d2cc936 ]]->getname())) + ":") + ([[ var_3d2cc936 ]]->getid()), var_59ea00e);
	}
}

/*
	Name: main
	Namespace: doa_wild
	Checksum: 0x5EAC5F04
	Offset: 0x4348
	Size: 0x1CE
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level endon(#"game_over");
	level waittill(#"hash_671684f03a58b3a3");
	level clientfield::set("setWild", 2);
	level clientfield::set("setWildSection", 7);
	util::wait_network_frame();
	level clientfield::set("setWildTOD", 2);
	foreach(wild in level.doa.var_d7dbacba)
	{
		[[ wild ]]->deactivate();
		[[ wild ]]->initialize([[ wild ]]->function_1e9525b8());
	}
	level flag::clear("doa_wild_section_j2_visited");
	level namespace_c85a46fe::function_edfcfa44();
	objective_setstate(12, "invisible");
	objective_setstate(13, "invisible");
	level.doa.var_8dc464fe = undefined;
}

/*
	Name: function_e5e987ae
	Namespace: doa_wild
	Checksum: 0xBD991CDF
	Offset: 0x4520
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_e5e987ae(name)
{
	level.doa.var_e15152e6 = undefined;
	level.doa.var_baeb966b = undefined;
	if(!isdefined(name))
	{
		return;
	}
	if(level.doa.var_6c58d51 > getdvarint(#"hash_2743236aa9857bee", 0))
	{
		return;
	}
	wild = function_d5e7454f(name);
	if(!isdefined(wild))
	{
		return;
	}
	return wild;
}

/*
	Name: function_7c5bc025
	Namespace: doa_wild
	Checksum: 0x8964A633
	Offset: 0x45C8
	Size: 0x940
	Parameters: 2
	Flags: Linked
*/
function function_7c5bc025(name, section)
{
	if(isdefined(level.doa.var_a77e6349))
	{
		[[ level.doa.var_a77e6349 ]]->deactivate();
		level namespace_c85a46fe::function_edfcfa44();
	}
	level.doa.var_a77e6349 = function_d5e7454f(name);
	/#
		assert(isdefined(level.doa.var_a77e6349), "" + name);
	#/
	[[ level.doa.var_a77e6349 ]]->activate(section);
	namespace_8c04284b::function_a70ff03e([[ level.doa.var_a77e6349 ]]->function_31ca9ed1());
	level util::set_lighting_state([[ level.doa.var_a77e6349 ]]->function_39f259cc());
	level clientfield::set("setWild", [[ level.doa.var_a77e6349 ]]->getid());
	level clientfield::set("setWildSection", section);
	foreach(player in getplayers())
	{
		player notify(#"hash_279998c5df86c04d");
	}
	util::wait_network_frame();
	level clientfield::set("setWildTOD", [[ level.doa.var_a77e6349 ]]->function_39f259cc());
	level namespace_a6ddb172::function_7a0e5387();
	namespace_4dae815d::function_21cd3890(4);
	util::wait_network_frame();
	level notify(#"hash_77a8f97f2648672", {#section:section, #name:name});
	level.doa.var_3902985f = &function_c6dcd966;
	level.doa.var_a71b0305 = &function_a1832a08;
	level thread function_715ea8aa(level.doa.var_a77e6349);
	level thread function_3efbdeb3(level.doa.var_a77e6349);
	starts = [[ level.doa.var_a77e6349 ]]->function_5dfb6d67();
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		spot = starts[i];
		players[i] setorigin(spot.origin);
		players[i] setplayerangles(spot.angles);
		players[i].doa.var_3cf36932 = 0;
		players[i].doa.var_4847bf49 = 0;
		players[i] clientfield::increment_to_player("hardResetCamera");
		players[i] clientfield::increment_to_player("setCompassVis");
		players[i].var_85f8774c = 1;
	}
	util::wait_network_frame();
	level namespace_7f5aeb59::function_d0251f76(0);
	level thread namespace_c85a46fe::function_782e605e(name);
	level thread namespace_a6056a45::function_de7fb95(name, 1);
	function_2828aa1();
	level notify(#"hash_5c97c4241ba01be4");
	level thread namespace_7f5aeb59::function_836aeb74();
	level waittill(#"hash_58caf0ade03043bb");
	level namespace_a6ddb172::function_7a0e5387(14);
	level thread namespace_9fc66ac::announce(59);
	if(isdefined(level.doa.var_6b57e2f))
	{
		level thread [[level.doa.var_6b57e2f]](name);
	}
	result = undefined;
	result = level waittill(#"hash_7626a6770055d63c", #"game_over");
	if(result._notify != "game_over")
	{
		level namespace_c85a46fe::function_edfcfa44();
		namespace_ec06fe4a::function_de70888a();
		banner = (isdefined(result.banner) ? result.banner : 15);
		level namespace_a6ddb172::function_7a0e5387(banner);
		if(!isdefined(result.banner))
		{
			level thread namespace_9fc66ac::announce(60);
		}
		foreach(player in getplayers())
		{
			player giveachievement(#"hash_79b5e565395ad617");
			player thread namespace_7f5aeb59::turnplayershieldon(0);
		}
		wait(3.5);
		level thread namespace_7f5aeb59::function_67f054d7(1.5);
		level notify(#"hash_7893364bd228d63e");
		wait(0.5);
		level namespace_a6ddb172::function_7a0e5387();
		foreach(player in getplayers())
		{
			player clientfield::increment_to_player("hardResetCamera");
		}
	}
	level waittill(#"hash_1b322de3d2e3e781");
	[[ level.doa.var_a77e6349 ]]->deactivate();
	level namespace_c85a46fe::function_edfcfa44();
	namespace_491fa2b2::function_df55eb9d(0);
	namespace_a6056a45::function_e2f97f03(0);
	doa_pickups::function_19fa261e();
	namespace_ec06fe4a::function_de70888a();
	level.doa.var_2bc99c8d = [];
	level.doa.var_a77e6349 = undefined;
	level.doa.var_6b57e2f = undefined;
	level.doa.var_3902985f = undefined;
	level.doa.var_a71b0305 = undefined;
	util::wait_network_frame();
	level notify(#"hash_325440d5433be263");
}

/*
	Name: function_d5e7454f
	Namespace: doa_wild
	Checksum: 0x63A7DA5B
	Offset: 0x4F10
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_d5e7454f(name)
{
	foreach(wild in level.doa.var_d7dbacba)
	{
		if(([[ wild ]]->getname()) === name)
		{
			return wild;
		}
	}
}

/*
	Name: function_87922476
	Namespace: doa_wild
	Checksum: 0xC2A0A48A
	Offset: 0x4FC0
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function function_87922476(name, section)
{
	foreach(wild in level.doa.var_d7dbacba)
	{
		if(([[ wild ]]->getname()) === name && ([[ wild ]]->getid()) === section)
		{
			return wild;
		}
	}
}

/*
	Name: function_c6dcd966
	Namespace: doa_wild
	Checksum: 0xC4175E5B
	Offset: 0x5090
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_c6dcd966(item)
{
	if(isdefined(item.var_aa1b5d45))
	{
		item.var_aa1b5d45.var_82725140++;
		item.var_aa1b5d45.canspawn = 0;
		if(([[ item.def ]]->function_5ce4fb28()) == 14)
		{
			item.var_aa1b5d45.var_c4f9b5c = 1;
		}
	}
}

/*
	Name: function_a1832a08
	Namespace: doa_wild
	Checksum: 0x49A1D29E
	Offset: 0x5110
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_a1832a08(item)
{
	item.var_aa1b5d45 = level.doa.var_aa1b5d45;
	if(isdefined(item.var_aa1b5d45))
	{
		item notify(#"hash_2a866f50cc161ca8");
		level.doa.var_aa1b5d45.pickups[level.doa.var_aa1b5d45.pickups.size] = item;
		level.doa.var_aa1b5d45.totalspawned = level.doa.var_aa1b5d45.pickups.size;
	}
}

/*
	Name: spawnitem
	Namespace: doa_wild
	Checksum: 0x4C793EED
	Offset: 0x51D8
	Size: 0x372
	Parameters: 1
	Flags: Linked
*/
function spawnitem(item)
{
	if(is_true(item.activated))
	{
		return;
	}
	item.pickups = [];
	item.activated = 1;
	level.doa.var_aa1b5d45 = item;
	switch(item.script_noteworthy)
	{
		case "hash_717f51c8c82e526c":
		{
			namespace_f63bdb08::function_2a1e5c1f(item.origin, item.angles, item.model, (isdefined(item.script_int) ? int(item.script_int) : undefined), (isdefined(item.script_objective) ? int(item.script_objective) : undefined), 1, item.script_parameters);
			break;
		}
		case "world_loot":
		{
			namespace_41f5b853::spawnlootitem(item.origin, item.angles, item.script_string, item.radius, 1);
			break;
		}
		case "hash_708bdcbf801445c6":
		{
			doa_pickups::function_68442ee7(item.origin, 20, 200);
			break;
		}
		case "pickone":
		{
			/#
				assert(isdefined(item.parameters), "");
			#/
			def = doa_pickups::function_6265bde4(item.parameters[randomint(item.parameters.size)]);
		}
		def = doa_pickups::function_6265bde4(item.script_noteworthy);
		level doa_pickups::function_d06cbfe8(item.origin, item.count, 64, 1, def, 1);
		level doa_pickups::function_b8f6a8cd(def, item.origin, 0, 1, item.scale, item.angles);
		level doa_pickups::function_83aea294(item.origin, item.count, 12, def, undefined, 1);
		break;
	}
	if(!item.permanent)
	{
		level thread function_612fa49c(item);
	}
	else
	{
		item.canspawn = 0;
	}
	level.doa.var_aa1b5d45 = undefined;
}

/*
	Name: function_612fa49c
	Namespace: doa_wild
	Checksum: 0xD497F8AE
	Offset: 0x5558
	Size: 0x22A
	Parameters: 2
	Flags: Linked
*/
function function_612fa49c(item, distance)
{
	if(!isdefined(distance))
	{
		distance = 1600;
	}
	while(item.activated && isdefined(level.doa.var_a77e6349))
	{
		players = namespace_7f5aeb59::function_23e1f90f();
		active = 0;
		foreach(player in players)
		{
			if(distancesquared(item.origin, player.origin) < sqr(distance))
			{
				active = 1;
				break;
			}
		}
		item.activated = active;
		wait(1);
	}
	remove = 1;
	if(item.var_82725140 == 0)
	{
		remove = 0;
	}
	if(remove)
	{
		item.canspawn = 0;
	}
	if(isdefined(item.pickups))
	{
		arrayremovevalue(item.pickups, undefined);
		foreach(pickup in item.pickups)
		{
			pickup delete();
		}
	}
	item.pickups = [];
}

/*
	Name: function_715ea8aa
	Namespace: doa_wild
	Checksum: 0xA2879D56
	Offset: 0x5790
	Size: 0x232
	Parameters: 1
	Flags: Linked
*/
function function_715ea8aa(wild)
{
	self notify("38b88231105686da");
	self endon("38b88231105686da");
	level endon(#"hash_325440d5433be263");
	level.doa.var_2bc99c8d = [[ wild ]]->function_d9ad5c49();
	while(true)
	{
		players = namespace_7f5aeb59::function_23e1f90f();
		items = [];
		foreach(player in players)
		{
			items = arraycombine(items, arraysortclosest(level.doa.var_2bc99c8d, player.origin, undefined, 0, 1200));
		}
		foreach(item in items)
		{
			if(is_true(item.activated))
			{
				continue;
			}
			if(!is_true(item.canspawn))
			{
				continue;
			}
			if(is_true(item.var_c4f9b5c))
			{
				continue;
			}
			level spawnitem(item);
		}
		wait(1);
	}
}

/*
	Name: function_61284d17
	Namespace: doa_wild
	Checksum: 0x59BCCAB5
	Offset: 0x59D0
	Size: 0x252
	Parameters: 2
	Flags: Linked
*/
function function_61284d17(radius, baseorigin)
{
	self notify("6989fab2f23d4aca");
	self endon("6989fab2f23d4aca");
	self endon(#"death");
	wait(5);
	maxdist = radius + (radius >> 1);
	maxdistsq = sqr(maxdist);
	minhealth = int(self.maxhealth * 0.75);
	var_9b39fe40 = sqr(256);
	while(true)
	{
		wait(1);
		distsq = distancesquared(self.origin, baseorigin);
		if(distsq >= maxdistsq)
		{
			if(isdefined(self.enemy))
			{
				distsq = distancesquared(self.origin, self.enemy.origin);
				if(distsq < var_9b39fe40)
				{
					continue;
				}
			}
			self notify(#"hash_232ad18a32353b62");
			self.var_834ad023 = 1;
			self clearenemy();
			self.favoriteenemy = undefined;
			self.lastknownenemypos = undefined;
			self.var_860a34b9 = baseorigin;
			self namespace_250e9486::function_41354e51(baseorigin, 1, 1);
			result = undefined;
			result = self waittill(#"goal", #"damage");
			self.var_834ad023 = 0;
			if(result._notify === "goal")
			{
				if(self.health < minhealth)
				{
					self.health = minhealth;
				}
			}
			self thread function_904157ac(radius, baseorigin);
			return;
		}
	}
}

/*
	Name: function_b3585fb7
	Namespace: doa_wild
	Checksum: 0xD080533D
	Offset: 0x5C30
	Size: 0x106
	Parameters: 2
	Flags: None
*/
function function_b3585fb7(origin, timeout)
{
	self notify("3da9fcc1a5f4c000");
	self endon("3da9fcc1a5f4c000");
	self endon(#"death");
	level thread namespace_1e25ad94::debugbox(origin, 0, 20, 20, 20, timeout, (self isatgoal() ? (0, 1, 0) : (1, 0, 0)));
	var_3d92670f = gettime() + (timeout * 1000);
	while(gettime() < var_3d92670f)
	{
		level thread namespace_1e25ad94::debugline(self.origin, origin, 0.05, (self haspath() ? (0, 1, 0) : (1, 0, 0)));
		waitframe(1);
	}
}

/*
	Name: function_904157ac
	Namespace: doa_wild
	Checksum: 0x1C70A867
	Offset: 0x5D40
	Size: 0x30E
	Parameters: 2
	Flags: Linked
*/
function function_904157ac(radius, baseorigin)
{
	if(!isdefined(radius))
	{
		radius = 1024;
	}
	self notify("44f59d1441478139");
	self endon("44f59d1441478139");
	self endon(#"death", #"hash_232ad18a32353b62");
	if(!isdefined(baseorigin))
	{
		baseorigin = self.origin;
	}
	if(isdefined(self.target))
	{
		base = struct::get(self.target);
		if(isdefined(base))
		{
			baseorigin = base.origin;
		}
	}
	radiussq = sqr(radius);
	self.engagementdistance = radius;
	self.var_a84a3d40 = radiussq;
	self.var_2dc9f085 = 0;
	self clearenemy();
	self.favoriteenemy = undefined;
	self.lastknownenemypos = undefined;
	self.var_860a34b9 = undefined;
	self namespace_250e9486::function_41354e51(baseorigin, 1);
	self.var_101082d1 = 0;
	var_92c9a6e = int(self.maxhealth * 0.02);
	var_71110327 = baseorigin;
	points = getrandomnavpoints(baseorigin, radius >> 1, 64, 30);
	self thread function_61284d17(radius, baseorigin);
	while(true)
	{
		wait(1);
		time = gettime();
		self.var_4bd563dd = 0;
		if(!isdefined(self.enemy))
		{
			if(time < self.var_2dc9f085 + 5000)
			{
				continue;
			}
			self.var_101082d1--;
			if(self.var_101082d1 > 0)
			{
				continue;
			}
			var_71110327 = baseorigin;
			if(points.size)
			{
				var_71110327 = points[randomint(points.size)];
			}
			self.zombie_move_speed = "walk";
			self.var_860a34b9 = var_71110327;
			self namespace_250e9486::function_41354e51(var_71110327, 1, 1);
			self waittilltimeout(15, #"goal", #"enemy");
			self.var_101082d1 = randomint(20);
		}
		else
		{
			self.var_860a34b9 = undefined;
			self.var_2dc9f085 = time;
		}
	}
}

/*
	Name: function_e5488243
	Namespace: doa_wild
	Checksum: 0x3195AB1D
	Offset: 0x6058
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_e5488243(npc)
{
	mode = "guard";
	if(isdefined(npc.script_string))
	{
		mode = npc.script_string;
	}
	switch(mode)
	{
		case "none":
		{
			return;
		}
		case "patrol":
		{
			break;
		}
		case "guard":
		default:
		{
			self thread function_904157ac(npc.radius);
			break;
		}
	}
}

/*
	Name: function_d81916f4
	Namespace: doa_wild
	Checksum: 0x8E9F2C31
	Offset: 0x6120
	Size: 0x230
	Parameters: 0
	Flags: Linked
*/
function function_d81916f4()
{
	self notify("66e93a2f54fd4d4e");
	self endon("66e93a2f54fd4d4e");
	level endon(#"game_over", #"hash_77e4bcc14697c018");
	while(self.activated)
	{
		result = undefined;
		result = self waittill(#"hash_4c72e79bdad8315e");
		namespace_1e25ad94::debugmsg(((("ai_queue_spawned notify recieved for ent:" + result.ai getentitynumber()) + " at: ") + gettime() + " note typestamp:") + result.time);
		if(isdefined(result.ai) && !isinarray(self.var_2b5ed682, result.ai))
		{
			result.ai.boss = (isdefined(self.boss) ? self.boss : result.ai.boss);
			result.ai.script_noteworthy = self.script_noteworthy;
			result.ai forceteleport(self.origin, self.angles);
			self.var_2b5ed682[self.var_2b5ed682.size] = result.ai;
			if(isdefined(self.var_a4c4ac53))
			{
				level notify(self.var_a4c4ac53, {#ai:result.ai});
			}
			self.count--;
			/#
				assert(self.count >= 0);
			#/
			result.ai.var_d1fac34a = self;
			result.ai thread function_e5488243(self);
		}
	}
}

/*
	Name: function_72405345
	Namespace: doa_wild
	Checksum: 0x5649052A
	Offset: 0x6358
	Size: 0x15E
	Parameters: 1
	Flags: Linked
*/
function function_72405345(npc)
{
	if(isdefined(level.doa.var_182fb75a))
	{
		return;
	}
	if(is_true(npc.activated))
	{
		return;
	}
	if(npc.count <= 0)
	{
		return;
	}
	npc.var_2b5ed682 = [];
	npc.activated = 1;
	if(!isdefined(npc.spawndef))
	{
		npc.spawndef = doa_enemy::function_d7c5adee(npc.type);
	}
	npc thread function_d81916f4();
	radius = 0;
	if(npc.count > 1)
	{
		radius = 30;
	}
	doa_enemy::function_a6b807ea(npc.spawndef, npc.count, npc.origin, radius, undefined, undefined, npc);
	if(!npc.permanent)
	{
		level thread function_7d406bae(npc);
	}
	else
	{
		arrayremovevalue(level.doa.var_95cc492a, npc);
	}
}

/*
	Name: function_7d406bae
	Namespace: doa_wild
	Checksum: 0xA3F5B235
	Offset: 0x64C0
	Size: 0x33C
	Parameters: 2
	Flags: Linked
*/
function function_7d406bae(npc, distance)
{
	if(!isdefined(distance))
	{
		distance = 2400;
	}
	level endon(#"game_over");
	while(npc.activated && isdefined(level.doa.var_a77e6349))
	{
		players = namespace_7f5aeb59::function_23e1f90f();
		active = 0;
		foreach(player in players)
		{
			if(distancesquared(npc.origin, player.origin) < sqr(distance))
			{
				active = 1;
				break;
			}
		}
		npc.activated = active;
		wait(1);
	}
	items = doa_enemy::function_924423d(npc);
	unspawned = 0;
	foreach(item in items)
	{
		unspawned = unspawned + item.count;
	}
	arrayremovevalue(npc.var_2b5ed682, undefined);
	npc.count = npc.count + (npc.var_2b5ed682.size + unspawned);
	foreach(guy in npc.var_2b5ed682)
	{
		if(is_true(guy.boss))
		{
			guy thread namespace_ec06fe4a::function_52afe5df();
			continue;
		}
		guy thread namespace_ec06fe4a::function_570729f0(0.1);
	}
	npc.var_2b5ed682 = [];
	if(npc.count <= 0)
	{
		arrayremovevalue(level.doa.var_95cc492a, npc);
	}
}

/*
	Name: function_3efbdeb3
	Namespace: doa_wild
	Checksum: 0x4CB1E0CF
	Offset: 0x6808
	Size: 0x242
	Parameters: 1
	Flags: Linked
*/
function function_3efbdeb3(wild)
{
	self notify("1aec4b97ed01998b");
	self endon("1aec4b97ed01998b");
	level endon(#"hash_325440d5433be263");
	level endon(#"game_over");
	level.doa.var_95cc492a = [[ wild ]]->function_a9d5a03d();
	while(true)
	{
		if(namespace_250e9486::function_60f6a9e())
		{
			players = namespace_7f5aeb59::function_23e1f90f();
			npcs = [];
			foreach(player in players)
			{
				npcs = arraycombine(npcs, arraysortclosest(level.doa.var_95cc492a, player.origin, undefined, 0, 2000));
			}
			foreach(npc in npcs)
			{
				if(is_true(npc.activated))
				{
					continue;
				}
				if(!is_true(npc.canspawn))
				{
					continue;
				}
				level function_72405345(npc);
			}
		}
		wait(1);
	}
}

/*
	Name: function_e8146c4c
	Namespace: doa_wild
	Checksum: 0xBAE743CD
	Offset: 0x6A58
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function function_e8146c4c()
{
	level endon(#"hash_325440d5433be263");
	level endon(#"game_over");
	wait(5);
	foreach(player in getplayers())
	{
		player namespace_6e90e490::showhint(12);
	}
	wait(30);
	while(isdefined(level.doa.var_6f3d327))
	{
		wait(1);
	}
	foreach(player in getplayers())
	{
		player namespace_6e90e490::showhint(13);
	}
}

/*
	Name: function_271e0d71
	Namespace: doa_wild
	Checksum: 0x9EC7B668
	Offset: 0x6BE8
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function function_271e0d71(name, section)
{
	round = 1;
	if(name === "jungle_1")
	{
		switch(section)
		{
			case 0:
			{
				round = 4;
				level.doa.var_997a0313 = 1;
				break;
			}
			case 1:
			{
				round = 36;
				level.doa.var_997a0313 = 3;
				break;
			}
			case 2:
			{
				round = 19;
				level.doa.var_997a0313 = 2;
				break;
			}
			case 3:
			{
				round = 60;
				level.doa.var_997a0313 = 4;
				break;
			}
		}
	}
	return namespace_8c04284b::function_962e9d92(round);
}

