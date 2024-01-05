#using script_3d64d88008582147;
#using script_4108035fe400ce67;
#using scripts\core_common\flag_shared.gsc;
#using script_27347f09888ad15;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using script_6b1f7ff883ed7f20;
#using script_34ab99a4ca1a43d;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_471b31bd963b388e;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_3bb7295f;

/*
	Name: function_27d0fad2
	Namespace: namespace_3bb7295f
	Checksum: 0xBDC4051B
	Offset: 0x348
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_27d0fad2()
{
	level notify(-1170991329);
}

/*
	Name: __init__system__
	Namespace: namespace_3bb7295f
	Checksum: 0xE9EBC0B0
	Offset: 0x368
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4e2289c68f35238d", &function_70a657d8, &init, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3bb7295f
	Checksum: 0x4F8E21E6
	Offset: 0x3C0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	setdvar(#"hash_34cae673a047c202", 1);
}

/*
	Name: init
	Namespace: namespace_3bb7295f
	Checksum: 0xFE2A80FC
	Offset: 0x3F8
	Size: 0xAF4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) || getdvarint(#"hash_40bd34b35079cf2e", 0) > 0 && (zm_utility::is_classic() || util::get_game_type() === #"hash_1f847b868c4199a3"))
	{
		namespace_679a22ba::function_3ba2f5dd(#"hash_9c00f9e4e4bd95a", #"hash_1f5172eae85cac38");
		namespace_679a22ba::function_3ba2f5dd(#"hash_539facc2c096b82", #"hash_54a098edabd7a240");
		namespace_679a22ba::function_3ba2f5dd(#"hash_208e2483f559ccd2", #"hash_77437f3742463d90");
		namespace_679a22ba::function_3ba2f5dd(#"hash_47bae14a2b1b4511", #"hash_1e2cf3f92b05eea9");
		level.var_8f576c00 = [#"spawner_zm_steiner_split_radiation_bomb":#"hash_16d309f1ce9e015a", #"hash_6904f5c7bef64405":#"hash_1d599c94a087ca05", #"spawner_zm_steiner_split_radiation_blast":#"hash_2c0da7720a1c2f90", #"hash_7f957e36b4f6160f":#"hash_5e24e4aa952bb1bb", #"spawner_zm_steiner":#"hash_43b8d4f24851653e", #"hash_53f4e0daa341a161":#"hash_156c697af81feaf9", #"hash_12a17ab3df5889eb":#"hash_2792674ef4fce09f", #"hash_19ef16d1ba01a5":#"hash_7725a0435b44b1e5", #"hash_5214ebcccbd95a36":#"hash_796dff2ea842c1ac"];
		level.overridezombiespawn = &function_767a6a84;
		level.var_9d098364 = #"hash_43b8d4f24851653e";
		level.var_c42bdd1b = #"hash_2c0da7720a1c2f90";
		level.var_dc38daf = #"hash_16d309f1ce9e015a";
		level.var_d3d40dcb = #"hash_156c697af81feaf9";
		level.var_68b26ea = #"hash_2c0da7720a1c2f90";
		level.var_887c5017 = #"hash_16d309f1ce9e015a";
		level.var_9e513533 = #"hash_7d52f8111674d66b";
		level.var_eea9f85a = #"hash_2567a068187655f9";
		level.var_1a4cc228[#"hash_796dff2ea842c1ac"] = [6:#"hash_55cd178e8d6db2aa", 5:#"hash_9c9737cf22069a5", 4:#"hash_4cc6bea1049efc55", 3:#"hash_50645fbb1e049528", 2:#"hash_7808152e8467362f", 1:#"hash_7d3fe2134df8b974", 0:#"hash_7f5ab1dc6cfb5e8b"];
		level.var_1a4cc228[#"hash_2792674ef4fce09f"] = [0:#"hash_7247a6e723dbd7ab"];
		level.var_1a4cc228[#"hash_2c0da7720a1c2f90"] = [0:#"hash_78bcaad275fa3c26"];
		level.var_1a4cc228[#"hash_16d309f1ce9e015a"] = [0:#"hash_5392a8401b0e3133"];
		level.var_1a4cc228[#"hash_7725a0435b44b1e5"] = [0:#"hash_4062a2032d2c9a34"];
		level.var_f546b995 = "winter";
		level thread function_3a268da9();
		callback::on_ai_damage(&on_ai_damaged);
		callback::on_ai_killed(&on_ai_killed);
		level.var_77143112 = [];
		level.var_76dd228a = [];
		a_s_snowball_piles = struct::get_array("snowball_pile", "targetname");
		var_3e0f6c4b = struct::get_array("snow_mound", "targetname");
		foreach(var_97ba446e in var_3e0f6c4b)
		{
			temp_ent = spawn("script_origin", var_97ba446e.origin);
			zone = temp_ent zm_utility::get_current_zone(1);
			temp_ent delete();
			if(isdefined(zone))
			{
				zone.var_b5490369 = 1;
				var_97ba446e.zone = zone;
				if(!isdefined(level.var_77143112))
				{
					level.var_77143112 = [];
				}
				else if(!isarray(level.var_77143112))
				{
					level.var_77143112 = array(level.var_77143112);
				}
				if(!isinarray(level.var_77143112, zone))
				{
					level.var_77143112[level.var_77143112.size] = zone;
				}
				if(!isdefined(zone.var_6284d1b2))
				{
					zone.var_6284d1b2 = [];
				}
				if(!isdefined(zone.var_6284d1b2))
				{
					zone.var_6284d1b2 = [];
				}
				else if(!isarray(zone.var_6284d1b2))
				{
					zone.var_6284d1b2 = array(zone.var_6284d1b2);
				}
				if(!isinarray(zone.var_6284d1b2, var_97ba446e))
				{
					zone.var_6284d1b2[zone.var_6284d1b2.size] = var_97ba446e;
				}
				if(!isdefined(zone.var_a5015123))
				{
					zone.var_a5015123 = [];
				}
			}
		}
		foreach(s_snowball_pile in a_s_snowball_piles)
		{
			temp_ent = spawn("script_origin", s_snowball_pile.origin);
			zone = temp_ent zm_utility::get_current_zone(1);
			temp_ent delete();
			if(isdefined(zone))
			{
				zone.var_fbc00b53 = 1;
				s_snowball_pile.zone = zone;
				if(!isdefined(level.var_76dd228a))
				{
					level.var_76dd228a = [];
				}
				else if(!isarray(level.var_76dd228a))
				{
					level.var_76dd228a = array(level.var_76dd228a);
				}
				if(!isinarray(level.var_76dd228a, zone))
				{
					level.var_76dd228a[level.var_76dd228a.size] = zone;
				}
				if(!isdefined(zone.var_45d884e6))
				{
					zone.var_45d884e6 = [];
				}
				if(!isdefined(zone.var_45d884e6))
				{
					zone.var_45d884e6 = [];
				}
				else if(!isarray(zone.var_45d884e6))
				{
					zone.var_45d884e6 = array(zone.var_45d884e6);
				}
				if(!isinarray(zone.var_45d884e6, s_snowball_pile))
				{
					zone.var_45d884e6[zone.var_45d884e6.size] = s_snowball_pile;
				}
				if(!isdefined(zone.var_4acb65df))
				{
					zone.var_4acb65df = [];
				}
			}
		}
		function_bf79a643();
		function_a05df3a7();
		level thread function_128f3b6b();
		level.var_162c45e4 = 1;
		level.var_72182681 = 1;
		thread function_e71942eb();
		callback::on_spawned(&function_8f677e13);
	}
}

/*
	Name: function_e71942eb
	Namespace: namespace_3bb7295f
	Checksum: 0x248D159C
	Offset: 0xEF8
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_e71942eb()
{
	level endon(#"end_game");
	waittillframeend();
	level flag::wait_till("all_players_spawned");
	players = getplayers();
	foreach(player in players)
	{
		player thread function_6f65e552();
		player function_8f677e13();
	}
}

/*
	Name: function_6f65e552
	Namespace: namespace_3bb7295f
	Checksum: 0x8B121338
	Offset: 0xFF0
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_6f65e552()
{
	self endon(#"death", #"disconnect");
	var_4531f22a = 0;
	while(true)
	{
		if(var_4531f22a >= 3)
		{
			return;
		}
		self waittill(#"loadout_given");
		var_4531f22a++;
		self function_8f677e13();
		wait(1);
	}
}

/*
	Name: function_767a6a84
	Namespace: namespace_3bb7295f
	Checksum: 0x87E391B7
	Offset: 0x1080
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function function_767a6a84(spawner, target_name, spawn_point, round_number)
{
	if(isdefined(level.var_8f576c00[round_number.aitype]))
	{
		return spawnactor(level.var_8f576c00[round_number.aitype], round_number.origin, round_number.angles, 0, 1, 0, round_number);
	}
	return round_number spawnfromspawner(0, 1);
}

/*
	Name: function_a05df3a7
	Namespace: namespace_3bb7295f
	Checksum: 0x5B79CC76
	Offset: 0x1128
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_a05df3a7()
{
	var_2c4241da = struct::get_array("xmas_tree", "targetname");
	foreach(location in var_2c4241da)
	{
		tree = spawn("script_model", location.origin);
		tree.angles = location.angles;
		tree setmodel("p9_zm_silver_foliage_tree_christmas_full");
		tree solid();
		tree disconnectpaths();
	}
}

/*
	Name: function_bf79a643
	Namespace: namespace_3bb7295f
	Checksum: 0xEA35C355
	Offset: 0x1258
	Size: 0x5A2
	Parameters: 0
	Flags: Linked
*/
function function_bf79a643()
{
	foreach(zone in level.var_76dd228a)
	{
		if(!isdefined(zone.var_6cff21f5))
		{
			zone.var_6cff21f5 = 0;
		}
		if(isdefined(zone.var_4acb65df))
		{
			function_1eaaceab(zone.var_4acb65df);
			if(zone.var_6cff21f5 < 3)
			{
				index = 0;
				if(zone.var_45d884e6.size === 0)
				{
					continue;
				}
				else if(zone.var_45d884e6.size > 1)
				{
					index = randomint(zone.var_45d884e6.size);
				}
				var_e779ff3c = 0;
				players_in_range = getplayers(undefined, zone.var_45d884e6[index].origin, 910);
				players = getplayers();
				foreach(player in players)
				{
					if(player util::is_looking_at(zone.var_45d884e6[index], 0.8, 1, vectorscale((0, 0, 1), 16)))
					{
						var_e779ff3c = 1;
					}
				}
				if(is_true(zone.var_fbc00b53) || (var_e779ff3c === 0 && players_in_range.size === 0))
				{
					zone.var_45d884e6[index] function_f5527ca2(zone);
					arrayremoveindex(zone.var_45d884e6, index);
				}
			}
		}
		zone.var_fbc00b53 = 0;
	}
	foreach(zone in level.var_77143112)
	{
		if(!isdefined(zone.var_e600b8df))
		{
			zone.var_e600b8df = 0;
		}
		if(isdefined(zone.var_a5015123))
		{
			function_1eaaceab(zone.var_a5015123);
			if(zone.var_e600b8df < 2)
			{
				index = 0;
				if(zone.var_6284d1b2.size === 0)
				{
					continue;
				}
				else if(zone.var_6284d1b2.size > 1)
				{
					index = randomint(zone.var_6284d1b2.size);
				}
				var_e779ff3c = 0;
				players_in_range = getplayers(undefined, zone.var_6284d1b2[index].origin, 910);
				players = getplayers();
				foreach(player in players)
				{
					if(player util::is_looking_at(zone.var_6284d1b2[index], 0.8, 1, vectorscale((0, 0, 1), 32)))
					{
						var_e779ff3c = 1;
					}
				}
				if(is_true(zone.var_b5490369) || (var_e779ff3c === 0 && players_in_range.size === 0 && (!isdefined(zone.var_6284d1b2[index].var_9ae54d14) || zone.var_6284d1b2[index].var_9ae54d14 < (gettime() - 30000))))
				{
					zone.var_6284d1b2[index] function_4d68903d(zone);
					arrayremoveindex(zone.var_6284d1b2, index);
				}
			}
		}
		zone.var_b5490369 = 0;
	}
}

