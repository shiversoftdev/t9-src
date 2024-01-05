#using scripts\zm_common\zm_equipment.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using script_24c32478acf44108;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_a5ef5769;

/*
	Name: function_af1e31d7
	Namespace: namespace_a5ef5769
	Checksum: 0xFB8A5A52
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_af1e31d7()
{
	level notify(-38913368);
}

/*
	Name: __init__system__
	Namespace: namespace_a5ef5769
	Checksum: 0xC78DD7F8
	Offset: 0x1D0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_52556758a0c8acfe", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a5ef5769
	Checksum: 0xA7E18BC8
	Offset: 0x228
	Size: 0xBCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_db785e13 = getweapon(#"hash_5bd48d860ebd5a41");
	level.var_a467bdbc = getweapon(#"hash_ac86d29509a8939");
	level.var_76fe888f = getweapon(#"hash_426d7c850c7f1d2");
	level.var_3415bf61 = getweapon(#"hash_493fc891e20b4f8a");
	if(!isdefined(level.var_3afb1303))
	{
		level.var_3afb1303 = [];
	}
	else if(!isarray(level.var_3afb1303))
	{
		level.var_3afb1303 = array(level.var_3afb1303);
	}
	weaponobjects::function_e6400478(#"hash_5bd48d860ebd5a41", &function_5acf1bb9, 1);
	weaponobjects::function_e6400478(#"hash_426d7c850c7f1d2", &function_5acf1bb9, 1);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_ac86d29509a8939", &function_81027f3e, &function_81027f3e);
	callback::add_weapon_fired(level.var_db785e13, &function_a70ad564);
	callback::add_weapon_fired(level.var_a467bdbc, &function_43a02dae);
	callback::add_weapon_fired(level.var_76fe888f, &function_a70ad564);
	callback::add_weapon_fired(level.var_3415bf61, &function_43a02dae);
	clientfield::register("scriptmover", "" + #"hash_47e7d5219a26a786", 16000, 3, "int");
	clientfield::register("actor", "" + #"hash_3a47820a21ce3170", 16000, 2, "int");
	clientfield::register("allplayers", "" + #"hash_7508e13e17dd1e3c", 16000, 4, "int");
	namespace_9ff9f642::register_slowdown(#"hash_5c37161904f4bcc9", 0.8, 3);
	namespace_9ff9f642::register_slowdown(#"hash_21cb91304fde349a", 0.5, 5);
	callback::on_weapon_change(&function_54e9969b);
	callback::on_ai_killed(&function_65ba5ec2);
	zm_weapons::function_90953640(level.var_a467bdbc, 5, float(function_60d95f53()) / 1000);
	level.var_c09dd754 = 0;
	if(zm_utility::is_survival())
	{
		level.var_1a4cc228[#"hash_7cba8a05511ceedf"] = [7:#"hash_1340313347e93335", 6:#"hash_11e4908180a964c", 5:#"hash_6799427e5e6c417c", 4:#"hash_4d95f42b33499eba", 3:#"hash_1c8805fec5806efe", 2:#"hash_26f6708ef92a0eae", 1:#"hash_1798ecca7f98873d", 0:#"hash_49adea61f71924bf"];
		level.var_1a4cc228[#"hash_29771ab26cb78d9b"] = [7:#"hash_779daa809936d578", 6:#"hash_34d9e63476111b5d", 5:#"hash_1c437f787033a2e5", 4:#"hash_5e074c09a3a31d97", 3:#"hash_11d7f39f088f3822", 2:#"hash_7d223eb036f4a31b", 1:#"hash_299e8cfa6d75ffd4", 0:#"hash_69143c727337ba1a"];
		level.var_1a4cc228[#"hash_46c917a1b5ed91e7"] = [0:#"hash_4729aed4cfa43476"];
		level.var_1a4cc228[#"hash_338eb4103e0ed797"] = [0:#"hash_59e40ffcdcfbffa6"];
		level.var_1a4cc228[#"hash_124b582ce08d78c0"] = [7:#"hash_4ece13caf46c00c7", 6:#"hash_53dbc62471a61f88", 5:#"hash_33c0e923173d2b48", 4:#"hash_75cfd69ce1d6f3dd", 3:#"hash_6b9e4c8e8e955c71", 2:#"hash_94674cb554826a9", 1:#"hash_63e9d6f275dc720", 0:#"hash_149fa86a9c5d858c"];
		level.var_1a4cc228[#"hash_30e4941b102093c4"] = [7:#"hash_53dbc62471a61f88", 6:#"hash_b35b3dcb7417075", 5:#"hash_3e647996c0a4d6b9", 4:#"hash_31713e12a88def10", 3:#"hash_5616978b668f07dc", 2:#"hash_23492308d6911444", 1:#"hash_e8b647bb58521c1", 0:#"hash_5c0dcc3f9d9e1ea5"];
		level.var_1a4cc228[#"hash_78215fa79f5557dc"] = [0:#"hash_4814b7b3c67568e3"];
		level.var_1a4cc228[#"hash_12a17ab3df5889eb"] = level.var_1a4cc228[#"hash_78215fa79f5557dc"];
		level.var_1a4cc228[#"hash_7a8b592728eec95d"] = [0:#"hash_2cb37314243526ec"];
		level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_bomb"] = [0:#"hash_614e3d7d0b75a944"];
		level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_blast"] = [0:#"hash_53c08317d48a0e49"];
		level.var_1a4cc228[#"hash_6904f5c7bef64405"] = [0:#"hash_5eafd160d077670d"];
		level.var_1a4cc228[#"hash_7f957e36b4f6160f"] = [0:#"hash_61df3be05096e9e2"];
	}
	else if(util::get_map_name() == "zm_gold")
	{
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_gold"] = [7:#"hash_63d74789d0b11dbc", 6:#"hash_15e17500f1c8d0e9", 5:#"hash_1b6585308f85be40", 4:#"hash_e3b20622eb68c2b", 3:#"hash_735b3e8785d43fdb", 2:#"hash_3b5927d61466dc58", 1:#"hash_36991df55c87dbcb", 0:#"hash_a80d8840eaa4e7e"];
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_gold_armor_heavy"] = [0:#"hash_4729aed4cfa43476"];
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_gold_armor_medium"] = [0:#"hash_59e40ffcdcfbffa6"];
		level.var_1a4cc228[#"hash_5765ccddce11dc6c"] = [7:#"hash_2d07ee0d2dca46d9", 6:#"hash_5c0dcc3f9d9e1ea5", 5:#"hash_35d84238103deb46", 4:#"hash_7151a0027b3ff314", 3:#"hash_7b3bac29e8e3bf13", 2:#"hash_1c8805fec5806efe", 1:#"hash_78a973a6fb604cf", 0:#"hash_1c89bc2d12106779"];
		level.var_1a4cc228[#"hash_78215fa79f5557dc"] = [0:#"hash_2cb37314243526ec"];
		level.var_1a4cc228[#"hash_7a8b592728eec95d"] = level.var_1a4cc228[#"hash_78215fa79f5557dc"];
	}
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_a5ef5769
	Checksum: 0xAD23535C
	Offset: 0xE00
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	zm_weapons::function_8389c033(#"hash_5bd48d860ebd5a41", #"hash_5bd48d860ebd5a41");
	zm_weapons::function_8389c033(#"hash_5bd48d860ebd5a41", #"ray_gun");
	zm_weapons::function_8389c033(#"ray_gun", #"hash_5bd48d860ebd5a41");
}

/*
	Name: function_b4174270
	Namespace: namespace_a5ef5769
	Checksum: 0xFDDE6672
	Offset: 0xEA0
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_b4174270(eventstruct)
{
	self function_48d53ca0();
}

/*
	Name: function_48d53ca0
	Namespace: namespace_a5ef5769
	Checksum: 0x58A7819E
	Offset: 0xED0
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_48d53ca0()
{
	current_weapon = self getcurrentweapon();
	if(!function_2715ee2d(current_weapon))
	{
		return;
	}
	var_f0d6790a = function_4f6da2be(current_weapon);
	if(function_4f6da2be(current_weapon))
	{
		if(self getweaponammoclip(current_weapon) >= 10)
		{
			self function_d4759f13(1, function_4ba529a7(current_weapon), 1);
		}
	}
	else
	{
		self function_d4759f13(1, function_4ba529a7(current_weapon), 0);
	}
}

/*
	Name: function_a70ad564
	Namespace: namespace_a5ef5769
	Checksum: 0x3A8BB371
	Offset: 0xFD8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_a70ad564(weapon)
{
	if(self getweaponammoclip(weapon) < 1)
	{
		self function_d4759f13(0, function_4ba529a7(weapon), 0);
	}
}

/*
	Name: function_43a02dae
	Namespace: namespace_a5ef5769
	Checksum: 0xB0C8AE4C
	Offset: 0x1038
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_43a02dae(weapon)
{
	if(self getweaponammoclip(weapon) < 10)
	{
		self function_d4759f13(0, function_4ba529a7(weapon), 1);
	}
}

/*
	Name: function_4ba529a7
	Namespace: namespace_a5ef5769
	Checksum: 0xD8C4D121
	Offset: 0x1098
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_4ba529a7(weapon)
{
	if(isdefined(weapon))
	{
		var_1236db9d = zm_weapons::function_386dacbc(weapon).name;
		switch(var_1236db9d)
		{
			case "hash_426d7c850c7f1d2":
			case "hash_493fc891e20b4f8a":
			{
				return true;
			}
			default:
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_d4759f13
	Namespace: namespace_a5ef5769
	Checksum: 0x918D2C1E
	Offset: 0x1130
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_d4759f13(var_bb674ab4, var_a444fb, var_93eafdc0)
{
	if(!isdefined(var_a444fb))
	{
		var_a444fb = 0;
	}
	if(!isdefined(var_93eafdc0))
	{
		var_93eafdc0 = 0;
	}
	if(var_a444fb)
	{
		var_bb674ab4 = var_bb674ab4 + 4;
	}
	if(var_93eafdc0)
	{
		var_bb674ab4 = var_bb674ab4 + 8;
	}
	self clientfield::set("" + #"hash_7508e13e17dd1e3c", var_bb674ab4);
}

/*
	Name: function_2715ee2d
	Namespace: namespace_a5ef5769
	Checksum: 0xCF148E44
	Offset: 0x11C8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_2715ee2d(weapon)
{
	return function_cbd0f11(weapon) || function_4f6da2be(weapon);
}

/*
	Name: function_cbd0f11
	Namespace: namespace_a5ef5769
	Checksum: 0xA491B92C
	Offset: 0x1210
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_cbd0f11(weapon)
{
	if(isdefined(weapon))
	{
		var_1236db9d = zm_weapons::function_386dacbc(weapon).name;
		switch(var_1236db9d)
		{
			case "hash_426d7c850c7f1d2":
			case "hash_5bd48d860ebd5a41":
			{
				return true;
			}
			default:
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_4f6da2be
	Namespace: namespace_a5ef5769
	Checksum: 0xF4A98B53
	Offset: 0x12A8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_4f6da2be(weapon)
{
	if(isdefined(weapon))
	{
		var_1236db9d = zm_weapons::function_386dacbc(weapon).name;
		switch(var_1236db9d)
		{
			case "hash_ac86d29509a8939":
			case "hash_493fc891e20b4f8a":
			{
				return true;
			}
			default:
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_42807ff9
	Namespace: namespace_a5ef5769
	Checksum: 0x148FE29D
	Offset: 0x1340
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_42807ff9()
{
	self endon(#"death", #"hash_5240d2339d9ab0cd");
	var_17b7891d = "61f9ab4d148b8e63" + "ray_rifle_reload";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		result = undefined;
		result = self waittill(#"reload_start");
		self function_d4759f13(0);
	}
}

/*
	Name: function_46649524
	Namespace: namespace_a5ef5769
	Checksum: 0xDF83DB12
	Offset: 0x13E8
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_46649524()
{
	self endon(#"death", #"hash_9f58c5008141d94");
	var_17b7891d = "4a8e5203445dc8be" + "ray_rifle_melee";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		if(!self ismeleeing())
		{
			waitframe(1);
			continue;
		}
		while(self ismeleeing())
		{
			waitframe(1);
		}
		self function_48d53ca0();
	}
}

/*
	Name: function_54e9969b
	Namespace: namespace_a5ef5769
	Checksum: 0x747B030B
	Offset: 0x14A8
	Size: 0x254
	Parameters: 1
	Flags: Linked
*/
function function_54e9969b(params)
{
	var_caf81a76 = function_2715ee2d(params.weapon);
	var_b3d1c0bd = function_2715ee2d(params.last_weapon);
	if(var_caf81a76)
	{
		if(!var_b3d1c0bd)
		{
			self setactionslot(1, "altmode");
			self thread function_42807ff9();
			self thread function_46649524();
			if(!is_true(self.var_a3eedf85))
			{
				self thread zm_equipment::show_hint_text(#"hash_1e6f4f9ae3fb106f");
				self.var_a3eedf85 = 1;
			}
		}
		var_5706eda6 = function_4f6da2be(params.weapon);
		var_2ccb1704 = (var_5706eda6 ? 10 : 1);
		if(self getweaponammoclip(params.weapon) >= var_2ccb1704)
		{
			self function_d4759f13(1, function_4ba529a7(params.weapon), var_5706eda6);
		}
		else
		{
			self function_d4759f13(0);
		}
	}
	else if(!function_2715ee2d(params.weapon) && function_2715ee2d(params.last_weapon))
	{
		self setactionslot(1, "");
		self notify(#"hash_5240d2339d9ab0cd");
		self notify(#"hash_9f58c5008141d94");
		self function_d4759f13(2);
	}
}

/*
	Name: function_81027f3e
	Namespace: namespace_a5ef5769
	Checksum: 0xC9E7C49C
	Offset: 0x1708
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function function_81027f3e(damage_percent)
{
	return false;
}

/*
	Name: function_5acf1bb9
	Namespace: namespace_a5ef5769
	Checksum: 0xCE892F4A
	Offset: 0x1720
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_5acf1bb9(watcher)
{
	watcher.onspawn = &function_121b803f;
}

/*
	Name: function_121b803f
	Namespace: namespace_a5ef5769
	Checksum: 0x5F2F2BEB
	Offset: 0x1750
	Size: 0x154
	Parameters: 2
	Flags: Linked
*/
function function_121b803f(watcher, player)
{
	if(isdefined(player))
	{
		var_deaac196 = player getcurrentweapon();
		if(function_cbd0f11(var_deaac196))
		{
			if(!isdefined(self.var_6ccc858c))
			{
				self.var_6ccc858c = [];
			}
			else if(!isarray(self.var_6ccc858c))
			{
				self.var_6ccc858c = array(self.var_6ccc858c);
			}
			self function_98175f42(watcher, player);
			if(self.var_6ccc858c.size > 0)
			{
				self thread function_bb80aad0();
			}
		}
		else if(function_4f6da2be(var_deaac196))
		{
			var_23130969 = player function_4a074587(var_deaac196);
			self thread function_8376de9c(player, var_23130969);
			self thread watch_for_death(player, var_23130969);
		}
	}
}

/*
	Name: function_98175f42
	Namespace: namespace_a5ef5769
	Checksum: 0x45AF9D22
	Offset: 0x18B0
	Size: 0x2C8
	Parameters: 2
	Flags: Linked
*/
function function_98175f42(watcher, player)
{
	foreach(vortex in level.var_3afb1303)
	{
		if(!isdefined(vortex))
		{
			continue;
		}
		var_b2c0e3d5 = vortex.origin - self.origin;
		var_b9fb2cb5 = vectorprojection(var_b2c0e3d5, self.var_59ba00f5);
		var_8a98d89 = self.origin + var_b9fb2cb5;
		z_diff = abs(var_8a98d89[2] - vortex.var_13015f04[2]);
		if(z_diff > 28)
		{
			continue;
		}
		var_37f36aee = distance2dsquared(var_8a98d89, vortex.var_13015f04);
		if(var_37f36aee <= 225)
		{
			var_7dcfceb3 = spawnstruct();
			var_7dcfceb3.var_7ef7dc23 = vortex;
			if(self.var_59ba00f5[0] != 0)
			{
				hit_time = var_b9fb2cb5[0] / self.var_59ba00f5[0];
			}
			else
			{
				if(self.var_59ba00f5[1] != 0)
				{
					hit_time = var_b9fb2cb5[1] / self.var_59ba00f5[1];
				}
				else
				{
					hit_time = var_b9fb2cb5[2] / self.var_59ba00f5[2];
				}
			}
			var_7dcfceb3.var_a31e9c2 = int(hit_time / (float(function_60d95f53()) / 1000));
			if(!isdefined(self.var_6ccc858c))
			{
				self.var_6ccc858c = [];
			}
			else if(!isarray(self.var_6ccc858c))
			{
				self.var_6ccc858c = array(self.var_6ccc858c);
			}
			self.var_6ccc858c[self.var_6ccc858c.size] = var_7dcfceb3;
		}
	}
}

/*
	Name: function_bb80aad0
	Namespace: namespace_a5ef5769
	Checksum: 0x697518DF
	Offset: 0x1B80
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_bb80aad0()
{
	self endon(#"death");
	var_5c022333 = 0;
	var_a8024c64 = 0;
	while(true)
	{
		foreach(var_7dcfceb3 in self.var_6ccc858c)
		{
			if(var_7dcfceb3.var_a31e9c2 == var_5c022333)
			{
				if(isdefined(var_7dcfceb3.var_7ef7dc23))
				{
					var_7dcfceb3.var_7ef7dc23 notify(#"ray_hit");
				}
				var_a8024c64++;
				if(var_a8024c64 >= self.var_6ccc858c.size)
				{
					break;
				}
			}
		}
		waitframe(1);
		var_5c022333++;
	}
}

/*
	Name: watch_for_death
	Namespace: namespace_a5ef5769
	Checksum: 0xFA3B731C
	Offset: 0x1C98
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function watch_for_death(owner, var_23130969)
{
	self waittilltimeout(3, #"death");
	if(isdefined(self))
	{
		self function_1c204e87(owner, var_23130969);
	}
}

/*
	Name: function_8376de9c
	Namespace: namespace_a5ef5769
	Checksum: 0x68988599
	Offset: 0x1CF8
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_8376de9c(owner, var_23130969)
{
	self endon(#"death");
	self util::waittillnotmoving();
	self function_1c204e87(owner, var_23130969);
}

/*
	Name: function_1c204e87
	Namespace: namespace_a5ef5769
	Checksum: 0x3909C06
	Offset: 0x1D58
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_1c204e87(owner, var_23130969)
{
	if(!is_true(self.var_274896bb))
	{
		self.var_274896bb = 1;
		self detonate(owner);
		function_b80325b1(owner, self.origin, var_23130969);
	}
}

/*
	Name: function_b80325b1
	Namespace: namespace_a5ef5769
	Checksum: 0x645189E3
	Offset: 0x1DD8
	Size: 0x2B4
	Parameters: 3
	Flags: Linked
*/
function function_b80325b1(owner, position, var_23130969)
{
	dir_up = (0, 0, 1);
	var_7ef7dc23 = spawn("script_model", position);
	var_7ef7dc23 setmodel("tag_origin");
	var_7ef7dc23.is_active = 1;
	var_7ef7dc23.var_745ae857 = 0;
	var_7ef7dc23.var_669f67cf = 0;
	var_7ef7dc23.exploded = 0;
	var_7ef7dc23.var_bc60b6e0 = 1;
	var_7ef7dc23.var_23130969 = var_23130969;
	var_7ef7dc23.var_13015f04 = position + vectorscale((0, 0, 1), 28);
	/#
		if(getdvarint(#"hash_49e9d3375f091d35", 0))
		{
			cylinder(var_7ef7dc23.origin, var_7ef7dc23.origin + vectorscale((0, 0, 1), 56), 15, (0, 1, 0), 0, 60);
		}
	#/
	if(!isdefined(level.var_3afb1303))
	{
		level.var_3afb1303 = [];
	}
	else if(!isarray(level.var_3afb1303))
	{
		level.var_3afb1303 = array(level.var_3afb1303);
	}
	level.var_3afb1303[level.var_3afb1303.size] = var_7ef7dc23;
	arrayremovevalue(level.var_3afb1303, undefined);
	var_7ef7dc23 function_b198b062(1);
	/#
		var_7ef7dc23 function_6a0ad00("");
	#/
	if(isdefined(owner))
	{
		var_7ef7dc23 setteam(owner.team);
		if(isplayer(owner))
		{
			var_7ef7dc23 setowner(owner);
			var_7ef7dc23.owner = owner;
		}
	}
	var_7ef7dc23 thread function_d60a354c();
	var_7ef7dc23 thread function_646f5566();
	var_7ef7dc23 thread function_70240b1b();
}

/*
	Name: function_646f5566
	Namespace: namespace_a5ef5769
	Checksum: 0x94E6D01A
	Offset: 0x2098
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function function_646f5566()
{
	level endon(#"end_game");
	self endon(#"death");
	while(true)
	{
		s_notify = undefined;
		s_notify = self waittill(#"ray_hit");
		if(!isdefined(self) || !self.is_active)
		{
			return;
		}
		if(self.var_669f67cf == 0)
		{
			self notify(#"ray_hit");
		}
		self.var_669f67cf++;
		if(self.var_669f67cf >= 8)
		{
			self function_a0ef7452();
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_a0ef7452
	Namespace: namespace_a5ef5769
	Checksum: 0x5D53B879
	Offset: 0x2178
	Size: 0x364
	Parameters: 0
	Flags: Linked
*/
function function_a0ef7452()
{
	/#
		self function_6a0ad00("");
	#/
	if(!is_true(self.exploded))
	{
		self.exploded = 1;
		self notify(#"exploded");
		targets = getentitiesinradius(self.origin, 250);
		if(self.var_23130969 > 1)
		{
			damage_weapon = level.var_3415bf61;
			var_d2e616e1 = 10000;
		}
		else
		{
			damage_weapon = level.var_a467bdbc;
			var_d2e616e1 = 5000;
		}
		player = self.owner;
		if(isplayer(player))
		{
			weapon1 = player.inventory.items[17 + 1];
			weapon2 = player.inventory.items[((17 + 1) + 8) + 1];
			if(weapon1.var_627c698b.altweapon.rootweapon === damage_weapon.rootweapon)
			{
				damage_weapon = weapon1.var_627c698b.altweapon;
			}
			else if(weapon2.var_627c698b.altweapon.rootweapon === damage_weapon.rootweapon)
			{
				damage_weapon = weapon2.var_627c698b.altweapon;
			}
		}
		foreach(target in targets)
		{
			if(isactor(target) && isalive(target) && target getteam() == level.zombie_team)
			{
				target dodamage(var_d2e616e1, self.origin, self.owner, self, "none", "MOD_UNKNOWN", 0, damage_weapon);
				continue;
			}
			if(isdefined(target.var_e0412177))
			{
				target notify(#"damage", {#amount:var_d2e616e1, #weapon:damage_weapon, #attacker:self.owner});
			}
		}
	}
	self function_b198b062(3);
	self thread function_e7714941();
}

/*
	Name: function_d60a354c
	Namespace: namespace_a5ef5769
	Checksum: 0x671857EF
	Offset: 0x24E8
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_d60a354c()
{
	level endon(#"end_game");
	self endon(#"explode");
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittilltimeout(3, #"ray_hit");
	if(waitresult._notify !== "ray_hit")
	{
		/#
			self function_6a0ad00("");
		#/
		self function_b198b062(0);
		self thread function_e7714941();
		return;
	}
	/#
		self function_6a0ad00("");
	#/
	self function_b198b062(2);
	self.var_bc60b6e0 = 1.5;
	wait(3);
	if(isdefined(self))
	{
		self function_b198b062(0);
		self thread function_e7714941();
	}
}

/*
	Name: function_e7714941
	Namespace: namespace_a5ef5769
	Checksum: 0xDC4E5C43
	Offset: 0x2648
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_e7714941()
{
	level endon(#"end_game");
	if(!isdefined(self))
	{
		return;
	}
	self.is_active = 0;
	wait(1);
	/#
		if(isdefined(self))
		{
			self function_6a0ad00("");
		}
		if(getdvarint(#"scr_draw_triggers", 0))
		{
			level notify(#"hash_3c1bbc5bb28a968c");
		}
	#/
	if(isdefined(self.var_fcefdef4))
	{
		self.var_fcefdef4 delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_70240b1b
	Namespace: namespace_a5ef5769
	Checksum: 0xCB3EC60
	Offset: 0x2728
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function function_70240b1b()
{
	level endon(#"end_game");
	self endon(#"death");
	while(isdefined(self))
	{
		targets = getentitiesinradius(self.origin, self.var_bc60b6e0 * 64, 15);
		damage_weapon = (self.var_23130969 > 1 ? level.var_3415bf61 : level.var_a467bdbc);
		var_c790ea95 = (self.var_23130969 > 1 ? 600 : 300);
		player = self.owner;
		if(isplayer(player))
		{
			weapon1 = player.inventory.items[17 + 1];
			weapon2 = player.inventory.items[((17 + 1) + 8) + 1];
			if(weapon1.var_627c698b.altweapon.rootweapon === damage_weapon.rootweapon)
			{
				damage_weapon = weapon1.var_627c698b.altweapon;
			}
			else if(weapon2.var_627c698b.altweapon.rootweapon === damage_weapon.rootweapon)
			{
				damage_weapon = weapon2.var_627c698b.altweapon;
			}
		}
		foreach(ai in targets)
		{
			if(isalive(ai) && ai getteam() == level.zombie_team)
			{
				ai dodamage(var_c790ea95, self.origin, self.owner, self, "none", "MOD_DOT", 0, damage_weapon);
				if(self.var_bc60b6e0 > 1)
				{
					ai thread namespace_9ff9f642::slowdown(#"hash_21cb91304fde349a");
					continue;
				}
				ai thread namespace_9ff9f642::slowdown(#"hash_5c37161904f4bcc9");
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_b198b062
	Namespace: namespace_a5ef5769
	Checksum: 0x65BFC64
	Offset: 0x2A40
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_b198b062(stage)
{
	if(self.var_23130969 > 1)
	{
		stage = stage + 4;
	}
	self clientfield::set("" + #"hash_47e7d5219a26a786", stage);
}

/*
	Name: function_65ba5ec2
	Namespace: namespace_a5ef5769
	Checksum: 0x3D86A1C6
	Offset: 0x2AA0
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function function_65ba5ec2(params)
{
	if(params.smeansofdeath === "MOD_MELEE")
	{
		return;
	}
	if(function_2715ee2d(params.weapon))
	{
		if(self function_bdb8126a())
		{
			if(isplayer(params.eattacker) && params.eattacker function_4ba529a7(params.weapon))
			{
				self clientfield::set("" + #"hash_3a47820a21ce3170", 2);
			}
			else
			{
				self clientfield::set("" + #"hash_3a47820a21ce3170", 1);
			}
			self thread function_5a2447b1(2);
		}
		if(function_4f6da2be(params.weapon) && params.smeansofdeath === "MOD_UNKNOWN")
		{
			if(level.var_c09dd754 >= 8)
			{
				return false;
			}
			var_ad3dca6f = (randomfloat(30), randomfloat(30), randomfloatrange(100, 150));
			zm_utility::function_ffc279(var_ad3dca6f, params.eattacker, self.health, level.var_a467bdbc);
			self thread function_e28429db();
		}
	}
}

/*
	Name: function_e28429db
	Namespace: namespace_a5ef5769
	Checksum: 0x708AD30B
	Offset: 0x2CA8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e28429db()
{
	level.var_c09dd754++;
	self waittill(#"death");
	level.var_c09dd754--;
}

/*
	Name: function_4a074587
	Namespace: namespace_a5ef5769
	Checksum: 0xEA5CD619
	Offset: 0x2CE0
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4a074587(weapon)
{
	var_4bd40253 = self item_inventory::function_230ceec4(weapon);
	if(isdefined(var_4bd40253.var_a8bccf69))
	{
		switch(var_4bd40253.var_a8bccf69)
		{
			case 1:
			{
				return 2;
			}
			case 2:
			{
				return 4;
			}
			case 3:
			{
				return 6;
			}
			default:
			{
				return 1;
			}
		}
	}
	else
	{
		return 1;
	}
}

/*
	Name: function_bdb8126a
	Namespace: namespace_a5ef5769
	Checksum: 0x3E00DB0E
	Offset: 0x2DA8
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_bdb8126a()
{
	if(!isdefined(level.var_1a4cc228[self.aitype]))
	{
		return false;
	}
	entitynum = self getentitynumber();
	a_characters = level.var_1a4cc228[self.aitype];
	self setmodel(a_characters[entitynum % a_characters.size]);
	if(isdefined(self.gib_state))
	{
		gibserverutils::function_96bedd91(self);
	}
	return true;
}

/*
	Name: function_5a2447b1
	Namespace: namespace_a5ef5769
	Checksum: 0x4833687B
	Offset: 0x2E50
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_5a2447b1(time)
{
	result = undefined;
	result = self waittilltimeout(time, #"actor_corpse", #"death");
	waittillframeend();
	if(isdefined(result.corpse))
	{
		result.corpse delete();
	}
	else if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_6a0ad00
	Namespace: namespace_a5ef5769
	Checksum: 0xCDFDA44F
	Offset: 0x2EF0
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_6a0ad00(msg, color)
{
	if(!isdefined(color))
	{
		color = (1, 0, 0);
	}
	/#
		if(!getdvarint(#"hash_49e9d3375f091d35", 0))
		{
			return;
		}
		print3d(self.origin + vectorscale((0, 0, 1), 60), msg, color, 1, 1, 10);
	#/
}

