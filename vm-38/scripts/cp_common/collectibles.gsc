#using script_32399001bdb550da;
#using script_47fb62300ac0bd60;
#using script_6e46300ab1cb7adb;
#using script_7d0013bbc05623b9;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace collectibles;

/*
	Name: function_72c8ef00
	Namespace: collectibles
	Checksum: 0xA85E626C
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_72c8ef00()
{
	level notify(1964330866);
}

/*
	Name: function_89f2df9
	Namespace: collectibles
	Checksum: 0x2A7ECDAB
	Offset: 0xB8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"collectibles", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: collectibles
	Checksum: 0x76E7E5A
	Offset: 0x110
	Size: 0x10
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_4ac1758e = [];
}

/*
	Name: function_8ac3bea9
	Namespace: collectibles
	Checksum: 0xA4F226BD
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	function_5a395617();
}

/*
	Name: function_5a395617
	Namespace: collectibles
	Checksum: 0xAF5C9923
	Offset: 0x148
	Size: 0x73C
	Parameters: 0
	Flags: Linked
*/
function function_5a395617()
{
	var_7bb83649 = [];
	var_bdf7b99d = [];
	var_b6e3d0a = getscriptbundle(#"evidenceboardlist");
	var_8f4db568 = var_b6e3d0a.var_48be729c;
	foreach(var_eeb11904 in var_8f4db568)
	{
		if(isdefined(var_eeb11904.var_b2d12125))
		{
			collectibles = var_eeb11904.var_b2d12125;
			foreach(v in collectibles)
			{
				collectible = getscriptbundle(v.collectible);
				if(!isdefined(collectible.var_1d226975))
				{
					collectible.var_1d226975 = 0;
				}
				collectible.var_430d1d6a = var_eeb11904.var_8ca1d4a;
				collectible.index = k;
				if(collectible.index >= 10)
				{
					/#
						assert(0, (("" + function_9e72a96(collectible.var_430d1d6a)) + "") + 10);
					#/
				}
				if(!isdefined(var_bdf7b99d[collectible.var_1d226975]))
				{
					var_bdf7b99d[collectible.var_1d226975] = [];
				}
				if(collectible.var_1d226975 == 0)
				{
					if(!isdefined(var_bdf7b99d[collectible.var_1d226975]))
					{
						var_bdf7b99d[collectible.var_1d226975] = [];
					}
					else if(!isarray(var_bdf7b99d[collectible.var_1d226975]))
					{
						var_bdf7b99d[collectible.var_1d226975] = array(var_bdf7b99d[collectible.var_1d226975]);
					}
					if(!isinarray(var_bdf7b99d[collectible.var_1d226975], collectible))
					{
						var_bdf7b99d[collectible.var_1d226975][var_bdf7b99d[collectible.var_1d226975].size] = collectible;
					}
					continue;
				}
				if(collectible.var_1d226975 == 1 || collectible.var_1d226975 == 2)
				{
					/#
						assert(isdefined(collectible.var_ed968ffd));
					#/
					if(!isdefined(var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd]))
					{
						var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd] = [];
					}
					else if(!isarray(var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd]))
					{
						var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd] = array(var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd]);
					}
					if(!isinarray(var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd], collectible))
					{
						var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd][var_bdf7b99d[collectible.var_1d226975][collectible.var_ed968ffd].size] = collectible;
					}
					continue;
				}
				if(collectible.var_1d226975 === 3)
				{
					/#
						assert(isdefined(collectible.var_f3575c58));
					#/
					/#
						assert(isdefined(collectible.var_ed968ffd));
					#/
					if(collectible.var_f3575c58 > 6)
					{
						/#
							assert(0, (("" + function_9e72a96(collectible.var_ed968ffd)) + "") + 6);
						#/
					}
					if(isdefined(collectible.var_f3575c58) && isdefined(collectible.var_ed968ffd))
					{
						if(!isdefined(var_7bb83649[collectible.var_f3575c58]))
						{
							var_7bb83649[collectible.var_f3575c58] = collectible;
						}
						else
						{
							var_91783c0f = var_7bb83649[collectible.var_f3575c58].name;
							/#
								assert(0, ((((("" + function_9e72a96(collectible.var_ed968ffd)) + "") + collectible.var_f3575c58) + "") + function_9e72a96(collectible.name) + "") + function_9e72a96(var_91783c0f));
							#/
						}
						if(!isdefined(var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58]))
						{
							var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58] = [];
						}
						else if(!isarray(var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58]))
						{
							var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58] = array(var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58]);
						}
						if(!isinarray(var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58], collectible))
						{
							var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58][var_bdf7b99d[collectible.var_1d226975][collectible.var_f3575c58].size] = collectible;
						}
					}
				}
			}
		}
	}
	level.collectible_table = var_7bb83649;
	level.var_997b5425 = var_bdf7b99d;
}

