#using script_1471eea5d2e60f83;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_1cd491b1807da8f7;
#using script_340a2e805e35f7a2;
#using script_39cbfe2ef5995b4b;
#using script_471b31bd963b388e;
#using script_5a84f213cefea5de;
#using script_5faf53425d584a24;
#using script_7bacb32f8222fa3e;
#using script_8988fdbc78d6c53;
#using script_d5e47f3a0e95613;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace item_world;

/*
	Name: function_89f2df9
	Namespace: item_world
	Checksum: 0xFB8AAF09
	Offset: 0x4B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"item_world", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: item_world
	Checksum: 0x364118F
	Offset: 0x4F8
	Size: 0x4BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	register_client_fields();
	level.var_d89ef54a = getgametypesetting(#"hash_2f0beae14bf17810");
	level.var_9cddbf4e = [];
	level.var_9cddbf4e[#"p8_fxanim_wz_supply_stash_01_mod"] = {#hash_b9492c6:#"hash_32f9ba3b1da75ed5", #hash_f6d388aa:#"hash_3462cfb200a2367"};
	level.var_9cddbf4e[#"p8_fxanim_wz_supply_stash_04_mod"] = {#hash_b9492c6:#"hash_32f9ba3b1da75ed5", #hash_f6d388aa:#"hash_3462cfb200a2367"};
	level.var_9cddbf4e[#"p8_fxanim_wz_death_stash_mod"] = {#hash_b9492c6:#"hash_70fb2ee1b706a28a", #hash_f6d388aa:#"hash_5e8b0f6cade25ff6"};
	level.var_9cddbf4e[#"hash_1dcbe8021fb16344"] = {#hash_b9492c6:#"hash_6fcb29cae6678d93", #hash_f6d388aa:#"hash_56b5b65c141f4629"};
	level.var_9cddbf4e[#"p8_fxanim_wz_supply_stash_ammo_mod"] = {#hash_b9492c6:#"hash_3e62bcbd6460ff44", #hash_f6d388aa:#"hash_f743d336f8b7764"};
	level.var_9cddbf4e[#"hash_574076754776e003"] = {#hash_b9492c6:#"hash_22f426a8593609e8", #hash_f6d388aa:#"hash_36e23ce3e5f7e4c0"};
	callback::on_connect(&function_4d97b664);
	callback::on_disconnect(&function_d446afe1);
	callback::add_callback(#"hash_41781454d98b676a", &function_9aefb438);
	level thread function_f7fb8a17();
	level thread function_e1965ae1();
	level.var_703d32de = 0;
	level.var_17c7288a = &function_23b313bd;
	level.nullprimaryoffhand = getweapon(#"null_offhand_primary");
	level.nullsecondaryoffhand = getweapon(#"null_offhand_secondary");
	level.var_3488e988 = getweapon(#"hash_5a7fd1af4a1d5c9");
	level thread namespace_65181344::init_spawn_system();
	if(!isdefined(level.var_227b9e91))
	{
		level.var_227b9e91 = new throttle();
		[[ level.var_227b9e91 ]]->initialize(4, 0.05);
	}
	level.var_3dfbaf65 = &function_8e0d14c1;
	if(!is_true(getgametypesetting(#"hash_36c2645732ad1c3b")) || !namespace_b376ff3f::function_7d5553ac())
	{
		level thread function_df1098a();
		level thread function_185f50c5();
	}
	level thread function_248022d9();
}

/*
	Name: register_client_fields
	Namespace: item_world
	Checksum: 0x9359D3B5
	Offset: 0x9C0
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private register_client_fields()
{
	clientfield::register("world", "item_world_seed", 1, 31, "int");
	clientfield::register("world", "item_world_sanity_random", 1, 16, "int");
	clientfield::register("world", "item_world_disable", 1, 1, "int");
	clientfield::register("scriptmover", "item_world_attachments", 1, 1, "int");
	clientfield::function_a8bbc967("hudItems.pickupHintGold", 1, 1, "int", 1);
	clientfield::register("toplayer", "disableItemPickup", 1, 1, "int");
	clientfield::function_a8bbc967("hudItems.multiItemPickup.status", 1, 3, "int");
}

/*
	Name: function_e6ea1ee0
	Namespace: item_world
	Checksum: 0x993AEB32
	Offset: 0xB18
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e6ea1ee0()
{
	[[ level.var_227b9e91 ]]->waitinqueue(self);
	var_fee74908 = function_784b5aa6();
	return var_fee74908;
}

/*
	Name: function_f3b6e182
	Namespace: item_world
	Checksum: 0xED5A9810
	Offset: 0xB60
	Size: 0x1DC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3b6e182(player)
{
	/#
		assert(isplayer(player));
	#/
	usetrigger = spawn("trigger_radius_use", vectorscale((0, 0, -1), 10000), 0, 128, 72);
	usetrigger.targetname = "item_world";
	usetrigger triggerignoreteam();
	usetrigger setinvisibletoall();
	usetrigger setvisibletoplayer(self);
	usetrigger setteamfortrigger(#"none");
	usetrigger setcursorhint("HINT_NOICON");
	usetrigger triggerenable(0);
	usetrigger function_89fca53b(0);
	usetrigger function_49462027(1, (((1 | 16) | 2097152) | 65536) | 1048576);
	usetrigger usetriggerignoreuseholdtime();
	player clientclaimtrigger(usetrigger);
	player.var_19caeeea = usetrigger;
	usetrigger callback::function_35a12f19(&function_ad7ad6ce);
}

/*
	Name: function_b516210b
	Namespace: item_world
	Checksum: 0x262BC5B2
	Offset: 0xD48
	Size: 0x230
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b516210b(var_889058cc, origin, activator)
{
	if(!isplayer(activator))
	{
		return;
	}
	var_cde95668 = isdefined(activator) && activator hasperk(#"specialty_quieter");
	if(isdefined(level.var_9cddbf4e[var_889058cc]))
	{
		mapping = level.var_9cddbf4e[var_889058cc];
		var_f6d388aa = playsoundatposition(mapping.var_f6d388aa, origin + vectorscale((0, 0, 1), 50));
		if(isdefined(var_f6d388aa))
		{
			var_f6d388aa hide();
		}
		var_b9492c6 = playsoundatposition(mapping.var_b9492c6, origin + vectorscale((0, 0, 1), 50));
		if(isdefined(var_b9492c6))
		{
			var_b9492c6 hide();
		}
		foreach(player in getplayers())
		{
			if(var_cde95668 && !player hasperk(#"specialty_loudenemies"))
			{
				if(isdefined(var_b9492c6))
				{
					var_b9492c6 showtoplayer(player);
				}
				continue;
			}
			if(isdefined(var_f6d388aa))
			{
				var_f6d388aa showtoplayer(player);
			}
		}
	}
}

/*
	Name: function_e1965ae1
	Namespace: item_world
	Checksum: 0x43A6DC1E
	Offset: 0xF80
	Size: 0x2B0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e1965ae1()
{
	level endon(#"game_ended");
	function_1b11e73c();
	foreach(player in getplayers())
	{
		if(isplayer(player))
		{
			player weaponobjects::function_ac7c2bf9();
		}
	}
	var_f997302a = getentarraybytype(4);
	for(index = 0; index < var_f997302a.size; index++)
	{
		if(isdefined(var_f997302a[index]))
		{
			var_f997302a[index] delete();
		}
	}
	if((isdefined(getgametypesetting(#"hash_7d8c969e384dd1c9")) ? getgametypesetting(#"hash_7d8c969e384dd1c9") : 0))
	{
		if(isdefined(level.var_5c14d2e6))
		{
			foreach(player in getplayers())
			{
				player thread [[level.var_5c14d2e6]]();
			}
		}
	}
	if(!namespace_b376ff3f::function_7d5553ac())
	{
		foreach(player in getplayers())
		{
			player thread namespace_b376ff3f::function_44f1ab43();
		}
	}
}

/*
	Name: function_5019e563
	Namespace: item_world
	Checksum: 0xE8D486D2
	Offset: 0x1238
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_5019e563(eventstruct)
{
	if(!isdefined(self.var_554ec2e2))
	{
		return;
	}
	if(!is_true(eventstruct.freefall) && !is_true(eventstruct.var_695a7111))
	{
		self thread [[self.var_554ec2e2]]();
	}
}

/*
	Name: function_87b05fa3
	Namespace: item_world
	Checksum: 0xF94CBF3E
	Offset: 0x12B0
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event function_87b05fa3(eventstruct)
{
	if(!isdefined(self.var_554ec2e2))
	{
		return;
	}
	if(!is_true(eventstruct.parachute))
	{
		self thread [[self.var_554ec2e2]]();
	}
}

/*
	Name: function_f7fb8a17
	Namespace: item_world
	Checksum: 0x360F9944
	Offset: 0x1300
	Size: 0x1CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f7fb8a17()
{
	level endon(#"game_ended");
	level flag::wait_till_clear(#"hash_2d3b2a4d082ba5ee");
	level flag::set(#"hash_2d3b2a4d082ba5ee");
	if(level flag::get(#"hash_38a387462f3a9ad"))
	{
		return;
	}
	level flag::clear(#"hash_51daecff754729dc");
	var_47f2f5fa = (1 << 31) - 1;
	var_582cb7bb = randomintrange(0, var_47f2f5fa) + 1;
	/#
		var_582cb7bb = getdvarint(#"hash_46870e6b25b988eb", var_582cb7bb);
	#/
	level.var_cca3647d = var_582cb7bb;
	match_record::set_stat(#"hash_45cd259b367a6b1e", var_582cb7bb);
	function_4c0953c4(var_582cb7bb);
	level namespace_f0884ae5::setup(var_582cb7bb);
	level flag::set(#"hash_51daecff754729dc");
	level flag::set(#"hash_38a387462f3a9ad");
	level flag::clear(#"hash_2d3b2a4d082ba5ee");
}

/*
	Name: function_4c0953c4
	Namespace: item_world
	Checksum: 0xBBBEC8E9
	Offset: 0x14D8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_4c0953c4(var_6937495e)
{
	waitframe(1);
	level clientfield::set("item_world_seed", var_6937495e);
}

/*
	Name: function_5d4b134e
	Namespace: item_world
	Checksum: 0x47755AD1
	Offset: 0x1518
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_5d4b134e(var_88ee50db)
{
	waitframe(1);
	level clientfield::set("item_world_sanity_random", var_88ee50db);
}

/*
	Name: function_8bac489c
	Namespace: item_world
	Checksum: 0xA4343F27
	Offset: 0x1558
	Size: 0x80
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8bac489c(var_f4cdfe08, player)
{
	/#
		assert(isdefined(var_f4cdfe08));
	#/
	/#
		assert(isplayer(player));
	#/
	if(var_f4cdfe08.var_193b3626 === player getentitynumber())
	{
		return true;
	}
	return false;
}

/*
	Name: function_35c26e09
	Namespace: item_world
	Checksum: 0x7127B2D2
	Offset: 0x15E0
	Size: 0x230
	Parameters: 1
	Flags: Linked, Private
*/
function private function_35c26e09(var_f4cdfe08)
{
	var_f4cdfe08.var_193b3626 = undefined;
	var_f4cdfe08.var_80089988 = undefined;
	targetname = (isdefined(var_f4cdfe08.targetname) ? var_f4cdfe08.targetname : var_f4cdfe08.target);
	var_76c7cb8a = function_91b29d2a(targetname);
	var_3c32093e = 0;
	var_3ba9a53f = [];
	foreach(item in var_76c7cb8a)
	{
		if(distancesquared(item.origin, var_f4cdfe08.origin) > 36)
		{
			continue;
		}
		if(!isdefined(item.var_a6762160))
		{
			continue;
		}
		if(namespace_ad5a0cd6::can_pick_up(item))
		{
			var_3c32093e = 1;
			break;
		}
		var_3ba9a53f[var_3ba9a53f.size] = item;
	}
	if(!var_3c32093e)
	{
		foreach(item in var_3ba9a53f)
		{
			function_54ca5536(item.id, -1);
			function_bfc28859(3, item.id);
			break;
		}
	}
	function_e2a06860(var_f4cdfe08, 0);
	return true;
}

