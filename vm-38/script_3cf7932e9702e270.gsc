#using script_5bb072c3abf4652c;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_51d1d6a3;

/*
	Name: function_7e3ec462
	Namespace: namespace_51d1d6a3
	Checksum: 0xA9313C6D
	Offset: 0x2C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7e3ec462()
{
	level notify(873289453);
}

/*
	Name: function_89f2df9
	Namespace: namespace_51d1d6a3
	Checksum: 0x2CA4510D
	Offset: 0x2E8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5fae7e8391e7e602", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_51d1d6a3
	Checksum: 0xBA5EED32
	Offset: 0x340
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_4d16d15f = #"hash_583a7c6fc0d127b0";
	level.var_24cfb8fb = "none";
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_51d1d6a3
	Checksum: 0xC6C5D372
	Offset: 0x378
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(zm_utility::is_classic())
	{
		level thread function_c6565603();
		callback::on_ai_spawned(&on_ai_spawned);
		/#
			execdevgui("");
			level thread function_3b2016d3();
		#/
	}
}

/*
	Name: on_ai_spawned
	Namespace: namespace_51d1d6a3
	Checksum: 0xE1F776EC
	Offset: 0x408
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
	if(self.archetype === #"hash_7c0d83ac1e845ac2" && !isdefined(self.var_9fde8624) && self.team === level.zombie_team)
	{
		if(!is_true(level.var_8804e5b7) || !is_true(level.var_8fff3192))
		{
			self thread function_40466d11();
		}
		self thread function_398dbc69();
	}
	if(self.aitype === "spawner_zm_steiner_f")
	{
		self thread function_c3b9424b();
	}
	if(self.aitype === #"hash_53f4e0daa341a161" && self.team === level.zombie_team)
	{
		self thread function_df33ea46();
	}
}

/*
	Name: function_c3b9424b
	Namespace: namespace_51d1d6a3
	Checksum: 0x8DD243CD
	Offset: 0x538
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_c3b9424b()
{
	level endon(#"end_game", #"game_ended", #"hash_6dae739b31c68d72");
	self endon(#"death");
	level flag::wait_till(#"hash_2406ec20430ec032");
	level.var_b68b30f7 = 0;
	var_dac4be45 = 0;
	while(true)
	{
		if(self.ai.var_a49798e7 == 1 && level.var_b68b30f7 == 0)
		{
			level.var_b68b30f7 = 1;
			self thread function_7c1f247a(var_dac4be45);
			if(var_dac4be45 < 5)
			{
				var_dac4be45++;
			}
			else
			{
				var_dac4be45 = 0;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_7c1f247a
	Namespace: namespace_51d1d6a3
	Checksum: 0x70E693BD
	Offset: 0x650
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_7c1f247a(var_7a3471b7)
{
	self zm_vo::function_d6f8bbd9(#"hash_10cf5cc4c1f4526" + var_7a3471b7);
	var_37f7293a = 30;
	wait(var_37f7293a);
	level.var_b68b30f7 = 0;
}

/*
	Name: function_df33ea46
	Namespace: namespace_51d1d6a3
	Checksum: 0x8F7EBEB5
	Offset: 0x6B0
	Size: 0x278
	Parameters: 0
	Flags: Linked
*/
function function_df33ea46()
{
	level endon(#"end_game", #"game_ended");
	self endon(#"death");
	wait(4);
	if(!is_true(level.var_f9287f6d))
	{
		level.var_f9287f6d = 1;
		self zm_vo::function_d6f8bbd9(#"hash_4e2210bb1d324c21");
	}
	if(is_true(level.var_5eb2de5e))
	{
		level.var_5eb2de5e = 0;
		self zm_vo::function_d6f8bbd9(#"hash_43c238c3de424c52");
	}
	if(is_true(level.var_988e3b51))
	{
		level.var_988e3b51 = 0;
		self zm_vo::function_d6f8bbd9(#"hash_717ac87ac16d7f03");
	}
	if(!level flag::get(#"hash_6d5f0babef82cff6"))
	{
		n_delay = randomintrange(4, 7);
		wait(n_delay);
		while(true)
		{
			self zm_vo::function_d6f8bbd9(#"hash_3931438d7d66b6c3");
			n_delay = randomintrange(60, 80);
			wait(n_delay);
		}
	}
	else if(level flag::get(#"hash_2406ec20430ec032") && level flag::get(#"hash_6d5f0babef82cff6"))
	{
		n_delay = randomintrange(4, 7);
		wait(n_delay);
		while(true)
		{
			self zm_vo::function_d6f8bbd9(#"hash_61d2f8c624470c9e");
			n_delay = randomintrange(60, 80);
			wait(n_delay);
		}
	}
}

/*
	Name: function_398dbc69
	Namespace: namespace_51d1d6a3
	Checksum: 0xDE751633
	Offset: 0x930
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_398dbc69()
{
	level endon(#"end_game", #"game_ended");
	self endon(#"death");
	n_delay = randomintrange(4, 7);
	wait(n_delay);
	while(true)
	{
		self zm_vo::function_d6f8bbd9(#"hash_2713f6cca57189d3");
		n_delay = randomintrange(60, 80);
		wait(n_delay);
	}
}

/*
	Name: function_40466d11
	Namespace: namespace_51d1d6a3
	Checksum: 0x4158458B
	Offset: 0x9F0
	Size: 0x26A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_40466d11()
{
	level endon(#"end_game", #"game_ended");
	level notify("19651613ce31d530");
	level endon("19651613ce31d530");
	if(!is_true(level.var_8804e5b7))
	{
		level.var_8804e5b7 = 1;
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level thread function_14a92dc6(#"hash_2bfa170c2577a2c0");
				break;
			}
			case "carver":
			{
				level thread function_14a92dc6(#"hash_2c86ec42e4ab7ef6");
				break;
			}
			case "grey":
			{
				level thread function_14a92dc6(#"hash_1224d15cf609ed6");
				break;
			}
		}
	}
	if(!is_true(level.var_8fff3192))
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"spawned_split_ai", #"death");
		if(var_be17187b._notify == "spawned_split_ai")
		{
			level.var_8fff3192 = 1;
			switch(level.var_4d16d15f)
			{
				case "hash_583a7c6fc0d127b0":
				{
					level thread function_14a92dc6(#"hash_26e569fb2e7fabe");
					break;
				}
				case "carver":
				{
					level thread function_14a92dc6(#"hash_477a4a51045495a0");
					break;
				}
				case "grey":
				{
					level thread function_14a92dc6(#"hash_1f327a042fd14498");
					break;
				}
			}
		}
	}
}

/*
	Name: function_c6565603
	Namespace: namespace_51d1d6a3
	Checksum: 0x6B185C43
	Offset: 0xC68
	Size: 0x27C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c6565603()
{
	level endon(#"end_game", #"game_ended");
	level flag::wait_till("initial_blackscreen_passed");
	if(isdefined(level.var_dfee7fc2) && !getdvarint(#"hash_39af51993585a73e", 0))
	{
		level thread function_14a92dc6(#"infil", 6.5);
	}
	level flag::wait_till(#"intro_scene_done");
	if(is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) || getdvarint(#"hash_40bd34b35079cf2e", 0) > 0)
	{
		level thread scene::play_from_time(#"hash_33e91a2c1bda9651", undefined, undefined, 0.33);
		zm_vo::function_2cf4b07f(#"hash_47e92194aaef0ed8", #"hash_5e5e5e00259cc81a");
		level zm_vo::function_8abe0568(#"hash_47e92194aaef0ed8", 1);
	}
	level function_14a92dc6(#"matchstart", 0.5);
	level thread function_3633608();
	level thread function_902215db();
	level thread function_952f3605();
	level thread function_ab2c7273();
	level thread function_4a3710bf();
	level thread function_5510bf92();
	level thread function_835805bb();
}

/*
	Name: function_3633608
	Namespace: namespace_51d1d6a3
	Checksum: 0xEDFDE7B
	Offset: 0xEF0
	Size: 0x792
	Parameters: 0
	Flags: Linked
*/
function function_3633608()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"end_of_round");
	wait(2);
	level.var_4d16d15f = array::random([2:#"grey", 1:#"carver", 0:#"hash_583a7c6fc0d127b0"]);
	level.var_6d0817f3 = function_21a3a673(1, 3);
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_7c89e8e126b6c6fd" + level.var_6d0817f3);
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_30a3deddec6cfb7b" + level.var_6d0817f3);
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_24d6176c658cdf7b" + level.var_6d0817f3);
			break;
		}
	}
	level flag::wait_till(#"hash_61c2fed7a1f6d570");
	wait(0.25);
	level.var_6d0817f3 = function_21a3a673(1, 3);
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_746082b4ed748867");
			level thread function_14a92dc6(#"hash_703122bc846f3274" + level.var_6d0817f3, 2);
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_15658a997da0f703");
			level thread function_14a92dc6(#"hash_3b930e2e45b286a8" + level.var_6d0817f3, 2);
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_1354333b8e3a096f");
			level thread function_14a92dc6(#"hash_2a239d01902b7bf4" + level.var_6d0817f3, 2);
			break;
		}
	}
	level flag::wait_till(#"power_on");
	level zm_vo::function_d6f8bbd9(#"hash_fe61de910d51e7", undefined, function_a1ef346b());
	level zm_vo::function_d6f8bbd9(#"hash_7db209e28051b399", undefined, function_a1ef346b());
	level flag::wait_till_all([1:"terminal_2_is_on", 0:"terminal_1_is_on"]);
	wait(12);
	level.var_6d0817f3 = function_21a3a673(1, 3);
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_664de04f130d528f" + level.var_6d0817f3);
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_5d3863e1a86e9e91" + level.var_6d0817f3);
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_12f00faa6698a759" + level.var_6d0817f3);
			break;
		}
	}
	level flag::wait_till(#"dark_aether_active");
	wait(4);
	level.var_6d0817f3 = function_21a3a673(1, 3);
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level zm_vo::function_7622cb70(#"hash_37898e53a04b05e" + level.var_6d0817f3, 2);
			break;
		}
		case "carver":
		{
			level zm_vo::function_7622cb70(#"hash_7408136b760428de" + level.var_6d0817f3, 2);
			break;
		}
		case "grey":
		{
			level zm_vo::function_7622cb70(#"hash_7f7a42977f2ca82" + level.var_6d0817f3, 2);
			break;
		}
	}
	level flag::wait_till_clear(#"hash_23d445a634bedeae");
	level function_14a92dc6(#"hash_435c5cccc93229fb", 2);
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_3581d9e7960a0f9e");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_79da06b07a856000");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_3484dc620f0683f8");
			break;
		}
	}
}

/*
	Name: function_902215db
	Namespace: namespace_51d1d6a3
	Checksum: 0xAC5C6FFE
	Offset: 0x1690
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_902215db()
{
	level endon(#"end_game", #"game_ended");
	level flag::wait_till(#"hash_15f3e07d50195cb9");
	if(isdefined(level.var_516c02a2))
	{
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level.var_516c02a2 function_14a92dc6(#"hash_1ba60eb0e7d6a166");
				break;
			}
			case "carver":
			{
				level.var_516c02a2 function_14a92dc6(#"hash_637b0c2ea5c531d8");
				break;
			}
			case "grey":
			{
				level.var_516c02a2 function_14a92dc6(#"hash_24d2af04716fb500");
				break;
			}
		}
	}
	level thread function_19c1718a();
}

/*
	Name: function_ab2c7273
	Namespace: namespace_51d1d6a3
	Checksum: 0x10B50558
	Offset: 0x17E8
	Size: 0x202
	Parameters: 0
	Flags: Linked
*/
function function_ab2c7273()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"hash_43f35dbac954ab43");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_53d9751e497e3c70");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_957314e8a0db966");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_478634a0cf673b66");
			break;
		}
	}
	level waittill(#"hash_e1a9539b07e72be");
	if(isdefined(level.var_c3accf46))
	{
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level.var_c3accf46 function_14a92dc6(#"hash_5155cb66536ec31d");
				break;
			}
			case "carver":
			{
				level.var_c3accf46 function_14a92dc6(#"hash_366dc4f7e2e3e96d");
				break;
			}
			case "grey":
			{
				level.var_c3accf46 function_14a92dc6(#"hash_545ec2c7298a79f1");
				break;
			}
		}
	}
}

/*
	Name: function_4a3710bf
	Namespace: namespace_51d1d6a3
	Checksum: 0xA42C3A71
	Offset: 0x19F8
	Size: 0x202
	Parameters: 0
	Flags: Linked
*/
function function_4a3710bf()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"hash_20690d1d96df7c03");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_3f97277da473b26");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_6973cef15a716d98");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_58534fe1830e66c0");
			break;
		}
	}
	level waittill(#"hash_6eada88f109e645");
	if(isdefined(level.var_ae002b60))
	{
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level.var_ae002b60 function_14a92dc6(#"hash_668d7bbc9af9b6d9");
				break;
			}
			case "carver":
			{
				level.var_ae002b60 function_14a92dc6(#"hash_197f35de323a80d1");
				break;
			}
			case "grey":
			{
				level.var_ae002b60 function_14a92dc6(#"hash_c25813223ef09a5");
				break;
			}
		}
	}
}

/*
	Name: function_5510bf92
	Namespace: namespace_51d1d6a3
	Checksum: 0x17A471FF
	Offset: 0x1C08
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_5510bf92()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"hash_120dd64bcb70e566");
	if(isdefined(level.var_42000fd0))
	{
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level.var_42000fd0 function_14a92dc6(#"hash_7a5f631bfc8662ea");
				break;
			}
			case "carver":
			{
				level.var_42000fd0 function_14a92dc6(#"hash_4916ddf4dc7ba3f4");
				break;
			}
			case "grey":
			{
				level.var_42000fd0 function_14a92dc6(#"hash_20b604aa921aab9c");
				break;
			}
		}
	}
}

/*
	Name: function_835805bb
	Namespace: namespace_51d1d6a3
	Checksum: 0xF3F2B5B8
	Offset: 0x1D40
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_835805bb()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"hash_5e2064095a103269");
	if(isdefined(level.var_c8a2dc28))
	{
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level.var_c8a2dc28 function_14a92dc6(#"hash_17c189767812d048");
				break;
			}
			case "carver":
			{
				level.var_c8a2dc28 function_14a92dc6(#"hash_71429496494273ce");
				break;
			}
			case "grey":
			{
				level.var_c8a2dc28 function_14a92dc6(#"hash_1f115d16a77d1e3e");
				break;
			}
		}
	}
}

/*
	Name: function_19c1718a
	Namespace: namespace_51d1d6a3
	Checksum: 0xD0F655AF
	Offset: 0x1E78
	Size: 0x3E6
	Parameters: 0
	Flags: Linked
*/
function function_19c1718a()
{
	level endon(#"end_game", #"game_ended");
	while(true)
	{
		s_notify = undefined;
		s_notify = level waittill(#"hash_a470078be6bce8d", #"hash_175cf405da429202", #"hash_76081eebc1e70e5", #"hash_11d2dc6f056764da");
		switch(s_notify._notify)
		{
			case "hash_a470078be6bce8d":
			{
				switch(level.var_4d16d15f)
				{
					case "hash_583a7c6fc0d127b0":
					{
						level function_14a92dc6(#"hash_5e88d33aa9677afe");
						break;
					}
					case "carver":
					{
						level function_14a92dc6(#"hash_610cf72ea6bc74e0");
						break;
					}
					case "grey":
					{
						level function_14a92dc6(#"hash_7af91ef5c5ed90d8");
						break;
					}
				}
				break;
			}
			case "hash_175cf405da429202":
			{
				switch(level.var_4d16d15f)
				{
					case "hash_583a7c6fc0d127b0":
					{
						level function_14a92dc6(#"hash_2caf7a7d178b77ba");
						break;
					}
					case "carver":
					{
						level function_14a92dc6(#"hash_781c03f419700ec4");
						break;
					}
					case "grey":
					{
						level function_14a92dc6(#"hash_46cc33923a453b8c");
						break;
					}
				}
				break;
			}
			case "hash_76081eebc1e70e5":
			{
				switch(level.var_4d16d15f)
				{
					case "hash_583a7c6fc0d127b0":
					{
						level function_14a92dc6(#"hash_17c2d93101463ced");
						break;
					}
					case "carver":
					{
						level function_14a92dc6(#"hash_41031d0bc140b37d");
						break;
					}
					case "grey":
					{
						level function_14a92dc6(#"hash_432e606c89dc18e1");
						break;
					}
				}
				break;
			}
			case "hash_11d2dc6f056764da":
			{
				switch(level.var_4d16d15f)
				{
					case "hash_583a7c6fc0d127b0":
					{
						level function_14a92dc6(#"hash_5bf0eab62d8ef917");
						break;
					}
					case "carver":
					{
						level function_14a92dc6(#"hash_250b5b485ca6a8f3");
						break;
					}
					case "grey":
					{
						level function_14a92dc6(#"hash_7f4bed84439013ff");
						break;
					}
				}
				break;
			}
		}
	}
}

/*
	Name: function_13d6d61f
	Namespace: namespace_51d1d6a3
	Checksum: 0x98FE7D9F
	Offset: 0x2268
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function function_13d6d61f()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"manage_to_find_aetherscope_part");
	level flag::wait_till_clear(#"hash_23d445a634bedeae");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_ce99e6568dee47d");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_28272cdbefb5f54d");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_79c0b87570aa4cd1");
			break;
		}
	}
	level flag::wait_till(#"hash_1e2c6b7b99b8706b");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_2a02c9052990894a");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_1d3faca9cf45d5d4");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_7b684da68327b77c");
			break;
		}
	}
	level thread function_71299b6e();
	level thread function_aa918663();
}

/*
	Name: function_c45ee789
	Namespace: namespace_51d1d6a3
	Checksum: 0xE0B2B388
	Offset: 0x24A8
	Size: 0x102
	Parameters: 0
	Flags: Linked
*/
function function_c45ee789()
{
	level endon(#"end_game", #"game_ended");
	level waittill(#"hash_222af38f51671594");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_f86b89d90bc0baa");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_14bbd9fbebb9bcb4");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_4cdd7e2fd505c45c");
			break;
		}
	}
}

/*
	Name: function_73b2378f
	Namespace: namespace_51d1d6a3
	Checksum: 0x29618CE9
	Offset: 0x25B8
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_73b2378f()
{
	level endon(#"end_game", #"game_ended");
	level flag::wait_till(#"hash_5d063793500cc512");
	level function_14a92dc6(#"hash_cb591bbc36d61c6");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_1f2fad952b916ca0");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_64b8440b42394056");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_7d69a94c65638236");
			break;
		}
	}
}

/*
	Name: function_61e91466
	Namespace: namespace_51d1d6a3
	Checksum: 0x10B8CB67
	Offset: 0x26F0
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function function_61e91466()
{
	level endon(#"end_game", #"game_ended");
	level.var_5eb2de5e = 1;
	level flag::wait_till(#"hash_6ddc7fc43d014f02");
	level zm_vo::function_d6f8bbd9(#"hash_1a439eaaa23e129a", undefined, function_a1ef346b());
	level zm_vo::function_d6f8bbd9(#"hash_4427f4ac84d6ca61", 1, function_a1ef346b());
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_59c256f38f192498");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_14c7d373837bb55e");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_4df2d7824c79c7ae");
			break;
		}
	}
}

/*
	Name: function_946d553b
	Namespace: namespace_51d1d6a3
	Checksum: 0x5C5364FB
	Offset: 0x2888
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_946d553b()
{
	level endon(#"end_game", #"game_ended");
	level thread function_ee2c526b();
}

/*
	Name: function_afe33aa6
	Namespace: namespace_51d1d6a3
	Checksum: 0xE86CD129
	Offset: 0x28D8
	Size: 0x1E2
	Parameters: 0
	Flags: Linked
*/
function function_afe33aa6()
{
	level endon(#"end_game", #"game_ended");
	level notify(#"hash_321aa1bcb0bb18bd");
	level zm_vo::function_d6f8bbd9(#"hash_497e0e37a7afc66", undefined, function_a1ef346b());
	level flag::wait_till(#"steiner_merge_done");
	level zm_vo::function_d6f8bbd9(#"hash_48e985ab475cb061", undefined, function_a1ef346b());
	level flag::wait_till(#"hash_821afd1816759c2");
	level zm_vo::function_d6f8bbd9(#"hash_7f5ce38acf75a8f4", undefined, function_a1ef346b());
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_7b3b9b567d3354a4");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_379a717bbd4bbbb2");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_3c62e74c8b3c7a32");
			break;
		}
	}
}

/*
	Name: function_56ba2988
	Namespace: namespace_51d1d6a3
	Checksum: 0x57EEF34E
	Offset: 0x2AC8
	Size: 0x13A
	Parameters: 0
	Flags: Linked
*/
function function_56ba2988()
{
	level endon(#"end_game", #"game_ended");
	level.var_988e3b51 = 1;
	level flag::wait_till(#"hash_781cedacdfef3f84");
	if(!level flag::get(#"hash_7cf2e90487ecca77"))
	{
		switch(level.var_4d16d15f)
		{
			case "hash_583a7c6fc0d127b0":
			{
				level function_14a92dc6(#"hash_7e2b798c1a94936c");
				break;
			}
			case "carver":
			{
				level function_14a92dc6(#"hash_18330842160ffa4a");
				break;
			}
			case "grey":
			{
				level function_14a92dc6(#"hash_86ddf1b1d72cefa");
				break;
			}
		}
	}
}

/*
	Name: function_7def382e
	Namespace: namespace_51d1d6a3
	Checksum: 0x9B414F58
	Offset: 0x2C10
	Size: 0x48C
	Parameters: 0
	Flags: Linked
*/
function function_7def382e()
{
	level endon(#"end_game", #"game_ended");
	level flag::wait_till(#"hash_f5da22dea5e85bf");
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_404c8dbda14093ec");
	}
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_652055f58c723ad");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_3d3d21ec57076f3d");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_60f2ec1caefe78a1");
			break;
		}
	}
	level flag::wait_till(#"hash_6d5f0babef82cff6");
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_7856d6d508b98f55");
	}
	if(isdefined(level.var_704c79ef))
	{
		level.var_704c79ef zm_vo::function_d6f8bbd9(#"hash_50739ef25ce8eb68");
	}
	level flag::set(#"hash_2406ec20430ec032");
	level thread function_c7ca9f21();
	level flag::wait_till(#"hash_3a617ab5e651c2a9");
	level thread zm_vo::function_d6f8bbd9(#"hash_66e5d1c8e5c7f95f", undefined, function_a1ef346b());
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_1ae92cebff80b19a");
	}
	level flag::wait_till(#"hash_4f6940328c97b402");
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_49776d7f856030ce");
	}
	level flag::wait_till(#"hash_4a49aa778b3cdd8");
	level zm_vo::function_d6f8bbd9(#"hash_e1a00c5df96472b", undefined, function_a1ef346b());
	level thread zm_vo::function_d6f8bbd9(#"hash_e19ffc5df964578", undefined, function_a1ef346b());
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_79f31fb265dc37ae");
	}
	level flag::wait_till(#"hash_4f693f328c97b24f");
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_3106c3a5a6c00979");
	}
	level flag::wait_till(#"hash_1aab687832f4e02b");
	level zm_vo::function_d6f8bbd9(#"hash_39f6b9475a0e656e", undefined, function_a1ef346b());
	level flag::set(#"hash_3dc9f09d14c418d9");
}

/*
	Name: function_ddb84db5
	Namespace: namespace_51d1d6a3
	Checksum: 0x4AD42432
	Offset: 0x30A8
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_ddb84db5()
{
	level endon(#"end_game", #"game_ended");
	if(isdefined(level.var_b0eb5e2))
	{
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_71d10005e47c7063");
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_2936eabf5e3d451f");
		wait(2);
		level.var_b0eb5e2 zm_vo::function_d6f8bbd9(#"hash_71d0ff05e47c6eb0");
	}
	level function_14a92dc6(#"hash_312eab510083e1e2");
	level notify(#"hash_4e734bad5161c1e7");
	level thread zm_vo::function_d6f8bbd9(#"hash_39f6ba475a0e6721", undefined, function_a1ef346b());
	level thread function_479619db();
	level thread function_6276b243();
}

/*
	Name: function_952f3605
	Namespace: namespace_51d1d6a3
	Checksum: 0xC6650722
	Offset: 0x3208
	Size: 0x25E
	Parameters: 0
	Flags: Linked
*/
function function_952f3605()
{
	level endon(#"end_game", #"game_ended");
	while(true)
	{
		s_notify = undefined;
		s_notify = level waittill(#"hash_64a65262c4492d98", #"hash_360f9258b1f19bcb", #"hash_c28b252525633da", #"hash_147d728c7bf9fa75", #"hash_695a92826c9198a4", #"hash_3bc9b27c09d93ae7", #"hash_6500b270bf5a1596", #"hash_196792ac246fbe91", #"hash_6f1392a5c4774e60");
		switch(s_notify._notify)
		{
			case "hash_64a65262c4492d98":
			{
				level thread function_13d6d61f();
				break;
			}
			case "hash_360f9258b1f19bcb":
			{
				level thread function_c45ee789();
				break;
			}
			case "hash_c28b252525633da":
			{
				level thread function_73b2378f();
				break;
			}
			case "hash_147d728c7bf9fa75":
			{
				level thread function_61e91466();
				break;
			}
			case "hash_695a92826c9198a4":
			{
				level thread function_946d553b();
				break;
			}
			case "hash_3bc9b27c09d93ae7":
			{
				level thread function_afe33aa6();
				break;
			}
			case "hash_6500b270bf5a1596":
			{
				level thread function_56ba2988();
				break;
			}
			case "hash_196792ac246fbe91":
			{
				level thread function_7def382e();
				break;
			}
			case "hash_6f1392a5c4774e60":
			{
				level thread function_ddb84db5();
				break;
			}
		}
	}
}

/*
	Name: function_c7ca9f21
	Namespace: namespace_51d1d6a3
	Checksum: 0x894D3F53
	Offset: 0x3470
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function function_c7ca9f21()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_7e3660d8d125a63a");
		if(waitresult.aitype === #"hash_53f4e0daa341a161")
		{
			level function_14a92dc6(#"hash_898a2ece2e63db5");
		}
	}
}

/*
	Name: function_aa918663
	Namespace: namespace_51d1d6a3
	Checksum: 0xBF394569
	Offset: 0x34F0
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_aa918663()
{
	level endon(#"end_game", #"game_ended");
	while(!is_true(level.var_909c3262) || !is_true(level.var_ae9e1aec))
	{
		level waittill(#"end_of_round");
		level.var_1f38ef9f = 0;
		foreach(player in getplayers())
		{
			if(!is_true(level.var_909c3262))
			{
				player thread function_6a3c98be();
			}
			if(!is_true(level.var_ae9e1aec))
			{
				player thread function_daafb798();
			}
		}
	}
}

/*
	Name: function_6a3c98be
	Namespace: namespace_51d1d6a3
	Checksum: 0x7469E68F
	Offset: 0x3670
	Size: 0x2B8
	Parameters: 0
	Flags: Linked
*/
function function_6a3c98be()
{
	level endon(#"end_game", #"game_ended", #"hash_4ed1b7566146cf88");
	self endon(#"death");
	var_e10caa68 = [2:"zone_power_tunel", 1:"zone_trans_north", 0:"zone_trans_south_tunnel"];
	while(true)
	{
		var_2f39336 = self zm_zonemgr::get_player_zone();
		self waittill(#"hash_2d4daa9e80b86b60");
		if(isdefined(var_2f39336))
		{
			if(isinarray(var_e10caa68, var_2f39336) && !is_true(level.var_909c3262) && (self.cached_zone_name === "zone_center_lower" || self.cached_zone_name === "zone_center_upper_west" || self.cached_zone_name === "zone_center_upper_north" || self.cached_zone_name === "zone_center_upper") && !is_true(level.var_1f38ef9f) && !level flag::get(#"dark_aether_active"))
			{
				level.var_909c3262 = 1;
				level.var_1f38ef9f = 1;
				switch(level.var_4d16d15f)
				{
					case "hash_583a7c6fc0d127b0":
					{
						level function_14a92dc6(#"hash_10e465208d0c985b");
						break;
					}
					case "carver":
					{
						level function_14a92dc6(#"hash_22051b7920fc05ef");
						break;
					}
					case "grey":
					{
						level function_14a92dc6(#"hash_322b908a40c115fb");
						break;
					}
				}
			}
		}
		break;
	}
	level notify(#"hash_4ed1b7566146cf88");
}

/*
	Name: function_daafb798
	Namespace: namespace_51d1d6a3
	Checksum: 0x504F2FFB
	Offset: 0x3930
	Size: 0x228
	Parameters: 0
	Flags: Linked
*/
function function_daafb798()
{
	level endon(#"end_game", #"game_ended", #"hash_1f04b497d266ec4d");
	self endon(#"death");
	level.var_7974d690 = [1:"zone_proto_upstairs", 0:"zone_proto_interior_cave"];
	while(true)
	{
		self waittill(#"hash_2d4daa9e80b86b60");
		if(self zm_zonemgr::is_player_in_zone(level.var_7974d690, 0) && !is_true(level.var_ae9e1aec) && !is_true(level.var_1f38ef9f) && !level flag::get(#"dark_aether_active"))
		{
			level.var_ae9e1aec = 1;
			level.var_1f38ef9f = 1;
			switch(level.var_4d16d15f)
			{
				case "hash_583a7c6fc0d127b0":
				{
					level function_14a92dc6(#"hash_70fba3c776927b17");
					break;
				}
				case "carver":
				{
					level function_14a92dc6(#"hash_3b40135268001ef3");
					break;
				}
				case "grey":
				{
					level function_14a92dc6(#"hash_52cc94e858b299ff");
					break;
				}
			}
			break;
		}
	}
	level notify(#"hash_1f04b497d266ec4d");
}

/*
	Name: function_71299b6e
	Namespace: namespace_51d1d6a3
	Checksum: 0x65449208
	Offset: 0x3B60
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_71299b6e()
{
	level endon(#"end_game", #"game_ended");
	var_25e4248d = getent("observation_room_trigger", "targetname");
	var_25e4248d waittill(#"trigger");
	switch(level.var_4d16d15f)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level function_14a92dc6(#"hash_2df687a8d81dd712");
			break;
		}
		case "carver":
		{
			level function_14a92dc6(#"hash_b7ed89957bef24c");
			break;
		}
		case "grey":
		{
			level function_14a92dc6(#"hash_70f79c3338502a64");
			break;
		}
	}
}

/*
	Name: function_ee2c526b
	Namespace: namespace_51d1d6a3
	Checksum: 0xF0D80914
	Offset: 0x3C98
	Size: 0x3E6
	Parameters: 0
	Flags: Linked
*/
function function_ee2c526b()
{
	level endon(#"end_game", #"game_ended", #"hash_321aa1bcb0bb18bd");
	while(true)
	{
		s_notify = undefined;
		s_notify = level waittill(#"hash_5734ddadf0546dc3", #"hash_4337abdaab1fc730", #"hash_3f9e5836a14975bc", #"hash_395eb3958f40a0cd");
		switch(s_notify._notify)
		{
			case "hash_5734ddadf0546dc3":
			{
				level zm_vo::function_d6f8bbd9(#"hash_227fbd78a7fbe481", 1, function_a1ef346b());
				break;
			}
			case "hash_4337abdaab1fc730":
			{
				level zm_vo::function_d6f8bbd9(#"hash_564984dea1b6179f", 1, function_a1ef346b());
				level zm_vo::function_d6f8bbd9(#"hash_40bf227fb6f54b9", 1, function_a1ef346b());
				break;
			}
			case "hash_3f9e5836a14975bc":
			{
				level zm_vo::function_d6f8bbd9(#"hash_262142d01923bd24", 1, function_a1ef346b());
				break;
			}
			case "hash_395eb3958f40a0cd":
			{
				level zm_vo::function_d6f8bbd9(#"hash_2c81383a9069770f", 1, function_a1ef346b());
				wait(15);
				var_448b5a02 = getent("vol_medical_lab_ctrlrm", "script_noteworthy");
				players = getplayers();
				foreach(player in players)
				{
					if(isdefined(var_448b5a02))
					{
						if(!player istouching(var_448b5a02))
						{
							var_9a92e103 = 0;
						}
					}
				}
				if(is_false(var_9a92e103))
				{
					switch(level.var_4d16d15f)
					{
						case "hash_583a7c6fc0d127b0":
						{
							level function_14a92dc6(#"hash_5d6224d4b53f40b4", 2);
							break;
						}
						case "carver":
						{
							level function_14a92dc6(#"hash_17abdaa5df52cac2", 2);
							break;
						}
						case "grey":
						{
							level function_14a92dc6(#"hash_654c47c2c2e9c122", 2);
							break;
						}
					}
				}
				level notify(#"hash_321aa1bcb0bb18bd");
				break;
			}
		}
	}
}

/*
	Name: function_479619db
	Namespace: namespace_51d1d6a3
	Checksum: 0x44F70675
	Offset: 0x4088
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_479619db()
{
	level endon(#"end_game", #"game_ended");
	var_e10caa68 = [3:"zone_center_upper_north", 2:"zone_center_upper_west", 1:"zone_center_upper", 0:"zone_center_lower"];
	var_658743a7 = 0;
	while(is_false(var_658743a7))
	{
		n_delay = randomintrange(20, 40);
		wait(n_delay);
		foreach(player in function_a1ef346b())
		{
			if(player zm_zonemgr::is_player_in_zone(var_e10caa68, 0))
			{
				player thread zm_vo::function_c4303dda(#"hash_2b7d306d63ee6f03");
				var_658743a7 = 1;
			}
		}
	}
}

/*
	Name: function_14a92dc6
	Namespace: namespace_51d1d6a3
	Checksum: 0x893F5729
	Offset: 0x4218
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function function_14a92dc6(var_b58a6345, n_delay, b_wait_if_busy)
{
	if(!level flag::get(#"hash_23d445a634bedeae"))
	{
		self zm_vo::function_7622cb70(var_b58a6345, n_delay, b_wait_if_busy);
	}
}

/*
	Name: function_6276b243
	Namespace: namespace_51d1d6a3
	Checksum: 0x903DE6F5
	Offset: 0x4280
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_6276b243()
{
	level waittill(#"hash_343f8b4d163b808f");
	level thread zm_vo::function_7622cb70("mq_end_sequence_start", 1);
	level thread zm_vo::function_7622cb70("mq_end_sequence_explosion", 12);
	level thread zm_vo::function_7622cb70("mq_fade_blk_mission_accomplished", 16);
}

/*
	Name: function_5bd32264
	Namespace: namespace_51d1d6a3
	Checksum: 0xA632442B
	Offset: 0x4308
	Size: 0xD0
	Parameters: 3
	Flags: Linked
*/
function function_5bd32264(str_vo_alias, n_delay, b_wait_if_busy)
{
	foreach(player in getplayers())
	{
		if(player zm_zonemgr::is_player_in_zone(level.var_65c43c31, 0))
		{
			player thread zm_vo::function_c4303dda(str_vo_alias, n_delay, b_wait_if_busy);
		}
	}
}

/*
	Name: function_3b2016d3
	Namespace: namespace_51d1d6a3
	Checksum: 0xF0408A38
	Offset: 0x43E0
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_3b2016d3()
{
	/#
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_c5b386e2);
	#/
}

/*
	Name: function_c5b386e2
	Namespace: namespace_51d1d6a3
	Checksum: 0xD032E799
	Offset: 0x4430
	Size: 0x142
	Parameters: 1
	Flags: Private
*/
function private function_c5b386e2(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_4d542c9d3f4bb89b":
			{
				level array::thread_all(getplayers(), &zm_vo::function_d342796e, "", 1, 0, 0, 1);
				break;
			}
			case "hash_5eb39a0fff2ee528":
			{
				level thread function_14a92dc6(#"hash_28272cdbefb5f54d");
				break;
			}
			case "hash_6608e2e55937727e":
			{
				level zm_vo::function_d6f8bbd9(#"hash_fe61de910d51e7", undefined, function_a1ef346b(), undefined);
				level zm_vo::function_d6f8bbd9(#"hash_6d907d6921a5eb66", undefined, function_a1ef346b(), undefined);
			}
			default:
			{
				break;
			}
		}
	#/
}