/*
	Name: function_28bfb57e
	Namespace: collectibles
	Checksum: 0xDE2E0494
	Offset: 0x890
	Size: 0x10A
	Parameters: 1
	Flags: None
*/
function function_28bfb57e(mission_name)
{
	if(!isdefined(mission_name))
	{
		mission_name = savegame::get_mission_name();
	}
	var_1494351b = [];
	foreach(collectible in level.collectible_table)
	{
		if(collectible.var_ed968ffd == mission_name)
		{
			if(!isdefined(var_1494351b))
			{
				var_1494351b = [];
			}
			else if(!isarray(var_1494351b))
			{
				var_1494351b = array(var_1494351b);
			}
			var_1494351b[var_1494351b.size] = collectible;
		}
	}
	return var_1494351b;
}

/*
	Name: function_293d81b4
	Namespace: collectibles
	Checksum: 0x90B2726
	Offset: 0x9A8
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_293d81b4(var_1d226975, key)
{
	if(!isdefined(var_1d226975))
	{
		var_1d226975 = 0;
	}
	if(!isdefined(level.var_997b5425[var_1d226975]))
	{
		level.var_997b5425[var_1d226975] = [];
	}
	if(isdefined(key))
	{
		if(!isdefined(level.var_997b5425[var_1d226975][key]))
		{
			level.var_997b5425[var_1d226975][key] = [];
		}
		return level.var_997b5425[var_1d226975][key];
	}
	return level.var_997b5425[var_1d226975];
}

/*
	Name: function_c57acbc9
	Namespace: collectibles
	Checksum: 0xD3974FA7
	Offset: 0xA58
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_c57acbc9(var_2a51713, value)
{
	if(!isdefined(value))
	{
		value = 1;
	}
	/#
		assert(isdefined(var_2a51713));
	#/
	player = getplayers()[0];
	/#
		assert(isplayer(player));
	#/
	player stats::set_stat(#"collectibles", var_2a51713 - 1, value);
	uploadstats(player);
}

/*
	Name: function_ab921f3d
	Namespace: collectibles
	Checksum: 0x5B82C720
	Offset: 0xB38
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function function_ab921f3d(var_2a51713)
{
	/#
		assert(isdefined(var_2a51713));
	#/
	player = getplayers()[0];
	/#
		assert(isplayer(player));
	#/
	if(isplayer(player))
	{
		var_4f84589e = is_true(player stats::get_stat(#"collectibles", var_2a51713 - 1));
		return var_4f84589e;
	}
	return 0;
}

/*
	Name: function_316c48a3
	Namespace: collectibles
	Checksum: 0xC500A089
	Offset: 0xC20
	Size: 0x15C
	Parameters: 3
	Flags: Linked
*/
function function_316c48a3(var_d13a0347, var_28c9f917, var_bfb1faa4)
{
	if(!isdefined(var_bfb1faa4))
	{
		var_bfb1faa4 = 1;
	}
	/#
		assert(isdefined(var_d13a0347));
	#/
	/#
		assert(isdefined(var_28c9f917));
	#/
	player = getplayers()[0];
	/#
		assert(isplayer(player));
	#/
	if(var_bfb1faa4 == function_1fe63475(var_d13a0347, var_28c9f917))
	{
		return;
	}
	player stats::set_stat(#"mapdata", var_d13a0347, #"evidence", var_28c9f917, var_bfb1faa4);
	player stats::set_stat(#"mapdata", var_d13a0347, #"hash_42b984266100b32", var_28c9f917, var_bfb1faa4);
	uploadstats(player);
}

/*
	Name: function_1fe63475
	Namespace: collectibles
	Checksum: 0x6802E2C1
	Offset: 0xD88
	Size: 0xEA
	Parameters: 2
	Flags: Linked
*/
function function_1fe63475(var_d13a0347, var_28c9f917)
{
	/#
		assert(isdefined(var_d13a0347));
	#/
	/#
		assert(isdefined(var_28c9f917));
	#/
	player = getplayers()[0];
	/#
		assert(isplayer(player));
	#/
	var_4f84589e = is_true(player stats::get_stat(#"mapdata", var_d13a0347, #"evidence", var_28c9f917));
	return var_4f84589e;
}

/*
	Name: function_ee216b9e
	Namespace: collectibles
	Checksum: 0x84979BF3
	Offset: 0xE80
	Size: 0xEA
	Parameters: 2
	Flags: Linked
*/
function function_ee216b9e(var_d13a0347, var_28c9f917)
{
	/#
		assert(isdefined(var_d13a0347));
	#/
	/#
		assert(isdefined(var_28c9f917));
	#/
	player = getplayers()[0];
	/#
		assert(isplayer(player));
	#/
	isnew = is_true(player stats::get_stat(#"mapdata", var_d13a0347, #"hash_42b984266100b32", var_28c9f917));
	return isnew;
}

/*
	Name: function_55fb73ea
	Namespace: collectibles
	Checksum: 0xE2A32421
	Offset: 0xF78
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function function_55fb73ea(var_d13a0347, var_28c9f917)
{
	/#
		assert(isdefined(var_d13a0347));
	#/
	/#
		assert(isdefined(var_28c9f917));
	#/
	player = getplayers()[0];
	/#
		assert(isplayer(player));
	#/
	if(!function_ee216b9e(var_d13a0347, var_28c9f917))
	{
		return;
	}
	player stats::set_stat(#"mapdata", var_d13a0347, #"hash_42b984266100b32", var_28c9f917, 0);
	uploadstats(player);
}

/*
	Name: function_e8d5de2c
	Namespace: collectibles
	Checksum: 0x40FB990D
	Offset: 0x1080
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_e8d5de2c(mission_name)
{
	if(!isdefined(mission_name))
	{
		mission_name = savegame::get_mission_name();
	}
	foreach(collectible in level.collectible_table)
	{
		if(collectible.var_ed968ffd == mission_name)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_9f455dbc
	Namespace: collectibles
	Checksum: 0xFCB7D8FD
	Offset: 0x1138
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_9f455dbc()
{
	return level.collectible_table.size;
}

/*
	Name: function_9f976c54
	Namespace: collectibles
	Checksum: 0xDE8A8894
	Offset: 0x1150
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_9f976c54(mission_name)
{
	if(!isdefined(mission_name))
	{
		mission_name = savegame::get_mission_name();
	}
	var_80fc6600 = 0;
	foreach(collectible in level.collectible_table)
	{
		if(collectible.var_ed968ffd == mission_name)
		{
			var_80fc6600++;
		}
	}
	return var_80fc6600;
}

/*
	Name: function_99c4aa1
	Namespace: collectibles
	Checksum: 0xE05773CD
	Offset: 0x1218
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_99c4aa1(var_d13a0347)
{
	if(!isdefined(var_d13a0347))
	{
		return;
	}
	var_80fc6600 = 0;
	foreach(collectible in level.collectible_table)
	{
		if(collectible.var_430d1d6a == var_d13a0347)
		{
			var_80fc6600++;
		}
	}
	return var_80fc6600;
}

/*
	Name: function_ee839c3b
	Namespace: collectibles
	Checksum: 0xC368B85C
	Offset: 0x12D0
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_ee839c3b()
{
	var_9a849009 = 0;
	foreach(collectible in level.collectible_table)
	{
		if(is_true(function_ab921f3d(collectible.var_f3575c58)))
		{
			var_9a849009++;
		}
	}
	return var_9a849009;
}

/*
	Name: function_7be39f53
	Namespace: collectibles
	Checksum: 0x4C903BE8
	Offset: 0x1398
	Size: 0xF2
	Parameters: 1
	Flags: Linked
*/
function function_7be39f53(mission_name)
{
	if(!isdefined(mission_name))
	{
		mission_name = savegame::get_mission_name();
	}
	var_9a849009 = 0;
	foreach(collectible in level.collectible_table)
	{
		if(collectible.var_ed968ffd == mission_name)
		{
			if(is_true(function_ab921f3d(collectible.var_f3575c58)))
			{
				var_9a849009++;
			}
		}
	}
	return var_9a849009;
}

/*
	Name: function_5d5166dd
	Namespace: collectibles
	Checksum: 0x63723483
	Offset: 0x1498
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_5d5166dd(var_d13a0347)
{
	if(!isdefined(var_d13a0347))
	{
		return;
	}
	var_9a849009 = 0;
	foreach(collectible in level.collectible_table)
	{
		if(collectible.var_430d1d6a == var_d13a0347)
		{
			if(is_true(function_ab921f3d(collectible.var_f3575c58)))
			{
				var_9a849009++;
			}
		}
	}
	return var_9a849009;
}

/*
	Name: function_d06c5a39
	Namespace: collectibles
	Checksum: 0xDB34A017
	Offset: 0x1588
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_d06c5a39()
{
	self prompts::function_d5ea17f0(#"hash_209c49282fbf4594");
	self prompts::function_309bf7c2(#"hash_1ca962038953ec7a");
}

/*
	Name: function_6cd091d2
	Namespace: collectibles
	Checksum: 0xB83D890A
	Offset: 0x15D8
	Size: 0x11C
	Parameters: 2
	Flags: Linked
*/
function function_6cd091d2(var_2a51713, var_c05d6)
{
	if(is_true(function_ab921f3d(var_2a51713)))
	{
		return;
	}
	function_cb8ff1b9(var_2a51713, 1);
	function_5b42ccea();
	collectible = level.collectible_table[var_2a51713];
	var_4bf53b01 = collectible.var_34754728;
	var_76e98c1f = collectible.var_444770d3;
	var_2a015e7e = function_5d5166dd(collectible.var_430d1d6a);
	var_f8f020e3 = function_99c4aa1(collectible.var_430d1d6a);
	thread namespace_a43d1663::init(var_4bf53b01, var_76e98c1f, var_2a015e7e, var_f8f020e3, var_c05d6);
}

/*
	Name: function_cb8ff1b9
	Namespace: collectibles
	Checksum: 0x611A8000
	Offset: 0x1700
	Size: 0x6C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cb8ff1b9(var_2a51713, is_unlocked)
{
	function_c57acbc9(var_2a51713, is_unlocked);
	collectible = level.collectible_table[var_2a51713];
	function_316c48a3(collectible.var_430d1d6a, collectible.index, is_unlocked);
}

/*
	Name: function_5b42ccea
	Namespace: collectibles
	Checksum: 0x80F724D1
	Offset: 0x1778
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_5b42ccea()
{
}

/*
	Name: add_callback
	Namespace: collectibles
	Checksum: 0xB62E6B61
	Offset: 0x1788
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function add_callback(collectible, callback)
{
	level.var_4ac1758e[collectible] = callback;
}

/*
	Name: function_606a97af
	Namespace: collectibles
	Checksum: 0x725ACC5B
	Offset: 0x17B8
	Size: 0x1E
	Parameters: 1
	Flags: None
*/
function function_606a97af(collectible)
{
	return isdefined(level.var_4ac1758e[collectible]);
}

/*
	Name: function_f539a1fa
	Namespace: collectibles
	Checksum: 0x1B49B42E
	Offset: 0x17E0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_f539a1fa(collectible, params)
{
	if(isdefined(level.var_4ac1758e[collectible]))
	{
		[[level.var_4ac1758e[collectible]]](params);
		return true;
	}
	return false;
}

/*
	Name: function_a66b8474
	Namespace: collectibles
	Checksum: 0x41939116
	Offset: 0x1838
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_a66b8474()
{
	/#
		foreach(id, collectible in level.collectible_table)
		{
			function_cb8ff1b9(id, 0);
		}
	#/
}

/*
	Name: function_4e4a7021
	Namespace: collectibles
	Checksum: 0x5A9B78B5
	Offset: 0x18D0
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_4e4a7021()
{
	/#
		foreach(id, collectible in level.collectible_table)
		{
			function_cb8ff1b9(id, 1);
		}
	#/
}

