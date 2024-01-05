#using script_522aeb6ae906391e;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using script_7a5293d92c61c788;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_420b39d3;

/*
	Name: __init__system__
	Namespace: namespace_420b39d3
	Checksum: 0x2E7154C1
	Offset: 0x140
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"hash_3a0015e9f67cadaf", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: namespace_420b39d3
	Checksum: 0x89F05FC8
	Offset: 0x198
	Size: 0x1E4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		util::init_dvar(#"hash_3a0015e9f67cadaf", "", &function_8cf627fd);
		util::init_dvar(#"hash_664590b4ac90cb22", "", &function_33430942);
		util::init_dvar(#"hash_6307f5372b3c2a6f", "", &function_33430942);
		util::init_dvar(#"hash_5c0d8210d7e4072b", "", &function_33430942);
		util::init_dvar(#"hash_e4ff0414d01c696", "", &function_42d3c9f5);
		util::init_dvar(#"hash_5c583988a48d4115", 0, &function_867e712a);
		util::init_dvar(#"hash_601883712ebe3542", 0, &function_ad391a04);
		util::init_dvar(#"hash_6f6defbd7ae55a98", 0, &function_3fe9e6d5);
		util::init_dvar(#"hash_46ea982132a001ec", 0, &function_f1f26ccb);
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_420b39d3
	Checksum: 0xD67A4B19
	Offset: 0x388
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	/#
		level thread function_76de3950();
	#/
}

/*
	Name: function_76de3950
	Namespace: namespace_420b39d3
	Checksum: 0x86C9659B
	Offset: 0x3B0
	Size: 0x178
	Parameters: 0
	Flags: None
*/
function function_76de3950()
{
	/#
		function_6f31d177();
		function_c4fe091c();
		if(is_true(level.aat_in_use))
		{
			level thread aat::setup_devgui("");
		}
		util::waittill_can_add_debug_command();
		if(isdefined(level.var_c0f77370))
		{
			level thread [[level.var_c0f77370]]();
		}
		util::waittill_can_add_debug_command();
		if(isdefined(level.var_633b283d))
		{
			level thread [[level.var_633b283d]]();
		}
		util::waittill_can_add_debug_command();
		if(isdefined(level.var_f793af68))
		{
			level thread [[level.var_f793af68]]();
		}
		util::waittill_can_add_debug_command();
		if(isdefined(level.var_6aa829ef))
		{
			level thread [[level.var_6aa829ef]]();
		}
		util::waittill_can_add_debug_command();
		if(isdefined(level.var_800654fc))
		{
			level thread [[level.var_800654fc]]();
		}
	#/
}

/*
	Name: function_6f31d177
	Namespace: namespace_420b39d3
	Checksum: 0xAD4E0263
	Offset: 0x530
	Size: 0x1E8
	Parameters: 0
	Flags: Private
*/
function private function_6f31d177()
{
	/#
		var_d9c347d9 = struct::get_array("", "");
		foreach(var_aafdab5f in var_d9c347d9)
		{
			if(isdefined(var_aafdab5f.target))
			{
				a_s_spawns = struct::get_array(var_aafdab5f.targetname, "");
				foreach(n_index, s_spawn in a_s_spawns)
				{
					util::add_debug_command(((((((("" + var_aafdab5f.target) + "") + n_index) + "") + var_aafdab5f.target) + "") + n_index) + "");
				}
				util::add_debug_command(((("" + var_aafdab5f.target) + "") + var_aafdab5f.target) + "");
			}
		}
	#/
}

/*
	Name: function_c4fe091c
	Namespace: namespace_420b39d3
	Checksum: 0x5D1E2776
	Offset: 0x720
	Size: 0x210
	Parameters: 0
	Flags: Private
*/
function private function_c4fe091c()
{
	/#
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		var_de82b392 = function_19df1c1c();
		foreach(var_7ecdee63 in var_de82b392)
		{
			var_7ecdee63 = function_9e72a96(var_7ecdee63);
			util::add_debug_command(((("" + var_7ecdee63) + "") + var_7ecdee63) + "");
			util::add_debug_command(((("" + var_7ecdee63) + "") + var_7ecdee63) + "");
			util::add_debug_command(((("" + var_7ecdee63) + "") + var_7ecdee63) + "");
		}
	#/
}

