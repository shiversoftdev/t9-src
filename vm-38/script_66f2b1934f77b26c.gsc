#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio_sq.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_34ab99a4ca1a43d;
#using script_7a5293d92c61c788;
#using scripts\zm_common\zm_audio.gsc;
#using script_5404bcacf34a92d;
#using scripts\zm\zm_gold_ww_quest.gsc;
#using script_25ebc9ade08aed84;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using script_4108035fe400ce67;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_36ebd7e4;

/*
	Name: function_fb964518
	Namespace: namespace_36ebd7e4
	Checksum: 0x48FD77F3
	Offset: 0x640
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fb964518()
{
	level notify(1992729987);
}

/*
	Name: init
	Namespace: namespace_36ebd7e4
	Checksum: 0xE82AA1C7
	Offset: 0x660
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function init()
{
	init_clientfields();
	function_ec9e5cf2();
	level thread scene::init(#"hash_5a121f0591383986");
}

/*
	Name: init_clientfields
	Namespace: namespace_36ebd7e4
	Checksum: 0xE775696F
	Offset: 0x6B0
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "" + #"hash_7b253f73f6f094c6", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5b7ac337732b7e59", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4566af74eca7b0fc", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_3133b920dbedc06b", 1, 1, "int");
	clientfield::register("world", "" + #"hash_66b3c585c1eacb0b", 1, 1, "counter");
}

/*
	Name: function_ec9e5cf2
	Namespace: namespace_36ebd7e4
	Checksum: 0x6C3DDC0F
	Offset: 0x800
	Size: 0x2CC
	Parameters: 0
	Flags: Linked
*/
function function_ec9e5cf2()
{
	zm_audio_sq::init();
	level zm_sq::register(#"hash_4bcc3acb4102f466", #"step_1", #"hash_1309b1590ff55819", &function_1dcf5339, &function_9a3d73f5);
	level zm_sq::register(#"hash_4bcc3acb4102f466", #"step_2", #"hash_1309ae590ff55300", &function_bc64a2fc, &function_5339496c);
	level zm_sq::register(#"hash_5891e4c3e9c2ece4", #"step_1", #"hash_cdb7944a1051037", &function_f68bd85b, &function_a10cd1d4);
	level zm_sq::register(#"hash_5891e4c3e9c2ece4", #"step_2", #"hash_cdb7a44a10511ea", &function_513e5d8e, &function_af1af946);
	level zm_sq::register(#"hash_1e54ef45c51f5b1a", #"step_1", #"hash_1e54ef45c51f5b1a", &function_afb809d7, &function_a7f8da0d);
	level zm_sq::register(#"hash_68f490a90206132a", #"step_1", #"hash_18de4ebce0c76a15", &function_519f3aff, &function_bd8fd5ea);
	level zm_sq::register(#"hash_68f490a90206132a", #"step_2", #"hash_18de4bbce0c764fc", &function_c037252d, &function_610a4c69);
	level thread function_2abef8da();
}

/*
	Name: function_2abef8da
	Namespace: namespace_36ebd7e4
	Checksum: 0x62096624
	Offset: 0xAD8
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2abef8da()
{
	level zm_sq::start(#"hash_4bcc3acb4102f466");
	level zm_sq::start(#"hash_5891e4c3e9c2ece4");
	level zm_sq::start(#"hash_1e54ef45c51f5b1a");
	level zm_sq::start(#"hash_68f490a90206132a");
}

/*
	Name: function_1dcf5339
	Namespace: namespace_36ebd7e4
	Checksum: 0x4E3D9D8E
	Offset: 0xB68
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_1dcf5339(var_a276c861)
{
	level endon(#"hash_61b2ca3ce72d604d");
	level flag::wait_till("power_on");
	var_3d2a6487 = struct::get("gd_dk_bny");
	/#
		var_3d2a6487 thread function_33773548();
	#/
	level scene::init(#"hash_68710fac299c41dd");
	level thread function_ee034322();
	level flag::wait_till(#"hash_7992dc29375ff937");
}

/*
	Name: function_ee034322
	Namespace: namespace_36ebd7e4
	Checksum: 0xBAE07C53
	Offset: 0xC40
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_ee034322()
{
	level endon(#"end_game", #"hash_7992dc29375ff937");
	while(true)
	{
		while(!function_919df79f())
		{
			waitframe(1);
		}
		function_815a82fb();
		while(function_919df79f())
		{
			waitframe(1);
		}
		function_8ee1ba57();
	}
}

/*
	Name: function_919df79f
	Namespace: namespace_36ebd7e4
	Checksum: 0x302B1612
	Offset: 0xCE0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_919df79f()
{
	return !level flag::get_any([2:#"hash_3e765c26047c9f54", 1:#"rbz_exfil_beacon_active", 0:#"hash_5dce120a8e013b48"]);
}

/*
	Name: function_815a82fb
	Namespace: namespace_36ebd7e4
	Checksum: 0x57C2DF11
	Offset: 0xD50
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_815a82fb()
{
	callback::on_connect(&function_31b264);
	foreach(e_player in getplayers())
	{
		e_player thread function_31b264();
	}
	level thread function_7eae58b9();
}

/*
	Name: function_8ee1ba57
	Namespace: namespace_36ebd7e4
	Checksum: 0x42D76FE6
	Offset: 0xE20
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_8ee1ba57()
{
	callback::remove_on_connect(&function_31b264);
	level notify(#"hash_7bfe7dd2d393d59c");
	foreach(e_player in getplayers())
	{
		e_player flag::clear(#"hash_6e69fc65a3ceab1c");
	}
}

/*
	Name: function_31b264
	Namespace: namespace_36ebd7e4
	Checksum: 0xBCCA821A
	Offset: 0xEF8
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function function_31b264()
{
	self notify("67c43b7ff319322a");
	self endon("67c43b7ff319322a");
	level endon(#"end_game", #"hash_7bfe7dd2d393d59c", #"hash_7992dc29375ff937");
	self endon(#"disconnect");
	var_3d2a6487 = struct::get("gd_dk_bny");
	var_fdc48fc2 = var_3d2a6487.origin + vectorscale((0, 0, 1), 10);
	while(true)
	{
		while(!zm_utility::is_player_valid(self) || !self util::is_looking_at(var_fdc48fc2, undefined, 1))
		{
			waitframe(1);
		}
		self flag::set(#"hash_6e69fc65a3ceab1c");
		while(zm_utility::is_player_valid(self) && self util::is_looking_at(var_fdc48fc2, undefined, 1))
		{
			waitframe(1);
		}
		self flag::clear(#"hash_6e69fc65a3ceab1c");
	}
}

/*
	Name: function_f2686e33
	Namespace: namespace_36ebd7e4
	Checksum: 0x2F3FC6B0
	Offset: 0x1088
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_f2686e33(e_player)
{
	if(!isdefined(e_player))
	{
		return 0;
	}
	return e_player flag::get(#"hash_6e69fc65a3ceab1c");
}

/*
	Name: function_db957b49
	Namespace: namespace_36ebd7e4
	Checksum: 0xD000A884
	Offset: 0x10D0
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function function_db957b49()
{
	foreach(e_player in getplayers())
	{
		if(function_f2686e33(e_player))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_2820044e
	Namespace: namespace_36ebd7e4
	Checksum: 0x57310163
	Offset: 0x1178
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_2820044e()
{
	var_3d2a6487 = struct::get("gd_dk_bny");
	foreach(e_player in arraysortclosest(getplayers(), var_3d2a6487.origin))
	{
		if(function_f2686e33(e_player))
		{
			return e_player;
		}
	}
}

/*
	Name: function_7eae58b9
	Namespace: namespace_36ebd7e4
	Checksum: 0x663CA8EC
	Offset: 0x1258
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_7eae58b9()
{
	level endon(#"end_game", #"hash_7bfe7dd2d393d59c", #"hash_7992dc29375ff937");
	while(true)
	{
		while(!function_db957b49())
		{
			waitframe(1);
		}
		level thread function_7e714810();
		while(function_db957b49())
		{
			waitframe(1);
		}
		level notify(#"hash_2488e6d5f0af96a9");
	}
}

/*
	Name: function_7e714810
	Namespace: namespace_36ebd7e4
	Checksum: 0x90E6EEC
	Offset: 0x1310
	Size: 0x198
	Parameters: 0
	Flags: Linked
*/
function function_7e714810()
{
	level endon(#"end_game", #"hash_7bfe7dd2d393d59c", #"hash_7992dc29375ff937", #"hash_2488e6d5f0af96a9");
	while(true)
	{
		n_wait = randomfloatrange(6, 10);
		if(math::cointoss(1))
		{
			n_wait = randomfloatrange(1, 10);
		}
		wait(n_wait);
		if(!level flag::get(#"hash_3314158279a61f07"))
		{
			level flag::set(#"hash_3314158279a61f07");
			level thread function_efc48562();
		}
		else if(!level flag::get(#"hash_44fbd1c2094bd9dd"))
		{
			e_closest = function_2820044e();
			if(isdefined(e_closest))
			{
				level flag::set(#"hash_44fbd1c2094bd9dd");
				level thread function_664460fb(e_closest);
			}
		}
	}
}

/*
	Name: function_efc48562
	Namespace: namespace_36ebd7e4
	Checksum: 0x82115B56
	Offset: 0x14B0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_efc48562()
{
	playsoundatposition(#"hash_19b2989fd9babdf6", (0, 0, 0));
	level scene::play(#"hash_68710fac299c41dd", "turn");
}

/*
	Name: function_664460fb
	Namespace: namespace_36ebd7e4
	Checksum: 0xAA738403
	Offset: 0x1510
	Size: 0x314
	Parameters: 1
	Flags: Linked
*/
function function_664460fb(e_player)
{
	level endon(#"end_game");
	level flag::set(#"in_dark_side");
	level.var_31a08449 = e_player;
	level.var_31a08449 val::set(#"hash_5b2ef46b6d99d81b", "freezecontrols", 1);
	playsoundatposition(#"hash_529502ec63a5d4f4", (0, 0, 0));
	level thread function_b6fef4c2();
	level flag::set(#"hash_49e515cdcf4bb8db");
	level scene::play(#"hash_68710fac299c41dd", "float");
	foreach(player in function_a1ef346b())
	{
		player clientfield::set_to_player("" + #"hash_69dc133e22a2769f", 1);
	}
	scene::add_scene_func(#"hash_68710fac299c41dd", &function_10108818, "fly");
	level thread scene::play(#"hash_68710fac299c41dd", "fly");
	wait(0.5);
	if(isdefined(level.var_31a08449))
	{
		level.var_31a08449 val::reset(#"hash_5b2ef46b6d99d81b", "freezecontrols");
	}
	if(!function_919df79f())
	{
		function_75a85730();
	}
	else
	{
		level flag::set(#"hash_7992dc29375ff937");
		scene::remove_scene_func(#"hash_68710fac299c41dd", &function_10108818, "fly");
		level scene::delete_scene_spawned_ents(#"hash_68710fac299c41dd");
	}
}

/*
	Name: function_75a85730
	Namespace: namespace_36ebd7e4
	Checksum: 0xD2164EE0
	Offset: 0x1830
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_75a85730()
{
	level scene::delete_scene_spawned_ents(#"hash_68710fac299c41dd");
	level scene::init(#"hash_68710fac299c41dd");
	level flag::clear(#"in_dark_side");
	level flag::clear(#"hash_44fbd1c2094bd9dd");
	level flag::clear(#"hash_3314158279a61f07");
	level flag::clear(#"hash_49e515cdcf4bb8db");
}

/*
	Name: function_b6fef4c2
	Namespace: namespace_36ebd7e4
	Checksum: 0xC590EF6E
	Offset: 0x1900
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_b6fef4c2()
{
	level endon(#"end_game");
	wait(1.25);
	level clientfield::increment("" + #"hash_66b3c585c1eacb0b");
}

/*
	Name: function_10108818
	Namespace: namespace_36ebd7e4
	Checksum: 0xE958113E
	Offset: 0x1960
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_10108818(a_ents)
{
	ent = a_ents[#"hash_26c68883043990a6"];
	var_28c547d2 = util::spawn_model("tag_origin", ent.origin, ent.angles);
	ent linkto(var_28c547d2);
	if(isdefined(var_28c547d2) && isdefined(level.var_31a08449))
	{
		var_28c547d2 moveto(level.var_31a08449 gettagorigin("tag_origin") + vectorscale((0, 0, 1), 10), 0.75);
		level.var_31a08449 function_bc82f900(#"hash_4841d74556467e90");
		var_28c547d2 waittill(#"movedone");
		if(isdefined(var_28c547d2))
		{
			var_28c547d2 delete();
		}
	}
}

/*
	Name: function_9a3d73f5
	Namespace: namespace_36ebd7e4
	Checksum: 0x75A6EF72
	Offset: 0x1AA0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_9a3d73f5(var_a276c861, var_19e802fa)
{
	level flag::set(#"hash_61b2ca3ce72d604d");
	level flag::set(#"hash_7992dc29375ff937");
	level flag::set(#"hash_3314158279a61f07");
	level flag::set(#"hash_44fbd1c2094bd9dd");
	level flag::set(#"hash_49e515cdcf4bb8db");
	function_8ee1ba57();
	level flag::set(#"in_dark_side");
}

/*
	Name: function_33773548
	Namespace: namespace_36ebd7e4
	Checksum: 0x850ACC08
	Offset: 0x1B90
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function function_33773548()
{
	/#
		self endon(#"death");
		while(true)
		{
			circle(self.origin, 10, (0, 0, 1));
			waitframe(1);
		}
	#/
}

/*
	Name: function_bc64a2fc
	Namespace: namespace_36ebd7e4
	Checksum: 0xD5EFFAD4
	Offset: 0x1BE8
	Size: 0x538
	Parameters: 1
	Flags: Linked
*/
function function_bc64a2fc(var_a276c861)
{
	level endon(#"hash_40f6eac419f5f36a");
	level flag::set("enable_bunny_room_zone");
	level flag::clear("spawn_zombies");
	level zm_utility::function_9ad5aeb1(1, 1, 1, 0);
	var_6d9ae982 = struct::get_array("gd_bny_rm_spn");
	foreach(player in function_a1ef346b())
	{
		if(player zm_zonemgr::is_player_in_zone(level.var_4b35561a, 0))
		{
			player.var_740db6b6 = "firebase";
		}
		else
		{
			player.var_740db6b6 = "village";
		}
		n_index = zm_fasttravel::get_player_index(player);
		var_3c1597cb = var_6d9ae982[n_index];
		var_3c1597cb.origin = var_3c1597cb.origin + vectorscale((0, 0, 1), 50);
		player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_3c1597cb, undefined, "bunny_room_teleport", 0, 0, 0, 1);
	}
	wait(3);
	var_3d2a6487 = getent("gd_dk_bny", "targetname");
	if(isdefined(var_3d2a6487))
	{
		var_3d2a6487 delete();
	}
	/#
		iprintlnbold("");
	#/
	level thread function_869127f6();
	level thread function_8bde8ea6();
	level.var_e3a52930 = 0;
	level.var_ea98bd02 = 120;
	while(level.var_e3a52930 < level.var_ea98bd02)
	{
		level.var_e3a52930 = level.var_e3a52930 + 1;
		/#
			iprintln("" + level.var_e3a52930);
		#/
		wait(1);
	}
	level notify(#"hash_530c86fd42b1812f");
	foreach(player in function_a1ef346b())
	{
		n_index = zm_fasttravel::get_player_index(player);
		if(!isdefined(player.var_740db6b6))
		{
			player.var_740db6b6 = "village";
		}
		var_4cfd3626 = struct::get((player.var_740db6b6 + "_end_") + n_index);
		player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_4cfd3626, undefined, "bunny_room_teleport", 0, 0, 0, 1);
	}
	level zm_utility::function_9ad5aeb1(1, 1, 1, 0);
	wait(3);
	level flag::set("spawn_zombies");
	level flag::clear(#"hash_49e515cdcf4bb8db");
	foreach(player in function_a1ef346b())
	{
		player clientfield::set_to_player("" + #"hash_69dc133e22a2769f", 0);
	}
}

/*
	Name: function_869127f6
	Namespace: namespace_36ebd7e4
	Checksum: 0xC30BAF9E
	Offset: 0x2128
	Size: 0x3D4
	Parameters: 0
	Flags: Linked
*/
function function_869127f6()
{
	level endon(#"end_game", #"hash_530c86fd42b1812f");
	var_f885c11b = 0;
	var_1ad915a8 = struct::get_array("gd_dk_bny_sp_init");
	var_395374db = struct::get_array("gd_dk_bny_sp");
	scene::add_scene_func(#"hash_68710fac299c41dd", &function_ea2f5d05, "dance");
	while(true)
	{
		if(var_f885c11b == 0)
		{
			var_c21a31f7 = array::random(var_1ad915a8);
		}
		else
		{
			var_c21a31f7 = array::random(var_395374db);
			arrayremovevalue(var_395374db, var_c21a31f7);
			level thread function_338329dd();
		}
		level.var_7a5b491e = util::spawn_model(#"hash_35eb10c0021b1cc0", var_c21a31f7.origin, var_c21a31f7.angles);
		playsoundatposition(#"hash_6b1f0de3bf8e1ff9", var_c21a31f7.origin);
		level.var_7a5b491e thread scene::play(#"hash_68710fac299c41dd", "dance", level.var_7a5b491e);
		level.var_7a5b491e clientfield::set("" + #"hash_7b253f73f6f094c6", 1);
		level.var_7a5b491e thread function_b23d16b9();
		level waittill(#"hash_79ee6459bad2f964");
		playsoundatposition(#"hash_5db33a6d409db81c", var_c21a31f7.origin);
		level.var_7a5b491e clientfield::set("" + #"hash_7b253f73f6f094c6", 0);
		level.var_7a5b491e ghost();
		var_f885c11b = var_f885c11b + 1;
		wait(randomintrange(3, 6));
		level scene::delete_scene_spawned_ents(#"hash_68710fac299c41dd");
		if(isdefined(level.var_7a5b491e))
		{
			level.var_7a5b491e delete();
		}
		if(var_f885c11b == 3)
		{
			break;
		}
	}
	scene::remove_scene_func(#"hash_68710fac299c41dd", &function_ea2f5d05, "dance");
	level flag::set("ghost_bunny_dead");
	level zm_utility::function_9ad5aeb1(1, 1, 1, 0);
	level.var_ea98bd02 = level.var_e3a52930 + 30;
	level function_70b8bf8f();
}

/*
	Name: function_b23d16b9
	Namespace: namespace_36ebd7e4
	Checksum: 0x6C657594
	Offset: 0x2508
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_b23d16b9()
{
	self endon(#"death");
	self setcandamage(1);
	self.health = 500;
	while(self.health > 0)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(waitresult.amount > 0)
		{
			self.health = self.health - waitresult.amount;
			/#
				iprintlnbold("" + self.health);
			#/
		}
	}
	level notify(#"hash_79ee6459bad2f964");
}

/*
	Name: function_ea2f5d05
	Namespace: namespace_36ebd7e4
	Checksum: 0x23BA2DB4
	Offset: 0x25F0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_ea2f5d05(a_ents)
{
	ent = a_ents[#"hash_26c68883043990a6"];
	var_28c547d2 = util::spawn_model("tag_origin", ent.origin, ent.angles);
	ent linkto(var_28c547d2);
	var_28c547d2 bobbing((0, 0, 1), randomfloatrange(5, 20), randomfloatrange(3, 6));
}

/*
	Name: function_70b8bf8f
	Namespace: namespace_36ebd7e4
	Checksum: 0x1DFAFB62
	Offset: 0x26C0
	Size: 0x2D4
	Parameters: 0
	Flags: Linked
*/
function function_70b8bf8f()
{
	foreach(destination in level.var_7d45d0d4.destinations)
	{
		if(destination.targetname === #"hash_33a292caff20dd7a")
		{
			foreach(location in destination.locations)
			{
				var_19845e62 = location.instances[#"explore_chests"];
				if(isdefined(var_19845e62))
				{
					namespace_8b6a9d79::function_20d7e9c7(var_19845e62);
				}
			}
		}
	}
	while(true)
	{
		wait(0.5);
		if(isdefined(level.var_8634611a))
		{
			break;
		}
	}
	foreach(chest in level.var_8634611a)
	{
		if(chest.target === "loot_dest_crate")
		{
			level.var_15140b8d = chest;
			level.var_15140b8d.var_f3a3c164 = 1;
		}
	}
	/#
		assert(isdefined(level.var_15140b8d));
	#/
	level.var_15140b8d.scriptmodel solid();
	level.var_15140b8d.trigger.var_cc1fb2d0 = #"hash_2c38a7d6a634dee2";
	level.var_15140b8d thread function_4dad3cb6();
	level.var_15140b8d util::delay(300, "chest_opened", &function_3076a002);
}

/*
	Name: function_4dad3cb6
	Namespace: namespace_36ebd7e4
	Checksum: 0x6CBB0E4
	Offset: 0x29A0
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_4dad3cb6()
{
	level endon(#"hash_40f6eac419f5f36a");
	self endon(#"death");
	self.trigger endon(#"death");
	playsoundatposition(#"hash_78ab7aaf4da20422", self.origin);
	self.var_e886e882 = spawn("script_origin", self.origin);
	self.var_e886e882 playloopsound(#"hash_5376822de0ce03cd");
	self.trigger waittill(#"chest_opened");
	self notify(#"chest_opened");
	self.var_e886e882 stoploopsound(1);
	self util::delay(5, undefined, &function_3076a002);
	self.var_e886e882 delete();
}

/*
	Name: function_3076a002
	Namespace: namespace_36ebd7e4
	Checksum: 0xB9A844D2
	Offset: 0x2AF8
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_3076a002()
{
	self endon(#"death");
	chest = self.scriptmodel;
	trigger = self.trigger;
	if(isdefined(chest))
	{
		chest thread item_world::loop_sound("wpn_semtex_alert", 0.84);
		chest clientfield::set("supply_drop_fx", 0);
		util::wait_network_frame(1);
	}
	wait(5);
	if(isdefined(chest))
	{
		chest scene::stop();
		playfx(#"hash_131031222bb89ea", chest.origin);
		playsoundatposition(#"wpn_grenade_explode", chest.origin);
		chest radiusdamage(chest.origin, 128, 50, 10, undefined, "MOD_EXPLOSIVE", getweapon(#"supplydrop"));
		chest delete();
	}
	if(isdefined(self.var_e886e882))
	{
		self.var_e886e882 delete();
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
}

/*
	Name: function_338329dd
	Namespace: namespace_36ebd7e4
	Checksum: 0x8A38927
	Offset: 0x2CC8
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function function_338329dd()
{
	level endon(#"end_game", #"hash_530c86fd42b1812f");
	all_players = getplayers();
	var_2759574a = int(((all_players.size - 1) / 2) + 1);
	var_2dba2234 = 6;
	var_394b1a2f = [];
	var_dbc18a74 = struct::get_array("riser_location", "script_noteworthy");
	while(!level flag::get("ghost_bunny_dead"))
	{
		var_1ad68a6d = [];
		if(var_394b1a2f.size < var_2759574a)
		{
			foreach(spawner in var_dbc18a74)
			{
				foreach(player in all_players)
				{
					if(isdefined(spawner) && isalive(player) && distancesquared(spawner.origin, player.origin) > 1000000 && distancesquared(spawner.origin, player.origin) < 2250000)
					{
						if(!isdefined(var_1ad68a6d))
						{
							var_1ad68a6d = [];
						}
						else if(!isarray(var_1ad68a6d))
						{
							var_1ad68a6d = array(var_1ad68a6d);
						}
						var_1ad68a6d[var_1ad68a6d.size] = spawner;
					}
				}
			}
			if(is_false(var_1ad68a6d.size))
			{
				waitframe(1);
				continue;
			}
			random_spawner = array::random(var_1ad68a6d);
			ai = spawnactor("spawner_bo5_mimic", random_spawner.origin, random_spawner.angles);
			if(isdefined(ai))
			{
				set_zombie(ai);
				if(!isdefined(var_394b1a2f))
				{
					var_394b1a2f = [];
				}
				else if(!isarray(var_394b1a2f))
				{
					var_394b1a2f = array(var_394b1a2f);
				}
				var_394b1a2f[var_394b1a2f.size] = ai;
			}
		}
		wait(var_2dba2234);
	}
}

/*
	Name: function_8bde8ea6
	Namespace: namespace_36ebd7e4
	Checksum: 0x1539C12B
	Offset: 0x3068
	Size: 0x4AE
	Parameters: 0
	Flags: Linked
*/
function function_8bde8ea6()
{
	level endon(#"end_game", #"hash_530c86fd42b1812f");
	all_players = getplayers();
	var_b4875974 = (all_players.size * 2) + 4;
	var_9cbc3287 = [];
	var_633be68c = struct::get_array("first_round", "round_note");
	var_dbc18a74 = struct::get_array("riser_location", "script_noteworthy");
	var_2ce40fd3 = 0;
	while(var_2ce40fd3 < 6)
	{
		ai = spawnactor("spawner_bo5_zombie_zm_gold", var_633be68c[var_2ce40fd3].origin, var_633be68c[var_2ce40fd3].angles);
		set_zombie(ai);
		if(isdefined(ai))
		{
			ai thread function_e6020995();
			if(!isdefined(var_9cbc3287))
			{
				var_9cbc3287 = [];
			}
			else if(!isarray(var_9cbc3287))
			{
				var_9cbc3287 = array(var_9cbc3287);
			}
			var_9cbc3287[var_9cbc3287.size] = ai;
			var_2ce40fd3 = var_2ce40fd3 + 1;
		}
		waitframe(1);
	}
	while(!level flag::get("ghost_bunny_dead"))
	{
		var_1ad68a6d = [];
		if(var_9cbc3287.size < var_b4875974)
		{
			foreach(spawner in var_dbc18a74)
			{
				foreach(player in all_players)
				{
					if(isdefined(spawner) && isalive(player) && distancesquared(spawner.origin, player.origin) > 1000000 && distancesquared(spawner.origin, player.origin) < 2250000)
					{
						if(!isdefined(var_1ad68a6d))
						{
							var_1ad68a6d = [];
						}
						else if(!isarray(var_1ad68a6d))
						{
							var_1ad68a6d = array(var_1ad68a6d);
						}
						var_1ad68a6d[var_1ad68a6d.size] = spawner;
					}
				}
			}
			if(is_false(var_1ad68a6d.size))
			{
				waitframe(1);
				continue;
			}
			random_spawner = array::random(var_1ad68a6d);
			ai = spawnactor("spawner_bo5_zombie_zm_gold", random_spawner.origin, random_spawner.angles);
			if(isdefined(ai))
			{
				set_zombie(ai);
				ai thread function_e6020995();
				if(!isdefined(var_9cbc3287))
				{
					var_9cbc3287 = [];
				}
				else if(!isarray(var_9cbc3287))
				{
					var_9cbc3287 = array(var_9cbc3287);
				}
				var_9cbc3287[var_9cbc3287.size] = ai;
			}
		}
		function_1eaaceab(var_9cbc3287);
		wait(1);
	}
}

/*
	Name: set_zombie
	Namespace: namespace_36ebd7e4
	Checksum: 0xC1016D07
	Offset: 0x3520
	Size: 0x44E
	Parameters: 1
	Flags: Linked, Private
*/
function private set_zombie(e_zombie)
{
	if(isdefined(e_zombie))
	{
		e_zombie.var_126d7bef = 1;
		e_zombie.ignore_round_spawn_failsafe = 1;
		e_zombie.b_ignore_cleanup = 1;
		e_zombie.ignore_enemy_count = 1;
		e_zombie.no_powerups = 1;
		if(level.round_number >= e_zombie ai::function_9139c839().var_15c336d1[6].start_round)
		{
			e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[6].var_928e93a0 * 5));
		}
		else
		{
			if(level.round_number >= e_zombie ai::function_9139c839().var_15c336d1[5].start_round)
			{
				e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[5].var_928e93a0 * 5));
			}
			else
			{
				if(level.round_number >= e_zombie ai::function_9139c839().var_15c336d1[4].start_round)
				{
					e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[4].var_928e93a0 * 5));
				}
				else
				{
					if(level.round_number >= e_zombie ai::function_9139c839().var_15c336d1[3].start_round)
					{
						e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[3].var_928e93a0 * 5));
					}
					else
					{
						if(level.round_number >= e_zombie ai::function_9139c839().var_15c336d1[2].start_round)
						{
							e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[2].var_928e93a0 * 5));
						}
						else
						{
							if(level.round_number >= e_zombie ai::function_9139c839().var_15c336d1[1].start_round)
							{
								e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[1].var_928e93a0 * 5));
							}
							else
							{
								e_zombie.health = e_zombie.health + (int(e_zombie ai::function_9139c839().var_15c336d1[0].var_928e93a0 * 5));
							}
						}
					}
				}
			}
		}
		e_zombie.zombie_move_speed = "sprint";
		e_zombie pathmode("move allowed");
		e_zombie.completed_emerging_into_playable_area = 1;
		e_zombie.zombie_think_done = 1;
	}
}

/*
	Name: function_e6020995
	Namespace: namespace_36ebd7e4
	Checksum: 0x1814AD28
	Offset: 0x3978
	Size: 0x250
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e6020995()
{
	self endon(#"death");
	wait(3);
	while(true)
	{
		n_index = randomint(6);
		if(isalive(self) && isdefined(level.var_7a5b491e) && distancesquared(self.origin, level.var_7a5b491e.origin) < 90000)
		{
			switch(n_index)
			{
				case 0:
				{
					self thread animation::play(#"hash_1aa9da42f97e0c7d");
					break;
				}
				case 1:
				{
					self thread animation::play(#"hash_1aa9d442f97e024b");
					break;
				}
				case 2:
				{
					self thread animation::play(#"hash_1aa9d542f97e03fe");
					break;
				}
				case 3:
				{
					self thread animation::play(#"hash_1aa9cf42f97df9cc");
					break;
				}
				case 4:
				{
					self thread animation::play(#"hash_1aad5d42f98120ed");
					break;
				}
				case 5:
				{
					self thread animation::play(#"hash_1aad5c42f9811f3a");
					break;
				}
			}
			self waittill(#"hash_7c906ecb1e33d16");
			self animation::stop();
		}
		wait(randomintrange(10, 20));
	}
}

/*
	Name: function_5339496c
	Namespace: namespace_36ebd7e4
	Checksum: 0x6FE8C596
	Offset: 0x3BD0
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_5339496c(var_a276c861, var_19e802fa)
{
	level flag::clear(#"in_dark_side");
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_40f6eac419f5f36a");
	}
}

/*
	Name: function_f68bd85b
	Namespace: namespace_36ebd7e4
	Checksum: 0xDCF2540F
	Offset: 0x3C40
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_f68bd85b(var_a276c861)
{
	level endon(#"end_game", #"hash_e70ff3437d15f62");
	var_1a874f11 = 0;
	while(var_1a874f11 < 63)
	{
		s_result = undefined;
		s_result = level waittill(#"hash_cb2d8c59ec2fc84");
		var_1a874f11 = var_1a874f11 | (1 << (s_result.var_b8e13043 - 1));
	}
}

/*
	Name: function_a10cd1d4
	Namespace: namespace_36ebd7e4
	Checksum: 0x784AB495
	Offset: 0x3CE0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_a10cd1d4(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_e70ff3437d15f62");
	}
}

/*
	Name: function_513e5d8e
	Namespace: namespace_36ebd7e4
	Checksum: 0x409E3D14
	Offset: 0x3D30
	Size: 0x380
	Parameters: 1
	Flags: Linked
*/
function function_513e5d8e(var_a276c861)
{
	level endon(#"end_game", #"hash_e70fe3437d15daf");
	var_1cc461e0 = [5:[4:0, 3:270, 2:90, 1:0, 0:90], 4:[4:180, 3:90, 2:270, 1:90, 0:0], 3:[4:0, 3:270, 2:90, 1:270, 0:180], 2:[4:270, 3:180, 2:0, 1:90, 0:270], 1:[4:0, 3:180, 2:0, 1:180, 0:0], 0:[4:90, 3:270, 2:90, 1:270, 0:90]];
	var_f3ebc5a2 = getentarray("flinger_pad_aimer", "targetname");
	var_8b93416f = 1;
	jump_pad = array::random(var_f3ebc5a2);
	while(isdefined(jump_pad))
	{
		jump_pad childthread function_db5c2d6a(var_8b93416f, var_1cc461e0[jump_pad.script_int - 1]);
		result = undefined;
		result = jump_pad waittill(#"hash_342385e92a15b40");
		if(is_true(result.success))
		{
			arrayremovevalue(var_f3ebc5a2, jump_pad);
			var_8b93416f = 0;
			jump_pad = function_83a84bcc(jump_pad, var_f3ebc5a2);
		}
		else
		{
			var_f3ebc5a2 = getentarray("flinger_pad_aimer", "targetname");
			var_8b93416f = 1;
			jump_pad = array::random(var_f3ebc5a2);
			level waittill(#"start_of_round");
		}
	}
	/#
		iprintlnbold("");
	#/
	level.var_d99df9f9 = 0;
}

/*
	Name: function_af1af946
	Namespace: namespace_36ebd7e4
	Checksum: 0x9FD57806
	Offset: 0x40B8
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_af1af946(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level.var_d99df9f9 = 0;
		level flag::set(#"hash_e70fe3437d15daf");
	}
}

/*
	Name: function_83a84bcc
	Namespace: namespace_36ebd7e4
	Checksum: 0x8548C057
	Offset: 0x4118
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_83a84bcc(var_b10c41a6, var_f5d2b231)
{
	if(!isdefined(var_f5d2b231) || var_f5d2b231.size == 0)
	{
		return;
	}
	var_10a95a2 = var_f5d2b231[0];
	foreach(pad in var_f5d2b231)
	{
		if(pad.var_b555f02e === var_b10c41a6.landing_pad.var_b555f02e)
		{
			var_10a95a2 = pad;
			if(pad.landing_pad.var_b555f02e !== var_b10c41a6.var_b555f02e)
			{
				break;
			}
		}
	}
	return var_10a95a2;
}

/*
	Name: function_4b391364
	Namespace: namespace_36ebd7e4
	Checksum: 0xA7D0024
	Offset: 0x4220
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_4b391364()
{
	self endon(#"jump_pad_quest_start");
	wait(40);
	self setcandamage(0);
	self clientfield::set("" + #"hash_4566af74eca7b0fc", 0);
	self notify(#"hash_342385e92a15b40", {#success:0});
}

/*
	Name: function_f340c8b
	Namespace: namespace_36ebd7e4
	Checksum: 0xFCC5D989
	Offset: 0x42B0
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function function_f340c8b()
{
	self endon(#"hash_342385e92a15b40");
	level flag::wait_till_clear("power_on" + self.var_b555f02e);
	self setcandamage(0);
	self clientfield::set("" + #"hash_4566af74eca7b0fc", 0);
	self notify(#"hash_342385e92a15b40", {#success:0});
}

/*
	Name: function_db5c2d6a
	Namespace: namespace_36ebd7e4
	Checksum: 0xF6AD4C
	Offset: 0x4368
	Size: 0x846
	Parameters: 2
	Flags: Linked
*/
function function_db5c2d6a(var_8b93416f, var_ea14a37)
{
	self endon(#"hash_342385e92a15b40");
	/#
		iprintlnbold(("" + self.script_int) + "");
	#/
	level flag::wait_till("power_on" + self.var_b555f02e);
	self thread function_f340c8b();
	self setcandamage(1);
	self clientfield::set("" + #"hash_4566af74eca7b0fc", 1);
	if(!is_true(var_8b93416f))
	{
		self childthread function_4b391364();
	}
	var_9e88794c = self gettagorigin("tag_light_blue_fx");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(isplayer(s_result.attacker) && distancesquared(var_9e88794c, s_result.position) < 25)
		{
			player = s_result.attacker;
			break;
		}
	}
	self setcandamage(0);
	self clientfield::set("" + #"hash_4566af74eca7b0fc", 0);
	wait(1);
	var_9705c93d = 90;
	var_54913776 = vectorscale((0, 0, 1), 10) + (anglestoright(self.angles) * 4);
	/#
		sphere(self.origin + var_54913776, 10, (1, 0, 0), 1, 1, 8, 200);
	#/
	self flag::set("jump_pad_quest_start");
	self.var_37db5cf = 1;
	self.var_63c8edf4 setmodel(#"hash_229ea252394102ef");
	self.var_43032f5e setmodel(#"hash_612ce9acf731e7c2");
	self.var_63c8edf4 playsound(#"hash_419b0b0f8e28e936");
	wait(1);
	self.var_43032f5e setmodel(#"hash_612ceaacf731e975");
	self.var_63c8edf4 playsound(#"hash_419b0c0f8e28eae9");
	wait(1);
	self.var_43032f5e setmodel(#"hash_612ce7acf731e45c");
	self.var_63c8edf4 playsound(#"hash_419b090f8e28e5d0");
	wait(1);
	self.var_43032f5e setmodel(#"hash_cbac724d17f7914");
	self.var_63c8edf4 playsound(#"hash_635ee326c0c9c783");
	var_bc6423c3 = self.var_43032f5e.angles;
	var_f5c28fe2 = 1;
	count = 1;
	foreach(dir in var_ea14a37)
	{
		self.var_43032f5e.angles = var_bc6423c3 + (0, dir, 0);
		switch(dir)
		{
			case 0:
			{
				self.var_63c8edf4 setmodel(#"hash_49b66d6eecdd601d");
				break;
			}
			case 90:
			{
				self.var_63c8edf4 setmodel(#"hash_66f6d645c0e69071");
				break;
			}
			case 180:
			{
				self.var_63c8edf4 setmodel(#"hash_5c1474042a8ce47c");
				break;
			}
			case 270:
			default:
			{
				self.var_63c8edf4 setmodel(#"hash_f057eb0c68cb8d2");
				break;
			}
		}
		wait(1);
		if(!isalive(player) || !player istouching(self.vol_fling) || !function_1cfdff7(self.var_43032f5e.angles[1] + var_9705c93d, (player.origin - self.origin) - var_54913776))
		{
			self.var_43032f5e setmodel(#"hash_475b514611cd4cdd");
			self.var_63c8edf4 playsound(#"hash_1798f5d0c8b1d475");
			var_f5c28fe2 = 0;
			wait(1);
			break;
			continue;
		}
		self.var_63c8edf4 playsound(#"hash_7a0028d96ef7f55" + count);
		count++;
	}
	if(is_true(var_f5c28fe2))
	{
		player thread namespace_47809ab2::function_c14f39dc(self.var_2ddd9b0c, self.landing_pad);
	}
	self flag::clear("jump_pad_quest_start");
	self.var_43032f5e.angles = var_bc6423c3;
	self.var_43032f5e setmodel(#"hash_cbac724d17f7914");
	self.var_63c8edf4 setmodel(#"hash_229ea252394102ef");
	self notify(#"hash_342385e92a15b40", {#success:var_f5c28fe2});
}

/*
	Name: function_1cfdff7
	Namespace: namespace_36ebd7e4
	Checksum: 0x1B95E1A9
	Offset: 0x4BB8
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_1cfdff7(arrow, var_aeaa1097)
{
	if(lengthsquared(var_aeaa1097) < 100)
	{
		return 0;
	}
	angles = vectortoangles(var_aeaa1097);
	return (abs(zombie_utility::safemod(angles[1], 360) - zombie_utility::safemod(arrow, 360))) <= 45;
}

/*
	Name: function_afb809d7
	Namespace: namespace_36ebd7e4
	Checksum: 0x51A177E
	Offset: 0x4C60
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_afb809d7(var_a276c861)
{
	level endon(#"end_game", #"hash_75f28a624e35884c");
	level.var_b1b99545 = 0;
	level.var_3d1077ef = [2:"zone_artillery_strike2", 1:"zone_napalm_strike2", 0:"zone_chopper_gunner3"];
	callback::on_ai_killed(&function_e5a2222e);
	level flag::wait_till(#"hash_29e9351d681a04e5");
	callback::remove_on_ai_killed(&function_e5a2222e);
	level.var_e3d7278e = &function_9ad2468d;
	level.var_6df2b61b = &function_b9fda9d9;
	level.var_c50ca517 = &function_bc59d0f7;
}

/*
	Name: function_9ad2468d
	Namespace: namespace_36ebd7e4
	Checksum: 0xB810A7AB
	Offset: 0x4D98
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_9ad2468d(var_bdd70f6a)
{
	var_bdd70f6a clientfield::set("" + #"hash_5b7ac337732b7e59", 1);
}

/*
	Name: function_bc59d0f7
	Namespace: namespace_36ebd7e4
	Checksum: 0xD68EFD51
	Offset: 0x4DE8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_bc59d0f7(var_bdd70f6a)
{
	var_bdd70f6a playsound(#"hash_2e0a8e856540bd82");
}

/*
	Name: function_b9fda9d9
	Namespace: namespace_36ebd7e4
	Checksum: 0xF6706216
	Offset: 0x4E20
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_b9fda9d9(var_bdd70f6a, zombie)
{
	var_caf81ae5 = var_bdd70f6a.origin;
	function_3bb0b75b(var_bdd70f6a, zombie);
	if(isalive(zombie) && distancesquared(zombie.origin, var_caf81ae5) < 30625)
	{
		zombie animation::stop();
		zombie dodamage(zombie.health, var_caf81ae5, undefined, undefined, undefined, "MOD_EXPLOSIVE", 0, getweapon(#"cymbal_monkey"));
	}
}

/*
	Name: function_3bb0b75b
	Namespace: namespace_36ebd7e4
	Checksum: 0x19397876
	Offset: 0x4F10
	Size: 0x3AC
	Parameters: 2
	Flags: Linked
*/
function function_3bb0b75b(var_bdd70f6a, zombie)
{
	var_bdd70f6a endon(#"death");
	zombie endon(#"death");
	while(true)
	{
		n_index = randomint(13);
		if(isalive(zombie) && distancesquared(zombie.origin, var_bdd70f6a.origin) < 10000)
		{
			switch(n_index)
			{
				case 0:
				{
					zombie animation::play(#"hash_1aa9d842f97e0917");
					break;
				}
				case 1:
				{
					zombie animation::play(#"hash_1aa9d942f97e0aca");
					break;
				}
				case 2:
				{
					zombie animation::play(#"hash_1aa9da42f97e0c7d");
					break;
				}
				case 3:
				{
					zombie animation::play(#"hash_1aa9d342f97e0098");
					break;
				}
				case 4:
				{
					zombie animation::play(#"hash_1aa9d442f97e024b");
					break;
				}
				case 5:
				{
					zombie animation::play(#"hash_1aa9d542f97e03fe");
					break;
				}
				case 6:
				{
					zombie animation::play(#"hash_1aa9d642f97e05b1");
					break;
				}
				case 7:
				{
					zombie animation::play(#"hash_1aa9cf42f97df9cc");
					break;
				}
				case 8:
				{
					zombie animation::play(#"hash_1aa9d042f97dfb7f");
					break;
				}
				case 9:
				{
					zombie animation::play(#"hash_1aad5d42f98120ed");
					break;
				}
				case 10:
				{
					zombie animation::play(#"hash_1aad5c42f9811f3a");
					break;
				}
				case 11:
				{
					zombie animation::play(#"hash_1aad5b42f9811d87");
					break;
				}
				case 12:
				{
					zombie animation::play(#"hash_1aad5a42f9811bd4");
					break;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_e5a2222e
	Namespace: namespace_36ebd7e4
	Checksum: 0x73832D1B
	Offset: 0x52C8
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_e5a2222e(params)
{
	if(self.damagemod === "MOD_GRENADE_SPLASH" || self.damagemod === "MOD_GRENADE" && self.damageweapon.name === #"cymbal_monkey" && isinarray(level.var_3d1077ef, self.zone_name))
	{
		level.var_b1b99545 = level.var_b1b99545 + 1;
		if(level.var_b1b99545 == 50)
		{
			level flag::set(#"hash_29e9351d681a04e5");
		}
	}
}

/*
	Name: function_a7f8da0d
	Namespace: namespace_36ebd7e4
	Checksum: 0xA8388D14
	Offset: 0x53A8
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_a7f8da0d(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level notify(#"hash_75f28a624e35884c");
	}
}

/*
	Name: function_519f3aff
	Namespace: namespace_36ebd7e4
	Checksum: 0xD1ABE19E
	Offset: 0x53E8
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function function_519f3aff(var_a276c861)
{
	level endon(#"hash_30d9e190de76db69");
	level.var_e4731251 = getweapon("equip_head_zm");
	level flag::wait_till("start_zombie_round_logic");
	var_b7cf8332 = struct::get_array("go_he_lo", "targetname");
	level.var_2572cd3 = array::random(var_b7cf8332);
	level.e_head = level spawn_head(level.var_2572cd3.origin, level.var_2572cd3.angles);
	level.var_241680d0 = getent("pl_fo_he", "targetname");
	var_5bbca559 = level.var_241680d0 zm_unitrigger::create(&function_3ef21627, 64, &function_db1c9b86);
	zm_unitrigger::unitrigger_force_per_player_triggers(var_5bbca559, 1);
	/#
		level.var_241680d0 thread function_363c7e7e((1, 0, 0));
	#/
	level.var_e59aeca1 = getent("pl_fo_tr", "targetname");
	var_ea432ca4 = level.var_e59aeca1 zm_unitrigger::create(&function_bc81184, 64, &function_fa9f55e0);
	zm_unitrigger::unitrigger_force_per_player_triggers(var_ea432ca4, 1);
	/#
		level.var_e59aeca1 thread function_363c7e7e((1, 0, 0));
	#/
	level thread function_2f6288d8();
	callback::on_item_pickup(&function_e1ea43c1);
	callback::on_disconnect(&function_2085bf3b);
	zm_player::function_a827358a(&function_8f9ea01c);
	level flag::wait_till(#"hash_66609c56bb848409");
}

/*
	Name: function_bd8fd5ea
	Namespace: namespace_36ebd7e4
	Checksum: 0xC289154B
	Offset: 0x56C8
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_bd8fd5ea(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_30d9e190de76db69");
		level flag::set(#"hash_3dff248b4edaface");
		level flag::set(#"hash_2e43edba67c87ef1");
	}
	callback::remove_callback(#"on_item_pickup", &function_e1ea43c1);
	callback::remove_on_disconnect(&function_2085bf3b);
}

/*
	Name: spawn_head
	Namespace: namespace_36ebd7e4
	Checksum: 0x343DBD7D
	Offset: 0x57A8
	Size: 0xB8
	Parameters: 2
	Flags: Linked, Private
*/
function private spawn_head(v_position, v_angles)
{
	if(!isdefined(v_angles))
	{
		v_angles = (0, 0, 0);
	}
	point = function_4ba8fde(#"hash_1680835628ff9442");
	e_head = item_drop::drop_item(0, undefined, 1, 0, point.id, v_position, v_angles, 0);
	e_head.var_dd21aec2 = 1 | 16;
	/#
		e_head thread function_363c7e7e();
	#/
	return e_head;
}

/*
	Name: function_8f9ea01c
	Namespace: namespace_36ebd7e4
	Checksum: 0x7D85645
	Offset: 0x5868
	Size: 0xB6
	Parameters: 10
	Flags: Linked
*/
function function_8f9ea01c(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(psoffsettime >= self.health)
	{
		if(self getcurrentweapon() === level.var_e4731251)
		{
			self notify(#"hash_51f42e32ad596022", {#str_result:"dropped"});
		}
	}
}

/*
	Name: function_2085bf3b
	Namespace: namespace_36ebd7e4
	Checksum: 0x1FEEB7A
	Offset: 0x5928
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_2085bf3b()
{
	if(!self util::is_spectating())
	{
		var_2e07b8ff = self getweaponslistprimaries();
		foreach(w_weapon in var_2e07b8ff)
		{
			if(w_weapon === level.var_e4731251)
			{
				self function_98957f5b();
				level thread function_6413e9b();
				callback::remove_on_weapon_change(&function_2c951177);
				callback::function_824d206(&function_2056cd79);
				break;
			}
		}
	}
}

/*
	Name: function_2c951177
	Namespace: namespace_36ebd7e4
	Checksum: 0xC010B472
	Offset: 0x5A60
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_2c951177(s_params)
{
	self notify(#"hash_31f98f1ef1f33ee1", {#str_result:"dropped"});
}

/*
	Name: function_2056cd79
	Namespace: namespace_36ebd7e4
	Checksum: 0x996AC701
	Offset: 0x5AA0
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_2056cd79(s_event)
{
	w_weapon = s_event.weapon;
	if(w_weapon.inventorytype === "ability")
	{
		return;
	}
	if(s_event.event === "take_weapon" && (w_weapon.inventorytype === "offhand" || w_weapon.inventorytype === "offhand_primary"))
	{
		return;
	}
	self notify(#"hash_31f98f1ef1f33ee1", {#str_result:"dropped"});
}

/*
	Name: function_8ee22ffd
	Namespace: namespace_36ebd7e4
	Checksum: 0x75BFFC3B
	Offset: 0x5B60
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_8ee22ffd()
{
	self endon(#"disconnect", #"hash_31f98f1ef1f33ee1", #"fake_death");
	self waittill(#"hash_4506f189fa360331");
	self notify(#"hash_31f98f1ef1f33ee1", {#str_result:"dropped"});
}

/*
	Name: function_2f6288d8
	Namespace: namespace_36ebd7e4
	Checksum: 0xE4E721F5
	Offset: 0x5BE0
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_2f6288d8()
{
	level endon(#"end_game");
	level flag::wait_till_all([1:#"hash_2e43edba67c87ef1", 0:#"hash_3dff248b4edaface"]);
	wait(0.5);
	level thread scene::play(#"hash_3cf9d0aa24d89124");
	if(isdefined(level.var_241680d0))
	{
		level.var_241680d0 zm_vo::function_d6f8bbd9(#"hash_48c3d73a5d86ca7f");
		level.var_241680d0 zm_vo::function_d6f8bbd9(#"hash_48c3d63a5d86c8cc");
		level.var_241680d0 zm_vo::function_d6f8bbd9(#"hash_48c3d93a5d86cde5");
	}
	level flag::set(#"hash_66609c56bb848409");
}

/*
	Name: function_47eb7a7a
	Namespace: namespace_36ebd7e4
	Checksum: 0x1270206A
	Offset: 0x5D20
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_47eb7a7a()
{
	return zm_utility::is_player_valid(self) && self getcurrentweapon() === level.var_e4731251 && !self isswitchingweapons();
}

/*
	Name: function_3ef21627
	Namespace: namespace_36ebd7e4
	Checksum: 0xC4C41D63
	Offset: 0x5D80
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_3ef21627(e_player)
{
	if(e_player function_47eb7a7a())
	{
		self sethintstringforplayer(e_player, #"hash_4133c0a101080e7b");
		return true;
	}
	return false;
}

/*
	Name: function_db1c9b86
	Namespace: namespace_36ebd7e4
	Checksum: 0x3218C852
	Offset: 0x5DE0
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_db1c9b86()
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	e_player = waitresult.activator;
	if(e_player function_47eb7a7a())
	{
		level scene::init(#"hash_3cf9d0aa24d89124");
		playsoundatposition(#"hash_384b11f9c14189aa", level.var_241680d0.origin);
		/#
			iprintlnbold("");
		#/
		level flag::set(#"hash_3dff248b4edaface");
		e_player function_bc82f900(#"hash_3937704286348bfa");
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_b3c7ab29
	Namespace: namespace_36ebd7e4
	Checksum: 0xFD7F249A
	Offset: 0x5F18
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b3c7ab29()
{
	return zm_utility::is_player_valid(self) && isdefined(self.var_646dca28);
}

/*
	Name: function_bc81184
	Namespace: namespace_36ebd7e4
	Checksum: 0xD04202AB
	Offset: 0x5F50
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_bc81184(e_player)
{
	if(e_player function_b3c7ab29())
	{
		self sethintstringforplayer(e_player, #"hash_2c8b931713febd2c");
		return true;
	}
	return false;
}

/*
	Name: function_27867437
	Namespace: namespace_36ebd7e4
	Checksum: 0x66EF38E7
	Offset: 0x5FB0
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_27867437()
{
	level endon(#"end_game");
	self function_bc82f900(#"hash_3937704286348bfa");
	self namespace_e0966e1e::function_43cd5eff();
	var_12672e82 = util::spawn_model(#"hash_f93e1bf903e219b", level.var_e59aeca1.origin + (13, 0, 1.3), vectorscale((0, 1, 0), 180));
	var_12672e82 thread function_a8c498e3();
	var_12672e82 playsound(#"hash_47eb58f0e1a10de8");
	var_12672e82 moveto(var_12672e82.origin + (vectorscale((-1, 0, 0), 10)), 2);
	var_12672e82 waittill(#"movedone");
	wait(0.5);
	playfxontag(#"hash_4735699f6a41793b", level.var_e59aeca1, "tag_light1");
	playfxontag(#"hash_47356c9f6a417e54", level.var_e59aeca1, "tag_light");
	/#
		iprintlnbold("");
	#/
	level flag::set(#"hash_2e43edba67c87ef1");
}

/*
	Name: function_fa9f55e0
	Namespace: namespace_36ebd7e4
	Checksum: 0x36720ED1
	Offset: 0x6190
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_fa9f55e0()
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	e_player = waitresult.activator;
	if(e_player function_b3c7ab29())
	{
		e_player thread function_27867437();
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_a8c498e3
	Namespace: namespace_36ebd7e4
	Checksum: 0x701103CB
	Offset: 0x6230
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_a8c498e3()
{
	var_3ee2bd0 = 2.5;
	var_63c51f10 = 0.25;
	while(var_3ee2bd0 > 0)
	{
		self clientfield::set("" + #"hash_3133b920dbedc06b", 1);
		wait(var_63c51f10);
		var_3ee2bd0 = var_3ee2bd0 - var_63c51f10;
		self clientfield::set("" + #"hash_3133b920dbedc06b", 0);
		wait(var_63c51f10);
		var_3ee2bd0 = var_3ee2bd0 - var_63c51f10;
	}
}

/*
	Name: function_98957f5b
	Namespace: namespace_36ebd7e4
	Checksum: 0xF2FC113C
	Offset: 0x62E8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_98957f5b()
{
	level endon(#"end_game");
	v_start = self.origin + vectorscale((0, 0, 1), 32);
	v_end = self.origin - vectorscale((0, 0, 1), 1000);
	a_trace = groundtrace(v_start, v_end, 0, self, 1);
	v_ground = (isdefined(a_trace[#"position"]) ? a_trace[#"position"] : self.origin);
	self playsound(#"hash_384b11f9c14189aa");
	level.e_head = level spawn_head(v_ground + vectorscale((0, 0, 1), 8));
}

/*
	Name: function_6413e9b
	Namespace: namespace_36ebd7e4
	Checksum: 0xB47552B1
	Offset: 0x6410
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_6413e9b()
{
	self notify("176e544e64f0df70");
	self endon("176e544e64f0df70");
	level endon(#"end_game", #"hash_28c14046706f2648");
	wait(120);
	level notify(#"hash_78a47b890ec7dad3");
	/#
		assert(isdefined(level.var_2572cd3));
	#/
	if(isdefined(level.e_head))
	{
		level.e_head.origin = level.var_2572cd3.origin;
		level.e_head.angles = level.var_2572cd3.angles;
	}
	else
	{
		level.e_head = level spawn_head(level.var_2572cd3.origin, level.var_2572cd3.angles);
	}
}

/*
	Name: function_c64d2826
	Namespace: namespace_36ebd7e4
	Checksum: 0x5C3E87DA
	Offset: 0x6538
	Size: 0x1E8
	Parameters: 1
	Flags: Linked
*/
function function_c64d2826(e_player)
{
	e_player endon(#"hash_31f98f1ef1f33ee1", #"disconnect");
	e_player val::set(#"hash_5f4be7238bf3892b", "disable_weapon_cycling", 1);
	e_player thread function_f4b436d5();
	util::wait_network_frame();
	e_player giveweapon(level.var_e4731251);
	e_player switchtoweapon(level.var_e4731251, 1);
	e_player waittill(#"weapon_change_complete");
	callback::on_weapon_change(&function_2c951177);
	callback::function_33f0ddd3(&function_2056cd79);
	e_player thread function_8ee22ffd();
	e_player val::reset(#"hash_5f4be7238bf3892b", "disable_weapon_cycling");
	e_player thread zm_equipment::show_hint_text(#"hash_b6c7be4cc64df9c", 10);
	level thread function_9c294ad5(e_player);
	level flag::wait_till(#"hash_3dff248b4edaface");
	e_player notify(#"hash_31f98f1ef1f33ee1", {#str_result:"placed"});
}

/*
	Name: function_f4b436d5
	Namespace: namespace_36ebd7e4
	Checksum: 0x6205D382
	Offset: 0x6728
	Size: 0x22C
	Parameters: 0
	Flags: Linked
*/
function function_f4b436d5()
{
	self endon(#"disconnect");
	self.is_drinking = 1;
	self val::set(#"hash_5f4be7238bf3892b", "disable_weapon_fire", 1);
	self val::set(#"hash_5f4be7238bf3892b", "allow_melee", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_mantle", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_sprint", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_jump", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_prone", 0);
	self waittill(#"hash_31f98f1ef1f33ee1");
	self.is_drinking = 0;
	self val::reset(#"hash_5f4be7238bf3892b", "disable_weapon_fire");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_melee");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_mantle");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_sprint");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_jump");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_prone");
}

/*
	Name: function_9c294ad5
	Namespace: namespace_36ebd7e4
	Checksum: 0x24C94A1E
	Offset: 0x6960
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_9c294ad5(e_player)
{
	e_player endon(#"disconnect");
	s_result = undefined;
	s_result = e_player waittill(#"hash_31f98f1ef1f33ee1", #"fake_death");
	callback::remove_on_weapon_change(&function_2c951177);
	callback::function_824d206(&function_2056cd79);
	e_player takeweapon(level.var_e4731251);
	e_player notify(#"hide_equipment_hint_text");
	if(s_result.str_result === "dropped" || s_result._notify == "fake_death")
	{
		e_player function_98957f5b();
		level thread function_6413e9b();
	}
}

/*
	Name: function_e1ea43c1
	Namespace: namespace_36ebd7e4
	Checksum: 0xCD7B54D7
	Offset: 0x6A90
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_e1ea43c1(params)
{
	if(isplayer(self))
	{
		item = params.item;
		if(item.var_a6762160.name === #"hash_1680835628ff9442")
		{
			level notify(#"hash_28c14046706f2648");
			level thread function_c64d2826(self);
		}
	}
}

/*
	Name: function_363c7e7e
	Namespace: namespace_36ebd7e4
	Checksum: 0x23875060
	Offset: 0x6B30
	Size: 0x5E
	Parameters: 1
	Flags: Private
*/
function private function_363c7e7e(color)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 1, 0);
		}
		self endon(#"death");
		while(true)
		{
			circle(self.origin, 10, color);
			waitframe(1);
		}
	#/
}

/*
	Name: function_c037252d
	Namespace: namespace_36ebd7e4
	Checksum: 0xD3F24A49
	Offset: 0x6B98
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_c037252d(var_a276c861)
{
	level endon(#"hash_5bccc551750f81c6");
	var_7ae3472c = struct::get("kr_sa_lo", "targetname");
	level.e_safe = util::spawn_model("tag_origin", var_7ae3472c.origin);
	/#
		level.e_safe thread function_363c7e7e();
	#/
	level.e_safe.require_look_at = 1;
	level.e_safe gameobjects::init_game_objects(#"hash_5482f1b89030995d");
	level.e_safe gameobjects::set_onuse_event(&function_3c81b8d8);
	level.e_safe.mdl_gameobject function_23a29590();
	level.e_safe.mdl_gameobject.trigger setcursorhint("HINT_NOICON");
	level.e_safe.mdl_gameobject.trigger usetriggerignoreuseholdtime();
	level.e_safe.mdl_gameobject.trigger function_268e4500();
	level.e_safe.mdl_gameobject.dontlinkplayertotrigger = 1;
	level.e_safe.mdl_gameobject.keepweapon = 1;
	level.e_safe.mdl_gameobject.canuseobject = &zm_utility::is_player_valid;
	level flag::wait_till(#"hash_25df5b0937fda015");
	level function_45521b98();
}

/*
	Name: function_610a4c69
	Namespace: namespace_36ebd7e4
	Checksum: 0xC39ADE4C
	Offset: 0x6DE0
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_610a4c69(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_5bccc551750f81c6");
		level notify(#"hash_75114a8e5a90be07");
	}
	if(isdefined(level.e_safe.mdl_gameobject))
	{
		level.e_safe.mdl_gameobject gameobjects::destroy_object(1, 1);
	}
	if(isdefined(level.e_safe))
	{
		level.e_safe delete();
	}
}

/*
	Name: function_3c81b8d8
	Namespace: namespace_36ebd7e4
	Checksum: 0x8DA12381
	Offset: 0x6EB0
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_3c81b8d8(e_player)
{
	level thread scene::play(#"hash_5a121f0591383986");
	e_player function_ec80a97();
	level flag::set(#"hash_25df5b0937fda015");
	e_player function_bc82f900(#"hash_3937704286348bfa");
	var_3c6ce622 = struct::get("intel_document_04", "targetname");
	namespace_9f2e6680::function_ade87eb5(#"hash_51d66d8e659b2f0d", var_3c6ce622, 0);
}

/*
	Name: function_ec80a97
	Namespace: namespace_36ebd7e4
	Checksum: 0x681E1FBA
	Offset: 0x6F90
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_ec80a97()
{
	self playsoundtoplayer(#"hash_68d1999829296b7d", self);
	s_perk = struct::get("he_pe_lo", "targetname");
	s_spawn = {#hash_738dfc81:1, #angles:s_perk.angles, #origin:s_perk.origin};
	level thread namespace_58949729::function_f82f361c(s_spawn, #"hash_31b3c0febd9c068b", 0, 1);
}

/*
	Name: function_45521b98
	Namespace: namespace_36ebd7e4
	Checksum: 0xB9E697FF
	Offset: 0x7068
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_45521b98()
{
	level endon(#"end_game");
	level thread function_d641bcf0();
	zm_audio::sndmusicsystem_playstate("head_quest_scare");
	if(isdefined(level.e_safe))
	{
		level.e_safe playloopsound(#"hash_5e6901a4f8fdd7bf");
	}
	wait(30);
	if(isdefined(level.e_safe))
	{
		level.e_safe stopsounds();
	}
	level notify(#"hash_75114a8e5a90be07");
}

/*
	Name: function_faf4646f
	Namespace: namespace_36ebd7e4
	Checksum: 0x38F3922D
	Offset: 0x7138
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_faf4646f(&var_500164d9)
{
	str_zone = (math::cointoss(33) ? "zone_colonel_office" : "zone_chopper_gunner3");
	ai = zm_utility::function_cce73165("dog_location", #"hash_7a8b592728eec95d", str_zone);
	if(isdefined(ai))
	{
		ai.ignore_enemy_count = 1;
		if(!isdefined(var_500164d9))
		{
			var_500164d9 = [];
		}
		else if(!isarray(var_500164d9))
		{
			var_500164d9 = array(var_500164d9);
		}
		var_500164d9[var_500164d9.size] = ai;
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_d641bcf0
	Namespace: namespace_36ebd7e4
	Checksum: 0x81FB1B60
	Offset: 0x7240
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function function_d641bcf0()
{
	level endon(#"end_game", #"hash_75114a8e5a90be07");
	var_a289fd96 = 7 + getplayers().size;
	var_500164d9 = [];
	level flag::clear("spawn_zombies");
	for(i = 0; i < var_a289fd96; i++)
	{
		level function_faf4646f(var_500164d9);
		util::wait_network_frame();
	}
	level flag::set("spawn_zombies");
	while(true)
	{
		function_1eaaceab(var_500164d9);
		if(var_500164d9.size < var_a289fd96)
		{
			level function_faf4646f(var_500164d9);
		}
		wait(0.5);
	}
}