/*
	Name: function_cc1aec8
	Namespace: item_world
	Checksum: 0xF6C7A6F6
	Offset: 0x1818
	Size: 0x92
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cc1aec8(player, slotid)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isint(slotid));
	#/
	if(!namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	return player namespace_b376ff3f::function_2e711614(slotid);
}

/*
	Name: function_199c092d
	Namespace: item_world
	Checksum: 0x528E7C96
	Offset: 0x18B8
	Size: 0x3D8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_199c092d(var_f4cdfe08, player)
{
	if(!isdefined(player))
	{
		player = undefined;
	}
	/#
		assert(!isdefined(var_f4cdfe08.var_193b3626));
	#/
	if(isdefined(var_f4cdfe08.var_193b3626))
	{
		return false;
	}
	var_f4cdfe08.var_193b3626 = player getentitynumber();
	item = function_cc1aec8(player, 10);
	if(!isdefined(item) || item.var_a6762160.name !== #"hash_211559ff9a516b7d")
	{
		return false;
	}
	var_bcb39afb = player namespace_a0d533d1::function_169cea63();
	/#
		assert(var_bcb39afb.size > 0);
	#/
	if(var_bcb39afb.size <= 0)
	{
		return false;
	}
	var_cf23afee = [];
	foreach(weaponname in var_bcb39afb)
	{
		var_cf23afee[weaponname] = 1;
	}
	targetname = (isdefined(var_f4cdfe08.targetname) ? var_f4cdfe08.targetname : var_f4cdfe08.target);
	var_76c7cb8a = function_91b29d2a(targetname);
	foreach(item in var_76c7cb8a)
	{
		if(distancesquared(item.origin, var_f4cdfe08.origin) > 36)
		{
			continue;
		}
		if(!isdefined(item.var_a6762160) || !isdefined(item.var_a6762160.weapon))
		{
			continue;
		}
		if(namespace_ad5a0cd6::can_pick_up(item) && !isdefined(var_cf23afee[item.var_a6762160.weapon.name]))
		{
			function_7730442c(item);
			continue;
		}
		if(isdefined(player.var_fbcc86d3) && isdefined(player.var_fbcc86d3[item.var_a6762160.weapon.name]))
		{
			function_7730442c(item);
			continue;
		}
		if(isdefined(var_cf23afee[item.var_a6762160.weapon.name]))
		{
			function_54ca5536(item.id, -1);
			function_bfc28859(3, item.id);
			continue;
		}
	}
	return true;
}

/*
	Name: function_23b313bd
	Namespace: item_world
	Checksum: 0xA9F55F48
	Offset: 0x1C98
	Size: 0x74
	Parameters: 4
	Flags: Linked, Private
*/
function private function_23b313bd(player, eventtype, eventdata, var_c5a66313)
{
	if(is_true(level.var_ab396c31))
	{
		return;
	}
	if(!isdefined(player))
	{
		return;
	}
	if(isdefined(level.var_e8af489f))
	{
		[[level.var_e8af489f]](player, eventtype, eventdata, var_c5a66313);
	}
}

