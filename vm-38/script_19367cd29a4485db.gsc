#using script_16b1b77a76492c6a;
#using script_2255a7ad3edc838f;
#using script_2618e0f3e5e11649;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_3f9e0dc8454d98e1;
#using script_522aeb6ae906391e;
#using script_5660bae5b402a1eb;
#using script_7a5293d92c61c788;
#using script_7e63597649100b1c;
#using script_7fc996fe8678852;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_420b39d3;

/*
	Name: function_2fd800a5
	Namespace: namespace_420b39d3
	Checksum: 0x380E6D26
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2fd800a5()
{
	level notify(1436403416);
}

/*
	Name: function_89f2df9
	Namespace: namespace_420b39d3
	Checksum: 0xB8AF6715
	Offset: 0x170
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"hash_3a0015e9f67cadaf", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: namespace_420b39d3
	Checksum: 0x462608CF
	Offset: 0x1C8
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		util::init_dvar(#"hash_3a0015e9f67cadaf", "", &function_8cf627fd);
		util::init_dvar(#"hash_46ea982132a001ec", 0, &function_f1f26ccb);
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_420b39d3
	Checksum: 0x7DDD030D
	Offset: 0x248
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
	Checksum: 0xBAFED6F4
	Offset: 0x270
	Size: 0x1A0
	Parameters: 0
	Flags: None
*/
function function_76de3950()
{
	/#
		infovolumedebuginit();
		function_6f31d177();
		function_c4fe091c();
		if(is_true(level.aat_in_use))
		{
			level thread aat::setup_devgui("");
		}
		util::function_345e5b9a("");
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
	Checksum: 0x26A30622
	Offset: 0x418
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
				var_eb3b90d = struct::get_array(var_aafdab5f.targetname, "");
				foreach(n_index, s_spawn in var_eb3b90d)
				{
					util::function_345e5b9a(((((((("" + var_aafdab5f.target) + "") + n_index) + "") + var_aafdab5f.target) + "") + n_index) + "");
				}
				util::function_345e5b9a(((("" + var_aafdab5f.target) + "") + var_aafdab5f.target) + "");
			}
		}
	#/
}

/*
	Name: function_c4fe091c
	Namespace: namespace_420b39d3
	Checksum: 0x80EE7BD9
	Offset: 0x608
	Size: 0x210
	Parameters: 0
	Flags: Private
*/
function private function_c4fe091c()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		var_de82b392 = function_19df1c1c();
		foreach(var_7ecdee63 in var_de82b392)
		{
			var_7ecdee63 = function_9e72a96(var_7ecdee63);
			util::function_345e5b9a(((("" + var_7ecdee63) + "") + var_7ecdee63) + "");
			util::function_345e5b9a(((("" + var_7ecdee63) + "") + var_7ecdee63) + "");
			util::function_345e5b9a(((("" + var_7ecdee63) + "") + var_7ecdee63) + "");
		}
	#/
}