/*
	Name: function_8cf627fd
	Namespace: namespace_420b39d3
	Checksum: 0x9FC809EF
	Offset: 0x938
	Size: 0x734
	Parameters: 1
	Flags: None
*/
function function_8cf627fd(params)
{
	/#
		self notify("");
		self endon("");
		waitframe(1);
		if(!isdefined(params.value))
		{
			return;
		}
		switch(params.value)
		{
			case "hash_c959cc1595e2f7":
			{
				array::thread_all(function_a1ef346b(), &zm_devgui::function_8d799ebd);
				break;
			}
			case "hash_1f1842f8525e2b9e":
			{
				array::thread_all(function_a1ef346b(), &zm_devgui::zombie_devgui_give_money, 50);
				break;
			}
			case "hash_122c4df3e2c0a31e":
			{
				array::thread_all(function_a1ef346b(), &zm_devgui::zombie_devgui_give_money, 100);
				break;
			}
			case "hash_346579f3f60438aa":
			{
				array::thread_all(function_a1ef346b(), &zm_devgui::zombie_devgui_give_money, 500);
				break;
			}
			case "hash_ca6d38b092c2dae":
			{
				array::thread_all(function_a1ef346b(), &zm_devgui::zombie_devgui_give_money, 5000);
				break;
			}
			case "hash_27d4bc4bf6d98bdf":
			{
				array::thread_all(function_a1ef346b(), &namespace_dd7e54e3::function_b2f69241);
				break;
			}
			case "hash_67c3788855e430dd":
			{
				array::thread_all(function_a1ef346b(), &namespace_dd7e54e3::give_armor, #"hash_35675bbd363f934a");
				break;
			}
			case "hash_67c3758855e42bc4":
			{
				array::thread_all(function_a1ef346b(), &namespace_dd7e54e3::give_armor, #"hash_7777b2b5970da847");
				break;
			}
			case "hash_67c3768855e42d77":
			{
				array::thread_all(function_a1ef346b(), &namespace_dd7e54e3::give_armor, #"hash_7bc70addda19ca00");
				break;
			}
			case "hash_278d3011e8daefc9":
			{
				var_cc6e64ae = getdvarint(#"hash_7255c78e5d6bfa33", -1);
				if(isdefined(level.var_37778628))
				{
					[[level.var_37778628]](var_cc6e64ae);
				}
				break;
			}
			case "hash_68b02f0279a6018a":
			{
				level.var_c7552541 = !is_true(level.var_c7552541);
				if(level.var_c7552541)
				{
					level thread function_e59c3c07();
				}
				else
				{
					level notify(#"hash_2a5b4fb329b3984a");
				}
				break;
			}
			case "hash_17f656e4906d263d":
			{
				zombies = getaiarchetypearray(#"zombie");
				foreach(zombie in zombies)
				{
					zombie zombie_utility::set_zombie_run_cycle_override_value("");
				}
				break;
			}
			case "hash_58f657c627e51661":
			{
				level.var_f662b93f = !is_true(level.var_f662b93f);
				if(level.var_f662b93f)
				{
					getplayers()[0] thread function_df5be8b2();
				}
				else
				{
					level notify(#"hash_624d34392463b628");
				}
				break;
			}
			case "hash_3d82e58502d3b9a7":
			{
				function_f9023d3a();
				break;
			}
			case "hash_166eb0846966ee22":
			{
				function_c78fe37a();
				break;
			}
			case "hash_51e79de8f027c5e1":
			{
				function_71797cab();
				break;
			}
			case "hash_5814e765f67e3421":
			{
				function_dabc0bfe();
				if(isdefined(level.var_29cf6901))
				{
					level.var_29cf6901 = undefined;
					level notify(#"hash_38fcca4f222bb813");
				}
				break;
			}
			case "hash_10568fdee341e234":
			{
				function_832956c9();
				break;
			}
			case "hash_77b350e55c00c7f2":
			{
				function_60cf1e76();
				break;
			}
			case "hash_15ba5e2d53488ef6":
			{
				level.var_29cf6901.repeat = !is_true(level.var_29cf6901.repeat);
				level thread function_58e8b7e3();
				break;
			}
			case "hash_4f637a6935df3a1c":
			{
				level thread function_b104a7cb();
				break;
			}
			default:
			{
				break;
			}
		}
		if(isdefined(level.var_c7b02cfe))
		{
			[[level.var_c7b02cfe]](params);
		}
		setdvar(#"hash_3a0015e9f67cadaf", "");
	#/
}

/*
	Name: function_f9023d3a
	Namespace: namespace_420b39d3
	Checksum: 0x72E9A7F8
	Offset: 0x1078
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_f9023d3a()
{
	/#
		v_origin = getplayers()[0] function_7ae85497();
		v_origin = getclosestpointonnavmesh(v_origin, 64, 32);
		if(!isdefined(v_origin))
		{
		}
		else
		{
			if(!isdefined(level.var_29cf6901))
			{
				level.var_29cf6901 = {};
			}
			if(!isdefined(level.var_29cf6901.start))
			{
				level.var_29cf6901.start = [];
			}
			level.var_29cf6901.start[level.var_29cf6901.start.size] = v_origin;
			level thread function_37c30a3b();
		}
	#/
}

/*
	Name: function_c78fe37a
	Namespace: namespace_420b39d3
	Checksum: 0xC6C2D457
	Offset: 0x1168
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_c78fe37a()
{
	/#
		v_origin = getplayers()[0] function_7ae85497();
		v_origin = getclosestpointonnavmesh(v_origin, 64, 32);
		if(!isdefined(v_origin))
		{
		}
		else
		{
			if(!isdefined(level.var_29cf6901))
			{
				level.var_29cf6901 = {};
			}
			if(!isdefined(level.var_29cf6901.end))
			{
				level.var_29cf6901.end = [];
			}
			level.var_29cf6901.end[level.var_29cf6901.end.size] = v_origin;
			level thread function_37c30a3b();
		}
	#/
}

/*
	Name: function_dabc0bfe
	Namespace: namespace_420b39d3
	Checksum: 0xF5BC239B
	Offset: 0x1258
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_dabc0bfe()
{
	/#
		function_832956c9();
		if(isdefined(level.var_29cf6901))
		{
			level.var_29cf6901.start = undefined;
			level.var_29cf6901.end = undefined;
			level notify(#"hash_38fcca4f222bb813");
		}
	#/
}

/*
	Name: function_71797cab
	Namespace: namespace_420b39d3
	Checksum: 0xAB1EFC04
	Offset: 0x12C0
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_71797cab()
{
	/#
		v_origin = getplayers()[0] function_7ae85497();
		points = [];
		if(isdefined(level.var_29cf6901.start))
		{
			points = level.var_29cf6901.start;
		}
		if(isdefined(level.var_29cf6901.end))
		{
			points = arraycombine(points, level.var_29cf6901.end, 1, 0);
		}
		closest_point = arraygetclosest(v_origin, points);
		if(isdefined(closest_point))
		{
			if(isdefined(level.var_29cf6901.start))
			{
				arrayremovevalue(level.var_29cf6901.start, closest_point);
			}
			if(isdefined(level.var_29cf6901.end))
			{
				arrayremovevalue(level.var_29cf6901.end, closest_point);
			}
		}
	#/
}

/*
	Name: function_60cf1e76
	Namespace: namespace_420b39d3
	Checksum: 0x4DECD85A
	Offset: 0x1428
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_60cf1e76()
{
	/#
		if(!(isdefined(level.var_29cf6901) && (isdefined(level.var_29cf6901.start) && isdefined(level.var_29cf6901.end))))
		{
			return;
		}
		if(!isdefined(level.var_29cf6901.ai))
		{
			level.var_29cf6901.ai = [];
		}
		start = array::random(level.var_29cf6901.start);
		end = array::random(level.var_29cf6901.end);
		forward = end - start;
		var_1a614c37 = spawnactor(#"spawner_zm_zombie", start, vectortoangles((0, forward[1], 0)), "", 1);
		if(!isdefined(var_1a614c37))
		{
		}
		else
		{
			var_1a614c37.ignoreall = 1;
			var_1a614c37.var_67faa700 = 1;
			var_1a614c37.backedupgoal = var_1a614c37.origin;
			var_1a614c37.b_ignore_cleanup = 1;
			var_1a614c37 thread function_eee42c73();
			level.var_29cf6901.ai[level.var_29cf6901.ai.size] = var_1a614c37;
		}
	#/
}

/*
	Name: function_832956c9
	Namespace: namespace_420b39d3
	Checksum: 0x50B336D3
	Offset: 0x15E8
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_832956c9()
{
	/#
		if(!isdefined(level.var_29cf6901.ai))
		{
			return;
		}
		if(isarray(level.var_29cf6901.ai) && level.var_29cf6901.ai.size)
		{
			foreach(ai in level.var_29cf6901.ai)
			{
				ai deletedelay();
			}
		}
	#/
}

/*
	Name: function_b104a7cb
	Namespace: namespace_420b39d3
	Checksum: 0xB38CC9D7
	Offset: 0x16D8
	Size: 0x21A
	Parameters: 0
	Flags: None
*/
function function_b104a7cb()
{
	/#
		if(is_true(level.var_26340887))
		{
			level notify(#"hash_32085673c18af61a");
			level.var_26340887 = undefined;
			return;
		}
		level.var_26340887 = 1;
		level endon(#"hash_f214fb1df20b46b");
		record = getdvar(#"recorder_enablerec", 0);
		while(true)
		{
			foreach(player in function_a1ef346b())
			{
				color = (0, 1, 1);
				position = player.last_valid_position;
				if(!isdefined(position))
				{
					color = (1, 0, 0);
					position = player.origin;
				}
				if(record)
				{
					recordstar(position, color, "", player);
					recordline(position, position + vectorscale((0, 0, 1), 72), color, "", player);
					continue;
				}
				debugstar(position, 1, color);
				line(position, position + vectorscale((0, 0, 1), 72), color, 1, 1, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_eee42c73
	Namespace: namespace_420b39d3
	Checksum: 0xAE8BC7A4
	Offset: 0x1900
	Size: 0x158
	Parameters: 0
	Flags: None
*/
function function_eee42c73()
{
	/#
		self endon(#"death");
		while(isdefined(level.var_29cf6901) && zm_utility::is_classic() && !is_true(self.completed_emerging_into_playable_area))
		{
			waitframe(1);
		}
		current_goal = 0;
		var_6936a23a = [1:level.var_29cf6901.start, 0:level.var_29cf6901.end];
		self setgoal(array::random(var_6936a23a[current_goal]));
		while(is_true(level.var_29cf6901.repeat))
		{
			self waittill(#"goal");
			current_goal = !current_goal;
			self setgoal(array::random(var_6936a23a[current_goal]));
		}
	#/
}

/*
	Name: function_58e8b7e3
	Namespace: namespace_420b39d3
	Checksum: 0x7186014F
	Offset: 0x1A60
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function function_58e8b7e3()
{
	/#
		while(is_true(level.var_29cf6901.repeat))
		{
			debug2dtext(vectorscale((1, 1, 0), 100), "", (0, 1, 0), 1, vectorscale((1, 1, 1), 0.5), 0.75);
			waitframe(1);
		}
	#/
}

/*
	Name: function_37c30a3b
	Namespace: namespace_420b39d3
	Checksum: 0x58ADF9AF
	Offset: 0x1AE8
	Size: 0x2F4
	Parameters: 0
	Flags: None
*/
function function_37c30a3b()
{
	/#
		self notify("");
		self endon("");
		level endon(#"game_ended", #"hash_38fcca4f222bb813");
		while(true)
		{
			waitframe(1);
			if(!isdefined(level.var_29cf6901))
			{
				continue;
			}
			if(isdefined(level.var_29cf6901.start))
			{
				foreach(origin in level.var_29cf6901.start)
				{
					debugstar(origin, 1, (0, 1, 0));
				}
			}
			if(isdefined(level.var_29cf6901.end))
			{
				foreach(origin in level.var_29cf6901.end)
				{
					debugstar(origin, 1, (1, 0, 0));
				}
			}
			if(isarray(level.var_29cf6901.ai) && level.var_29cf6901.ai.size)
			{
				function_1eaaceab(level.var_29cf6901.ai);
				foreach(ai in level.var_29cf6901.ai)
				{
					line(ai.origin, ai.origin + (0, 0, ai function_6a9ae71()), (1, 0, 1), 1, 0, 1);
				}
			}
		}
	#/
}

/*
	Name: function_7ae85497
	Namespace: namespace_420b39d3
	Checksum: 0x6CFF581D
	Offset: 0x1DE8
	Size: 0xE6
	Parameters: 1
	Flags: None
*/
function function_7ae85497(dist)
{
	/#
		v_forward = anglestoforward(self getplayerangles());
		v_forward = vectorscale(v_forward, 4000);
		var_5927a215 = vectorscale((1, 1, 1), 10);
		v_eye = self getplayercamerapos();
		var_abd03397 = physicstrace(v_eye, v_eye + v_forward, -1 * var_5927a215, var_5927a215, getplayers()[0], 64 | 2);
		return var_abd03397[#"position"];
	#/
}

/*
	Name: function_33430942
	Namespace: namespace_420b39d3
	Checksum: 0xA1E43D66
	Offset: 0x1ED8
	Size: 0x2E4
	Parameters: 1
	Flags: None
*/
function function_33430942(params)
{
	/#
		self notify("");
		self endon("");
		waitframe(1);
		if(params.value === "")
		{
			return;
		}
		switch(params.name)
		{
			case "hash_664590b4ac90cb22":
			{
				host = getplayers()[0];
				v_origin = host function_7ae85497();
				ai = spawnactor(params.value, v_origin, host.angles + vectorscale((0, 1, 0), 180), "", 1);
				if(isdefined(ai))
				{
					if(!isdefined(level.var_a46cf88a))
					{
						level.var_a46cf88a = [];
					}
					else if(!isarray(level.var_a46cf88a))
					{
						level.var_a46cf88a = array(level.var_a46cf88a);
					}
					level.var_a46cf88a[level.var_a46cf88a.size] = ai;
					function_1eaaceab(level.var_a46cf88a);
				}
				else
				{
					iprintlnbold((("" + params.value) + "") + getailimit() + "");
				}
				break;
			}
			case "hash_6307f5372b3c2a6f":
			{
				function_e645d51a(level.var_a46cf88a, params.value);
				break;
			}
			case "hash_5c0d8210d7e4072b":
			{
				function_e645d51a(getaiarray(), params.value);
				break;
			}
			default:
			{
				break;
			}
		}
		setdvar(#"hash_664590b4ac90cb22", "");
		setdvar(#"hash_6307f5372b3c2a6f", "");
		setdvar(#"hash_5c0d8210d7e4072b", "");
	#/
}

/*
	Name: function_e645d51a
	Namespace: namespace_420b39d3
	Checksum: 0xDB8603C2
	Offset: 0x21C8
	Size: 0x10C
	Parameters: 2
	Flags: Private
*/
function private function_e645d51a(a_ai, var_7ecdee63)
{
	/#
		if(isarray(a_ai))
		{
			foreach(ai in a_ai)
			{
				if(isalive(ai) && (!isdefined(var_7ecdee63) || ai.aitype === var_7ecdee63))
				{
					ai.allowdeath = 1;
					ai kill();
				}
			}
			function_1eaaceab(a_ai);
		}
	#/
}

/*
	Name: function_867e712a
	Namespace: namespace_420b39d3
	Checksum: 0x45267F6C
	Offset: 0x22E0
	Size: 0x60
	Parameters: 1
	Flags: Private
*/
function private function_867e712a(params)
{
	/#
		if(is_true(params.value))
		{
			level thread function_51403488();
		}
		else
		{
			level notify(#"hash_275c4bf3f697b9e");
		}
	#/
}

/*
	Name: function_51403488
	Namespace: namespace_420b39d3
	Checksum: 0x450DF61B
	Offset: 0x2348
	Size: 0x1BA
	Parameters: 0
	Flags: Private
*/
function private function_51403488()
{
	/#
		level notify(#"hash_275c4bf3f697b9e");
		level endon(#"hash_275c4bf3f697b9e", #"end_game", #"game_ended");
		while(true)
		{
			player = getplayers()[0];
			if(!isdefined(player))
			{
				return;
			}
			a_ai = player getenemiesinradius(player.origin, 2000);
			foreach(ai in a_ai)
			{
				if(isalive(ai))
				{
					print3d(ai.origin + vectorscale((0, 0, 1), 68), (("" + ai.health) + "") + (isdefined(ai.maxhealth) ? ai.maxhealth : ""), (0, 1, 0), 1, 0.5);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ad391a04
	Namespace: namespace_420b39d3
	Checksum: 0x5B70DED1
	Offset: 0x2510
	Size: 0x70
	Parameters: 1
	Flags: Private
*/
function private function_ad391a04(params)
{
	/#
		if(isint(params.value) && params.value)
		{
			level thread print_zombie_counts();
		}
		else
		{
			level notify(#"hash_87534d41fedbdf9");
		}
	#/
}

/*
	Name: print_zombie_counts
	Namespace: namespace_420b39d3
	Checksum: 0xE7E82204
	Offset: 0x2588
	Size: 0x342
	Parameters: 0
	Flags: Private
*/
function private print_zombie_counts()
{
	/#
		level notify(#"hash_87534d41fedbdf9");
		level endon(#"hash_87534d41fedbdf9");
		while(true)
		{
			var_c708e6e1 = 120;
			var_6a432250 = [];
			a_ai = getaiarray();
			foreach(ai in a_ai)
			{
				if(isalive(ai))
				{
					if(isdefined(ai.var_9fde8624))
					{
						str_archetype = (function_9e72a96(ai.archetype) + "") + function_9e72a96(ai.var_9fde8624) + "";
					}
					else
					{
						str_archetype = function_9e72a96(ai.archetype);
					}
					if(!isdefined(var_6a432250[str_archetype]))
					{
						var_6a432250[str_archetype] = 0;
					}
					var_6a432250[str_archetype]++;
				}
			}
			debug2dtext((700, var_c708e6e1, 0), "", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 5);
			var_c708e6e1 = var_c708e6e1 + 33;
			debug2dtext((700, var_c708e6e1, 0), "", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 5);
			foreach(n_ai_count in var_6a432250)
			{
				var_c708e6e1 = var_c708e6e1 + 22;
				debug2dtext((700, var_c708e6e1, 0), ((function_9e72a96(str_archetype) + "") + n_ai_count) + "", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 5);
			}
			waitframe(5);
		}
	#/
}

/*
	Name: function_3fe9e6d5
	Namespace: namespace_420b39d3
	Checksum: 0xC3E5A5FA
	Offset: 0x28D8
	Size: 0x110
	Parameters: 1
	Flags: Private
*/
function private function_3fe9e6d5(params)
{
	/#
		if(is_true(params.value))
		{
			spawner::add_ai_spawn_function(&function_e9939aa7);
			foreach(zombie in getactorarray())
			{
				zombie thread function_e9939aa7();
			}
		}
		else
		{
			spawner::function_932006d1(&function_e9939aa7);
			level notify(#"hash_339fb98e940fbaf6");
		}
	#/
}

/*
	Name: function_e9939aa7
	Namespace: namespace_420b39d3
	Checksum: 0x81FB338
	Offset: 0x29F0
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_e9939aa7()
{
	/#
		self endon(#"death");
		level endon(#"hash_339fb98e940fbaf6");
		while(true)
		{
			waitframe(1);
			record3dtext((is_true(self.var_1fa24724) ? "" : ""), self.origin, (0, 1, 0), "", self);
		}
	#/
}

/*
	Name: function_f1f26ccb
	Namespace: namespace_420b39d3
	Checksum: 0xC50CC889
	Offset: 0x2A88
	Size: 0x58
	Parameters: 1
	Flags: Private
*/
function private function_f1f26ccb(params)
{
	/#
		level.var_2b46c827 = is_true(params.value);
		if(!level.var_2b46c827)
		{
			level notify(#"hash_39e4c9a17bf97f7d");
		}
	#/
}

/*
	Name: function_42d3c9f5
	Namespace: namespace_420b39d3
	Checksum: 0x949A692A
	Offset: 0x2AE8
	Size: 0x24C
	Parameters: 1
	Flags: Private
*/
function private function_42d3c9f5(params)
{
	/#
		if(params.value === "")
		{
			return;
		}
		var_bfae6869 = strtok(params.value, "");
		var_3480e14d = var_bfae6869[0];
		var_a75f9486 = var_bfae6869[1];
		s_instance = namespace_8b6a9d79::function_f703a5a(struct::get(var_3480e14d))[0];
		a_s_spawns = namespace_8b6a9d79::function_f703a5a(s_instance);
		if(isdefined(var_a75f9486))
		{
			var_a75f9486 = int(var_a75f9486);
			player = getplayers()[0];
			player setorigin(a_s_spawns[var_a75f9486].origin);
			player setplayerangles(a_s_spawns[var_a75f9486].angles);
		}
		else
		{
			foreach(player in getplayers())
			{
				s_spawn = a_s_spawns[n_index];
				if(isdefined(s_spawn))
				{
					player setorigin(s_spawn.origin);
					player setplayerangles(s_spawn.angles);
				}
			}
		}
		setdvar(#"hash_e4ff0414d01c696", "");
	#/
}

/*
	Name: function_2fab7a62
	Namespace: namespace_420b39d3
	Checksum: 0x3F33CEAF
	Offset: 0x2D40
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_2fab7a62(str_type)
{
	/#
		str_dvar = "" + str_type;
		util::init_dvar(str_dvar, 0, &function_2a3a4bf6);
		util::add_devgui(namespace_8b6a9d79::devgui_path("", function_9e72a96(str_type), 103), ("" + str_dvar) + "");
	#/
}

/*
	Name: function_2a3a4bf6
	Namespace: namespace_420b39d3
	Checksum: 0xAFC6A7B9
	Offset: 0x2DF8
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_2a3a4bf6(params)
{
	/#
		var_806a0877 = function_9e72a96(params.name);
		a_str_tokens = strtok(var_806a0877, "");
		/#
			assert(isdefined(a_str_tokens) && a_str_tokens.size > 1, var_806a0877 + "");
		#/
		str_type = a_str_tokens[1];
		level thread function_afb25532(str_type, params.value);
	#/
}

/*
	Name: function_afb25532
	Namespace: namespace_420b39d3
	Checksum: 0x1E2C531B
	Offset: 0x2ED0
	Size: 0x3BE
	Parameters: 2
	Flags: None
*/
function function_afb25532(str_type, b_enable)
{
	/#
		if(!isdefined(b_enable))
		{
			b_enable = 1;
		}
		level notify("" + str_type);
		level endon("" + str_type, #"end_game", #"game_ended");
		if(b_enable)
		{
			while(true)
			{
				player = getplayers()[0];
				if(!isdefined(player))
				{
					return;
				}
				var_e5880035 = struct::get_array(str_type, "");
				if(!var_e5880035.size)
				{
					return;
				}
				foreach(var_97aab885 in var_e5880035)
				{
					if(isdefined(var_97aab885.var_fe2612fe[#"capture_point"][0]))
					{
						v_loc = var_97aab885.var_fe2612fe[#"capture_point"][0].origin;
						v_color = (0, 1, 0);
					}
					else
					{
						if(isdefined(var_97aab885.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0]))
						{
							v_loc = var_97aab885.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0].origin;
							v_color = (0, 1, 0);
						}
						else
						{
							if(isdefined(var_97aab885.var_fe2612fe[#"trigger_spawn"][0]))
							{
								v_loc = var_97aab885.var_fe2612fe[#"trigger_spawn"][0].origin;
								v_color = (0, 1, 0);
							}
							else
							{
								v_loc = var_97aab885.origin;
								v_color = (1, 0, 0);
							}
						}
					}
					print3d(v_loc, (("" + str_type) + "") + (isdefined(var_97aab885.targetname) ? var_97aab885.targetname : ""), (1, 1, 0), undefined, 1);
					n_radius = 64;
					n_dist = distance(v_loc, player.origin);
					n_radius = n_radius * (n_dist / 3000);
					sphere(v_loc, n_radius, v_color);
				}
				debug2dtext((100, 900, 0), "", (0, 1, 0), undefined, undefined, undefined, 1.5);
				debug2dtext((100, 925, 0), "", (1, 0, 0), undefined, undefined, undefined, 1.5);
				waitframe(1);
			}
		}
		else
		{
			level notify("" + str_type);
		}
	#/
}

/*
	Name: function_e59c3c07
	Namespace: namespace_420b39d3
	Checksum: 0x228A9AAB
	Offset: 0x3298
	Size: 0x296
	Parameters: 0
	Flags: None
*/
function function_e59c3c07()
{
	/#
		level notify(#"hash_2a5b4fb329b3984a");
		level endon(#"hash_2a5b4fb329b3984a");
		while(isdefined(level.attackables))
		{
			foreach(attackable in level.attackables)
			{
				circle(attackable.origin, attackable.var_b79a8ac7.var_f019ea1a, (1, 0, 1), 0, 1);
				foreach(slot in attackable.var_b79a8ac7.slots)
				{
					circle(slot.origin, 8, (1, 0, 1), 0, 1);
					debugstar(slot.origin, 1, (1, 0, 1));
					line(attackable.origin, slot.origin, (1, 0, 1), 1, 0);
					if(!isalive(slot.entity))
					{
						continue;
					}
					circle(slot.entity.origin, slot.entity getpathfindingradius(), (0, 1, 1), 0, 1);
					line(slot.origin, slot.entity.origin, (0, 1, 1), 1, 0);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_34f85f1b
	Namespace: namespace_420b39d3
	Checksum: 0x9C7446E2
	Offset: 0x3538
	Size: 0x48C
	Parameters: 2
	Flags: None
*/
function function_34f85f1b(str_flag, var_1303e212)
{
	/#
		if(!isdefined(var_1303e212))
		{
			var_1303e212 = 1;
		}
		level flag::set(str_flag);
		if(var_1303e212)
		{
			var_4777a582 = getdvar(#"hash_7c3872b765911891");
			setdvar(#"hash_7c3872b765911891", 0);
			if(var_4777a582 !== 0)
			{
				wait(3);
			}
		}
		level.var_78b6c3a4 = 0;
		while(level flag::get(str_flag))
		{
			if(var_1303e212 && (!isdefined(level.var_f804b293) || !level.var_f804b293.size))
			{
				wait(1);
				continue;
			}
			a_spawn_points = [];
			if(var_1303e212)
			{
				hotzone = arraygetclosest(getplayers()[0].origin, level.var_f804b293);
				a_spawn_points = struct::get_array(hotzone.targetname, "");
			}
			else
			{
				trigger = arraygetclosest(getplayers()[0].origin, getentarray("", ""));
				if(isdefined(trigger.target))
				{
					a_spawn_points = struct::get_array(trigger.target, "");
				}
			}
			if(!a_spawn_points.size)
			{
				wait(1);
				continue;
			}
			foreach(spawn_point in a_spawn_points)
			{
				while(level flag::get(str_flag) && (level.var_78b6c3a4 >= a_spawn_points.size || getaicount() >= getailimit()))
				{
					wait(1);
				}
				if(!level flag::get(str_flag))
				{
					break;
				}
				var_944250d2 = spawnactor(#"hash_7cba8a05511ceedf", spawn_point.origin, spawn_point.angles, undefined, 1);
				if(!isdefined(var_944250d2))
				{
					println("" + spawn_point.origin);
					debugstar(spawn_point.origin, 30, (1, 0, 0), "");
				}
				if(isdefined(spawn_point.var_90d0c0ff) && function_c4cb6239(#"hash_7cba8a05511ceedf", spawn_point.var_90d0c0ff))
				{
					var_944250d2.var_c9b11cb3 = spawn_point.var_90d0c0ff;
				}
				level.var_78b6c3a4++;
				var_944250d2 thread function_8245d8a0();
				if(isdefined(spawn_point.var_90d0c0ff))
				{
					debugstar(spawn_point.origin, 100, (1, 1, 1), "" + spawn_point.var_90d0c0ff, 0.65);
				}
			}
		}
		setdvar(#"hash_7c3872b765911891", var_4777a582);
	#/
}

/*
	Name: function_8245d8a0
	Namespace: namespace_420b39d3
	Checksum: 0x19980027
	Offset: 0x39D0
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function function_8245d8a0()
{
	/#
		self waittill(#"hash_790882ac8688cee5", #"death");
		wait(1);
		if(isalive(self))
		{
			self.allowdeath = 1;
			self delete();
		}
		level.var_78b6c3a4--;
	#/
}

/*
	Name: function_46997bdf
	Namespace: namespace_420b39d3
	Checksum: 0xA1C4B0BF
	Offset: 0x3A48
	Size: 0x588
	Parameters: 2
	Flags: None
*/
function function_46997bdf(spawn_points, var_e6c99abc)
{
	/#
		level endon(#"game_ended");
		if(!isdefined(var_e6c99abc))
		{
			var_e6c99abc = "";
		}
		totalspawns = spawn_points.size;
		if(!isdefined(level.var_7d45d0d4.currentdestination))
		{
			return;
		}
		destination = level.var_7d45d0d4.currentdestination;
		iprintln(("" + var_e6c99abc) + "");
		println("");
		println(((("" + destination.targetname) + "") + totalspawns) + "");
		println(("" + var_e6c99abc) + "");
		println("");
		level notify(#"hash_2d15e9ef4a8fd60c");
		level.var_5c5abaf2 = 1;
		level.var_135a36f7 = [];
		level.var_d3582224 = 0;
		var_4777a582 = getdvar(#"hash_7c3872b765911891");
		setdvar(#"hash_7c3872b765911891", 0);
		if(var_4777a582 != 0)
		{
			wait(3);
		}
		var_34bcb139 = getailimit() - getaicount();
		iprintln("" + var_34bcb139);
		foreach(spawn_point in spawn_points)
		{
			var_34bcb139 = getailimit() - getaicount();
			if(var_34bcb139 > 0 && function_103c90c0(spawn_point, 0))
			{
				var_34bcb139 = var_34bcb139 - 1;
			}
			while(var_34bcb139 <= 0)
			{
				var_34bcb139 = getailimit() - getaicount();
				wait(0.1);
			}
		}
		while(level.var_d3582224 > 0)
		{
			wait(0.1);
		}
		var_d6d7c500 = level.var_135a36f7.size > 0;
		var_76fb4fcc = (var_d6d7c500 ? ("" + level.var_135a36f7.size) + "" : "");
		color = (var_d6d7c500 ? "" : "");
		println(color + "");
		println((((((color + "") + destination.targetname) + "") + var_e6c99abc) + "") + var_76fb4fcc);
		println(color + "");
		iprintlnbold((((((color + "") + destination.targetname) + "") + var_e6c99abc) + "") + var_76fb4fcc);
		if(var_d6d7c500)
		{
			foreach(msg in level.var_135a36f7)
			{
				println(color + msg);
			}
			println(color + "");
		}
		setdvar(#"hash_7c3872b765911891", var_4777a582);
		level.var_5c5abaf2 = 0;
	#/
}

/*
	Name: function_70e877d7
	Namespace: namespace_420b39d3
	Checksum: 0x1D6E5F5
	Offset: 0x3FD8
	Size: 0x254
	Parameters: 1
	Flags: None
*/
function function_70e877d7(spawn_points)
{
	/#
		level.var_135a36f7 = undefined;
		var_d610cbe2 = sqr(1000);
		player = getplayers()[0];
		player_vec = vectornormalize(anglestoforward(player getplayerangles()));
		var_167af5ff = undefined;
		best_dot = 0.707;
		foreach(spawn_point in spawn_points)
		{
			var_a9944b6 = vectornormalize(spawn_point.origin - player.origin);
			dot = vectordot(player_vec, var_a9944b6);
			if(dot > best_dot && distancesquared(spawn_point.origin, player.origin) < var_d610cbe2)
			{
				best_dot = dot;
				var_167af5ff = spawn_point;
			}
		}
		if(isdefined(var_167af5ff))
		{
			iprintln("" + var_167af5ff.origin);
			if(function_103c90c0(var_167af5ff, 1))
			{
				debugstar(var_167af5ff.origin, 30, (0, 0, 1), "");
			}
		}
		else
		{
			iprintln("");
		}
	#/
}

/*
	Name: function_103c90c0
	Namespace: namespace_420b39d3
	Checksum: 0x808F077D
	Offset: 0x4238
	Size: 0x180
	Parameters: 2
	Flags: None
*/
function function_103c90c0(spawn_point, var_957493b8)
{
	/#
		if(!isdefined(var_957493b8))
		{
			var_957493b8 = 0;
		}
		var_944250d2 = spawnactor(#"hash_7cba8a05511ceedf", spawn_point.origin, spawn_point.angles, undefined, 1);
		if(!isdefined(var_944250d2))
		{
			println("" + spawn_point.origin);
			debugstar(spawn_point.origin, 30, (1, 0, 0), "");
			return false;
		}
		if(!isdefined(level.var_d3582224))
		{
			level.var_d3582224 = 0;
		}
		if(is_false(var_957493b8))
		{
			level.var_d3582224 = level.var_d3582224 + 1;
		}
		if(isdefined(spawn_point.var_90d0c0ff) && function_c4cb6239(#"hash_7cba8a05511ceedf", spawn_point.var_90d0c0ff))
		{
			var_944250d2.var_c9b11cb3 = spawn_point.var_90d0c0ff;
		}
		var_944250d2 thread function_fabd315d(spawn_point, var_957493b8);
		return true;
	#/
}

/*
	Name: function_fabd315d
	Namespace: namespace_420b39d3
	Checksum: 0xF7A48988
	Offset: 0x43C8
	Size: 0x4EC
	Parameters: 2
	Flags: None
*/
function function_fabd315d(spawn_point, var_957493b8)
{
	/#
		if(is_false(var_957493b8))
		{
			self endoncallback(&function_cad1a4b5, #"death");
		}
		else
		{
			self endon(#"death");
		}
		self waittill(#"hash_790882ac8688cee5");
		if(!ispointonnavmesh(self.origin, self))
		{
			println("" + spawn_point.origin);
			debugstar(spawn_point.origin, 80, (1, 0, 0), "");
			if(isdefined(level.var_135a36f7))
			{
				errormsg = "" + spawn_point.origin;
				if(isdefined(self.var_90d0c0ff) && isdefined(self.var_1a02009e))
				{
					errormsg = errormsg + (("" + self.var_90d0c0ff) + "") + function_9e72a96(self.var_1a02009e);
				}
				level.var_135a36f7[level.var_135a36f7.size] = errormsg;
			}
			else
			{
				errormsg = "" + spawn_point.origin;
				if(isdefined(self.var_90d0c0ff) && isdefined(self.var_1a02009e))
				{
					errormsg = errormsg + (("" + self.var_90d0c0ff) + "") + function_9e72a96(self.var_1a02009e);
				}
				println("" + errormsg);
			}
		}
		else
		{
			self.cant_move_cb = &function_bc21ac74;
			var_6e56b150 = 0;
			for(i = 0; i < 2; i++)
			{
				goal = awareness::function_b184324d(spawn_point.origin, (isdefined(spawn_point.wander_radius) ? spawn_point.wander_radius : 128), self getpathfindingradius() * 1.2, self getpathfindingradius() * 1.2);
				if(isdefined(goal))
				{
					self setgoal(goal);
				}
				waitresult = undefined;
				waitresult = self waittilltimeout(7, #"goal", #"bad_path", #"death");
				if(waitresult._notify == #"goal" || waitresult._notify == "")
				{
					break;
				}
				else if(waitresult._notify == #"bad_path")
				{
					var_6e56b150++;
				}
				self waittilltimeout(2, #"goal_changed");
			}
			if(var_6e56b150 >= 2)
			{
				println("" + spawn_point.origin);
				debugstar(spawn_point.origin, 80, (1, 0, 0), "");
				if(isdefined(level.var_135a36f7))
				{
					errormsg = "" + spawn_point.origin;
					if(isdefined(self.var_90d0c0ff) && isdefined(self.var_1a02009e))
					{
						errormsg = errormsg + (("" + self.var_90d0c0ff) + "") + function_9e72a96(self.var_1a02009e);
					}
					level.var_135a36f7[level.var_135a36f7.size] = errormsg;
				}
			}
		}
		if(is_false(var_957493b8))
		{
			self.allowdeath = 1;
			self kill();
		}
	#/
}

/*
	Name: function_cad1a4b5
	Namespace: namespace_420b39d3
	Checksum: 0xCA6D1546
	Offset: 0x48C0
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_cad1a4b5(str_notify)
{
	/#
		level.var_d3582224 = level.var_d3582224 - 1;
	#/
}

/*
	Name: function_bc21ac74
	Namespace: namespace_420b39d3
	Checksum: 0xF560A157
	Offset: 0x48F8
	Size: 0x1E
	Parameters: 0
	Flags: Private
*/
function private function_bc21ac74()
{
	/#
		self notify(#"bad_path");
	#/
}

/*
	Name: function_df5be8b2
	Namespace: namespace_420b39d3
	Checksum: 0x20EFFAE
	Offset: 0x4920
	Size: 0x26E
	Parameters: 0
	Flags: Private
*/
function private function_df5be8b2()
{
	/#
		self endon(#"death", #"disconnect");
		level endon(#"hash_624d34392463b628");
		while(true)
		{
			view_pos = self getplayercamerapos();
			dir = anglestoforward(self getplayerangles()) * 500;
			end_pos = view_pos + dir;
			trace = physicstraceex(view_pos, end_pos, (0, 0, 0), (0, 0, 0), self);
			if(getdvarint(#"recorder_enablerec", 0))
			{
				recordline(view_pos, view_pos + (dir * trace[#"fraction"]), (0, 1, 0), "");
			}
			else
			{
				line(view_pos, view_pos + (dir * trace[#"fraction"]), (0, 1, 0));
			}
			if(getdvarint(#"recorder_enablerec", 0))
			{
				recordcircle(end_pos, 32, (0, 1, 0), "");
			}
			else
			{
				circle(end_pos, 32, (0, 1, 0), 0, 1);
			}
			if(getdvarint(#"recorder_enablerec", 0))
			{
				recordstar(view_pos + (dir * trace[#"fraction"]), (1, 0, 0), "");
			}
			else
			{
				debugstar(view_pos + (dir * trace[#"fraction"]), (1, 0, 0));
			}
			waitframe(1);
		}
	#/
}