/*
	Name: function_4d97b664
	Namespace: item_world
	Checksum: 0x5221F14F
	Offset: 0x1D18
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4d97b664()
{
	function_f3b6e182(self);
	self.var_d7a70ae4 = undefined;
	if(function_76915220() && (!self issplitscreen() || !self function_f27ff71f()))
	{
		self thread function_ba96cdf(self);
	}
}

/*
	Name: function_d446afe1
	Namespace: item_world
	Checksum: 0xE3172E2B
	Offset: 0x1DB0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d446afe1()
{
	if(isdefined(self.var_19caeeea))
	{
		self.var_19caeeea delete();
	}
}

/*
	Name: function_9aefb438
	Namespace: item_world
	Checksum: 0xED644370
	Offset: 0x1DE8
	Size: 0x2A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9aefb438(params)
{
	if(isdefined(params) && params.message == #"hash_52e9e8e985489587")
	{
		if(!isdefined(self) || !isplayer(self) || !isalive(self))
		{
			params.player = undefined;
			return;
		}
		var_b909352 = 13;
		var_bd027dd9 = undefined;
		if(!isdefined(self.var_bf3cabc9))
		{
			var_9b882d22 = self.var_d5673d87;
			if(!isdefined(var_9b882d22) || !isdefined(var_9b882d22.var_bd027dd9))
			{
				params.player = undefined;
				return;
			}
			if(!is_true(var_9b882d22.var_5d97fed1) && distance2dsquared(var_9b882d22.origin, self.origin) > sqr(128))
			{
				params.player = undefined;
				return;
			}
			if(!is_true(var_9b882d22.var_5d97fed1) && var_9b882d22.var_a6762160.rarity == #"epic")
			{
				params.message = #"hash_433c75db9fd3177e";
			}
			var_bd027dd9 = var_9b882d22.var_bd027dd9;
		}
		else
		{
			var_b909352 = 14;
			var_bd027dd9 = self.var_bf3cabc9 getentitynumber();
		}
		members = getplayers(self.team);
		foreach(member in members)
		{
			member function_b00db06(var_b909352, var_bd027dd9, self getentitynumber());
		}
	}
}

/*
	Name: function_f27ff71f
	Namespace: item_world
	Checksum: 0xB48135DF
	Offset: 0x2098
	Size: 0xD2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f27ff71f()
{
	foreach(player in level.players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(player == self)
		{
			continue;
		}
		if(!self isplayeronsamemachine(player))
		{
			continue;
		}
		if(is_true(player.var_d7a70ae4))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_df1098a
	Namespace: item_world
	Checksum: 0x77563B84
	Offset: 0x2178
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_df1098a()
{
	self notify("4117b1bdaea5da");
	self endon("4117b1bdaea5da");
	level endon(#"game_ended");
	while(true)
	{
		players = getplayers();
		for(index = 0; index < players.size; index++)
		{
			player = players[index];
			if(isalive(player))
			{
				player function_7c84312d(player getplayercamerapos(), player getplayerangles());
			}
			if(((index + 1) % 15) == 0)
			{
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_185f50c5
	Namespace: item_world
	Checksum: 0xDD3512A8
	Offset: 0x2280
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_185f50c5()
{
	self notify("3f33c17bf4699b32");
	self endon("3f33c17bf4699b32");
	level endon(#"game_ended");
	while(true)
	{
		players = getplayers();
		for(index = 0; index < players.size; index++)
		{
			player = players[index];
			if(!isdefined(player))
			{
				continue;
			}
			player function_f59b16bb(player.origin, player.angles);
			if(((index + 1) % 10) == 0)
			{
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_b962721d
	Namespace: item_world
	Checksum: 0x4621C1E0
	Offset: 0x2370
	Size: 0x5C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b962721d(scriptbundlename, itemcount, falling, delay)
{
	if(!isdefined(delay))
	{
		delay = 0;
	}
	if(delay > 0)
	{
		wait(delay);
	}
	self thread namespace_65181344::function_fd87c780(scriptbundlename, itemcount, falling);
}

/*
	Name: function_ad7ad6ce
	Namespace: item_world
	Checksum: 0x54D44D94
	Offset: 0x23D8
	Size: 0x536
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ad7ad6ce(trigger_struct)
{
	level endon(#"game_ended");
	self endon(#"death");
	usetrigger = self;
	activator = trigger_struct.activator;
	if(!isdefined(activator) || !isplayer(activator) || !isalive(activator) || activator inlaststand())
	{
		return;
	}
	if(!activator function_8e0d14c1())
	{
		return;
	}
	if(activator function_4a8572c4())
	{
		return;
	}
	if(is_true(level.var_ab396c31))
	{
		return;
	}
	var_91d3170d = activator clientfield::get_player_uimodel("hudItems.multiItemPickup.status");
	if(var_91d3170d == 4)
	{
		return;
	}
	if(var_91d3170d == 3)
	{
		stash = namespace_ad5a0cd6::function_31f5aa51(usetrigger.var_ba85cc6f);
		if(!isdefined(stash))
		{
			return;
		}
		if(function_199c092d(stash, activator))
		{
			var_91d3170d = 1;
		}
		else
		{
			return;
		}
	}
	if(isdefined(self.lastactivatetime) && (self.lastactivatetime + 250) >= gettime())
	{
		return;
	}
	if(var_91d3170d == 1 || (var_91d3170d == 0 && namespace_ad5a0cd6::function_83c20f83(usetrigger.var_ba85cc6f)))
	{
		usetrigger sethintstring(#"");
		stashes = level.var_93d08989[usetrigger.var_ba85cc6f.targetname];
		if(!isdefined(stashes) && isdefined(usetrigger.var_ba85cc6f.var_67169c0b))
		{
			stashes = getentarray(usetrigger.var_ba85cc6f.var_67169c0b, "targetname");
		}
		stash = undefined;
		if(isdefined(stashes) && stashes.size > 0)
		{
			stashes = arraysortclosest(stashes, usetrigger.var_ba85cc6f.origin, 1, 0, 12);
			if(stashes.size > 0)
			{
				stash = stashes[0];
			}
		}
		if(isdefined(stash) && isdefined(stash.var_b91441dd) && is_true(stash.var_b91441dd.var_4f220d03))
		{
			stash thread function_7730442c(usetrigger.var_ba85cc6f);
			stash thread function_b962721d(stash.var_b91441dd.name, stash.available, 3, 0.25);
		}
		else
		{
			activator clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 2);
			activator thread function_eb900758(namespace_ad5a0cd6::function_31f5aa51(usetrigger.var_ba85cc6f));
		}
		function_a54d07e6(usetrigger.var_ba85cc6f, activator);
	}
	else
	{
		if(var_91d3170d == 2)
		{
			usetrigger sethintstring(#"");
		}
		else
		{
			item = usetrigger.var_ba85cc6f;
			if(isdefined(item) && !isentity(item) && isdefined(item.id))
			{
				item = function_b1702735(item.id);
			}
			var_28ace73 = 1;
			if(isdefined(level.var_f365bb30))
			{
				var_28ace73 = activator [[level.var_f365bb30]](item);
			}
			if(activator namespace_ad5a0cd6::can_pick_up(item) && var_28ace73)
			{
				activator pickup_item(item);
				activator function_58b29f4f();
			}
		}
	}
	self.lastactivatetime = gettime();
}

/*
	Name: function_eb900758
	Namespace: item_world
	Checksum: 0x91D38DD8
	Offset: 0x2918
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eb900758(stash)
{
	self endon(#"disconnect");
	self thread function_d87c50ae(stash);
	self thread function_6266f448();
	self waittill(#"death", #"entering_last_stand", #"hash_2781407e327b42ee");
	self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 0);
	self.var_c4462112 = 1;
}

/*
	Name: function_6266f448
	Namespace: item_world
	Checksum: 0x8882432D
	Offset: 0x29D8
	Size: 0xC6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6266f448()
{
	self notify("54aa3c9d2a650c2");
	self endon("54aa3c9d2a650c2");
	self endon(#"death", #"entering_last_stand", #"hash_2781407e327b42ee");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		if(waitresult.menu == "MultiItemPickup" && waitresult.response == "multi_item_menu_closed")
		{
			break;
		}
	}
	self notify(#"hash_2781407e327b42ee");
}

/*
	Name: function_d87c50ae
	Namespace: item_world
	Checksum: 0x983BBF19
	Offset: 0x2AA8
	Size: 0x236
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d87c50ae(stash)
{
	self notify("a8a6e23c71cdd5f");
	self endon("a8a6e23c71cdd5f");
	self endon(#"death", #"entering_last_stand", #"hash_2781407e327b42ee");
	while(true)
	{
		waitframe(1);
		if(!isdefined(self.var_f0f7e918))
		{
			break;
		}
		if(self.var_f0f7e918.size == 0)
		{
			break;
		}
		var_9f69a4d3 = 0;
		foreach(item in self.var_f0f7e918)
		{
			if(isdefined(item) && self namespace_ad5a0cd6::can_pick_up(item))
			{
				var_9f69a4d3 = 1;
				break;
			}
		}
		if(!var_9f69a4d3)
		{
			break;
		}
		if(self isfiring() || self playerads() > 0.3 || self ismeleeing())
		{
			break;
		}
		if(isdefined(stash) && is_true(stash.var_1ed4b650) && !function_8bac489c(stash, self))
		{
			break;
		}
	}
	if(isdefined(stash) && is_true(stash.var_1ed4b650))
	{
		function_35c26e09(stash);
	}
	self notify(#"hash_2781407e327b42ee");
}

/*
	Name: function_f9da222a
	Namespace: item_world
	Checksum: 0x9A1B0A7A
	Offset: 0x2CE8
	Size: 0x1E
	Parameters: 1
	Flags: None
*/
function function_f9da222a(identifier)
{
	return isdefined(level.var_66383953[identifier]);
}

/*
	Name: function_861f348d
	Namespace: item_world
	Checksum: 0x1D7E4394
	Offset: 0x2D10
	Size: 0x78
	Parameters: 2
	Flags: Linked
*/
function function_861f348d(identifier, handler)
{
	/#
		assert(!function_f9da222a(identifier), "" + identifier);
	#/
	if(!isdefined(level.var_66383953))
	{
		level.var_66383953 = [];
	}
	level.var_66383953[identifier] = handler;
}

/*
	Name: function_ba96cdf
	Namespace: item_world
	Checksum: 0x6F3E865F
	Offset: 0x2D90
	Size: 0xA2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba96cdf(player)
{
	if(is_true(level.var_ab396c31))
	{
		return;
	}
	function_1b11e73c();
	if(isplayer(player))
	{
		var_fee74908 = player function_e6ea1ee0();
		if(isdefined(player))
		{
			player function_45ecbbc5(var_fee74908);
			player.var_d7a70ae4 = 1;
		}
	}
}

/*
	Name: function_76915220
	Namespace: item_world
	Checksum: 0xE0B07D07
	Offset: 0x2E40
	Size: 0x12
	Parameters: 0
	Flags: Linked, Private
*/
function private function_76915220()
{
	return level.var_703d32de > 0;
}