/*
	Name: function_128f3b6b
	Namespace: namespace_3bb7295f
	Checksum: 0x1FA3F60
	Offset: 0x1808
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_128f3b6b()
{
	while(true)
	{
		level waittill(#"end_of_round");
		function_bf79a643();
	}
}

/*
	Name: function_dd028fcb
	Namespace: namespace_3bb7295f
	Checksum: 0x449688A9
	Offset: 0x1848
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dd028fcb(e_player)
{
	var_d49d10b0 = e_player zm_loadout::get_player_lethal_grenade();
	self sethintstring(#"hash_302511d2e9a9429b");
	return true;
}

/*
	Name: function_608b90b4
	Namespace: namespace_3bb7295f
	Checksum: 0x2D5FA3EA
	Offset: 0x18A0
	Size: 0x200
	Parameters: 0
	Flags: Linked, Private
*/
function private function_608b90b4()
{
	self endon(#"end_game", #"death");
	self.var_e95e6830 = 5;
	while(true)
	{
		s_notify = undefined;
		s_notify = self waittill(#"trigger_activated");
		e_player = s_notify.e_who;
		e_player thread function_79ef6b93(self);
		if(!is_true(e_player.var_61fca2c3))
		{
			e_player.var_61fca2c3 = 1;
		}
		if(self.var_e95e6830 <= 0)
		{
			if(!isdefined(self.zone.var_45d884e6))
			{
				self.zone.var_45d884e6 = [];
			}
			else if(!isarray(self.zone.var_45d884e6))
			{
				self.zone.var_45d884e6 = array(self.zone.var_45d884e6);
			}
			if(!isinarray(self.zone.var_45d884e6, self.mound))
			{
				self.zone.var_45d884e6[self.zone.var_45d884e6.size] = self.mound;
			}
			self.zone.var_6cff21f5--;
			zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
			playfx("maps/ltm/fx9_winter_snowball_pile_pickup", self.origin);
			self delete();
		}
	}
}

/*
	Name: function_8f677e13
	Namespace: namespace_3bb7295f
	Checksum: 0x6B6A278D
	Offset: 0x1AA8
	Size: 0x22A
	Parameters: 0
	Flags: Linked
*/
function function_8f677e13()
{
	self endon(#"disconnect", #"death");
	waittillframeend();
	item = function_4ba8fde("snowball_item_sr");
	currentweapon = self getcurrentweapon();
	if(isdefined(item))
	{
		if(self item_inventory::function_bba770de(item.var_a6762160) === 5)
		{
			return;
		}
		var_fbf4dc0d = self item_inventory::function_bba770de(item.var_a6762160);
		var_ff2621e6 = 5 - var_fbf4dc0d;
		item.var_a6762160.amount = var_ff2621e6;
		var_fa3df96 = self item_inventory::function_e66dcff5(item);
		if(isdefined(var_fa3df96))
		{
			if(!item_world_util::function_db35e94f(item.var_bd027dd9))
			{
				item.var_bd027dd9 = item_world_util::function_970b8d86(var_fa3df96);
			}
			item.hidetime = 0;
			if(self.inventory.items[var_fa3df96].var_bd027dd9 != 32767 && self.inventory.items[var_fa3df96].var_a6762160.name != item.var_a6762160.name)
			{
				self item_inventory::function_fba40e6c(item);
			}
			else
			{
				item_world::function_de2018e3(item, self, var_fa3df96);
			}
		}
		else
		{
			item_world::function_de2018e3(item, self, var_fa3df96);
		}
		item.var_a6762160.amount = 1;
	}
}

/*
	Name: function_79ef6b93
	Namespace: namespace_3bb7295f
	Checksum: 0x4920CA81
	Offset: 0x1CE0
	Size: 0x37E
	Parameters: 1
	Flags: Linked
*/
function function_79ef6b93(snowball_pile)
{
	self endon(#"disconnect", #"death");
	self playsound("fly_pickup_snowball");
	item = function_4ba8fde("snowball_item_sr");
	currentweapon = self getcurrentweapon();
	if(isdefined(item))
	{
		if(self item_inventory::function_bba770de(item.var_a6762160) === 5)
		{
			return;
		}
		var_fbf4dc0d = self item_inventory::function_bba770de(item.var_a6762160);
		var_ff2621e6 = 5 - var_fbf4dc0d;
		if(var_ff2621e6 > snowball_pile.var_e95e6830)
		{
			var_ff2621e6 = snowball_pile.var_e95e6830;
		}
		item.var_a6762160.amount = var_ff2621e6;
		var_fa3df96 = self item_inventory::function_e66dcff5(item);
		if(isdefined(var_fa3df96))
		{
			if(!item_world_util::function_db35e94f(item.var_bd027dd9))
			{
				item.var_bd027dd9 = item_world_util::function_970b8d86(var_fa3df96);
			}
			item.hidetime = 0;
			if(self.inventory.items[var_fa3df96].var_bd027dd9 != 32767 && self.inventory.items[var_fa3df96].var_a6762160.name != item.var_a6762160.name)
			{
				self item_inventory::function_fba40e6c(item);
				for(i = 0; i < var_ff2621e6 - 1; i++)
				{
					item_world::function_de2018e3(item, self, var_fa3df96);
				}
			}
			else
			{
				for(i = 0; i < var_ff2621e6; i++)
				{
					item_world::function_de2018e3(item, self, var_fa3df96);
				}
			}
		}
		else
		{
			for(i = 0; i < var_ff2621e6; i++)
			{
				item_world::function_de2018e3(item, self, var_fa3df96);
			}
		}
		item.var_a6762160.amount = 1;
		if(snowball_pile.var_8438fd5c === 1)
		{
			snowball_pile.var_8438fd5c = 0;
			playfx("maps/ltm/fx9_winter_snowball_pile_pickup", self.origin);
			snowball_pile setmodel("p8_wz_snowball_pile_sml");
		}
		if(var_ff2621e6 > 0)
		{
			playfx("maps/ltm/fx9_winter_snowball_pile_pickup", snowball_pile.origin);
		}
		snowball_pile.var_e95e6830 = snowball_pile.var_e95e6830 - var_ff2621e6;
	}
}

/*
	Name: function_f5527ca2
	Namespace: namespace_3bb7295f
	Checksum: 0xB3FF169A
	Offset: 0x2068
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_f5527ca2(zone)
{
	playfx("maps/ltm/fx9_winter_snowball_pile_pickup", self.origin);
	snowball_pile = util::spawn_model("p8_wz_snowball_pile", self.origin, self.angles);
	snowball_pile.targetname = "snowball_pile";
	snowball_pile.angles = self.angles;
	snowball_pile setmodel("p8_wz_snowball_pile");
	snowball_pile.mound = self;
	snowball_pile.zone = zone;
	snowball_pile.zone.var_6cff21f5++;
	snowball_pile.var_8438fd5c = 1;
	snowball_pile function_619a5c20();
	snowball_pile zm_unitrigger::create(&function_dd028fcb, 64);
	snowball_pile.s_unitrigger.origin = snowball_pile.s_unitrigger.origin + vectorscale((0, 0, 1), 32);
	function_1eaaceab(zone.var_4acb65df);
	if(!isdefined(zone.var_4acb65df))
	{
		zone.var_4acb65df = [];
	}
	else if(!isarray(zone.var_4acb65df))
	{
		zone.var_4acb65df = array(zone.var_4acb65df);
	}
	if(!isinarray(zone.var_4acb65df, snowball_pile))
	{
		zone.var_4acb65df[zone.var_4acb65df.size] = snowball_pile;
	}
	snowball_pile thread function_608b90b4();
}

/*
	Name: function_4d68903d
	Namespace: namespace_3bb7295f
	Checksum: 0x3A90989C
	Offset: 0x2278
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function function_4d68903d(zone)
{
	self endon(#"death");
	playfx("_t7/snow/fx_snow_impact_lg", self.origin + vectorscale((0, 0, 1), 30));
	snowman = util::spawn_model("p9_nt6x_win_snowman", self.origin, self.angles);
	snowman.takedamage = 1;
	snowman.health = 100;
	snowman.var_493b77d4 = 1;
	snowman.var_defc3cee = 1;
	snowman.mound = self;
	snowman.zone = zone;
	snowman.zone.var_e600b8df++;
	snowman.spawn_time = gettime();
	snowman.var_5d6eb0f1 = 1;
	snowman.var_6748b2d2 = #"hash_52c65a6a82b13cfd";
	snowman disconnectpaths();
	snowman solid();
	snowman setcandamage(1);
	self.var_38409c6 = "snowman";
	self.snowman = snowman;
	function_1eaaceab(zone.var_a5015123);
	if(!isdefined(zone.var_a5015123))
	{
		zone.var_a5015123 = [];
	}
	else if(!isarray(zone.var_a5015123))
	{
		zone.var_a5015123 = array(zone.var_a5015123);
	}
	if(!isinarray(zone.var_a5015123, snowman))
	{
		zone.var_a5015123[zone.var_a5015123.size] = snowman;
	}
	snowman thread function_dc8f034(self.snowman);
	var_c416888f = randomint(100);
	if(var_c416888f < 100)
	{
		snowman thread function_36043197();
	}
}

/*
	Name: function_36043197
	Namespace: namespace_3bb7295f
	Checksum: 0xF4706435
	Offset: 0x24F8
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function function_36043197()
{
	self endon(#"death");
	var_47b592ad = randomfloatrange(1250, 7000);
	level flag::wait_till("gameplay_started");
	while(true)
	{
		players = function_a1ef346b(#"allies", self.origin, 750);
		if(players.size === 0)
		{
			self.spawn_time = gettime();
		}
		foreach(player in players)
		{
			if(player util::is_looking_at(self, 0.8, 1, vectorscale((0, 0, 1), 32)))
			{
				if(self.spawn_time < gettime() - var_47b592ad)
				{
					if(!isdefined(self.var_bd710417))
					{
						self.var_bd710417 = [];
					}
					if(isdefined(self.var_bd710417[player getentitynumber()]))
					{
						if(self.var_bd710417[player getentitynumber()] === 0)
						{
							self.var_bd710417[player getentitynumber()] = gettime();
						}
						else if(self.var_bd710417[player getentitynumber()] < gettime() - 500)
						{
							if(!is_true(self.var_624e969b))
							{
								self thread zm_utility::function_e77fca72();
							}
							wait(0.5);
							self.zone.var_e600b8df--;
							self.var_9d1762d6 = 1;
							self.mound thread function_87490b97(self.zone);
							self.mound.var_9ae54d14 = gettime();
							self function_856d0105();
							return;
						}
					}
					else
					{
						self.var_bd710417[player getentitynumber()] = gettime();
					}
				}
				continue;
			}
			self.var_bd710417[player getentitynumber()] = 0;
		}
		wait(0.25);
	}
}

/*
	Name: function_87490b97
	Namespace: namespace_3bb7295f
	Checksum: 0x3F101927
	Offset: 0x2808
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function function_87490b97(zone)
{
	self endon(#"death");
	spawner = level.zombie_spawners[0];
	ai = zombie_utility::spawn_zombie(spawner, spawner.targetname, self);
	self function_a9114898(self.snowman.origin, self.snowman.angles);
	if(!isdefined(zone.var_6284d1b2))
	{
		zone.var_6284d1b2 = [];
	}
	else if(!isarray(zone.var_6284d1b2))
	{
		zone.var_6284d1b2 = array(zone.var_6284d1b2);
	}
	if(!isinarray(zone.var_6284d1b2, self))
	{
		zone.var_6284d1b2[zone.var_6284d1b2.size] = self;
	}
}

/*
	Name: function_a9114898
	Namespace: namespace_3bb7295f
	Checksum: 0xBBF51FBA
	Offset: 0x2940
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_a9114898(origin, angles)
{
	self endon(#"death");
	fwd = anglestoforward(angles);
	up = anglestoup(angles);
	playfx("maps/ltm/fx9_winter_snowman_dest", origin, fwd, up);
	playsoundatposition(#"hash_a00a48925a72e55", origin + vectorscale((0, 0, 1), 30));
}

/*
	Name: function_dc8f034
	Namespace: namespace_3bb7295f
	Checksum: 0x7B921179
	Offset: 0x2A00
	Size: 0x1DA
	Parameters: 1
	Flags: Linked
*/
function function_dc8f034(snowman)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		self function_96244838(waitresult.weapon, waitresult.attacker);
		if(self.health <= 0)
		{
			self.mound function_a9114898(self.origin, self.angles);
			self function_83cb84d3(#"hash_24af9f98f7899474", 1, 0);
			self.zone.var_e600b8df--;
			if(!isdefined(self.zone.var_6284d1b2))
			{
				self.zone.var_6284d1b2 = [];
			}
			else if(!isarray(self.zone.var_6284d1b2))
			{
				self.zone.var_6284d1b2 = array(self.zone.var_6284d1b2);
			}
			if(!isinarray(self.zone.var_6284d1b2, self.mound))
			{
				self.zone.var_6284d1b2[self.zone.var_6284d1b2.size] = self.mound;
			}
			self.mound.var_9ae54d14 = gettime();
			self function_856d0105();
			return;
		}
	}
}

/*
	Name: function_856d0105
	Namespace: namespace_3bb7295f
	Checksum: 0x7DDD01DC
	Offset: 0x2BE8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_856d0105()
{
	if(isdefined(self))
	{
		self deletedelay();
	}
}

/*
	Name: function_3a268da9
	Namespace: namespace_3bb7295f
	Checksum: 0x6AE076F9
	Offset: 0x2C18
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_3a268da9(params)
{
	self endon(#"endgame");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_4a4f23c60bbb7f6f");
		if(waitresult.itemname === "item_zm_ltm_holiday_gift_01" || waitresult.itemname === "item_zm_ltm_holiday_gift_02" || waitresult.itemname === "item_zm_ltm_holiday_gift_03")
		{
			switch(waitresult.itemname)
			{
				case "item_zm_ltm_holiday_gift_01":
				{
					waitresult.item function_83cb84d3(#"hash_3adefdb432d5b064", 0, 1, waitresult.item.var_7b02ac6a);
					break;
				}
				case "item_zm_ltm_holiday_gift_02":
				{
					waitresult.item function_83cb84d3(#"hash_3adefdb432d5b064", 0, 1, waitresult.item.var_7b02ac6a);
					break;
				}
				case "item_zm_ltm_holiday_gift_03":
				{
					waitresult.item function_83cb84d3(#"hash_3adefdb432d5b064", 0, 1, waitresult.item.var_7b02ac6a);
					break;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_83cb84d3
	Namespace: namespace_3bb7295f
	Checksum: 0xB8E75256
	Offset: 0x2DD0
	Size: 0x23C
	Parameters: 5
	Flags: Linked
*/
function function_83cb84d3(var_20287981, var_3798631c, var_b9012667, var_63942b62, var_6ff6be61)
{
	var_7580ce3e = spawnstruct();
	var_7580ce3e.origin = self.origin;
	var_7580ce3e.angles = self.angles;
	var_7580ce3e.var_738dfc81 = 1;
	var_7580ce3e.scriptmodel = self;
	if(var_3798631c === 1 && is_true(level.var_72182681) && !is_true(var_6ff6be61))
	{
		level.var_72182681 = 0;
		var_9b2da190 = "ltm_chest_item_list";
	}
	else
	{
		if(var_3798631c === 1 && is_true(level.var_162c45e4) && is_true(var_6ff6be61))
		{
			level.var_162c45e4 = 0;
			var_9b2da190 = "ltm_chest_item_list";
		}
		else
		{
			if(var_3798631c === 1)
			{
				var_9b2da190 = namespace_58949729::function_fd5e77fa(var_20287981);
			}
			else
			{
				if(var_b9012667 === 1)
				{
					var_59364773 = 0;
					if(var_63942b62 === 1)
					{
						var_59364773 = 1;
					}
					var_9b2da190 = namespace_58949729::function_257d7203(var_20287981, var_59364773);
				}
				else
				{
					var_9b2da190 = namespace_58949729::function_257d7203(var_20287981);
				}
			}
		}
	}
	if(var_b9012667 === 1)
	{
		level thread namespace_58949729::function_f82f361c(var_7580ce3e, var_9b2da190, 0, 1);
	}
	else
	{
		level thread namespace_58949729::function_f82f361c(var_7580ce3e, var_9b2da190, 2, 1);
	}
	var_7580ce3e struct::delete();
}

/*
	Name: function_96244838
	Namespace: namespace_3bb7295f
	Checksum: 0x520967EB
	Offset: 0x3018
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_96244838(weapon, attacker)
{
	self endon(#"death");
	if(isdefined(weapon) && isdefined(attacker) && isplayer(attacker))
	{
		var_594a2d34 = isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3;
		attacker util::show_hit_marker(0, var_594a2d34);
	}
}

/*
	Name: on_ai_damaged
	Namespace: namespace_3bb7295f
	Checksum: 0xE89C9BA5
	Offset: 0x30C0
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function on_ai_damaged(params)
{
	if(params.weapon.name === #"snowball" && !self.var_6f84b820 === #"elite")
	{
		if(!isdefined(self.var_2b2c16c7))
		{
			self.var_2b2c16c7 = {};
		}
		self.var_2b2c16c7 = {#player:params.eattacker, #time:gettime()};
		if(params.idamage >= self.health)
		{
			self.var_b69c12bc = 0;
		}
		if(params.eattacker zm_powerups::is_insta_kill_active())
		{
			self.var_958cf9c5 = 1;
		}
		else
		{
			self thread ammomod_cryofreeze::function_f00409f3(params.eattacker, undefined, params.weapon, 0, 3);
		}
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_3bb7295f
	Checksum: 0x9A76C45F
	Offset: 0x31E0
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(params)
{
	if(self.var_958cf9c5 === 1 && (isdefined(self.var_2b2c16c7) && self.var_2b2c16c7.time > (gettime() - 4000)))
	{
		self.var_aa2ce9a4 = 1;
		if(zm_utility::is_player_valid(self.var_2b2c16c7.player, 0, 0))
		{
			if(self.var_2b2c16c7.player === params.eattacker)
			{
				scoreevents::processscoreevent(#"hash_62d538ab42fe8565", params.eattacker, self, params.weapon);
			}
			else
			{
				scoreevents::processscoreevent(#"hash_1fb5d644e5408000", params.eattacker, self, params.weapon);
			}
		}
		self function_83cb84d3(#"hash_24af9f98f7899474", 1, 0, undefined, 1);
	}
}

