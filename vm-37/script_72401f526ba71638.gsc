#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_2467fe25132955b8;
#using script_27610ca25737f68d;
#using script_340a2e805e35f7a2;
#using script_3751b21462a54a7d;
#using script_3f9e0dc8454d98e1;
#using script_4108035fe400ce67;
#using script_421ca110b4204518;
#using script_44c2a1259e14bef1;
#using script_471b31bd963b388e;
#using script_47fb62300ac0bd60;
#using script_58860a35d0555f74;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_1b527536;

/*
	Name: function_89f2df9
	Namespace: namespace_1b527536
	Checksum: 0x32297716
	Offset: 0x1C8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_13a43d760497b54d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1b527536
	Checksum: 0x2495C16
	Offset: 0x210
	Size: 0x68C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_9bff3a72 = getgametypesetting(#"hash_7dedd27bf994a9a9");
	if(!is_true(level.var_9bff3a72))
	{
		return;
	}
	level.var_d98fc25e = [];
	function_134fcf4b(#"hash_85edf3a63bb488c", #"hash_2f148f3f9c3812a8", #"hash_2f14923f9c3817c1", #"hash_2f14913f9c38160e", #"hash_2f14943f9c381b27", #"frost_blast_5");
	function_134fcf4b(#"heal_aoe", #"hash_379869d5b6da974b", #"hash_37986ad5b6da98fe", #"hash_37986bd5b6da9ab1", #"hash_37986cd5b6da9c64", #"hash_37986dd5b6da9e17");
	function_134fcf4b(#"energy_mine", #"hash_4ac402a4add2a995", #"hash_4ac3ffa4add2a47c", #"hash_4ac400a4add2a62f", #"hash_4ac3fda4add2a116", #"hash_4ac3fea4add2a2c9");
	function_134fcf4b(#"aether_shroud", #"hash_164c43cbd0ee958", #"hash_164c73cbd0eee71", #"hash_164c63cbd0eecbe", #"hash_164c93cbd0ef1d7", #"hash_164c83cbd0ef024");
	function_134fcf4b(#"ring_of_fire", #"hash_631a223758cd92a", #"hash_631a123758cd777", #"hash_631a023758cd5c4", #"hash_6319f23758cd411", #"hash_6319e23758cd25e");
	function_134fcf4b(#"hash_55569355da0f0f68", #"hash_43e326396554e18c", #"hash_43e329396554e6a5", #"hash_43e328396554e4f2", #"hash_43e323396554dc73", #"hash_43e322396554dac0");
	level.var_dbd3b871 = [];
	level.var_bfc892f2 = [];
	level.var_fee98522 = [];
	level.var_5b46d961 = [];
	level.var_197c8eb1 = 0;
	level.var_1b527536 = array(#"hash_85edf3a63bb488c", #"hash_2f148f3f9c3812a8", #"hash_2f14923f9c3817c1", #"hash_2f14913f9c38160e", #"hash_2f14943f9c381b27", #"frost_blast_5", #"heal_aoe", #"hash_379869d5b6da974b", #"hash_37986ad5b6da98fe", #"hash_37986bd5b6da9ab1", #"hash_37986cd5b6da9c64", #"hash_37986dd5b6da9e17", #"energy_mine", #"hash_4ac402a4add2a995", #"hash_4ac3ffa4add2a47c", #"hash_4ac400a4add2a62f", #"hash_4ac3fda4add2a116", #"hash_4ac3fea4add2a2c9", #"aether_shroud", #"hash_164c43cbd0ee958", #"hash_164c73cbd0eee71", #"hash_164c63cbd0eecbe", #"hash_164c93cbd0ef1d7", #"hash_164c83cbd0ef024", #"ring_of_fire", #"hash_631a223758cd92a", #"hash_631a123758cd777", #"hash_631a023758cd5c4", #"hash_6319f23758cd411", #"hash_6319e23758cd25e", #"hash_55569355da0f0f68", #"hash_43e326396554e18c", #"hash_43e329396554e6a5", #"hash_43e328396554e4f2", #"hash_43e323396554dc73", #"hash_43e322396554dac0");
	clientfield::function_a8bbc967("hud_items.ammoCooldowns.fieldUpgrade", 1, 5, "float");
	clientfield::register("toplayer", "field_upgrade_selected", 1, 5, "int");
	clientfield::register("allplayers", "field_upgrade_fired", 1, 4, "counter");
	callback::on_spawned(&function_1505f5d4);
	callback::on_ai_killed(&function_f832427c);
	callback::on_bleedout(&function_9482f724);
	/#
		level.var_f793af68 = &function_f793af68;
	#/
}

/*
	Name: function_134fcf4b
	Namespace: namespace_1b527536
	Checksum: 0xA71861D9
	Offset: 0x8A8
	Size: 0xF8
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_134fcf4b(var_5eebbc40, ...)
{
	var_50846129 = [];
	if(!isdefined(var_50846129))
	{
		var_50846129 = [];
	}
	else if(!isarray(var_50846129))
	{
		var_50846129 = array(var_50846129);
	}
	var_50846129[var_50846129.size] = var_5eebbc40;
	for(i = 0; i < vararg.size; i++)
	{
		if(!isdefined(var_50846129))
		{
			var_50846129 = [];
		}
		else if(!isarray(var_50846129))
		{
			var_50846129 = array(var_50846129);
		}
		var_50846129[var_50846129.size] = vararg[i];
	}
	level.var_d98fc25e[var_5eebbc40] = var_50846129;
}

/*
	Name: function_dbd391bf
	Namespace: namespace_1b527536
	Checksum: 0x39791D1B
	Offset: 0x9A8
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_dbd391bf(weaponname, func)
{
	level.var_dbd3b871[weaponname] = func;
}

/*
	Name: function_36e0540e
	Namespace: namespace_1b527536
	Checksum: 0x7DD280FC
	Offset: 0x9D8
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_36e0540e(weaponname, maxammo, killcount, itemname)
{
	level.var_bfc892f2[weaponname] = maxammo;
	level.var_fee98522[weaponname] = killcount;
	level.var_5b46d961[weaponname] = itemname;
}

/*
	Name: function_460882e2
	Namespace: namespace_1b527536
	Checksum: 0xDFF85AE4
	Offset: 0xA38
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_460882e2(var_4e20aeca)
{
	if(!isdefined(var_4e20aeca))
	{
		var_4e20aeca = 0;
	}
	if(self.var_c9448182 > 1 && var_4e20aeca)
	{
		return;
	}
	self.var_8da24ed0 = 0;
	self clientfield::set_player_uimodel("hud_items.ammoCooldowns.fieldUpgrade", 0);
}

/*
	Name: function_94d18799
	Namespace: namespace_1b527536
	Checksum: 0x2A19589
	Offset: 0xAA8
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_94d18799(var_40e28ba)
{
	switch(var_40e28ba)
	{
		case "hash_36db069df9152c5d":
		{
			return #"hash_85edf3a63bb488c";
			break;
		}
		case "hash_32f9b8f90f9905cc":
		{
			return #"heal_aoe";
			break;
		}
		case "hash_4c75d01fe7fd8ebe":
		{
			return #"energy_mine";
			break;
		}
		case "hash_2bd7b571efbb68d":
		{
			return #"aether_shroud";
			break;
		}
		case "hash_5d9876c9f2034adf":
		{
			return #"ring_of_fire";
			break;
		}
		case "hash_1bb7d8d0caf94859":
		{
			return #"hash_55569355da0f0f68";
			break;
		}
	}
}

/*
	Name: function_e41a11bf
	Namespace: namespace_1b527536
	Checksum: 0x75E919E1
	Offset: 0xB98
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function function_e41a11bf(var_40e28ba, tier)
{
	base_name = function_94d18799(var_40e28ba);
	/#
		var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
		if(var_8c590502 > 0)
		{
			tier = var_8c590502;
		}
	#/
	var_50846129 = level.var_d98fc25e[base_name];
	if(!isdefined(var_50846129))
	{
		return #"weapon_null";
	}
	field_upgrade = var_50846129[tier];
	if(!isdefined(field_upgrade))
	{
		return #"weapon_null";
	}
	return field_upgrade;
}

/*
	Name: function_12b698fa
	Namespace: namespace_1b527536
	Checksum: 0xBF52E61C
	Offset: 0xCA0
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_12b698fa(statname)
{
	/#
		var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
		if(var_8c590502 > 0)
		{
			return var_8c590502;
		}
	#/
	return self stats::function_6d50f14b(#"cacloadouts", #"hash_1b24e5b336f5ae8d", statname);
}

/*
	Name: function_3ef3cec3
	Namespace: namespace_1b527536
	Checksum: 0xC7A8A8CF
	Offset: 0xD58
	Size: 0x250
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3ef3cec3(class_index)
{
	if(isdefined(class_index))
	{
		var_d07d57b2 = self function_b958b70d(class_index, "specialgrenade");
	}
	else
	{
		var_d07d57b2 = self function_b958b70d(self.class_num, "specialgrenade");
	}
	item_index = getitemindexfromref(var_d07d57b2);
	var_438da649 = function_b143666d(item_index, 1);
	var_40e28ba = var_438da649.var_cd070e56;
	if(!isdefined(var_40e28ba) || var_40e28ba == #"")
	{
		var_d07d57b2 = level.var_1b527536[0];
	}
	else if(isdefined(var_40e28ba) && var_40e28ba != #"")
	{
		tier = self function_12b698fa(var_40e28ba);
		var_d07d57b2 = function_e41a11bf(var_40e28ba, tier);
		if(var_d07d57b2 == #"" || var_d07d57b2 == #"weapon_null")
		{
			var_d07d57b2 = level.var_1b527536[0];
		}
	}
	self.var_c9448182 = level.var_bfc892f2[var_d07d57b2];
	self.var_fc8023b4 = level.var_fee98522[var_d07d57b2];
	self.var_87f72f8 = level.var_5b46d961[var_d07d57b2];
	for(i = 0; i < level.var_1b527536.size; i++)
	{
		if(level.var_1b527536[i] == var_d07d57b2)
		{
			self clientfield::set_to_player("field_upgrade_selected", i + 1);
			break;
		}
	}
}

/*
	Name: function_7fb7c83c
	Namespace: namespace_1b527536
	Checksum: 0xCC03DBB1
	Offset: 0xFB0
	Size: 0x62
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7fb7c83c(weaponname)
{
	if(!isdefined(weaponname))
	{
		return 0;
	}
	if(isweapon(weaponname))
	{
		weaponname = weaponname.name;
	}
	var_66ac8e3e = isinarray(level.var_1b527536, weaponname);
	return var_66ac8e3e;
}

/*
	Name: function_1067f94c
	Namespace: namespace_1b527536
	Checksum: 0x7AFB4ADF
	Offset: 0x1020
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_1067f94c(class_index)
{
	item = self.inventory.items[12];
	if(item.var_bd027dd9 != 32767)
	{
		var_d07d57b2 = self function_b958b70d(class_index, "specialgrenade");
		if(self.var_87f72f8 != level.var_5b46d961[var_d07d57b2])
		{
			self function_460882e2();
			namespace_b376ff3f::function_5852cb7b(item.var_bd027dd9);
		}
	}
	self function_3ef3cec3(class_index);
}

/*
	Name: function_9482f724
	Namespace: namespace_1b527536
	Checksum: 0xF8441C83
	Offset: 0x10F8
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_9482f724()
{
	item = self.inventory.items[12];
	if(item.var_bd027dd9 != 32767)
	{
		self.var_6e3cb3d1 = item.var_a6762160.name;
		self.var_a4be9abe = item.count;
	}
}

/*
	Name: function_1505f5d4
	Namespace: namespace_1b527536
	Checksum: 0x2A1BFE7E
	Offset: 0x1168
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1505f5d4()
{
	self flag::function_c58ecb49("zm_field_upgrade_in_use");
	self.var_8da24ed0 = 0;
	self function_3ef3cec3();
}

/*
	Name: function_4776caf4
	Namespace: namespace_1b527536
	Checksum: 0x77E79798
	Offset: 0x11B8
	Size: 0x152
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	if(!is_true(level.var_9bff3a72))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	if(is_true(self.var_28107825))
	{
		return;
	}
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	if(function_7fb7c83c(eventstruct.weapon.name) && isdefined(level.var_dbd3b871[eventstruct.weapon.name]))
	{
		self playrumbleonentity(#"hash_116369f6e589c9fd");
		self function_5f81a103(eventstruct.weapon);
		self function_9a67c8c7(eventstruct.weapon.name);
		self thread [[level.var_dbd3b871[eventstruct.weapon.name]]](eventstruct);
	}
}

/*
	Name: function_5f81a103
	Namespace: namespace_1b527536
	Checksum: 0x730F58F1
	Offset: 0x1318
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function function_5f81a103(weapon, b_killed)
{
	if(!isdefined(b_killed))
	{
		b_killed = 0;
	}
	if(isplayer(self))
	{
		var_49058ab = {#killed_enemy:b_killed, #field_upgrade:weapon.name, #hash_d8fb195f:zm_utility::get_round_number(), #hash_8335e8a8:zm_utility::function_e3025ca5(), #hash_4b738e64:function_f8d53445()};
		self function_678f57c8(#"hash_7f3eae86c535c88", var_49058ab);
	}
}

/*
	Name: function_9a67c8c7
	Namespace: namespace_1b527536
	Checksum: 0x8792ACDB
	Offset: 0x1418
	Size: 0x2DC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9a67c8c7(str_name)
{
	switch(str_name)
	{
		case "hash_85edf3a63bb488c":
		case "hash_2f148f3f9c3812a8":
		case "hash_2f14913f9c38160e":
		case "hash_2f14923f9c3817c1":
		case "frost_blast_5":
		case "hash_2f14943f9c381b27":
		{
			var_45d28da0 = 1;
			break;
		}
		case "hash_379869d5b6da974b":
		case "hash_37986ad5b6da98fe":
		case "hash_37986bd5b6da9ab1":
		case "hash_37986cd5b6da9c64":
		case "hash_37986dd5b6da9e17":
		case "heal_aoe":
		{
			var_45d28da0 = 2;
			break;
		}
		case "energy_mine":
		case "hash_4ac3fda4add2a116":
		case "hash_4ac3fea4add2a2c9":
		case "hash_4ac3ffa4add2a47c":
		case "hash_4ac400a4add2a62f":
		case "hash_4ac402a4add2a995":
		{
			var_45d28da0 = 3;
			break;
		}
		case "hash_6319e23758cd25e":
		case "hash_6319f23758cd411":
		case "hash_631a023758cd5c4":
		case "hash_631a123758cd777":
		case "hash_631a223758cd92a":
		case "ring_of_fire":
		{
			var_45d28da0 = 4;
			break;
		}
		case "hash_164c43cbd0ee958":
		case "hash_164c63cbd0eecbe":
		case "hash_164c73cbd0eee71":
		case "hash_164c83cbd0ef024":
		case "hash_164c93cbd0ef1d7":
		case "aether_shroud":
		{
			var_45d28da0 = 5;
			break;
		}
		case "hash_43e322396554dac0":
		case "hash_43e323396554dc73":
		case "hash_43e326396554e18c":
		case "hash_43e328396554e4f2":
		case "hash_43e329396554e6a5":
		case "hash_55569355da0f0f68":
		{
			var_45d28da0 = 6;
			break;
		}
	}
	if(isdefined(var_45d28da0))
	{
		self clientfield::increment("field_upgrade_fired", var_45d28da0);
	}
}

/*
	Name: function_f832427c
	Namespace: namespace_1b527536
	Checksum: 0x4156176
	Offset: 0x1700
	Size: 0x2B0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f832427c(s_params)
{
	if(isdefined(self.var_c2dcab66))
	{
		foreach(var_b189bbe6 in self.var_c2dcab66)
		{
			e_player = var_b189bbe6.player;
			weapon = var_b189bbe6.weapon;
			if(isplayer(e_player) && function_7fb7c83c(weapon.name))
			{
				e_player function_5f81a103(weapon, 1);
			}
			if(e_player flag::get("zm_field_upgrade_in_use"))
			{
				return;
			}
			if(!isplayer(e_player) || (isdefined(weapon.name) && function_7fb7c83c(weapon.name)))
			{
				return;
			}
			if(is_true(self.var_28107825))
			{
				return;
			}
			if(isdefined(e_player.var_d93ab65) && e_player.var_d93ab65.size > 0)
			{
				return;
			}
			if(is_true(e_player zombie_utility::function_73061b82(#"zombie_insta_kill")) || is_true(zombie_utility::function_6403cf83(#"zombie_insta_kill", e_player.team)))
			{
				return;
			}
			e_player.var_8da24ed0 = e_player.var_8da24ed0 + 1;
			e_player function_fe8d21ed();
			if(isplayer(e_player))
			{
				progress = e_player.var_8da24ed0 / e_player.var_fc8023b4;
				e_player clientfield::set_player_uimodel("hud_items.ammoCooldowns.fieldUpgrade", progress);
			}
		}
	}
}

/*
	Name: function_fe8d21ed
	Namespace: namespace_1b527536
	Checksum: 0x17D8D437
	Offset: 0x19B8
	Size: 0x234
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fe8d21ed()
{
	if(isalive(self) && (isdefined(self.inventory) && (isdefined(self.var_8da24ed0) && isdefined(self.var_fc8023b4))))
	{
		var_7df0eb27 = self.var_fc8023b4;
		if(self namespace_791d0451::function_56cedda7(#"hash_520b5cb0216b75d7") || self namespace_791d0451::function_56cedda7(#"hash_520b5bb0216b7424") || self namespace_791d0451::function_56cedda7(#"hash_520b5ab0216b7271") || self namespace_791d0451::function_56cedda7(#"hash_520b59b0216b70be"))
		{
			var_7df0eb27 = var_7df0eb27 - (int(var_7df0eb27 * 0.2));
		}
		var_874a73c4 = (isdefined(self.inventory.items[12].count) ? self.inventory.items[12].count : 0);
		if(self.var_8da24ed0 >= var_7df0eb27 && var_874a73c4 < self.var_c9448182)
		{
			self function_6457e4cd(self.var_87f72f8);
			level.var_197c8eb1 = 1;
			if(isplayer(self))
			{
				var_874a73c4 = (isdefined(self.inventory.items[12].count) ? self.inventory.items[12].count : 0);
				if(var_874a73c4 < self.var_c9448182)
				{
					function_460882e2();
				}
			}
		}
	}
}

/*
	Name: function_4f8cb6fd
	Namespace: namespace_1b527536
	Checksum: 0xA4EAD4DB
	Offset: 0x1BF8
	Size: 0x3E4
	Parameters: 1
	Flags: Linked
*/
function function_4f8cb6fd(item_name)
{
	switch(item_name)
	{
		case "field_upgrade_aether_shroud_2_item_sr":
		case "field_upgrade_aether_shroud_item_sr":
		case "field_upgrade_aether_shroud_3_item_sr":
		case "field_upgrade_aether_shroud_1_item_sr":
		case "field_upgrade_aether_shroud_4_item_sr":
		case "field_upgrade_aether_shroud_5_item_sr":
		{
			if(!is_true(getgametypesetting(#"hash_26dc68686741b223")))
			{
				return true;
			}
			break;
		}
		case "hash_681471b56324b3e":
		case "hash_12f4d7321d9c5005":
		case "hash_1f9a001790297282":
		case "hash_47954c9090e3f900":
		case "hash_649e3a841620150f":
		case "hash_7ea42360bdf2de16":
		{
			if(!is_true(getgametypesetting(#"hash_af8083f7ea1c28b")))
			{
				return true;
			}
			break;
		}
		case "hash_1fc30bedac3b39a5":
		case "hash_35d8042aa3ab475e":
		case "hash_37b9ba3f40fc1ba5":
		case "hash_4554f3c03465642f":
		case "hash_4feb54f5041d1609":
		case "hash_76ed099fde5ea820":
		{
			if(!is_true(getgametypesetting(#"hash_77e5bcb82c95cf00")))
			{
				return true;
			}
			break;
		}
		case "field_upgrade_energy_mine_5_item_sr":
		case "field_upgrade_energy_mine_1_item_sr":
		case "field_upgrade_energy_mine_item_sr":
		case "field_upgrade_energy_mine_3_item_sr":
		case "field_upgrade_energy_mine_2_item_sr":
		case "field_upgrade_energy_mine_4_item_sr":
		{
			if(!is_true(getgametypesetting(#"hash_4230e2ce569b5e48")))
			{
				return true;
			}
			break;
		}
		case "field_upgrade_ring_of_fire_5_item_sr":
		case "field_upgrade_ring_of_fire_1_item_sr":
		case "field_upgrade_ring_of_fire_item_sr":
		case "field_upgrade_ring_of_fire_3_item_sr":
		case "field_upgrade_ring_of_fire_2_item_sr":
		case "field_upgrade_ring_of_fire_4_item_sr":
		{
			if(!is_true(getgametypesetting(#"hash_2015355bc530a7e8")))
			{
				return true;
			}
			break;
		}
		case "hash_32d3740bf1d93fe":
		case "hash_276a89fd0875409a":
		case "hash_45a15df330b74adc":
		case "hash_56f5e5578534069b":
		case "hash_5addc54d5927cc29":
		case "hash_7fecb687adf7f042":
		{
			if(!is_true(getgametypesetting(#"hash_6e7905f68c5d7bdd")))
			{
				return true;
			}
			break;
		}
	}
	return false;
}

/*
	Name: function_6457e4cd
	Namespace: namespace_1b527536
	Checksum: 0xC362E703
	Offset: 0x1FE8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_6457e4cd(item_name)
{
	if(!isdefined(item_name) || item_name == #"")
	{
		return;
	}
	if(function_4f8cb6fd(item_name))
	{
		return;
	}
	self playlocalsound(#"hash_55f9d99ffab775e1");
	item = function_4ba8fde(item_name);
	var_fa3df96 = self namespace_b376ff3f::function_e66dcff5(item);
	if(isdefined(var_fa3df96))
	{
		if(!namespace_ad5a0cd6::function_db35e94f(item.var_bd027dd9))
		{
			item.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_fa3df96);
		}
		self item_world::function_de2018e3(item, self, var_fa3df96, 0);
	}
}

/*
	Name: actor_damage_override
	Namespace: namespace_1b527536
	Checksum: 0xD8533846
	Offset: 0x2110
	Size: 0x19E
	Parameters: 13
	Flags: Linked
*/
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isplayer(psoffsettime) && isarray(psoffsettime.var_d93ab65) && psoffsettime.var_d93ab65.size && !function_7fb7c83c(surfacetype.name))
	{
		var_8214ea7f = 0;
		foreach(var_3889eb68 in psoffsettime.var_d93ab65)
		{
			if(isdefined(var_3889eb68.var_c91dca7e) && var_3889eb68.var_c91dca7e > var_8214ea7f)
			{
				var_8214ea7f = var_3889eb68.var_c91dca7e;
			}
		}
		boneindex = boneindex + (boneindex * var_8214ea7f);
	}
	return boneindex;
}

/*
	Name: function_f793af68
	Namespace: namespace_1b527536
	Checksum: 0xBE5A2B63
	Offset: 0x22B8
	Size: 0x954
	Parameters: 0
	Flags: None
*/
function function_f793af68()
{
	/#
		level endon(#"game_ended");
		setdvar(#"hash_6ace867d48136ede", "");
		setdvar(#"hash_31bd3f1a2ffb2b7", "");
		adddebugcommand("");
		adddebugcommand(("" + function_9e72a96(#"hash_7ea42360bdf2de16")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f9a001790297282")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_649e3a841620150f")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_47954c9090e3f900")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_12f4d7321d9c5005")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_681471b56324b3e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_37b9ba3f40fc1ba5")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_4feb54f5041d1609")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_76ed099fde5ea820")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_4554f3c03465642f")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_35d8042aa3ab475e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1fc30bedac3b39a5")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96("")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_276a89fd0875409a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_32d3740bf1d93fe")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_56f5e5578534069b")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_45a15df330b74adc")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_5addc54d5927cc29")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_7fecb687adf7f042")) + "");
		function_cd140ee9(#"hash_6ace867d48136ede", &function_35216077);
		function_cd140ee9(#"hash_31bd3f1a2ffb2b7", &function_35216077);
	#/
}

/*
	Name: function_35216077
	Namespace: namespace_1b527536
	Checksum: 0xDDB5ADBE
	Offset: 0x2C18
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function function_35216077(params)
{
	/#
		if(params.value === "")
		{
			return;
		}
		switch(params.name)
		{
			case "hash_6ace867d48136ede":
			{
				foreach(player in getplayers())
				{
					player function_6457e4cd(hash(params.value));
				}
				break;
			}
			case "hash_31bd3f1a2ffb2b7":
			{
				foreach(player in getplayers())
				{
					if(isalive(player) && (isdefined(player.inventory) && (isdefined(player.var_8da24ed0) && isdefined(player.var_fc8023b4))))
					{
						player.var_8da24ed0 = player.var_fc8023b4;
						player function_fe8d21ed();
					}
				}
				break;
			}
		}
		setdvar(#"hash_6ace867d48136ede", "");
		setdvar(#"hash_31bd3f1a2ffb2b7", "");
	#/
}

