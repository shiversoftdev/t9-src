#using script_18077945bb84ede7;
#using script_1c65dbfc2f1c8d8f;
#using script_3751b21462a54a7d;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using script_4ccfb58a9443a60b;
#using script_67c87580908a0a00;
#using script_68d2ee1489345a1d;
#using script_7133a4d461308099;
#using script_72401f526ba71638;
#using script_7a5293d92c61c788;
#using script_f11fc6f7a3ad5b9;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_cf6efd05;

/*
	Name: function_4cd4c348
	Namespace: namespace_cf6efd05
	Checksum: 0x763F7D20
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4cd4c348()
{
	level notify(2077344068);
}

/*
	Name: init
	Namespace: namespace_cf6efd05
	Checksum: 0x1A597D6F
	Offset: 0x190
	Size: 0xF6
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	level endon(#"game_ended");
	if(!zm_utility::is_survival())
	{
		return;
	}
	level.var_85b812c9 = function_21d402f4(#"initialized");
	if(!function_85b812c9())
	{
		function_ded56b14();
		function_c484a9be(#"initialized", 1);
	}
	function_f120fbd8();
	if(function_85b812c9())
	{
		level flag::wait_till(#"initial_fade_in_complete");
		level.var_85b812c9 = undefined;
	}
}

/*
	Name: function_85b812c9
	Namespace: namespace_cf6efd05
	Checksum: 0x56DDE57B
	Offset: 0x290
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_85b812c9()
{
	return is_true(level.var_85b812c9);
}

/*
	Name: function_c484a9be
	Namespace: namespace_cf6efd05
	Checksum: 0xB783E8F7
	Offset: 0x2B8
	Size: 0x1F4
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_c484a9be(...)
{
	value = vararg[vararg.size - 1];
	if(!isdefined(value))
	{
		return;
	}
	arrayremoveindex(vararg, vararg.size - 1);
	/#
		if(getdvarint(#"hash_66a946ea0668bb21", 0))
		{
			var_7e5020cb = "";
			foreach(path in vararg)
			{
				if(function_7a600918(path))
				{
					var_7e5020cb = (var_7e5020cb + "") + function_9e72a96(path);
					continue;
				}
				var_7e5020cb = (var_7e5020cb + "") + path;
			}
			println((((("" + "") + "") + var_7e5020cb) + "") + (function_7a600918(value) ? function_9e72a96(value) : (isdefined(value) ? value : "")));
		}
	#/
	function_138a6b4b(vararg, value);
}

/*
	Name: function_53721fc4
	Namespace: namespace_cf6efd05
	Checksum: 0x8640F7EB
	Offset: 0x4B8
	Size: 0x384
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_53721fc4(player, ...)
{
	if(!isdefined(player))
	{
		return;
	}
	player_xuid = player getxuid(1);
	if(player_xuid === 0)
	{
		return;
	}
	for(i = 0; i < 4; i++)
	{
		path_array = [1:#"players", 0:i];
		path_array = arraycombine(path_array, [0:#"xuid"], 1, 0);
		value = function_7bce700c(path_array);
		if(int(player_xuid) === value)
		{
			player_index = i;
			break;
			continue;
		}
		if(!isdefined(player_index) && value == 0)
		{
			player_index = i;
		}
	}
	if(!isdefined(player_index))
	{
		return;
	}
	value = vararg[vararg.size - 1];
	if(!isdefined(value))
	{
		return;
	}
	arrayremoveindex(vararg, vararg.size - 1);
	path_array = [1:#"players", 0:player_index];
	path_array = arraycombine(path_array, vararg, 1, 0);
	/#
		if(getdvarint(#"hash_66a946ea0668bb21", 0))
		{
			var_7e5020cb = "";
			foreach(path in path_array)
			{
				if(function_7a600918(path))
				{
					var_7e5020cb = (var_7e5020cb + "") + function_9e72a96(path);
					continue;
				}
				var_7e5020cb = (var_7e5020cb + "") + path;
			}
			println((((("" + "") + "") + var_7e5020cb) + "") + (function_7a600918(value) ? function_9e72a96(value) : (isdefined(value) ? value : "")));
		}
	#/
	function_138a6b4b(path_array, value);
}

/*
	Name: function_594ed048
	Namespace: namespace_cf6efd05
	Checksum: 0xBF436563
	Offset: 0x848
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_594ed048(map_name, category)
{
	function_c484a9be(#"hash_501fca63bac8cf9", map_name, #"hash_51416992d6e52e2d", category, 1);
}

/*
	Name: function_42f98bb6
	Namespace: namespace_cf6efd05
	Checksum: 0xB31D3939
	Offset: 0x8A0
	Size: 0x3EC
	Parameters: 1
	Flags: Linked
*/
function function_42f98bb6(player)
{
	if(!isdefined(player))
	{
		return;
	}
	function_53721fc4(player, #"xuid", player getxuid(1));
	function_53721fc4(player, #"valid", 1);
	function_53721fc4(player, #"classnum", player.class_num);
	function_53721fc4(player, #"hash_505f17545479dd7c", player.var_afe4efeb);
	function_53721fc4(player, #"hash_46de19213c750fcd", player zm_laststand::function_618fd37e());
	function_53721fc4(player, #"deaths", player.deaths);
	function_53721fc4(player, #"kills", player.kills);
	function_53721fc4(player, #"score", player.pers[#"score"]);
	function_53721fc4(player, #"revives", player.pers[#"revives"]);
	function_53721fc4(player, #"downs", player.pers[#"downs"]);
	function_53721fc4(player, #"damage", (isdefined(player.pers[#"damagedone"]) ? player.pers[#"damagedone"] : 0));
	function_53721fc4(player, #"headshots", player.headshots);
	function_53721fc4(player, #"hash_7472529eae501802", player.var_3f62a666);
	function_53721fc4(player, #"hash_709ac244d8923f57", player.var_3b4f6b37);
	function_53721fc4(player, #"hash_28e11648279d2037", int((isdefined(player.var_e2d764da) ? player.var_e2d764da : 0)));
	function_f859a82d(player);
	function_2728bf09(player);
	function_10248eb0(player);
	function_9a198b3a(player);
	function_b8d9713(player);
	function_85fb7313(player);
	function_92ce0b73(player);
	function_bddd882e(player);
}

/*
	Name: function_f859a82d
	Namespace: namespace_cf6efd05
	Checksum: 0xC84931
	Offset: 0xC98
	Size: 0x5F4
	Parameters: 1
	Flags: Linked
*/
function function_f859a82d(player)
{
	var_6653c106 = [1:((17 + 1) + 8) + 1, 0:17 + 1];
	primary_weapons = player getweaponslist();
	var_3c6fcb66 = 0;
	foreach(weapon in primary_weapons)
	{
		if(!isdefined(weapon) || weapon === level.weaponnone || weapon === level.nullprimaryoffhand || killstreaks::is_killstreak_weapon(weapon) || (weapon.inventorytype !== "primary" && weapon.inventorytype !== "melee"))
		{
			continue;
		}
		weapon_index = var_3c6fcb66;
		item = player namespace_b376ff3f::function_230ceec4(weapon);
		weapon_name = "";
		if(isdefined(item.var_a8bccf69))
		{
			weapon_name = weapon.name;
		}
		else
		{
			base_weapon = zm_weapons::get_base_weapon(weapon);
			weapon_name = base_weapon.name;
		}
		function_53721fc4(player, #"weapons", weapon_index, #"name", weapon_name);
		foreach(attachment_index, attachment in weapon.attachments)
		{
			function_53721fc4(player, #"weapons", weapon_index, #"attachments", attachment_index, hash(attachment));
		}
		function_dc928114(player, weapon, weapon_index);
		if(isdefined(item))
		{
			if(isdefined(item.var_a8bccf69))
			{
				function_53721fc4(player, #"weapons", weapon_index, #"hash_1e11eaa7ac26bbd0", item.var_a8bccf69);
			}
			if(isdefined(item.aat))
			{
				function_53721fc4(player, #"weapons", weapon_index, #"aat", hash(item.aat));
			}
			if(isdefined(item.var_a6762160.rarity))
			{
				function_53721fc4(player, #"weapons", weapon_index, #"rarity", hash(item.var_a6762160.rarity));
			}
			function_53721fc4(player, #"weapons", weapon_index, #"hash_455cfe820071b143", is_true(item.var_b3546c09));
			function_53721fc4(player, #"weapons", weapon_index, #"weaponoptions", string((isdefined(item.weaponoptions) ? item.weaponoptions : 0)));
			function_53721fc4(player, #"weapons", weapon_index, #"hash_6ebd8dec863a7782", string((isdefined(item.var_e91aba42) ? item.var_e91aba42 : 0)));
			function_53721fc4(player, #"weapons", weapon_index, #"hash_17f911763bde5dfe", string((isdefined(item.var_908f65ca) ? item.var_908f65ca : 0)));
		}
		function_53721fc4(player, #"weapons", weapon_index, #"lastequipped", player.var_5d80a93b === weapon);
		var_3c6fcb66++;
	}
}

/*
	Name: function_dc928114
	Namespace: namespace_cf6efd05
	Checksum: 0x91BB7965
	Offset: 0x1298
	Size: 0x254
	Parameters: 3
	Flags: Linked
*/
function function_dc928114(player, weapon, weapon_index)
{
	weapon = activecamo::function_94c2605(weapon);
	var_f4eb4a50 = player activecamo::function_155299d(weapon);
	if(!isdefined(var_f4eb4a50) || !isdefined(player.pers[#"activecamo"]))
	{
		return;
	}
	base_weapon = activecamo::function_c14cb514(weapon);
	if(!isdefined(base_weapon))
	{
		return;
	}
	var_8d729f1b = 0;
	activecamo = player.pers[#"activecamo"][var_f4eb4a50.name];
	if(isdefined(activecamo.var_13949c61.stages))
	{
		foreach(var_62b564ee in activecamo.var_13949c61.stages)
		{
			stage = activecamo.stages[var_d1a848d9];
			if(isdefined(stage.var_dd54a13b[base_weapon]))
			{
				var_8d729f1b = var_8d729f1b + stage.var_dd54a13b[base_weapon].statvalue;
			}
		}
	}
	function_53721fc4(player, #"weapons", weapon_index, #"hash_63f0851f53ab627c", #"bundlename", hash(var_f4eb4a50.name));
	function_53721fc4(player, #"weapons", weapon_index, #"hash_63f0851f53ab627c", #"statvalue", var_8d729f1b);
}

/*
	Name: function_2728bf09
	Namespace: namespace_cf6efd05
	Checksum: 0xE942A5
	Offset: 0x14F8
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_2728bf09(player)
{
	if(player.inventory.items[13].var_bd027dd9 !== 32767)
	{
		item = player.inventory.items[13];
		function_53721fc4(player, #"tactical", #"name", hash(item.var_a6762160.name));
		function_53721fc4(player, #"tactical", #"amount", item.count);
	}
	if(player.inventory.items[7].var_bd027dd9 !== 32767)
	{
		item = player.inventory.items[7];
		function_53721fc4(player, #"lethal", #"name", hash(item.var_a6762160.name));
		function_53721fc4(player, #"lethal", #"amount", item.count);
	}
}

/*
	Name: function_10248eb0
	Namespace: namespace_cf6efd05
	Checksum: 0x5B72AA07
	Offset: 0x16B8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_10248eb0(player)
{
	if(isdefined(player.var_87f72f8))
	{
		function_53721fc4(player, #"hash_fffea0defd338fe", player.var_8da24ed0);
	}
	if(player.inventory.items[12].var_bd027dd9 !== 32767)
	{
		item = player.inventory.items[12];
		function_53721fc4(player, #"fieldupgrade", #"name", hash(item.var_a6762160.name));
		function_53721fc4(player, #"fieldupgrade", #"amount", item.count);
	}
}

/*
	Name: function_9a198b3a
	Namespace: namespace_cf6efd05
	Checksum: 0xAA4E5A73
	Offset: 0x17E0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_9a198b3a(player)
{
	if(isdefined(player.var_7341f980))
	{
		foreach(index, var_ec1d9111 in player.var_7341f980)
		{
			function_53721fc4(player, #"perks", index, var_ec1d9111);
		}
	}
}

/*
	Name: function_b8d9713
	Namespace: namespace_cf6efd05
	Checksum: 0x4AA27FCD
	Offset: 0x18A0
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_b8d9713(player)
{
	if(player.inventory.items[17].var_bd027dd9 !== 32767)
	{
		item = player.inventory.items[17];
		function_53721fc4(player, #"hash_13a6653f40472f80", hash(item.var_a6762160.name));
	}
}

/*
	Name: function_85fb7313
	Namespace: namespace_cf6efd05
	Checksum: 0x199DBE3
	Offset: 0x1948
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_85fb7313(player)
{
	if(player.inventory.items[6].var_bd027dd9 !== 32767)
	{
		item = player.inventory.items[6];
		function_53721fc4(player, #"hash_52119dffbbef02ab", hash(item.var_a6762160.name));
		function_53721fc4(player, #"armor", player.armor);
	}
}

/*
	Name: function_92ce0b73
	Namespace: namespace_cf6efd05
	Checksum: 0x3C4EC20A
	Offset: 0x1A18
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_92ce0b73(player)
{
	scrap = player sr_scrap::function_6f3fd157();
	function_53721fc4(player, #"scrap", (isdefined(scrap) ? scrap : 0));
	var_c7f20631 = player sr_scrap::function_efd1d093();
	function_53721fc4(player, #"hash_d6fdfc12ead24ba", (isdefined(var_c7f20631) ? var_c7f20631 : 0));
}

/*
	Name: function_bddd882e
	Namespace: namespace_cf6efd05
	Checksum: 0xDD5406AC
	Offset: 0x1AE0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_bddd882e(player)
{
	function_53721fc4(player, #"hash_7cd550c023e602c2", #"hash_67fa39d03fd168d9", (isdefined(player.var_6b3806e8) ? player.var_6b3806e8 : 0));
	function_53721fc4(player, #"hash_7cd550c023e602c2", #"hash_f0eccd443684741", (isdefined(player.var_207f01b0) ? player.var_207f01b0 : 0));
	function_53721fc4(player, #"hash_7cd550c023e602c2", #"tribute", int((isdefined(player.n_tribute) ? player.n_tribute : 0)));
	function_53721fc4(player, #"hash_7cd550c023e602c2", #"hash_183357499f14d5b7", int((isdefined(player.var_9e09931e) ? player.var_9e09931e : 0)));
	function_53721fc4(player, #"hash_7cd550c023e602c2", #"hash_115e695af69d2e5c", int((isdefined(player.var_c8413949) ? player.var_c8413949 : 0)));
}

/*
	Name: function_9c9d3652
	Namespace: namespace_cf6efd05
	Checksum: 0xA0848E58
	Offset: 0x1CD0
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_9c9d3652()
{
	function_c484a9be(#"hash_2b3a351ebb247773", #"category", (isdefined(level.var_edb2bb69) ? level.var_edb2bb69 : #""));
	function_c484a9be(#"hash_2b3a351ebb247773", #"variant", (isdefined(level.var_1b2466fe) ? level.var_1b2466fe : #""));
	if(isdefined(level.var_7d45d0d4))
	{
		function_c5655189(level.var_7d45d0d4.var_dc858a58);
		function_a7656dd1(level.var_7d45d0d4.var_407236bf, level.var_7d45d0d4.var_9614b1d2);
	}
	function_c484a9be(#"hash_4c6551b221159068", int((isdefined(level.var_df1d1235) ? level.var_df1d1235 : 0)));
	function_c484a9be(#"hash_44f5d4b321e92263", int((isdefined(level.var_d2bdec66) ? level.var_d2bdec66 : 0)));
}

/*
	Name: function_c5655189
	Namespace: namespace_cf6efd05
	Checksum: 0x63E4A49E
	Offset: 0x1EB0
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_c5655189(var_53789a3b)
{
	foreach(index, map_name in var_53789a3b.list)
	{
		function_c484a9be(#"hash_60af8d9cfbbe06bd", index, map_name);
	}
	function_c484a9be(#"hash_2ab6464d4c124e87", var_53789a3b.index);
}

/*
	Name: function_a7656dd1
	Namespace: namespace_cf6efd05
	Checksum: 0xB80318A9
	Offset: 0x1F90
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function function_a7656dd1(var_6a2432bd, var_e3e502f9)
{
	foreach(index, objective_name in var_6a2432bd.list)
	{
		function_c484a9be(#"hash_5eba90da524edc31", index, objective_name);
		if(isdefined(var_e3e502f9[objective_name]))
		{
			function_a6d3f1ca(var_e3e502f9[objective_name], objective_name);
		}
	}
	function_c484a9be(#"hash_1fe8bc20266a252b", var_6a2432bd.index);
}

/*
	Name: function_a6d3f1ca
	Namespace: namespace_cf6efd05
	Checksum: 0x22456DEE
	Offset: 0x20A0
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_a6d3f1ca(var_276aa0ed, objective_name)
{
	foreach(index, var_1833acb0 in var_276aa0ed.list)
	{
		function_c484a9be(#"hash_15d6e042e3e0ebfe", objective_name, #"variants", index, var_1833acb0);
	}
	function_c484a9be(#"hash_15d6e042e3e0ebfe", objective_name, #"variantindex", var_276aa0ed.index);
}

/*
	Name: function_21d402f4
	Namespace: namespace_cf6efd05
	Checksum: 0x9EB156E0
	Offset: 0x21A8
	Size: 0x1B8
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_21d402f4(...)
{
	value = function_7bce700c(vararg);
	/#
		if(getdvarint(#"hash_66a946ea0668bb21", 0))
		{
			var_7e5020cb = "";
			foreach(path in vararg)
			{
				if(function_7a600918(path))
				{
					var_7e5020cb = (var_7e5020cb + "") + function_9e72a96(path);
					continue;
				}
				var_7e5020cb = (var_7e5020cb + "") + path;
			}
			println((((("" + "") + "") + var_7e5020cb) + "") + (function_7a600918(value) ? function_9e72a96(value) : (isdefined(value) ? value : "")));
		}
	#/
	return value;
}

/*
	Name: function_48b5c403
	Namespace: namespace_cf6efd05
	Checksum: 0xBB031CC2
	Offset: 0x2368
	Size: 0x338
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_48b5c403(player, ...)
{
	if(!isdefined(player))
	{
		return;
	}
	player_xuid = player getxuid(1);
	if(player_xuid === 0)
	{
		return;
	}
	for(i = 0; i < 4; i++)
	{
		path_array = [1:#"players", 0:i];
		path_array = arraycombine(path_array, [0:#"xuid"], 1, 0);
		value = function_7bce700c(path_array);
		if(int(player_xuid) === value)
		{
			player_index = i;
			break;
		}
	}
	if(!isdefined(player_index))
	{
		return;
	}
	path_array = [1:#"players", 0:player_index];
	path_array = arraycombine(path_array, vararg, 1, 0);
	value = function_7bce700c(path_array);
	if(!isdefined(value))
	{
		value = 0;
	}
	/#
		if(getdvarint(#"hash_66a946ea0668bb21", 0))
		{
			var_7e5020cb = "";
			foreach(path in path_array)
			{
				if(function_7a600918(path))
				{
					var_7e5020cb = (var_7e5020cb + "") + function_9e72a96(path);
					continue;
				}
				var_7e5020cb = (var_7e5020cb + "") + path;
			}
			println((((("" + "") + "") + var_7e5020cb) + "") + (function_7a600918(value) ? function_9e72a96(value) : (isdefined(value) ? value : "")));
		}
	#/
	return value;
}

/*
	Name: function_99df13e0
	Namespace: namespace_cf6efd05
	Checksum: 0x833C87A7
	Offset: 0x26A8
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_99df13e0(player)
{
	return is_true(function_48b5c403(player, #"valid"));
}

/*
	Name: function_642cc595
	Namespace: namespace_cf6efd05
	Checksum: 0x6F5F67FC
	Offset: 0x26F0
	Size: 0x506
	Parameters: 1
	Flags: Linked
*/
function function_642cc595(player)
{
	if(!function_85b812c9() || !isdefined(player))
	{
		return;
	}
	player endon(#"death", #"disconnect");
	player takeallweapons();
	util::wait_network_frame();
	player.specialty = [];
	var_43d69af6 = getweapon(#"null_offhand_primary");
	player giveweapon(var_43d69af6);
	player setweaponammoclip(var_43d69af6, 0);
	player switchtooffhand(var_43d69af6);
	while(!player hasweapon(var_43d69af6))
	{
		waitframe(1);
	}
	player.class_num = function_48b5c403(player, #"classnum");
	player.var_afe4efeb = function_48b5c403(player, #"hash_505f17545479dd7c");
	var_7f2e1d50 = function_48b5c403(player, #"hash_46de19213c750fcd");
	if(player zm_laststand::function_618fd37e() < 1)
	{
		player zm_laststand::function_3a00302e(var_7f2e1d50);
	}
	player.deaths = function_48b5c403(player, #"deaths");
	player.pers[#"deaths"] = player.deaths;
	player.kills = function_48b5c403(player, #"kills");
	player.pers[#"kills"] = player.kills;
	player.score = function_48b5c403(player, #"score");
	player.pers[#"score"] = player.score;
	player.revives = function_48b5c403(player, #"revives");
	player.pers[#"revives"] = player.revives;
	player.downs = function_48b5c403(player, #"downs");
	player.pers[#"downs"] = player.downs;
	player.headshots = function_48b5c403(player, #"headshots");
	player.pers[#"headshots"] = player.headshots;
	player.var_3f62a666 = function_48b5c403(player, #"hash_7472529eae501802");
	player.pers[#"hash_7472529eae501802"] = player.var_3f62a666;
	player.pers[#"damagedone"] = function_48b5c403(player, #"damage");
	player.var_3b4f6b37 = function_48b5c403(player, #"hash_709ac244d8923f57");
	player.var_e2d764da = function_48b5c403(player, #"hash_28e11648279d2037");
	function_77e8e806(player);
	function_65229c47(player);
	function_3c54ba6f(player);
	function_fbf71e69(player);
	function_390e2146(player);
	function_102126f6(player);
	function_b0681676(player);
	function_a1f42996(player);
	player.var_1fa95cc = gettime();
}

/*
	Name: function_7695efd4
	Namespace: namespace_cf6efd05
	Checksum: 0x75C9C525
	Offset: 0x2C00
	Size: 0x108C
	Parameters: 3
	Flags: Linked
*/
function function_7695efd4(player, index, var_d17eb4df)
{
	var_6653c106 = [2:((((17 + 1) + 8) + 1) + 8) + 1, 1:((17 + 1) + 8) + 1, 0:17 + 1];
	weapon_name = hash(function_48b5c403(player, #"weapons", index, #"name"));
	if(weapon_name == #"")
	{
		return;
	}
	/#
		if(getdvar(#"hash_64ed0f72b786103", 0))
		{
			println(((("" + player getentitynumber()) + "") + "") + function_9e72a96(weapon_name));
		}
	#/
	attachments = [];
	for(j = 0; j < 8; j++)
	{
		attachment_name = hash(function_48b5c403(player, #"weapons", index, #"attachments", j));
		if(attachment_name == #"")
		{
			continue;
		}
		attachments[attachments.size] = attachment_name;
	}
	function_4cec0a67(player, index);
	var_a8bccf69 = function_48b5c403(player, #"weapons", index, #"hash_1e11eaa7ac26bbd0");
	/#
		if(getdvar(#"hash_64ed0f72b786103", 0))
		{
			println(((("" + player getentitynumber()) + "") + "") + var_a8bccf69);
		}
	#/
	aat = hash(function_48b5c403(player, #"weapons", index, #"aat"));
	/#
		if(getdvar(#"hash_64ed0f72b786103", 0))
		{
			println(((("" + player getentitynumber()) + "") + "") + function_9e72a96(aat));
		}
	#/
	rarity = hash(function_48b5c403(player, #"weapons", index, #"rarity"));
	var_b3546c09 = function_48b5c403(player, #"weapons", index, #"hash_455cfe820071b143");
	weaponoptions = function_48b5c403(player, #"weapons", index, #"weaponoptions");
	var_e91aba42 = function_48b5c403(player, #"weapons", index, #"hash_6ebd8dec863a7782");
	var_908f65ca = function_48b5c403(player, #"weapons", index, #"hash_17f911763bde5dfe");
	lastequipped = function_48b5c403(player, #"weapons", index, #"lastequipped");
	if(rarity === #"")
	{
		rarity = #"none";
	}
	weapon = getweapon(weapon_name);
	rootweapon = weapon.rootweapon;
	var_5067ed1f = zm_weapons::function_d4f870ec(rarity);
	if(var_a8bccf69 || var_5067ed1f !== #"white" || !var_b3546c09 && (isdefined(level.var_c1f1b29a[rootweapon.name]) && isdefined(level.var_c1f1b29a[rootweapon.name][var_5067ed1f]) || (isdefined(level.var_ec04a8a4[rootweapon.name]) && isdefined(level.var_ec04a8a4[rootweapon.name][var_5067ed1f]))))
	{
		if(isdefined(var_a8bccf69) && var_5067ed1f === #"white" && var_b3546c09)
		{
			if(zm_weapons::is_weapon_upgraded(rootweapon))
			{
				if(weapon.name == #"hash_7a910d220f3767fa")
				{
					var_8114384d = ("knife_loadout" + "_t9_upgraded") + "_item_sr";
				}
				else
				{
					var_8114384d = weapon.name + "_item_sr";
				}
			}
		}
		else
		{
			if(isdefined(var_a8bccf69) && var_a8bccf69 > 0 && zm_weapons::is_weapon_upgraded(weapon))
			{
				var_8114384d = level.var_c1f1b29a[rootweapon.name][var_5067ed1f];
			}
			else
			{
				var_8114384d = level.var_ec04a8a4[rootweapon.name][var_5067ed1f];
			}
		}
		weapon_to_give = (isdefined(var_8114384d) ? var_8114384d : weapon);
	}
	else
	{
		weapon_to_give = weapon;
	}
	if(!isdefined(weapon_to_give))
	{
		/#
			if(getdvar(#"hash_64ed0f72b786103", 0))
			{
				println((("" + player getentitynumber()) + "") + "");
			}
		#/
		return;
	}
	if(isweapon(weapon_to_give))
	{
		/#
			if(getdvar(#"hash_64ed0f72b786103", 0))
			{
				println(((("" + player getentitynumber()) + "") + "") + (function_7a600918(weapon_to_give.name) ? function_9e72a96(weapon_to_give.name) : weapon_to_give.name));
			}
		#/
		weapon = player zm_weapons::weapon_give(weapon_to_give, 1, 1, undefined, var_b3546c09, undefined, attachments, 0);
	}
	else
	{
		item = function_4ba8fde(weapon_to_give);
		/#
			if(getdvar(#"hash_64ed0f72b786103", 0))
			{
				println(((("" + player getentitynumber()) + "") + "") + (function_7a600918(weapon_to_give) ? function_9e72a96(weapon_to_give) : weapon_to_give));
			}
		#/
		weapon = player zm_weapons::function_943eabd9(item, 1, 0, var_b3546c09, attachments, weaponoptions, var_e91aba42, var_908f65ca);
	}
	if(var_d17eb4df < var_6653c106.size && namespace_ad5a0cd6::function_db35e94f(player.inventory.items[var_6653c106[var_d17eb4df]].var_bd027dd9) && player.inventory.items[var_6653c106[var_d17eb4df]].var_627c698b.rootweapon === weapon.rootweapon)
	{
		item = player.inventory.items[var_6653c106[var_d17eb4df]];
		/#
			if(getdvar(#"hash_64ed0f72b786103", 0))
			{
				println((((("" + player getentitynumber()) + "") + "") + (function_7a600918(item.var_a6762160.name) ? function_9e72a96(item.var_a6762160.name) : item.var_a6762160.name) + "") + var_6653c106[var_d17eb4df]);
			}
		#/
		var_d17eb4df++;
	}
	else
	{
		/#
			println(((((("" + player getentitynumber()) + "") + "") + var_6653c106[var_d17eb4df]) + "") + (function_7a600918(weapon.rootweapon.name) ? function_9e72a96(weapon.rootweapon.name) : weapon.rootweapon.name) + "");
		#/
		if(getdvar(#"hash_64ed0f72b786103", 0))
		{
		}
		foreach(slot in [2:((((17 + 1) + 8) + 1) + 8) + 1, 1:((17 + 1) + 8) + 1, 0:17 + 1])
		{
			/#
				if(getdvar(#"hash_64ed0f72b786103", 0))
				{
					println(slot + (player.inventory.items[slot].var_bd027dd9 === 32767 ? "" : player.inventory.items[slot].var_a6762160.name));
				}
			#/
		}
		if(isdefined(weapon) && is_true(lastequipped))
		{
			var_c0cc95d5 = weapon;
		}
		return {#hash_d17eb4df:var_d17eb4df, #hash_c0cc95d5:var_c0cc95d5};
	}
	if(!isdefined(item))
	{
		return;
	}
	item.var_b3546c09 = var_b3546c09;
	if(aat !== #"")
	{
		/#
			if(getdvar(#"hash_64ed0f72b786103", 0))
			{
				println((((("" + player getentitynumber()) + "") + "") + function_9e72a96(aat) + "") + (function_7a600918(item.var_627c698b.name) ? function_9e72a96(item.var_627c698b.name) : item.var_627c698b.name));
			}
		#/
		player zm_weapons::function_37e9e0cb(item, item.var_627c698b, aat);
	}
	if(var_a8bccf69 > 0)
	{
		/#
			if(getdvar(#"hash_64ed0f72b786103", 0))
			{
				println(((((("" + player getentitynumber()) + "") + "") + var_a8bccf69) + "") + (function_7a600918(item.var_627c698b.name) ? function_9e72a96(item.var_627c698b.name) : item.var_627c698b.name));
			}
		#/
		item.var_a8bccf69 = var_a8bccf69;
		player namespace_b376ff3f::function_d92c6b5b(item.var_627c698b, undefined, var_a8bccf69);
	}
	if(isdefined(item.var_627c698b) && is_true(lastequipped))
	{
		var_c0cc95d5 = item.var_627c698b;
	}
	return {#hash_d17eb4df:var_d17eb4df, #hash_c0cc95d5:var_c0cc95d5};
}

/*
	Name: function_77e8e806
	Namespace: namespace_cf6efd05
	Checksum: 0xAF88627A
	Offset: 0x3C98
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_77e8e806(player)
{
	player endon(#"death", #"disconnect");
	var_c0cc95d5 = undefined;
	var_d17eb4df = 0;
	var_b8e0b77b = -1;
	for(i = 0; i < 4; i++)
	{
		weapon_name = hash(function_48b5c403(player, #"weapons", i, #"name"));
		if(weapon_name === #"bowie_knife")
		{
			var_b8e0b77b = i;
			break;
		}
	}
	if(var_b8e0b77b != -1)
	{
		function_7695efd4(player, var_b8e0b77b, var_d17eb4df);
	}
	for(i = 0; i < 4; i++)
	{
		if(i === var_b8e0b77b)
		{
			continue;
		}
		result = function_7695efd4(player, i, var_d17eb4df);
		var_c0cc95d5 = (isdefined(result.var_c0cc95d5) ? result.var_c0cc95d5 : var_c0cc95d5);
		var_d17eb4df = (isdefined(result.var_d17eb4df) ? result.var_d17eb4df : var_d17eb4df);
	}
	if(!isdefined(var_c0cc95d5))
	{
		if((player.inventory.items[17 + 1].var_bd027dd9) !== 32767)
		{
			var_c0cc95d5 = player.inventory.items[17 + 1].var_627c698b;
		}
		else
		{
			var_c0cc95d5 = player getweaponslistprimaries()[0];
		}
	}
	if(isdefined(var_c0cc95d5))
	{
		player switchtoweaponimmediate(var_c0cc95d5);
	}
	player namespace_3e3637fc::function_ec7953fa();
}

/*
	Name: function_4cec0a67
	Namespace: namespace_cf6efd05
	Checksum: 0xF626E54
	Offset: 0x3F08
	Size: 0x19A
	Parameters: 2
	Flags: Linked
*/
function function_4cec0a67(player, weapon_index)
{
	var_36ae553 = function_48b5c403(player, #"weapons", weapon_index, #"hash_63f0851f53ab627c", #"bundlename");
	var_36ae553 = hash((isdefined(var_36ae553) ? var_36ae553 : ""));
	if(var_36ae553 !== #"")
	{
		statvalue = function_48b5c403(player, #"weapons", weapon_index, #"hash_63f0851f53ab627c", #"statvalue");
		if(!isdefined(player.var_7a8d78ac))
		{
			player.var_7a8d78ac = [];
		}
		player.var_7a8d78ac[player.var_7a8d78ac.size] = {#statvalue:statvalue, #bundlename:var_36ae553};
		if(!is_true(player.var_89f2bfbf))
		{
			player callback::function_d8abfc3d(#"hash_478f81e3bb0950dd", &function_897f280a);
			player.var_89f2bfbf = 1;
		}
	}
}

/*
	Name: function_897f280a
	Namespace: namespace_cf6efd05
	Checksum: 0xCDD56181
	Offset: 0x40B0
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_897f280a(params)
{
	weapon = activecamo::function_94c2605(params.weapon);
	var_f4eb4a50 = self activecamo::function_155299d(weapon);
	if(!isdefined(var_f4eb4a50) || !isdefined(self.var_7a8d78ac))
	{
		return;
	}
	var_5bf485dc = [];
	foreach(var_3786b72d in self.var_7a8d78ac)
	{
		if(var_3786b72d.bundlename === var_f4eb4a50.name)
		{
			if(isarray(var_f4eb4a50.stages) && var_f4eb4a50.stages.size)
			{
				statname = var_f4eb4a50.stages[0].statname;
			}
			if(isdefined(statname))
			{
				for(i = 0; i < var_3786b72d.statvalue; i++)
				{
					activecamo::function_896ac347(weapon, statname, 1);
				}
			}
			var_5bf485dc[var_5bf485dc.size] = var_3786b72d;
		}
	}
	foreach(var_a6815309 in var_5bf485dc)
	{
		arrayremovevalue(self.var_7a8d78ac, var_a6815309);
	}
	if(!self.var_7a8d78ac.size)
	{
		self.var_7a8d78ac = undefined;
		self callback::function_52ac9652(#"hash_478f81e3bb0950dd", &function_897f280a);
	}
}

/*
	Name: set_player_equipment
	Namespace: namespace_cf6efd05
	Checksum: 0xA4BE0F4E
	Offset: 0x4320
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function set_player_equipment(equipment_name, count)
{
	item = function_4ba8fde(equipment_name);
	slot = self namespace_b376ff3f::function_e66dcff5(item, 1);
	item.count = count;
	item_world::function_de2018e3(item, self, slot);
}

/*
	Name: function_65229c47
	Namespace: namespace_cf6efd05
	Checksum: 0x16C6CD35
	Offset: 0x43B0
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_65229c47(player)
{
	var_d4b3e9c8 = function_48b5c403(player, #"lethal", #"name");
	var_d4b3e9c8 = hash((isdefined(var_d4b3e9c8) ? var_d4b3e9c8 : ""));
	if(var_d4b3e9c8 !== #"")
	{
		count = function_48b5c403(player, #"lethal", #"amount");
		player namespace_1cc7b406::function_52df229a(var_d4b3e9c8, count, 1);
	}
	var_892fd196 = function_48b5c403(player, #"tactical", #"name");
	var_892fd196 = hash((isdefined(var_892fd196) ? var_892fd196 : ""));
	if(var_892fd196 !== #"")
	{
		count = function_48b5c403(player, #"tactical", #"amount");
		player namespace_1cc7b406::function_52df229a(var_892fd196, count, 1);
	}
}

/*
	Name: function_3c54ba6f
	Namespace: namespace_cf6efd05
	Checksum: 0x58FE2380
	Offset: 0x4570
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_3c54ba6f(player)
{
	kill_count = function_48b5c403(player, #"hash_fffea0defd338fe");
	player.var_8da24ed0 = (isdefined(kill_count) ? kill_count : 0);
	player namespace_1b527536::function_1067f94c(player.class_num);
	var_91811618 = function_48b5c403(player, #"fieldupgrade", #"name");
	var_91811618 = hash((isdefined(var_91811618) ? var_91811618 : ""));
	if(var_91811618 !== #"")
	{
		count = function_48b5c403(player, #"fieldupgrade", #"amount");
		player set_player_equipment(var_91811618, count);
	}
	progress = player.var_8da24ed0 / player.var_fc8023b4;
	player clientfield::set_player_uimodel("hud_items.ammoCooldowns.fieldUpgrade", progress);
}

/*
	Name: function_fbf71e69
	Namespace: namespace_cf6efd05
	Checksum: 0xCBCBEC40
	Offset: 0x4700
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_fbf71e69(player)
{
	for(i = 0; i < 10; i++)
	{
		perk_name = function_48b5c403(player, #"perks", i);
		perk_name = hash((isdefined(perk_name) ? perk_name : ""));
		if(perk_name !== #"")
		{
			player namespace_791d0451::function_3fecad82(perk_name, 0);
		}
	}
}

/*
	Name: function_390e2146
	Namespace: namespace_cf6efd05
	Checksum: 0x7E140727
	Offset: 0x47C8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_390e2146(player)
{
	killstreak_name = function_48b5c403(player, #"hash_13a6653f40472f80");
	killstreak_name = hash((isdefined(killstreak_name) ? killstreak_name : ""));
	if(killstreak_name !== #"")
	{
		player namespace_1cc7b406::function_52df229a(killstreak_name, 1, 1);
	}
}

/*
	Name: function_102126f6
	Namespace: namespace_cf6efd05
	Checksum: 0x87D2AFBE
	Offset: 0x4868
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_102126f6(player)
{
	var_4fa06a79 = function_48b5c403(player, #"hash_52119dffbbef02ab");
	var_4fa06a79 = hash((isdefined(var_4fa06a79) ? var_4fa06a79 : ""));
	if(var_4fa06a79 !== #"")
	{
		var_dd020072 = function_48b5c403(player, #"armor");
		player namespace_dd7e54e3::give_armor(var_4fa06a79);
		player.armor = var_dd020072;
	}
}

/*
	Name: function_b0681676
	Namespace: namespace_cf6efd05
	Checksum: 0x4C7A5A1A
	Offset: 0x4940
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_b0681676(player)
{
	player.var_595a11bc = 0;
	scrap = function_48b5c403(player, #"scrap");
	player sr_scrap::function_afab250a(scrap, 1);
	player.var_72d64cfd = 0;
	var_c7f20631 = function_48b5c403(player, #"hash_d6fdfc12ead24ba");
	player sr_scrap::function_a6d4221f(var_c7f20631, 1);
}

/*
	Name: function_a1f42996
	Namespace: namespace_cf6efd05
	Checksum: 0xC17D5108
	Offset: 0x49F8
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function function_a1f42996(player)
{
	player.var_6b3806e8 = function_48b5c403(player, #"hash_7cd550c023e602c2", #"hash_67fa39d03fd168d9");
	player.var_207f01b0 = function_48b5c403(player, #"hash_7cd550c023e602c2", #"hash_f0eccd443684741");
	player.n_tribute = function_48b5c403(player, #"hash_7cd550c023e602c2", #"tribute");
	player.var_9e09931e = function_48b5c403(player, #"hash_7cd550c023e602c2", #"hash_183357499f14d5b7");
	player.var_c8413949 = function_48b5c403(player, #"hash_7cd550c023e602c2", #"hash_115e695af69d2e5c");
}

/*
	Name: function_f120fbd8
	Namespace: namespace_cf6efd05
	Checksum: 0x2047C9E
	Offset: 0x4B28
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_f120fbd8()
{
	var_490ade6 = function_21d402f4(#"hash_2b3a351ebb247773", #"category");
	if(!isdefined(var_490ade6))
	{
		var_490ade6 = 0;
	}
	level.var_490ade6 = (var_490ade6 === 0 ? undefined : hash(var_490ade6));
	var_c73744cc = function_21d402f4(#"hash_2b3a351ebb247773", #"variant");
	if(!isdefined(var_c73744cc))
	{
		var_c73744cc = 0;
	}
	level.var_c73744cc = (var_c73744cc === 0 ? undefined : hash(var_c73744cc));
	var_df1d1235 = function_21d402f4(#"hash_4c6551b221159068");
	if(!isdefined(var_df1d1235))
	{
		var_df1d1235 = 0;
	}
	level.var_df1d1235 = var_df1d1235;
	var_d2bdec66 = function_21d402f4(#"hash_44f5d4b321e92263");
	if(!isdefined(var_d2bdec66))
	{
		var_d2bdec66 = 0;
	}
	level.var_d2bdec66 = var_d2bdec66;
}

/*
	Name: function_8864b117
	Namespace: namespace_cf6efd05
	Checksum: 0x8FC3746A
	Offset: 0x4CB8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_8864b117()
{
	var_dc858a58 = [];
	for(index = 0; index < 6; index++)
	{
		value = function_21d402f4(#"hash_60af8d9cfbbe06bd", index);
		if(value == "")
		{
			continue;
		}
		var_dc858a58[var_dc858a58.size] = value;
	}
	current_index = function_21d402f4(#"hash_2ab6464d4c124e87");
	return {#index:current_index, #list:var_dc858a58};
}

/*
	Name: function_b12c9424
	Namespace: namespace_cf6efd05
	Checksum: 0xAC2DB599
	Offset: 0x4D98
	Size: 0x1CC
	Parameters: 0
	Flags: Linked
*/
function function_b12c9424()
{
	var_407236bf = [];
	for(index = 0; index < 20; index++)
	{
		value = function_21d402f4(#"hash_5eba90da524edc31", index);
		if(value == 0)
		{
			continue;
		}
		value = hash(value);
		var_407236bf[var_407236bf.size] = value;
	}
	current_index = function_21d402f4(#"hash_1fe8bc20266a252b");
	var_f203d5e2 = [];
	foreach(objective_name in var_407236bf)
	{
		var_ac58e8e0 = function_d1f3aa5d(objective_name);
		if(isdefined(var_ac58e8e0) && var_ac58e8e0.list.size)
		{
			var_f203d5e2[objective_name] = var_ac58e8e0;
		}
	}
	return {#hash_f203d5e2:var_f203d5e2, #hash_407236bf:{#index:current_index, #list:var_407236bf}};
}

/*
	Name: function_d1f3aa5d
	Namespace: namespace_cf6efd05
	Checksum: 0x21E49A03
	Offset: 0x4F70
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_d1f3aa5d(objective_name)
{
	variants = [];
	for(index = 0; index < 8; index++)
	{
		value = function_21d402f4(#"hash_15d6e042e3e0ebfe", objective_name, #"variants", index);
		if(value == 0)
		{
			continue;
		}
		value = hash(value);
		variants[variants.size] = value;
	}
	current_index = function_21d402f4(#"hash_15d6e042e3e0ebfe", objective_name, #"variantindex");
	return {#index:current_index, #list:variants};
}

/*
	Name: function_ded56b14
	Namespace: namespace_cf6efd05
	Checksum: 0xD577007B
	Offset: 0x5088
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_ded56b14()
{
	/#
		if(getdvarint(#"hash_66a946ea0668bb21", 0))
		{
			println("");
		}
	#/
	function_15dc6bef();
}