/*
	Name: function_248022d9
	Namespace: item_world
	Checksum: 0x6674A056
	Offset: 0x2E60
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function function_248022d9()
{
	level.var_37a4536d = [];
	if(!isdefined(level.var_75dc9c49))
	{
		level.var_75dc9c49 = 0;
	}
	while(true)
	{
		level.var_37a4536d = [];
		if(level.var_75dc9c49 > 0)
		{
			time = gettime();
			for(index = 0; index < level.var_37a4536d.size; index++)
			{
				var_3d2f8fc3 = level.var_37a4536d[index];
				if((time - var_3d2f8fc3.var_8e092725) >= level.var_75dc9c49)
				{
					function_54ca5536(var_3d2f8fc3.id, 0);
					function_bfc28859(3, var_3d2f8fc3.id, 1);
					level.var_37a4536d[index] = undefined;
					continue;
				}
				break;
			}
			arrayremovevalue(level.var_37a4536d, undefined, 0);
		}
		waitframe(1);
	}
}

/*
	Name: function_a54d07e6
	Namespace: item_world
	Checksum: 0x342A89B1
	Offset: 0x2FA8
	Size: 0x9AC
	Parameters: 2
	Flags: Linked
*/
function function_a54d07e6(item, activator)
{
	/#
		assert(isdefined(item));
	#/
	if(isdefined(item) && (isdefined(item.targetname) || isdefined(item.var_67169c0b)))
	{
		targetname = (isdefined(item.targetname) ? item.targetname : item.var_67169c0b);
		stashes = level.var_93d08989[targetname];
		if(isdefined(stashes) && stashes.size > 0)
		{
			stashes = arraysortclosest(stashes, item.origin, 1, 0, 12);
			if(stashes.size <= 0)
			{
				return;
			}
			stash = stashes[0];
			state = function_ffdbe8c2(stash);
			if(state == 0)
			{
				function_b516210b((isdefined(stash.var_15d44120) ? stash.var_15d44120 : stash.model), stash.origin, activator);
				function_e2a06860(stash, 1);
				params = {#state:state, #activator:activator};
				stash callback::callback(#"hash_20eb78148e01f7c3", params);
				if(isdefined(stash.onuse))
				{
					succeeded = stash [[stash.onuse]](activator, state, 1);
				}
			}
			else if(state == 1)
			{
				var_bad52796 = function_91b29d2a(targetname);
				var_bad52796 = arraysortclosest(var_bad52796, stash.origin, var_bad52796.size, 0, 12);
				foreach(var_be90d3da in var_bad52796)
				{
					if(isdefined(var_be90d3da.var_a6762160) && namespace_ad5a0cd6::function_83c20f83(var_be90d3da))
					{
						return;
					}
				}
				var_c5c64633 = [];
				foreach(var_979cae3d in level.var_a4a4012e)
				{
					if(isdefined(var_979cae3d) && var_979cae3d.var_67169c0b === targetname)
					{
						var_c5c64633[var_c5c64633.size] = var_979cae3d;
					}
				}
				var_c5c64633 = arraysortclosest(var_c5c64633, stash.origin, var_c5c64633.size, 0, 12);
				foreach(var_ae944413 in var_c5c64633)
				{
					if(namespace_ad5a0cd6::function_83c20f83(var_ae944413))
					{
						return;
					}
				}
				if(is_true(stash.var_1ed4b650) && activator !== level)
				{
					function_35c26e09(stash);
					function_e2a06860(stash, 0);
					if(isdefined(stash.onuse))
					{
						succeeded = stash [[stash.onuse]](activator, state, 0);
					}
					return;
				}
				function_e2a06860(stash, 2);
				if(isdefined(stash.onuse))
				{
					succeeded = stash [[stash.onuse]](activator, state, 2);
				}
				stash notify(#"hash_4c78fc894646853d");
			}
		}
		if(!isstring(targetname))
		{
			return;
		}
		stashes = getentarray(targetname, "targetname");
		if(stashes.size > 0)
		{
			stashes = arraysortclosest(stashes, item.origin, 1, 0, 12);
			if(stashes.size <= 0)
			{
				return;
			}
			stash = stashes[0];
			if(stash.var_bad13452 == 0)
			{
				function_b516210b(stash.model, stash.origin, activator);
				params = {#state:state, #activator:activator};
				stash function_ad255265(params);
				stash callback::callback(#"hash_20eb78148e01f7c3", params);
				if(is_true(stash.var_a76e4941))
				{
					stash animscripted("death_stash_open", stash.origin, stash.angles, "p8_fxanim_wz_death_stash_used_anim", "normal", "root", 1, 0);
				}
				else
				{
				}
				stash.var_bad13452 = 1;
			}
			else if(stash.var_bad13452 == 1)
			{
				var_c5c64633 = [];
				foreach(var_979cae3d in level.var_a4a4012e)
				{
					if(isdefined(var_979cae3d) && var_979cae3d.var_67169c0b === targetname)
					{
						var_c5c64633[var_c5c64633.size] = var_979cae3d;
					}
				}
				var_c5c64633 = arraysortclosest(var_c5c64633, stashes[0].origin, var_c5c64633.size, 0, 12);
				foreach(var_ae944413 in var_c5c64633)
				{
					if(namespace_ad5a0cd6::function_83c20f83(var_ae944413))
					{
						return;
					}
				}
				if(is_true(stash.var_a76e4941))
				{
					stash animscripted("death_stash_empty", stash.origin, stash.angles, "p8_fxanim_wz_death_stash_empty_anim", "normal", "root", 1, 0);
				}
				else if(is_true(stash.var_a64ed253))
				{
					stash animscripted("supply_drop_empty", stash.origin, stash.angles, "p9_fxanim_mp_care_package_open_anim", "normal", "root", 1, 0);
					stash thread function_ee32337(stash);
				}
				stash.var_bad13452 = 2;
				stash clientfield::set("dynamic_stash", 2);
				stash clientfield::set("supply_drop_fx", 0);
			}
		}
	}
}

/*
	Name: loop_sound
	Namespace: item_world
	Checksum: 0x193A1EF
	Offset: 0x3960
	Size: 0x20A
	Parameters: 2
	Flags: Linked
*/
function loop_sound(alias, interval)
{
	self endon(#"death");
	if(self haspart("tag_fx_01") && self haspart("tag_fx_02") && self haspart("tag_fx_03") && self haspart("tag_fx_04") && self haspart("tag_body"))
	{
		var_75b1f55f = 1;
	}
	while(true)
	{
		playsoundatposition(alias, self.origin);
		if(is_true(var_75b1f55f))
		{
			playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_01");
			playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_02");
			playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_03");
			playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_04");
			playfxontag(#"hash_3e6e2a2df9fd889", self, "tag_body");
		}
		wait(interval);
		interval = interval / 1.2;
		if(interval < 0.08)
		{
			break;
		}
	}
}

/*
	Name: function_ee32337
	Namespace: item_world
	Checksum: 0x89F27D09
	Offset: 0x3B78
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_ee32337(stash)
{
	stash endon(#"death");
	/#
		assert(isentity(stash));
	#/
	stash thread loop_sound("wpn_semtex_alert", 0.84);
	stash clientfield::set("supply_drop_fx", 0);
	util::wait_network_frame(1);
	wait(4);
	playfx(#"hash_131031222bb89ea", stash.origin);
	playsoundatposition(#"hash_2f1ae087d02ed33f", stash.origin);
	stash radiusdamage(stash.origin, 128, 50, 10, undefined, "MOD_EXPLOSIVE", getweapon(#"supplydrop"));
	stash delete();
}

/*
	Name: function_ad255265
	Namespace: item_world
	Checksum: 0x4672C316
	Offset: 0x3CF0
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_ad255265(params)
{
	activator = params.activator;
	if(!isplayer(activator) || is_true(self.var_32ed1056))
	{
		return;
	}
	if(self.var_ed175c5 === 0)
	{
		drop_type = #"hash_24f0444fc5e083ea";
	}
	else
	{
		if(self.var_ed175c5 === 1)
		{
			drop_type = #"hash_4fbb9339305f16f2";
		}
		else if(self.var_ed175c5 === 2)
		{
			drop_type = #"hash_5a5b9e642747c4ab";
		}
	}
	if(isdefined(drop_type))
	{
		self.var_32ed1056 = 1;
		scoreevents::processscoreevent(drop_type, activator);
	}
}

/*
	Name: function_c199bcc6
	Namespace: item_world
	Checksum: 0x3F6488F6
	Offset: 0x3E00
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c199bcc6(item)
{
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return 0;
	}
	return self namespace_b376ff3f::function_e106cbe9(item);
}

/*
	Name: function_6105623a
	Namespace: item_world
	Checksum: 0xA01D432E
	Offset: 0x3E48
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6105623a(item)
{
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return 0;
	}
	return self namespace_b376ff3f::function_550fcb41(item);
}

/*
	Name: function_3f63e44f
	Namespace: item_world
	Checksum: 0xFDAC0262
	Offset: 0x3E90
	Size: 0x27E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3f63e44f(itemdef)
{
	if(!isdefined(itemdef) || !isdefined(self))
	{
		return false;
	}
	if(!is_true(itemdef.var_a6762160.var_b362e309) && !is_true(itemdef.var_a6762160.var_ef039d3d) || is_true(itemdef.var_5d97fed1))
	{
		return false;
	}
	if(is_true(itemdef.var_eeb03183))
	{
		return false;
	}
	if(isdefined(itemdef.var_afda6972) && gettime() < itemdef.var_afda6972)
	{
		return false;
	}
	var_104eb1a8 = itemdef.origin - self.origin;
	if(lengthsquared(var_104eb1a8) > sqr(itemdef.var_a6762160.var_16e34ef4))
	{
		return false;
	}
	if(!self namespace_ad5a0cd6::can_pick_up(itemdef))
	{
		return false;
	}
	if(isentity(itemdef))
	{
		if(itemdef.classname === "script_model" || itemdef.classname === "script_origin" || itemdef.classname === "script_brushmodel")
		{
			var_ba207c19 = itemdef function_3d33610f();
			if(isdefined(var_ba207c19))
			{
				if(var_ba207c19.moving && (gettime() - var_ba207c19.time) < 1000)
				{
					return false;
				}
			}
		}
	}
	if(is_true(itemdef.var_a6762160.var_ef039d3d) && !is_true(itemdef.var_a6762160.var_b362e309))
	{
		if(!self function_6105623a(itemdef))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_b0443f69
	Namespace: item_world
	Checksum: 0xEDB15D36
	Offset: 0x4118
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b0443f69(var_f4b807cb)
{
	for(itemindex = 0; itemindex < var_f4b807cb.size; itemindex++)
	{
		itemdef = var_f4b807cb[itemindex];
		if(!isdefined(itemdef.var_a6762160))
		{
			continue;
		}
		if(!self function_3f63e44f(itemdef))
		{
			continue;
		}
		if(isdefined(level.var_d539e0dd) && ![[level.var_d539e0dd]](itemdef))
		{
			continue;
		}
		self thread function_23bb3dd1(itemdef, 1, 1, 1);
	}
}

/*
	Name: function_b30c15ae
	Namespace: item_world
	Checksum: 0x3DED119E
	Offset: 0x41F0
	Size: 0x2A2
	Parameters: 6
	Flags: Linked, Private
*/
function private function_b30c15ae(origin, angles, forward, var_f4b807cb, var_512ddf16, maxdist)
{
	/#
		assert(isplayer(self));
	#/
	if(self inlaststand())
	{
		return;
	}
	if(isdefined(level.var_b290ca72))
	{
		var_b290ca72 = [[level.var_b290ca72]](self);
		/#
			assert(var_b290ca72 == 1 || var_b290ca72 == 0);
		#/
		if(!var_b290ca72)
		{
			return;
		}
	}
	var_9b882d22 = undefined;
	if(var_512ddf16 && isdefined(self.var_d7abc784))
	{
		var_75f6d739 = anglestoforward((0, angles[1], 0));
		for(itemindex = 0; itemindex < var_f4b807cb.size; itemindex++)
		{
			itemdef = var_f4b807cb[itemindex];
			var_47684cd2 = itemdef.origin - origin;
			if(!namespace_ad5a0cd6::function_83c20f83(itemdef))
			{
				continue;
			}
			var_1777205e = vectordot(var_75f6d739, vectornormalize((var_47684cd2[0], var_47684cd2[1], 0)));
			if(var_1777205e >= 0.5 && distancesquared(itemdef.origin, self.var_d7abc784) <= sqr(12))
			{
				if(namespace_ad5a0cd6::function_2eb2c17c(origin, itemdef))
				{
					var_9b882d22 = itemdef;
					break;
					continue;
				}
				break;
			}
		}
	}
	if(!isdefined(var_9b882d22))
	{
		var_4bd72bfe = self.var_c1ea9cae;
		var_9b882d22 = namespace_ad5a0cd6::function_6061a15(var_f4b807cb, maxdist, origin, angles, forward, var_4bd72bfe);
	}
	return var_9b882d22;
}

/*
	Name: function_f59b16bb
	Namespace: item_world
	Checksum: 0xD8BC7DBF
	Offset: 0x44A0
	Size: 0x12C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f59b16bb(origin, angles)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.inventory) && !namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	if(!isalive(self) || self inlaststand())
	{
		return;
	}
	forward = vectornormalize(anglestoforward(angles));
	maxdist = util::function_16fb0a3b();
	var_f4b807cb = function_2e3efdda(origin, forward, 128, maxdist, 0);
	function_b0443f69(var_f4b807cb);
}

/*
	Name: function_7c84312d
	Namespace: item_world
	Checksum: 0xB92D42FB
	Offset: 0x45D8
	Size: 0xE8E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7c84312d(origin, angles)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.inventory) && !namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	usetrigger = self.var_19caeeea;
	if(!isdefined(usetrigger))
	{
		return;
	}
	if(is_true(self.disableitempickup))
	{
		return;
	}
	forward = vectornormalize(anglestoforward(angles));
	var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
	maxdist = util::function_16fb0a3b();
	if(var_512ddf16)
	{
		maxdist = 128;
	}
	var_9b882d22 = undefined;
	var_1f50aeea = self clientfield::get_player_uimodel("hudItems.pickupHintWeaponIndex");
	if(!var_1f50aeea)
	{
		var_f4b807cb = function_2e3efdda(origin, forward, 128, maxdist, 0);
		var_9b882d22 = function_b30c15ae(origin, angles, forward, var_f4b807cb, var_512ddf16, maxdist);
	}
	var_caafaa25 = #"";
	if(isdefined(var_9b882d22) && !self isinvehicle())
	{
		self.var_f0f7e918 = [];
		var_4f583f35 = self namespace_b376ff3f::has_backpack();
		var_be90d3da = namespace_ad5a0cd6::function_83c20f83(var_9b882d22);
		var_52bfa6e5 = !var_be90d3da && function_6105623a(var_9b882d22);
		var_f4b42fba = self namespace_b376ff3f::has_armor() && var_9b882d22.var_a6762160.itemtype == #"armor";
		isammo = var_9b882d22.var_a6762160.itemtype == #"ammo";
		var_de41d336 = !var_4f583f35 && var_9b882d22.var_a6762160.itemtype == #"backpack";
		if(var_be90d3da || (!isammo && !var_de41d336 && !var_52bfa6e5 && !var_f4b42fba))
		{
			var_433d429 = 14;
			self.var_f0f7e918 = function_2e3efdda(var_9b882d22.origin, undefined, 128, var_433d429);
			self.var_f0f7e918 = self array::filter(self.var_f0f7e918, 0, &namespace_ad5a0cd6::can_pick_up);
		}
		if(self.var_f0f7e918.size == 1)
		{
			var_be90d3da = namespace_ad5a0cd6::function_83c20f83(self.var_f0f7e918[0]);
		}
		var_b46724f6 = 0;
		if(isdefined(self.var_d5673d87) && (isdefined(var_9b882d22.targetname) || isdefined(var_9b882d22.var_67169c0b)))
		{
			if(isdefined(self.var_d5673d87.targetname) || isdefined(self.var_d5673d87.var_67169c0b))
			{
				var_45602f41 = (isdefined(var_9b882d22.targetname) ? var_9b882d22.targetname : var_9b882d22.var_67169c0b);
				var_d2daaa1a = (isdefined(self.var_d5673d87.targetname) ? self.var_d5673d87.targetname : self.var_d5673d87.var_67169c0b);
				var_b46724f6 = var_45602f41 != var_d2daaa1a;
			}
		}
		if(var_be90d3da)
		{
			usetrigger setcursorhint("HINT_NOICON");
			usetrigger sethintstring(#"");
			usetrigger function_89fca53b(1);
			usetrigger function_49462027(0);
			stash = namespace_ad5a0cd6::function_31f5aa51(var_9b882d22);
			var_e30063d2 = isdefined(stash) && is_true(stash.var_1ed4b650);
			currentstate = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status");
			if(currentstate != 2 || (currentstate == 2 && var_b46724f6))
			{
				if(distancesquared(origin, var_9b882d22.origin) > sqr(128))
				{
					self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 0);
				}
				else
				{
					if(var_e30063d2 && !function_8bac489c(stash, self))
					{
						if(self namespace_b376ff3f::function_471897e2())
						{
							self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 3);
						}
						else
						{
							self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 4);
						}
					}
					else
					{
						self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 1);
					}
				}
			}
		}
		else
		{
			usetrigger function_89fca53b(0);
			if(isdefined(var_9b882d22.var_dd21aec2))
			{
				usetrigger function_49462027(1, var_9b882d22.var_dd21aec2);
			}
			else
			{
				usetrigger function_49462027(1, (((1 | 16) | 2097152) | 65536) | 1048576);
			}
			self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 0);
			var_a6762160 = var_9b882d22.var_a6762160;
			if(isdefined(var_a6762160.weapon) && var_a6762160.weapon != level.weaponnone)
			{
				if(var_a6762160.itemtype != #"ammo")
				{
					usetrigger setcursorhint("HINT_WEAPON_3D", namespace_a0d533d1::function_2b83d3ff(var_9b882d22));
					var_caafaa25 = #"";
					if(isdefined(var_a6762160.hintstring))
					{
						var_caafaa25 = var_a6762160.hintstring;
					}
					else
					{
						if(isdefined(var_a6762160.weapon))
						{
							var_caafaa25 = var_a6762160.weapon.displayname;
						}
						else
						{
							var_caafaa25 = (isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"hash_64b3a5bc6b1aba8c");
						}
					}
					usetrigger sethintstring(var_caafaa25);
				}
				else
				{
					usetrigger setcursorhint("HINT_3D");
					var_caafaa25 = (isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"");
					usetrigger sethintstring(var_caafaa25);
				}
			}
			else
			{
				usetrigger setcursorhint("HINT_3D");
				var_caafaa25 = (isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"");
				usetrigger sethintstring(var_caafaa25);
			}
		}
		usetrigger.var_ba85cc6f = var_9b882d22;
		usetrigger.origin = var_9b882d22.origin + vectorscale((0, 0, 1), 4);
		usetrigger.angles = (0, 0, 0);
		usetrigger triggerenable(1);
		usetrigger usetriggerignoreuseholdtime();
		if(!is_true(var_9b882d22.var_5d97fed1))
		{
			self clientfield::set_player_uimodel("hudItems.pickupHintGold", var_9b882d22.var_a6762160.rarity == #"epic");
		}
		var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
		if(!is_true(var_9b882d22.var_5d97fed1) && !var_512ddf16)
		{
			if(var_9b882d22.var_a6762160.itemtype == #"ammo")
			{
				if(!function_c199bcc6(var_9b882d22))
				{
					usetrigger function_dae4ab9b(getdvarint(#"hash_3ec4f617fad5b87c", 150) / 1000);
				}
			}
			else if(!isdefined(function_a4e63191(var_9b882d22)))
			{
				usetrigger function_dae4ab9b(getdvarint(#"hash_3ec4f617fad5b87c", 150) / 1000);
			}
		}
		self.var_d5673d87 = var_9b882d22;
		if(isdefined(self.var_d5673d87))
		{
			self.var_d7abc784 = self.var_d5673d87.origin;
		}
		else
		{
			self.var_d7abc784 = undefined;
		}
	}
	else
	{
		self clientfield::set_player_uimodel("hudItems.multiItemPickup.status", 0);
		self clientfield::set_player_uimodel("hudItems.pickupHintGold", 0);
		usetrigger.var_ba85cc6f = undefined;
		usetrigger triggerenable(0);
		self.var_f0f7e918 = undefined;
	}
	self.var_cc586562 = undefined;
	self.var_bf3cabc9 = undefined;
	eyepos = self getplayercamerapos();
	if(isdefined(var_9b882d22) && is_true(var_9b882d22.var_5d97fed1))
	{
		var_caafaa25 = #"hash_1b179a759b7f05c8";
		var_1ba7b9c8 = arraysortclosest(level.var_5ce07338, var_9b882d22.origin, 1, 0, 12);
		if(var_1ba7b9c8.size > 0 && isdefined(var_1ba7b9c8[0].displayname))
		{
			var_caafaa25 = var_1ba7b9c8[0].displayname;
		}
		var_c36bd68a = arraysortclosest(level.var_ace9fb52, var_9b882d22.origin, 1, 0, 12);
		if(var_c36bd68a.size > 0)
		{
			var_caafaa25 = #"hash_7b3fd580a423c4ef";
		}
		else
		{
			var_6594679a = arraysortclosest(level.var_a5f063d, var_9b882d22.origin, 1, 0, 12);
			if(var_6594679a.size > 0)
			{
				var_caafaa25 = #"hash_378637b14671886";
			}
		}
	}
	else if(!isdefined(var_9b882d22) || distance2dsquared(var_9b882d22.origin, eyepos) > sqr(128))
	{
		angles = self getplayerangles();
		self.var_bf3cabc9 = namespace_ad5a0cd6::function_6af455de(0, eyepos, angles);
		hintstring = namespace_ad5a0cd6::function_c62ad9a7(self.var_bf3cabc9);
		if(hintstring != #"")
		{
			var_caafaa25 = hintstring;
		}
	}
	self.var_cc586562 = var_caafaa25;
}

/*
	Name: function_c8ab2022
	Namespace: item_world
	Checksum: 0xB6F2FFF9
	Offset: 0x5470
	Size: 0x17A
	Parameters: 2
	Flags: Linked
*/
function function_c8ab2022(item, var_cdf8c0d1)
{
	if(!isdefined(var_cdf8c0d1))
	{
		var_cdf8c0d1 = 0;
	}
	if(!isdefined(item))
	{
		return 0;
	}
	var_a6762160 = item.var_a6762160;
	itemcount = item.count;
	if(var_a6762160.itemtype == #"cash")
	{
		if(var_cdf8c0d1 && !is_true(var_a6762160.stackable))
		{
			return 1;
		}
		return (isdefined(item.count) ? item.count : 1);
	}
	if(!isdefined(itemcount))
	{
		itemcount = (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1);
		if(var_a6762160.itemtype == #"weapon")
		{
			itemcount = 1;
		}
	}
	if(var_cdf8c0d1 && !is_true(var_a6762160.stackable) && (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1) == 1)
	{
		itemcount = 1;
	}
	return itemcount;
}

/*
	Name: function_7730442c
	Namespace: item_world
	Checksum: 0x245F12BA
	Offset: 0x55F8
	Size: 0x46C
	Parameters: 2
	Flags: Linked
*/
function function_7730442c(item, timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 0;
	}
	level notify(#"hash_4a4f23c60bbb7f6f", {#itemorigin:item.origin, #itemname:item.var_a6762160.name, #item:item});
	if(is_true(level.var_ab396c31))
	{
		return;
	}
	if(isdefined(item.var_bd027dd9) && isdefined(item.id))
	{
		id = (isstruct(item) ? item.id : item.var_bd027dd9);
		ping::function_bbe2694a(id);
	}
	if(isdefined(item.var_8ff34f45))
	{
		if(item.owner === self)
		{
			self.var_8ff34f45 = item.var_8ff34f45;
		}
		else
		{
			self.var_8ff34f45 = undefined;
		}
	}
	if(isentity(item))
	{
		item.var_8e092725 = gettime();
		if(isdefined(item.var_d783088e))
		{
			foreach(var_711e35e5 in item.var_d783088e)
			{
				if(!isdefined(var_711e35e5))
				{
					continue;
				}
				if(isdefined(level.var_9911d36f))
				{
					var_711e35e5 thread [[level.var_9911d36f]]();
				}
			}
			item.var_d783088e = undefined;
		}
	}
	else
	{
		if(isdefined(item))
		{
			function_54ca5536(item.id, gettime());
			if(isdefined(item.var_a6762160) && is_true(item.var_a6762160.var_47f145b4))
			{
				var_3d2f8fc3 = spawnstruct();
				var_3d2f8fc3.id = item.id;
				var_3d2f8fc3.var_8e092725 = gettime();
				level.var_37a4536d[level.var_37a4536d.size] = var_3d2f8fc3;
			}
			function_bfc28859(2, item.id);
		}
		level.var_703d32de++;
	}
	if(isdefined(item))
	{
		function_a54d07e6(item, self);
	}
	if(isentity(item))
	{
		if(timeout)
		{
			item clientfield::set("dynamic_item_drop", 3);
		}
		else
		{
			item clientfield::set("dynamic_item_drop", 2);
		}
		item function_46d7f921(32767);
		item ghost();
		util::wait_network_frame(2);
		if(!isdefined(item))
		{
			return;
		}
		if(isdefined(item.var_38af96b9))
		{
			var_38af96b9 = item.var_38af96b9;
			var_38af96b9 stopsounds();
			util::wait_network_frame(1);
			if(isdefined(var_38af96b9))
			{
				var_38af96b9 delete();
			}
		}
		if(!isdefined(item))
		{
			return;
		}
		item delete();
	}
}

/*
	Name: function_df82b00c
	Namespace: item_world
	Checksum: 0x4CD2BD7D
	Offset: 0x5A70
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_df82b00c()
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(isdefined(self.var_19caeeea))
	{
		self.var_19caeeea triggerenable(0);
	}
	self.disableitempickup = 1;
	self.var_d5673d87 = undefined;
	self clientfield::set_to_player("disableItemPickup", 1);
}

/*
	Name: function_528ca826
	Namespace: item_world
	Checksum: 0x29ACE546
	Offset: 0x5B10
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_528ca826(var_bd027dd9)
{
	if(namespace_ad5a0cd6::function_d9648161(var_bd027dd9))
	{
		if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
		{
			return function_b1702735(var_bd027dd9);
		}
		if(namespace_ad5a0cd6::function_da09de95(var_bd027dd9))
		{
			if(isdefined(level.var_a4a4012e[var_bd027dd9]))
			{
				return level.var_a4a4012e[var_bd027dd9];
			}
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
	}
}

/*
	Name: function_2e3efdda
	Namespace: item_world
	Checksum: 0x82C93733
	Offset: 0x5BD0
	Size: 0x132
	Parameters: 6
	Flags: Linked
*/
function function_2e3efdda(origin, dir, var_4e7bdb02, maxdistance, dot, var_bc1582aa)
{
	if(!isdefined(var_bc1582aa))
	{
		var_bc1582aa = 1;
	}
	var_4e7bdb02 = (isdefined(var_4e7bdb02) ? int(min(var_4e7bdb02, 4000)) : var_4e7bdb02);
	var_f4b807cb = function_abaeb170(origin, dir, var_4e7bdb02, maxdistance, dot, var_bc1582aa, 2147483647);
	var_6665e24 = arraysortclosest(level.var_a4a4012e, origin, var_4e7bdb02, 0, maxdistance);
	var_f4b807cb = arraycombine(var_f4b807cb, var_6665e24, 1, 0);
	var_f4b807cb = arraysortclosest(var_f4b807cb, origin, var_4e7bdb02, 0, maxdistance);
	return var_f4b807cb;
}

/*
	Name: function_de2018e3
	Namespace: item_world
	Checksum: 0x10F7E554
	Offset: 0x5D10
	Size: 0x524
	Parameters: 5
	Flags: Linked
*/
function function_de2018e3(item, player, slotid, playgesture, var_7b753bce)
{
	if(!isdefined(slotid))
	{
		slotid = undefined;
	}
	if(!isdefined(playgesture))
	{
		playgesture = 1;
	}
	if(!isdefined(var_7b753bce))
	{
		var_7b753bce = 0;
	}
	if(!isdefined(item))
	{
		return 0;
	}
	var_a6762160 = item.var_a6762160;
	if(!isdefined(item.var_1181c08b))
	{
		item.var_1181c08b = var_a6762160.var_1181c08b;
	}
	if(isdefined(var_a6762160.handler))
	{
		var_5f8125a9 = level.var_66383953[var_a6762160.handler];
		if(isdefined(var_5f8125a9))
		{
			var_aec6fa7f = item.amount;
			if(!isdefined(var_aec6fa7f) || item.amount == 0)
			{
				if(var_a6762160.itemtype == #"ammo")
				{
					if(!isdefined(var_aec6fa7f))
					{
						var_aec6fa7f = var_a6762160.amount;
					}
				}
				else
				{
					if(var_a6762160.itemtype == #"weapon")
					{
						if(!isdefined(item.amount))
						{
							weapon = namespace_a0d533d1::function_2b83d3ff(item);
							var_aec6fa7f = var_a6762160.amount;
							if(isdefined(weapon))
							{
								var_aec6fa7f = var_a6762160.amount * weapon.clipsize;
							}
						}
					}
					else
					{
						if(var_a6762160.itemtype == #"armor")
						{
							if(!is_true(var_a6762160.var_b5b2485b))
							{
								armoramount = (isdefined(item.amount) ? item.amount : var_a6762160.amount);
								var_aec6fa7f = armoramount;
							}
							else
							{
								var_aec6fa7f = var_a6762160.amount;
							}
						}
						else
						{
							if(namespace_a0d533d1::function_1507e6f0(var_a6762160))
							{
								if(isentity(item))
								{
									var_aec6fa7f = item.ammo;
								}
								if(!isdefined(var_aec6fa7f))
								{
									var_aec6fa7f = 0;
								}
							}
							else
							{
								var_aec6fa7f = 0;
							}
						}
					}
				}
			}
			var_d72b1a4b = function_c8ab2022(item, 0);
			var_8cd447d8 = function_c8ab2022(item, 1);
			var_c5781c22 = player [[var_5f8125a9]](item, player, item.var_bd027dd9, item.id, var_8cd447d8, var_aec6fa7f, slotid);
			var_c5781c22 = var_c5781c22 + (var_d72b1a4b - var_8cd447d8);
			/#
				assert(isint(var_c5781c22) && var_c5781c22 >= 0);
			#/
			if(var_a6762160.itemtype == #"ammo" && var_d72b1a4b === var_c5781c22)
			{
			}
			else
			{
				if(var_c5781c22 == var_d72b1a4b)
				{
				}
				else
				{
					if(is_true(playgesture))
					{
						player gestures::function_56e00fbf("gestable_grab", undefined, 0);
					}
					if(isdefined(item))
					{
						if(var_a6762160.itemtype == #"ammo")
						{
							item.amount = var_c5781c22;
						}
						else
						{
							item.count = var_c5781c22;
						}
						if(isentity(item))
						{
							item clientfield::set("dynamic_item_drop_count", int(max(item.count, item.amount)));
						}
					}
				}
			}
			if(var_c5781c22 != var_d72b1a4b)
			{
				var_fceba0ce = {#hash_7b753bce:var_7b753bce, #player:player, #count:var_8cd447d8, #item:item};
				self callback::callback(#"hash_56d1805bfff3e65b", var_fceba0ce);
			}
			return var_c5781c22;
		}
	}
	/#
		assertmsg(("" + var_a6762160.name) + "");
	#/
}

/*
	Name: function_a4e63191
	Namespace: item_world
	Checksum: 0x176B5659
	Offset: 0x6240
	Size: 0x6A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a4e63191(item, var_26a492bc)
{
	/#
		assert(isplayer(self));
	#/
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	return self namespace_b376ff3f::function_e66dcff5(item, var_26a492bc);
}

/*
	Name: function_23bb3dd1
	Namespace: item_world
	Checksum: 0xD9EE097C
	Offset: 0x62B8
	Size: 0x6C
	Parameters: 4
	Flags: Linked
*/
function function_23bb3dd1(item, var_22be503, var_26a492bc, var_b362e309)
{
	if(!isdefined(var_22be503))
	{
		var_22be503 = 1;
	}
	if(!isdefined(var_26a492bc))
	{
		var_26a492bc = 0;
	}
	if(!isdefined(var_b362e309))
	{
		var_b362e309 = 0;
	}
	pickup_item(item, var_22be503, var_26a492bc, var_b362e309);
}

/*
	Name: pickup_item
	Namespace: item_world
	Checksum: 0xDBFB7BCB
	Offset: 0x6330
	Size: 0x5A4
	Parameters: 4
	Flags: Linked
*/
function pickup_item(item, var_22be503, var_26a492bc, var_b362e309)
{
	if(!isdefined(var_22be503))
	{
		var_22be503 = 1;
	}
	if(!isdefined(var_26a492bc))
	{
		var_26a492bc = 0;
	}
	if(!isdefined(var_b362e309))
	{
		var_b362e309 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.inventory) && !namespace_b376ff3f::function_7d5553ac())
	{
		return 0;
	}
	if(!namespace_ad5a0cd6::can_pick_up(item))
	{
		return 0;
	}
	if(is_true(self.is_reviving_any) || is_true(self.var_5c574004))
	{
		return 0;
	}
	if(isdefined(item.hidefromteam) && item.hidefromteam == self.team)
	{
		if(!isdefined(item.var_6e788302) || item.var_6e788302 !== self getentitynumber())
		{
			self playsoundtoplayer(#"uin_default_action_denied", self);
			return 0;
		}
	}
	rumble = item.var_a6762160.var_c2de1e75;
	self dynent_use::function_7f2040e8();
	if(var_22be503)
	{
		var_fa3df96 = self function_a4e63191(item, var_26a492bc);
	}
	if(isdefined(var_fa3df96))
	{
		var_5c727d89 = item.var_bd027dd9;
		success = self function_83ddce0f(item, var_fa3df96);
		if(success && isdefined(rumble) && isplayer(self))
		{
			self function_bc82f900(rumble);
		}
		if(success && isdefined(var_5c727d89))
		{
			ping::function_bbe2694a(var_5c727d89);
		}
		return success;
	}
	if(item.var_a6762160.itemtype != #"weapon")
	{
		var_d72b1a4b = function_c8ab2022(item, 0);
		var_8cd447d8 = function_c8ab2022(item, 1);
		var_77e61fc6 = function_de2018e3(item, self, undefined, !var_b362e309, 1);
		var_77e61fc6 = var_77e61fc6 + (var_d72b1a4b - var_8cd447d8);
		if(var_77e61fc6 == 0)
		{
			if(isdefined(rumble) && isplayer(self))
			{
				self function_bc82f900(rumble);
			}
			if(item.var_a6762160.itemtype != #"armor")
			{
				if(isdefined(item) && isdefined(item.var_a6762160))
				{
					function_1a46c8ae(self, undefined, undefined, item.var_a6762160, item.var_a6762160.amount);
				}
			}
			function_7730442c(item);
			return 1;
		}
		if(var_77e61fc6 < var_8cd447d8 && !isentity(item) && item.var_a6762160.itemtype != #"ammo")
		{
			if(isdefined(rumble) && isplayer(self))
			{
				self function_bc82f900(rumble);
			}
			var_be90d3da = namespace_ad5a0cd6::function_83c20f83(item);
			var_be90d3da = var_be90d3da & (~(isdefined(item.var_4961f577) ? item.var_4961f577 : 0));
			dropitem = self item_drop::function_fd9026e4(0, item.var_a6762160.weapon, var_77e61fc6, item.amount, item.id, item.origin, item.angles, 0, var_be90d3da, undefined, (isdefined(item.var_67169c0b) ? item.var_67169c0b : item.targetname), undefined, undefined, 0);
			if(isdefined(dropitem))
			{
				dropitem.origin = item.origin;
				dropitem.angles = item.angles;
				function_7730442c(item);
			}
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_8e0d14c1
	Namespace: item_world
	Checksum: 0xDD1598DE
	Offset: 0x68E0
	Size: 0x146
	Parameters: 1
	Flags: Linked
*/
function function_8e0d14c1(var_4b0875ec)
{
	if(!isdefined(var_4b0875ec))
	{
		var_4b0875ec = 0;
	}
	/#
		assert(isplayer(self));
	#/
	usetrigger = self.var_19caeeea;
	if(!isdefined(usetrigger))
	{
		return false;
	}
	if(!isdefined(usetrigger.var_ba85cc6f))
	{
		return false;
	}
	if(var_4b0875ec && namespace_ad5a0cd6::function_83c20f83(usetrigger.var_ba85cc6f))
	{
		return false;
	}
	origin = self getplayercamerapos();
	if(distance2dsquared(usetrigger.var_ba85cc6f.origin, origin) > sqr(128))
	{
		return false;
	}
	if(abs(usetrigger.var_ba85cc6f.origin[2] - origin[2]) > 128)
	{
		return false;
	}
	return true;
}

/*
	Name: function_1a46c8ae
	Namespace: item_world
	Checksum: 0x929D53C
	Offset: 0x6A30
	Size: 0x22C
	Parameters: 5
	Flags: Linked
*/
function function_1a46c8ae(player, var_a1ca235e, var_3d1f9df4, var_7089b458, var_381f3b39)
{
	if(game.state == #"pregame" || (!isdefined(var_a1ca235e) && !isdefined(var_7089b458)))
	{
		return;
	}
	loc_00006AAC:
	loc_00006ADE:
	loc_00006AFC:
	loc_00006B2E:
	data = {#hash_d1f97c0f:(isdefined(var_381f3b39) ? var_381f3b39 : 0), #hash_6789038:(isdefined(var_7089b458) ? hash(var_7089b458.name) : 0), #hash_5b8ff5e9:(isdefined(var_3d1f9df4) ? var_3d1f9df4 : 0), #dropped_item:(isdefined(var_a1ca235e) ? hash(var_a1ca235e.name) : 0), #player_xuid:(isdefined(player) ? int(player getxuid(1)) : 0), #game_time:function_f8d53445()};
	/#
		if(isdefined(var_a1ca235e))
		{
			println((("" + var_a1ca235e.name) + "") + (isdefined(var_3d1f9df4) ? var_3d1f9df4 : 0));
		}
		if(isdefined(var_7089b458))
		{
			println((("" + var_7089b458.name) + "") + (isdefined(var_381f3b39) ? var_381f3b39 : 0));
		}
	#/
	function_92d1707f(#"hash_1ed3b4af49015043", data);
}

/*
	Name: function_83ddce0f
	Namespace: item_world
	Checksum: 0xD3BEE551
	Offset: 0x6C68
	Size: 0x4E0
	Parameters: 2
	Flags: Linked
*/
function function_83ddce0f(item, var_14f7206c)
{
	var_a1ca235e = undefined;
	var_3d1f9df4 = 0;
	var_8acbe1d0 = self function_6105623a(item) || item.var_a6762160.itemtype == #"hash_56d6621e6c4caf07" || item.var_a6762160.itemtype == #"resource" || item.var_a6762160.itemtype == #"ammo" || (item.var_a6762160.itemtype == #"backpack" && !self namespace_b376ff3f::has_backpack()) || item.var_a6762160.var_4a1a4613 == #"hash_3d98ea1d4a033e97";
	var_be90d3da = namespace_ad5a0cd6::function_83c20f83(item);
	var_a692c6d6 = (isdefined(item.var_4961f577) ? item.var_4961f577 : 0);
	var_be90d3da = var_be90d3da & (~var_a692c6d6);
	dropitem = undefined;
	if(!var_8acbe1d0 && self namespace_b376ff3f::function_f62713c3(var_14f7206c))
	{
		var_69944179 = self.inventory.items[var_14f7206c];
		var_a1ca235e = var_69944179.var_a6762160;
		var_3d1f9df4 = var_a1ca235e.amount;
		dropitem = self namespace_b376ff3f::function_418f9eb8(var_69944179.var_bd027dd9, 0, item.origin, undefined, 0);
		if(!isdefined(dropitem))
		{
			return false;
		}
		waitframe(1);
	}
	if(isdefined(item) && !isentity(item) && isdefined(item.id))
	{
		item = function_b1702735(item.id);
	}
	if(!isdefined(item) || !namespace_ad5a0cd6::can_pick_up(item))
	{
		if(isdefined(dropitem) && isdefined(item) && isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"backpack")
		{
			namespace_b376ff3f::function_ec238da8();
		}
		return false;
	}
	var_77e61fc6 = function_de2018e3(item, self, var_14f7206c, 1, 1);
	if(var_77e61fc6 == 0)
	{
		if(isdefined(item) && isdefined(item.var_a6762160))
		{
			function_1a46c8ae(self, var_a1ca235e, var_3d1f9df4, item.var_a6762160, item.var_a6762160.amount);
			if(item.var_a6762160.itemtype == #"backpack")
			{
				namespace_b376ff3f::function_ec238da8();
			}
		}
		function_7730442c(item);
	}
	else if(!isentity(item) && item.var_a6762160.itemtype != #"ammo")
	{
		dropitem = self item_drop::function_fd9026e4(0, item.var_a6762160.weapon, item.count, item.amount, item.id, item.origin, item.angles, 2, 0, undefined, (isdefined(item.var_67169c0b) ? item.var_67169c0b : item.targetname), undefined, undefined, 0);
		if(isdefined(dropitem))
		{
			dropitem.origin = item.origin;
			dropitem.angles = item.angles;
			function_7730442c(item);
		}
	}
	return true;
}

/*
	Name: function_8eee98dd
	Namespace: item_world
	Checksum: 0x7F6D967F
	Offset: 0x7150
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_8eee98dd(var_f4cdfe08)
{
	function_1b11e73c();
	/#
		assert(isdefined(var_f4cdfe08));
	#/
	if(!isdefined(var_f4cdfe08) || !isdefined(var_f4cdfe08.targetname))
	{
		return;
	}
	targetname = (isdefined(var_f4cdfe08.targetname) ? var_f4cdfe08.targetname : var_f4cdfe08.target);
	var_76c7cb8a = function_91b29d2a(targetname);
	foreach(item in var_76c7cb8a)
	{
		if(!isdefined(item.var_a6762160))
		{
			continue;
		}
		if(distancesquared(item.origin, var_f4cdfe08.origin) > 36)
		{
			continue;
		}
		function_54ca5536(item.id, -1);
		function_bfc28859(3, item.id);
	}
	function_e2a06860(var_f4cdfe08, 0);
}

/*
	Name: function_7a0c5d2e
	Namespace: item_world
	Checksum: 0xCAA09C94
	Offset: 0x7300
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function function_7a0c5d2e(probability, targetname, var_8bd8496)
{
	if(!isdefined(var_8bd8496))
	{
		var_8bd8496 = undefined;
	}
	/#
		assert(isint(probability));
	#/
	/#
		assert(probability >= 0 && probability <= 100);
	#/
	/#
		assert(!isdefined(var_8bd8496) || isint(var_8bd8496));
	#/
	/#
		assert(isstring(targetname) || function_7a600918(targetname));
	#/
	function_1b11e73c();
	dynents = getdynentarray(targetname, 1);
	dynents = array::randomize(dynents);
	var_9f9cadbe = ceil((dynents.size * probability) / 100);
	var_fdc859b5 = 0;
	foreach(dynent in dynents)
	{
		if(var_fdc859b5 < var_9f9cadbe)
		{
			function_8eee98dd(dynent);
			var_fdc859b5++;
			continue;
		}
		function_160294c7(dynent);
	}
	return dynents;
}

/*
	Name: function_160294c7
	Namespace: item_world
	Checksum: 0x2074788F
	Offset: 0x7540
	Size: 0x2F4
	Parameters: 1
	Flags: Linked
*/
function function_160294c7(var_f4cdfe08)
{
	function_1b11e73c();
	/#
		assert(isdefined(var_f4cdfe08));
	#/
	if(!isdefined(var_f4cdfe08) || !isdefined(var_f4cdfe08.targetname))
	{
		return;
	}
	targetname = (isdefined(var_f4cdfe08.targetname) ? var_f4cdfe08.targetname : var_f4cdfe08.target);
	var_76c7cb8a = function_91b29d2a(targetname);
	foreach(item in var_76c7cb8a)
	{
		if(distancesquared(item.origin, var_f4cdfe08.origin) > 36)
		{
			continue;
		}
		if(namespace_ad5a0cd6::can_pick_up(item))
		{
			function_7730442c(item);
		}
	}
	var_1d722c21 = [];
	foreach(item in level.var_a4a4012e)
	{
		if(!isdefined(item))
		{
			continue;
		}
		var_45602f41 = (isdefined(item.targetname) ? item.targetname : item.var_67169c0b);
		if(!isdefined(var_45602f41))
		{
			continue;
		}
		if(var_45602f41 == targetname)
		{
			if(namespace_ad5a0cd6::can_pick_up(item))
			{
				var_1d722c21[var_1d722c21.size] = item;
			}
		}
	}
	foreach(item in var_1d722c21)
	{
		if(isdefined(item))
		{
			function_7730442c(item);
		}
	}
	function_e2a06860(var_f4cdfe08, 3);
}

/*
	Name: function_cbc32e1b
	Namespace: item_world
	Checksum: 0x5CAC4A90
	Offset: 0x7840
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_cbc32e1b(milliseconds)
{
	/#
		assert(isint(milliseconds));
	#/
	if(isint(milliseconds))
	{
		level.var_75dc9c49 = milliseconds;
	}
}

/*
	Name: function_1b11e73c
	Namespace: item_world
	Checksum: 0x2D0F0B81
	Offset: 0x78A8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_1b11e73c()
{
	level flag::wait_till(#"hash_51daecff754729dc");
}