/*
	Name: function_8cf627fd
	Namespace: namespace_420b39d3
	Checksum: 0x7B8CFC9A
	Offset: 0x820
	Size: 0xC6C
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
		cmd = strtok(params.value, "");
		if(!cmd.size)
		{
			return;
		}
		switch(cmd[0])
		{
			case "hash_2e685b829361da56":
			{
				function_867e712a({#value:!is_true(level.var_be5f7304)});
				level.var_be5f7304 = !is_true(level.var_be5f7304);
				break;
			}
			case "hash_47552ceecca70bbf":
			{
				function_ad391a04({#value:!is_true(level.var_120cb74c)});
				level.var_120cb74c = !is_true(level.var_120cb74c);
				break;
			}
			case "hash_1601070d585ddd81":
			{
				function_3fe9e6d5({#value:!is_true(level.var_2602effb)});
				level.var_2602effb = !is_true(level.var_2602effb);
				break;
			}
			case "hash_7ac289b5f23d2a16":
			{
				function_42d3c9f5({#value:cmd[1]});
				break;
			}
			case "hash_c2cc9e25cab2cd7":
			{
				spawn_aitype(cmd[1]);
				break;
			}
			case "hash_6aa7001d6e1ebe88":
			{
				function_e645d51a(level.var_a46cf88a, cmd[1]);
				break;
			}
			case "hash_577941bb0dacd434":
			{
				function_e645d51a(getaiarray(), cmd[1]);
				break;
			}
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
			case "hash_79295473b7f29d5":
			{
				var_9965967d = namespace_ce1f29cc::function_fac3e87c();
				var_625b64e6 = namespace_2c949ef8::function_10c88d2e();
				spawns = arraycombine(&var_9965967d, &var_625b64e6, 0);
				level thread function_46997bdf(&spawns, "");
				break;
			}
			case "hash_6c29b11ea918c7bb":
			{
				var_9965967d = namespace_ce1f29cc::function_fac3e87c();
				var_625b64e6 = namespace_2c949ef8::function_10c88d2e();
				spawns = arraycombine(&var_9965967d, &var_625b64e6, 0);
				function_70e877d7(&spawns);
				break;
			}
			case "hash_5f4a68bd8f1d951c":
			{
				if(!level flag::get(#"hash_2948fbc2709393c1"))
				{
					level thread function_34f85f1b(#"hash_2948fbc2709393c1");
				}
				else
				{
					level flag::clear(#"hash_2948fbc2709393c1");
				}
				break;
			}
			case "hash_4dcde390e34421ba":
			{
				if(!level flag::get(#"hash_7c64d48a72acee19"))
				{
					level thread function_34f85f1b(#"hash_7c64d48a72acee19", 0);
				}
				else
				{
					level flag::clear(#"hash_7c64d48a72acee19");
				}
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
			case "hash_34eaa65aa218e34c":
			{
				level function_e77b67f(params, 1);
				break;
			}
			case "hash_2a07c5c2234c0125":
			{
				level function_e77b67f(params, 0);
				break;
			}
			case "hash_6e8b16b2c5467b11":
			{
				level notify(#"hash_4fbe4720f6f13107", {#b_success:1});
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
	Name: function_e77b67f
	Namespace: namespace_420b39d3
	Checksum: 0x4C18C42C
	Offset: 0x1498
	Size: 0x208
	Parameters: 2
	Flags: None
*/
function function_e77b67f(params, show)
{
	/#
		cmd = strtok(params.value, "");
		if(cmd.size <= 1 || cmd.size > 3)
		{
			return;
		}
		key = "";
		value = cmd[1];
		if(cmd.size > 2)
		{
			key = cmd[1];
			value = cmd[2];
		}
		ents = getentarray(value, key);
		if(!ents.size)
		{
			println((("" + key) + "") + value);
			return;
		}
		foreach(ent in ents)
		{
			if(show)
			{
				setdvar(#"hash_1c45750e4f6818eb", 1);
				showinfovolume(ent getentitynumber(), (1, 1, 0), 0.5);
				continue;
			}
			hideinfovolume(ent getentitynumber());
		}
	#/
}

/*
	Name: function_f9023d3a
	Namespace: namespace_420b39d3
	Checksum: 0xB38AAA30
	Offset: 0x16A8
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
	Checksum: 0xFD1F618E
	Offset: 0x1798
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
	Checksum: 0x7B51F45F
	Offset: 0x1888
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
	Checksum: 0x50DF056F
	Offset: 0x18F0
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
	Checksum: 0x9A257AA7
	Offset: 0x1A58
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
	Checksum: 0xC298DCA1
	Offset: 0x1C18
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
	Checksum: 0xC1A103BF
	Offset: 0x1D08
	Size: 0x29A
	Parameters: 0
	Flags: None
*/
function function_b104a7cb()
{
	/#
		if(is_true(level.var_26340887))
		{
			level notify(#"hash_f214fb1df20b46b");
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
				debug2dtext((960, 180, 0), (("" + distance(player.origin, position)) + "") + distancesquared(player.origin, position), (1, 1, 0), 1, (0, 0, 0), 0.75);
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
	Checksum: 0x909DD2C0
	Offset: 0x1FB0
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
	Checksum: 0x8A41E62
	Offset: 0x2110
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
	Checksum: 0x58A23CB8
	Offset: 0x2198
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
	Checksum: 0x8137BCE9
	Offset: 0x2498
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
	Name: spawn_aitype
	Namespace: namespace_420b39d3
	Checksum: 0x1A8D386
	Offset: 0x2588
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function spawn_aitype(aitype)
{
	/#
		host = getplayers()[0];
		v_origin = host function_7ae85497();
		ai = spawnactor(aitype, v_origin, host.angles + vectorscale((0, 1, 0), 180), "", 1);
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
			iprintlnbold((("" + aitype) + "") + getailimit() + "");
		}
	#/
}

/*
	Name: function_e645d51a
	Namespace: namespace_420b39d3
	Checksum: 0x3CBC28AD
	Offset: 0x2708
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
	Checksum: 0x2FD656E5
	Offset: 0x2820
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
	Checksum: 0xAE1C6B90
	Offset: 0x2888
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
			a_ai = player function_bdda420f(player.origin, 2000);
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
	Checksum: 0xCC0339BA
	Offset: 0x2A50
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
	Checksum: 0x4C571F2A
	Offset: 0x2AC8
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
	Checksum: 0xD74E88C6
	Offset: 0x2E18
	Size: 0x118
	Parameters: 1
	Flags: Private
*/
function private function_3fe9e6d5(params)
{
	/#
		if(isdefined(params.value) && params.value !== 0)
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
	Checksum: 0x7BDDD20A
	Offset: 0x2F38
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
	Checksum: 0x20BDB7D
	Offset: 0x2FD0
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
	Checksum: 0x97AAAD5E
	Offset: 0x3030
	Size: 0x220
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
		var_eb3b90d = namespace_8b6a9d79::function_f703a5a(s_instance);
		if(isdefined(var_a75f9486))
		{
			var_a75f9486 = int(var_a75f9486);
			player = getplayers()[0];
			player setorigin(var_eb3b90d[var_a75f9486].origin);
			player setplayerangles(var_eb3b90d[var_a75f9486].angles);
		}
		else
		{
			foreach(player in getplayers())
			{
				s_spawn = var_eb3b90d[n_index];
				if(isdefined(s_spawn))
				{
					player setorigin(s_spawn.origin);
					player setplayerangles(s_spawn.angles);
				}
			}
		}
	#/
}

/*
	Name: function_2fab7a62
	Namespace: namespace_420b39d3
	Checksum: 0x3E197076
	Offset: 0x3258
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_2fab7a62(str_type)
{
	/#
		if(isdefined(str_type) && str_type != "")
		{
			str_dvar = "" + str_type;
			util::init_dvar(str_dvar, 0, &function_2a3a4bf6);
			util::function_e2e9d901(namespace_8b6a9d79::function_7956c7ac("", function_9e72a96(str_type), 103), ("" + str_dvar) + "");
		}
	#/
}

/*
	Name: function_2a3a4bf6
	Namespace: namespace_420b39d3
	Checksum: 0x225E7F83
	Offset: 0x3328
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
	Checksum: 0xC3967425
	Offset: 0x3400
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
	Checksum: 0xAE292562
	Offset: 0x37C8
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
	Checksum: 0xF0E3F4CC
	Offset: 0x3A68
	Size: 0x494
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
				var_d194d219 = arraygetclosest(getplayers()[0].origin, level.var_f804b293);
				a_spawn_points = struct::get_array(var_d194d219.targetname, "");
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
		if(isdefined(var_4777a582))
		{
			setdvar(#"hash_7c3872b765911891", var_4777a582);
		}
	#/
}

/*
	Name: function_8245d8a0
	Namespace: namespace_420b39d3
	Checksum: 0xBA8C0AF2
	Offset: 0x3F08
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
	Checksum: 0x17E7AC87
	Offset: 0x3F80
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
		var_4777a582 = getdvarint(#"hash_7c3872b765911891", 0);
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
	Checksum: 0xED1FE20A
	Offset: 0x4510
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
	Checksum: 0x999CFB9C
	Offset: 0x4770
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
	Checksum: 0xEDB9A963
	Offset: 0x4900
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
				goal = awareness::function_b184324d(spawn_point.origin, (isdefined(spawn_point.var_1564b717) ? spawn_point.var_1564b717 : 128), self getpathfindingradius() * 1.2, self getpathfindingradius() * 1.2);
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
	Checksum: 0x8A78E3DC
	Offset: 0x4DF8
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
	Checksum: 0x4B28FAA6
	Offset: 0x4E30
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
	Checksum: 0x84B9989E
	Offset: 0x4E58
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

