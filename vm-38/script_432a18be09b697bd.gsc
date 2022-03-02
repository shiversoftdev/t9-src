#using script_18e21a7011416ce0;
#using script_1c65dbfc2f1c8d8f;
#using script_340a2e805e35f7a2;
#using script_34ab99a4ca1a43d;
#using script_35598499769dbb3d;
#using script_3f9e0dc8454d98e1;
#using script_4108035fe400ce67;
#using script_4ccfb58a9443a60b;
#using script_5882f53c3e1f693f;
#using script_5bb072c3abf4652c;
#using script_68d2ee1489345a1d;
#using script_6c5b51f98cd04fa3;
#using script_6c8abe14025b47c4;
#using script_6ce38ab036223e6e;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using script_bf0c2c69ce5745e;
#using script_f11fc6f7a3ad5b9;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_45690bb8;

/*
	Name: function_c073310
	Namespace: namespace_45690bb8
	Checksum: 0xA2CE660B
	Offset: 0x8D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c073310()
{
	level notify(906172964);
}

/*
	Name: init
	Namespace: namespace_45690bb8
	Checksum: 0x85E994FB
	Offset: 0x8F8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	init_clientfields();
	function_ec9e5cf2();
	/#
		execdevgui("");
		level thread function_4b06b46e();
	#/
	setdvar(#"hash_5a8a4ab51def32b1", 0);
	setdvar(#"hash_186066f95083b691", 0);
	setdvar(#"hash_195b99ea080e0f20", 0);
	setdvar(#"hash_5dfa519a8cb95559", 0);
	namespace_8f39dfb1::init();
}

/*
	Name: init_clientfields
	Namespace: namespace_45690bb8
	Checksum: 0x2BDB509E
	Offset: 0x9F0
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "" + #"hash_18735ccb22cdefb5", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_1df73c94e87e145c", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_615d25f799b80ed7", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7e481cd16f021d79", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_acf98ff6d976e10", 1, 1, "int");
	clientfield::register("world", "" + #"hash_58dd30074d399de5", 1, 1, "int");
	clientfield::register("world", "" + #"hash_195f6fa038980aca", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_3d14472eb7838c71", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_734d80bbfc2cb595", 1, 2, "counter");
	clientfield::register("toplayer", "" + #"hash_802934d416ac981", 1, 1, "int");
}

/*
	Name: function_ec9e5cf2
	Namespace: namespace_45690bb8
	Checksum: 0x6A056C8C
	Offset: 0xC80
	Size: 0x384
	Parameters: 0
	Flags: Linked
*/
function function_ec9e5cf2()
{
	level namespace_ee206246::register(#"hash_c4b3458de63120f", #"step_1", #"hash_c4b3458de63120f", &function_6dcf4b9f, &function_cf9f04);
	level namespace_ee206246::register(#"hash_5901f2453ffa0890", #"step_1", #"hash_5901f2453ffa0890", &function_8e848ba6, &function_e2ec7010);
	level namespace_ee206246::register(#"hash_6ffd792c789fdc3e", #"step_1", #"hash_6ffd792c789fdc3e", &function_953a87da, &function_8a3b8ea1);
	level namespace_ee206246::register(#"hash_4481398b3702806", #"step_1", #"hash_4481398b3702806", &function_55b7455c, &function_8d254596);
	level namespace_ee206246::register(#"hash_27afeec3970b3b60", #"step_1", #"hash_1a3b58a38cdde9eb", &function_21c1b671, &function_51bd2bd5);
	level namespace_ee206246::register(#"hash_27afeec3970b3b60", #"step_2", #"hash_1a3b59a38cddeb9e", &function_8d749d26, &function_dd843411);
	level namespace_ee206246::register(#"hash_bac7d727e093e91", #"step_1", #"hash_17f11bdabf28a22c", &function_79f95e6e, &function_6d60894b);
	level namespace_ee206246::register(#"hash_bac7d727e093e91", #"step_2", #"hash_17f11edabf28a745", &function_de12a4a9, &function_332fa187);
	level namespace_ee206246::register(#"hash_71e04a201d2b2586", #"step_1", #"hash_71e04a201d2b2586", &function_2d90874d, &function_3822111d);
	level.var_c49b0cf5 = 0;
	level thread function_2abef8da();
}

/*
	Name: function_2abef8da
	Namespace: namespace_45690bb8
	Checksum: 0xC2AE5E44
	Offset: 0x1010
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2abef8da()
{
	level namespace_ee206246::start(#"hash_c4b3458de63120f");
	level namespace_ee206246::start(#"hash_27afeec3970b3b60");
	level namespace_ee206246::start(#"hash_4481398b3702806");
	level namespace_ee206246::start(#"hash_bac7d727e093e91");
	level namespace_ee206246::start(#"hash_6ffd792c789fdc3e");
	level namespace_ee206246::start(#"hash_71e04a201d2b2586");
	level namespace_ee206246::start(#"hash_5901f2453ffa0890");
}

/*
	Name: function_6dcf4b9f
	Namespace: namespace_45690bb8
	Checksum: 0xEB62E3B5
	Offset: 0x1100
	Size: 0x30C
	Parameters: 1
	Flags: Linked
*/
function function_6dcf4b9f(var_a276c861)
{
	level endon(#"hash_2d0433bbc2675311");
	level flag::set("arm_not_in_cooldown");
	level flag::wait_till(#"pap_quest_completed");
	level thread function_694361ad();
	while(true)
	{
		level waittill(#"dark_aether_active", #"arm_not_in_cooldown");
		if(!level flag::get(#"dark_aether_active"))
		{
			namespace_812a8849::function_bd7cde02("turn_all_lights_off");
			continue;
		}
		if(!level flag::get("arm_not_in_cooldown"))
		{
			continue;
		}
		var_f6ed35c4 = getent("hh_door_5", "targetname");
		var_3cfbb4bb = struct::get("hh_door_init_loc", "targetname");
		waitframe(1);
		var_f6ed35c4 rotateto(var_3cfbb4bb.angles, 0.1);
		if(!isdefined(level.var_c2a74bf5))
		{
			var_c2a74bf5 = [];
			var_c2a74bf5 = getentarray("hh_button", "targetname");
			level.var_c2a74bf5 = var_c2a74bf5;
		}
		else
		{
			var_c2a74bf5 = level.var_c2a74bf5;
		}
		if(!isdefined(level.var_903a6494))
		{
			level.var_903a6494 = var_c2a74bf5.size;
		}
		var_c2a74bf5 function_6756d316();
		if(level flag::get(#"hash_46113ff0abdbbbb8"))
		{
			level thread function_a8dc8da3();
		}
		else
		{
			foreach(door_button in var_c2a74bf5)
			{
				t_damage = getent(door_button.target, "targetname");
				door_button thread function_3ebb9aa4(t_damage);
			}
		}
	}
}

/*
	Name: function_694361ad
	Namespace: namespace_45690bb8
	Checksum: 0x6BC36776
	Offset: 0x1418
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function function_694361ad()
{
	level endon(#"hash_2d0433bbc2675311");
	while(true)
	{
		level waittill(#"hash_48d78e5b218bf15a");
		wait(30);
		level flag::set("arm_not_in_cooldown");
	}
}

/*
	Name: function_6756d316
	Namespace: namespace_45690bb8
	Checksum: 0x9BD440E0
	Offset: 0x1480
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_6756d316()
{
	foreach(door_button in self)
	{
		if(is_true(door_button.var_5d77c939))
		{
			var_b40be993 = door_button.script_noteworthy;
			namespace_812a8849::function_bd7cde02(("turn_" + var_b40be993) + "_light_on");
			waitframe(1);
		}
	}
}

/*
	Name: function_3ebb9aa4
	Namespace: namespace_45690bb8
	Checksum: 0xDC7BC6D4
	Offset: 0x1558
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_3ebb9aa4(t_damage)
{
	level endon(#"hash_2d0433bbc2675311", #"dark_side_timeout");
	if(!level flag::get("arm_not_in_cooldown"))
	{
		return;
	}
	if(is_true(self.var_5d77c939))
	{
		return;
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = t_damage waittill(#"damage");
		if(isdefined(waitresult) && isplayer(waitresult.attacker) && zm_weapons::is_weapon_upgraded(waitresult.weapon))
		{
			level.var_903a6494--;
			var_b40be993 = self.script_noteworthy;
			self.var_5d77c939 = 1;
			self playsound(#"hash_4eef39d18c3c0706");
			namespace_812a8849::function_bd7cde02(("turn_" + var_b40be993) + "_light_on");
			if(level.var_903a6494 == 0)
			{
				wait(2);
				level thread function_a8dc8da3();
			}
			break;
		}
	}
}

/*
	Name: function_a8dc8da3
	Namespace: namespace_45690bb8
	Checksum: 0xB5BF5326
	Offset: 0x16F8
	Size: 0x24C
	Parameters: 0
	Flags: Linked
*/
function function_a8dc8da3()
{
	level endon(#"hash_2d0433bbc2675311", #"dark_side_timeout");
	playsoundatposition(#"hash_54b4d49cbd9f466b", (-26, 2180, -337));
	playsoundatposition(#"hash_26911d03f6bd7686", (38, 2491, -329));
	namespace_812a8849::function_bd7cde02("turn_room_5_light_on");
	var_2c8ebaf = struct::get("hh_button_5", "targetname");
	if(!level flag::get(#"hash_46113ff0abdbbbb8"))
	{
		level flag::set(#"hash_46113ff0abdbbbb8");
		var_82a319ce = util::spawn_model(#"p8_zm_ori_button_alarm", var_2c8ebaf.origin, var_2c8ebaf.angles);
		var_82a319ce moveto(var_82a319ce.origin + vectorscale((1, 0, 0), 15), 2);
		var_82a319ce waittill(#"movedone");
	}
	t_damage = getent(var_2c8ebaf.target, "targetname");
	var_7f729179 = undefined;
	var_7f729179 = t_damage waittill(#"damage");
	t_damage playsound(#"hash_4eef39d18c3c0706");
	level.var_a4a95081 = var_7f729179.attacker;
	level flag::clear("arm_not_in_cooldown");
	level thread function_9a4f25ac();
}

/*
	Name: function_9a4f25ac
	Namespace: namespace_45690bb8
	Checksum: 0x3CA9737D
	Offset: 0x1950
	Size: 0x228
	Parameters: 0
	Flags: Linked
*/
function function_9a4f25ac()
{
	level endon(#"hash_2d0433bbc2675311");
	scene::add_scene_func(#"hash_42b00314d9c6a0d5", &function_d521aae, "flail");
	var_f6ed35c4 = getent("hh_door_5", "targetname");
	var_f6ed35c4 rotateto(var_f6ed35c4.angles + (vectorscale((0, -1, 0), 145)), 0.5, 0.1, 0.1);
	var_f6ed35c4 playsound("zmb_sq_hand_door_open");
	wait(0.5);
	level notify(#"hash_9be4bc3b1815505");
	level thread scene::play(#"hash_42b00314d9c6a0d5");
	level waittill(#"hash_48d78e5b218bf15a");
	wait(0.5);
	/#
		assert(isdefined(var_f6ed35c4));
	#/
	var_f6ed35c4 rotateto(var_f6ed35c4.angles + vectorscale((0, 1, 0), 145), 0.5, 0.1, 0.1);
	var_f6ed35c4 playsound("zmb_sq_hand_door_close");
	wait(0.5);
	namespace_812a8849::function_bd7cde02("turn_room_5_light_off");
	playsoundatposition(#"hash_e706356358d5b8f", (-26, 2180, -337));
	level notify(#"hash_d915cc21bc0220");
}

/*
	Name: function_d521aae
	Namespace: namespace_45690bb8
	Checksum: 0x86A5A42C
	Offset: 0x1B80
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function function_d521aae(a_ents)
{
	level endon(#"hash_2d0433bbc2675311", #"hash_53788cff7f529fda");
	ent = a_ents[#"claw"];
	if(!isdefined(level.var_fe0060a))
	{
		level.var_fe0060a = getent("hh_t_kill", "targetname");
	}
	if(isdefined(level.var_fe0060a))
	{
		level.var_fe0060a thread function_e3c937ee();
		while(isdefined(level.var_fe0060a.origin))
		{
			level.var_fe0060a.origin = ent gettagorigin("tag_aim");
			wait(0.1);
		}
	}
}

/*
	Name: function_e3c937ee
	Namespace: namespace_45690bb8
	Checksum: 0xED55EF5F
	Offset: 0x1C90
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_e3c937ee()
{
	level endon(#"hash_2d0433bbc2675311", #"dark_side_timeout");
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"trigger");
		if(isalive(s_result.activator) && s_result.activator.archetype === #"zombie")
		{
			s_result.activator kill();
			s_result.activator function_ae1b4f5b();
			level.var_c49b0cf5 = level.var_c49b0cf5 + 1;
			if(level.var_c49b0cf5 >= 15 && !flag::get("give_reward"))
			{
				flag::set("give_reward");
				level thread function_76f53c53();
				break;
			}
		}
	}
	waitframe(1);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_ae1b4f5b
	Namespace: namespace_45690bb8
	Checksum: 0x2F08C2E0
	Offset: 0x1E20
	Size: 0x1EC
	Parameters: 3
	Flags: Linked
*/
function function_ae1b4f5b(var_6888276a, var_7d866d50, var_aadd0545)
{
	if(!isdefined(var_6888276a))
	{
		var_6888276a = 75;
	}
	if(!isdefined(var_7d866d50))
	{
		var_7d866d50 = 75;
	}
	if(!isdefined(var_aadd0545))
	{
		var_aadd0545 = 75;
	}
	if(is_true(self.no_gib))
	{
		return;
	}
	val = randomint(100);
	if(val > 100 - var_6888276a)
	{
		self zombie_utility::zombie_head_gib();
	}
	val = randomint(100);
	if(val > 100 - var_7d866d50)
	{
		if(!gibserverutils::isgibbed(self, 32))
		{
			gibserverutils::gibrightarm(self, 0);
		}
	}
	val = randomint(100);
	if(val > 100 - var_7d866d50)
	{
		if(!gibserverutils::isgibbed(self, 16))
		{
			gibserverutils::gibleftarm(self, 0);
		}
	}
	val = randomint(100);
	if(val > 100 - var_aadd0545)
	{
		gibserverutils::gibrightleg(self, 0);
	}
	val = randomint(100);
	if(val > 100 - var_aadd0545)
	{
		gibserverutils::gibleftleg(self, 0);
	}
}

/*
	Name: function_76f53c53
	Namespace: namespace_45690bb8
	Checksum: 0x97F3C8EE
	Offset: 0x2018
	Size: 0x3AC
	Parameters: 0
	Flags: Linked
*/
function function_76f53c53()
{
	self notify("3c0727c57301309");
	self endon("3c0727c57301309");
	player = level.var_a4a95081;
	if(!isplayer(player))
	{
		return;
	}
	if(!player laststand::player_is_in_laststand() && player.sessionstate !== "spectator")
	{
		weap = player getcurrentweapon();
		item = player namespace_b376ff3f::function_230ceec4(weap);
		player playsoundtoplayer(#"hash_68d1999829296b7d", player);
		if(item.var_a6762160.rarity === "Legendary")
		{
			var_22481c68 = struct::get_array("hh_essence_pickup_spawner", "targetname");
			foreach(var_2db4f648 in var_22481c68)
			{
				point = function_4ba8fde(#"hash_69a628368f8263f");
				item_drop::drop_item(0, undefined, 1, 0, point.id, var_2db4f648.origin + (vectorscale((1, -1, 0), 25)), var_2db4f648.angles, 2);
				waitframe(1);
			}
		}
		else
		{
			var_b349f40e = struct::get("hh_reward_fx_hand_loc", "targetname");
			fxtime = 0.5;
			/#
				fxtime = getdvarfloat(#"hash_27bb0ff7115c2be8", 0.5);
			#/
			fxent = util::spawn_model("tag_origin", var_b349f40e.origin);
			playfxontag(#"hash_6010924498e558ce", fxent, "tag_origin");
			fxent moveto(player.origin + (-7, -40, 45), fxtime);
			wait(fxtime);
			if(isdefined(fxent))
			{
				fxent delete();
			}
			if(isdefined(player))
			{
				player zm_weapons::function_17e9ed37(#"legendary");
			}
		}
	}
	level waittill(#"hash_d915cc21bc0220");
	namespace_812a8849::function_bd7cde02("turn_all_lights_off");
	level flag::set(#"hash_2d0433bbc2675311");
}

/*
	Name: function_cf9f04
	Namespace: namespace_45690bb8
	Checksum: 0x9306BE60
	Offset: 0x23D0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_cf9f04(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_2d0433bbc2675311");
	}
}

/*
	Name: function_8e848ba6
	Namespace: namespace_45690bb8
	Checksum: 0x18A10290
	Offset: 0x2420
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_8e848ba6(var_a276c861)
{
	level endon(#"hash_1816c9d692edb10e");
	var_821fa21c = struct::get("dm_loc", "targetname");
	while(!level flag::get("distant_monster_anim_start_play"))
	{
		level waittill(#"into_the_dark_side");
		level flag::wait_till(#"dark_aether_active");
		var_821fa21c thread function_252db1d7();
	}
}

/*
	Name: function_252db1d7
	Namespace: namespace_45690bb8
	Checksum: 0x16CA508D
	Offset: 0x24E8
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_252db1d7()
{
	level endon(#"hash_1816c9d692edb10e", #"dark_side_timeout");
	if(namespace_a28acff3::get_round_number() >= 40)
	{
		level thread function_d47abb5c();
		t_trigger = getent("dm_t_start", "targetname");
		t_trigger waittill(#"trigger");
		wait(3);
		self thread function_b3dff8ff();
	}
}

/*
	Name: function_b3dff8ff
	Namespace: namespace_45690bb8
	Checksum: 0x74757D5F
	Offset: 0x25A8
	Size: 0x280
	Parameters: 0
	Flags: Linked
*/
function function_b3dff8ff()
{
	level endoncallback(&function_24a7c113, #"dark_side_timeout", #"hash_1816c9d692edb10e");
	players = getplayers();
	foreach(player in players)
	{
		player thread function_ccd8d6e0(1);
	}
	var_821fa21c = self;
	var_b528ceef = util::spawn_model(#"c_t9_zmb_hulking_summoner_body_black", var_821fa21c.origin, var_821fa21c.angles);
	level.var_b528ceef = var_b528ceef;
	var_b528ceef setscale(2);
	level flag::set("distant_monster_anim_start_play");
	for(var_6a3f365 = 2; var_6a3f365 > 0; var_6a3f365--)
	{
		var_b528ceef thread function_1b897d69();
		var_b528ceef thread function_2efbc9a7();
		var_b528ceef thread scene::play(#"hash_17690029a781693", "Walk", var_b528ceef);
		level waittill(#"hash_44b7af19ed94271b");
		var_b528ceef.origin = var_b528ceef gettagorigin("tag_player");
	}
	level scene::delete_scene_spawned_ents(#"hash_17690029a781693");
	if(isdefined(var_b528ceef))
	{
		var_b528ceef delete();
	}
	level notify(#"hash_1816c9d692edb10e");
}

/*
	Name: function_24a7c113
	Namespace: namespace_45690bb8
	Checksum: 0x91CF8E47
	Offset: 0x2830
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_24a7c113(s_result)
{
	level scene::delete_scene_spawned_ents(#"hash_17690029a781693");
	if(isdefined(level.var_b528ceef))
	{
		level.var_b528ceef delete();
	}
}

/*
	Name: function_1b897d69
	Namespace: namespace_45690bb8
	Checksum: 0x74648304
	Offset: 0x2890
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_1b897d69()
{
	if(getdvarint(#"hash_5a8a4ab51def32b1", 0))
	{
		namespace_ee206246::objective_set(#"hash_9096d6ed99664a0", self, 1);
	}
}

/*
	Name: function_2efbc9a7
	Namespace: namespace_45690bb8
	Checksum: 0x77DDD934
	Offset: 0x28E8
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_2efbc9a7()
{
	level endon(#"hash_1816c9d692edb10e", #"dark_side_timeout");
	var_25dfb60 = getent("tree_fall_over_1", "targetname");
	var_82347b0b = getent("tree_fall_over_2", "targetname");
	var_74a9dff6 = getent("tree_fall_over_3", "targetname");
	level waittill(#"tree_fall_over_1");
	if(isdefined(var_25dfb60))
	{
		var_25dfb60 rotateto(self.angles + vectorscale((1, 0, 1), 90), 5, 1.5, 0.5);
	}
	level waittill(#"tree_fall_over_2");
	if(isdefined(var_82347b0b))
	{
		var_82347b0b rotateto(self.angles + vectorscale((1, 0, 0), 90), 4, 1.5, 0.5);
	}
	level waittill(#"tree_fall_over_3");
	if(isdefined(var_74a9dff6))
	{
		var_74a9dff6 rotateto(self.angles + (90, 0, 60), 5, 1.5, 0.5);
	}
}

/*
	Name: function_e2ec7010
	Namespace: namespace_45690bb8
	Checksum: 0x28DCD294
	Offset: 0x2AB8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_e2ec7010(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_1816c9d692edb10e");
	}
}

/*
	Name: function_d47abb5c
	Namespace: namespace_45690bb8
	Checksum: 0xFAF3C9D1
	Offset: 0x2B08
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function function_d47abb5c()
{
	level endon(#"hash_1816c9d692edb10e", #"dark_side_timeout");
	var_31bad4cf = [];
	if(!isdefined(var_31bad4cf))
	{
		var_31bad4cf = [];
	}
	else if(!isarray(var_31bad4cf))
	{
		var_31bad4cf = array(var_31bad4cf);
	}
	var_31bad4cf[var_31bad4cf.size] = "zone_proto_exterior_rear";
	if(!isdefined(var_31bad4cf))
	{
		var_31bad4cf = [];
	}
	else if(!isarray(var_31bad4cf))
	{
		var_31bad4cf = array(var_31bad4cf);
	}
	var_31bad4cf[var_31bad4cf.size] = "zone_proto_exterior_rear2";
	while(true)
	{
		if(level flag::get("distant_monster_anim_start_play"))
		{
			break;
		}
		players = getplayers();
		foreach(player in players)
		{
			str_zone = player zm_zonemgr::get_player_zone();
			if(isdefined(str_zone) && isinarray(var_31bad4cf, str_zone) && player.var_2be73089 === 0)
			{
				player thread function_ccd8d6e0(0);
				player.var_2be73089 = 1;
				continue;
			}
			level notify(#"hash_1b742a7f8c54967a");
			player.var_2be73089 = 0;
		}
		wait(1);
	}
}

/*
	Name: function_ccd8d6e0
	Namespace: namespace_45690bb8
	Checksum: 0xD3D22740
	Offset: 0x2D50
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function function_ccd8d6e0(var_24aa6c41)
{
	level endon(#"hash_1816c9d692edb10e", #"dark_side_timeout", #"hash_1b742a7f8c54967a");
	player = self;
	wait(0.65);
	while(true)
	{
		if(isalive(player))
		{
			if(!var_24aa6c41)
			{
				player clientfield::increment_to_player("" + #"hash_734d80bbfc2cb595", 1);
			}
			else
			{
				player clientfield::increment_to_player("" + #"hash_734d80bbfc2cb595", 2);
			}
		}
		wait(1.5);
	}
}

/*
	Name: function_953a87da
	Namespace: namespace_45690bb8
	Checksum: 0x26F829C9
	Offset: 0x2E50
	Size: 0x82C
	Parameters: 1
	Flags: Linked
*/
function function_953a87da(var_a276c861)
{
	level endon(#"end_game", #"hash_6468c94dec1ff598");
	var_64a4aebe = [];
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_start";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_start2";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_interior_lower";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_interior_cave";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_upstairs";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_upstairs_2";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_roof_plane";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_exterior_rear";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_exterior_rear2";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_plane_exterior";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_proto_plane_exterior2";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_power_tunnel";
	if(!isdefined(var_64a4aebe))
	{
		var_64a4aebe = [];
	}
	else if(!isarray(var_64a4aebe))
	{
		var_64a4aebe = array(var_64a4aebe);
	}
	var_64a4aebe[var_64a4aebe.size] = #"zone_tunnel_interior";
	level.var_a4db12b6 = struct::get_array("ceiling_dust_med", "targetname");
	level.var_e4aa236f = struct::get_array("ceiling_dust_lg", "targetname");
	while(true)
	{
		level waittill(#"start_of_round");
		var_7a4815da = 1;
		if(getdvarint(#"hash_186066f95083b691", 0) == 0)
		{
			if(level.round_number <= 15)
			{
				continue;
			}
			wait(randomintrange(60, 120));
			if(!level flag::get(#"dark_aether_active") || !isdefined(level.var_ba3a0e1f) || level.var_ba3a0e1f <= 20)
			{
				continue;
			}
			if(!math::cointoss(10))
			{
				continue;
			}
			foreach(zone_name in var_64a4aebe)
			{
				if(level.zones[zone_name].is_occupied)
				{
					var_7a4815da = 0;
				}
			}
			if(is_true(var_7a4815da))
			{
				break;
			}
		}
		else if(level flag::get(#"dark_aether_active"))
		{
			break;
		}
	}
	var_169fc18f = struct::get("hf_snd_loc", "targetname");
	var_24be5744 = spawn("script_origin", var_169fc18f.origin);
	var_64a4aebe thread function_b21d09cb(var_24be5744);
	waitresult = undefined;
	waitresult = level waittill(#"hash_5a95b150295599a9", #"dark_side_timeout");
	if(waitresult._notify === #"dark_side_timeout")
	{
		level notify(#"hash_5a95b150295599a9");
	}
	if(isdefined(var_24be5744))
	{
		var_24be5744 delete();
	}
	s_max_ammo_loc = struct::get("s_max_ammo_loc", "targetname");
	level zm_powerups::specific_powerup_drop("full_ammo", s_max_ammo_loc.origin, undefined, undefined, undefined, 1, undefined, undefined, undefined, 1);
}

/*
	Name: function_b21d09cb
	Namespace: namespace_45690bb8
	Checksum: 0xD63B2320
	Offset: 0x3688
	Size: 0x22A
	Parameters: 1
	Flags: Linked
*/
function function_b21d09cb(var_24be5744)
{
	level endon(#"end_game", #"hash_6468c94dec1ff598", #"hash_5a95b150295599a9");
	var_ff02f2c5 = struct::get("hf_dest_loc", "targetname");
	var_24be5744 thread function_4f5f24b(var_ff02f2c5, 35);
	self thread function_ee554505(var_24be5744);
	var_4362e6fe = 1;
	var_62153c98 = [4:14, 3:11, 2:8, 1:6, 0:3];
	var_2d1473e1 = [2:15, 1:9, 0:4];
	while(true)
	{
		if(isdefined(var_24be5744))
		{
			playrumbleonposition("zm_silver_heavy_footfalls_rumble", var_24be5744.origin);
			var_24be5744 playsound(#"hash_7f68d52a43e2fbe2");
			var_24be5744 function_bc8a5d56();
			if(isinarray(var_62153c98, var_4362e6fe))
			{
				waitframe(1);
				var_24be5744 playsound(#"hash_7857541f270b9a34");
			}
			if(isinarray(var_2d1473e1, var_4362e6fe))
			{
				waitframe(1);
				var_24be5744 playsound(#"hash_51319230bb919be8");
			}
		}
		wait(4);
		var_4362e6fe++;
	}
}

/*
	Name: function_4f5f24b
	Namespace: namespace_45690bb8
	Checksum: 0xA68D2EC7
	Offset: 0x38C0
	Size: 0x88
	Parameters: 2
	Flags: Linked
*/
function function_4f5f24b(dest_point, move_time)
{
	level endon(#"end_game", #"hash_6468c94dec1ff598", #"dark_side_timeout");
	self moveto(dest_point.origin, move_time);
	wait(move_time);
	level notify(#"hash_5a95b150295599a9");
}

/*
	Name: function_bc8a5d56
	Namespace: namespace_45690bb8
	Checksum: 0x28A9FBE1
	Offset: 0x3950
	Size: 0x1D0
	Parameters: 0
	Flags: Linked
*/
function function_bc8a5d56()
{
	level endon(#"end_game", #"hash_6468c94dec1ff598", #"dark_side_timeout", #"hash_5a95b150295599a9");
	foreach(loc in level.var_a4db12b6)
	{
		if(distance(self.origin, loc.origin) < 3000)
		{
			playfx(#"hash_4c34a278cf6a6581", loc.origin);
		}
	}
	foreach(loc in level.var_e4aa236f)
	{
		if(distance(self.origin, loc.origin) < 3000)
		{
			playfx(#"hash_f2490be5b318dd9", loc.origin);
		}
	}
}

/*
	Name: function_ee554505
	Namespace: namespace_45690bb8
	Checksum: 0xFFEC23F2
	Offset: 0x3B28
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_ee554505(var_24be5744)
{
	level endon(#"end_game", #"hash_5a95b150295599a9");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"newzoneactive");
		activezone = waitresult.zone;
		if(isinarray(self, activezone))
		{
			break;
		}
	}
	level notify(#"hash_6468c94dec1ff598");
	wait(1);
	var_24be5744 playsound(#"hash_7823cc80333f02b2");
	if(isdefined(var_24be5744))
	{
		var_24be5744 delete();
	}
}

/*
	Name: function_8a3b8ea1
	Namespace: namespace_45690bb8
	Checksum: 0x6B2EDFBF
	Offset: 0x3C28
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_8a3b8ea1(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level notify(#"hash_6468c94dec1ff598");
	}
}

/*
	Name: function_beb26915
	Namespace: namespace_45690bb8
	Checksum: 0xFA967EEA
	Offset: 0x3C68
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function function_beb26915(var_a276c861)
{
	level endon(#"hash_59a98cc550dbc416");
	level flag::wait_till(#"pap_quest_completed");
	level.var_e5a3bba0 = 0;
	level.var_8290e497 = 1;
	while(true)
	{
		level thread function_eb87e687();
		waitresult = undefined;
		waitresult = level waittill(#"all_players_on_rooftop", #"end_of_round");
		if(waitresult._notify == "all_players_on_rooftop" && level.round_number > level.var_e5a3bba0 && is_true(level.var_8290e497))
		{
			level thread function_9ea6f403();
		}
	}
}

/*
	Name: function_eb87e687
	Namespace: namespace_45690bb8
	Checksum: 0x3B225917
	Offset: 0x3D90
	Size: 0x1B0
	Parameters: 0
	Flags: Linked
*/
function function_eb87e687()
{
	level endon(#"hash_59a98cc550dbc416", #"end_of_round", #"end_game");
	var_4045962d = 0;
	var_de5f56d8 = getent("t_sq_crpkg_all_players_in", "targetname");
	var_1dc85dfd = 0;
	waitframe(1);
	while(true)
	{
		if(var_1dc85dfd >= 300)
		{
			break;
		}
		players = getplayers();
		foreach(player in players)
		{
			if(isalive(player) && player istouching(var_de5f56d8))
			{
				var_4045962d = var_4045962d + 1;
			}
		}
		wait(1);
		var_1dc85dfd++;
		if(var_4045962d >= players.size)
		{
			continue;
		}
		else
		{
			var_4045962d = 0;
			var_1dc85dfd = 0;
		}
	}
	level notify(#"all_players_on_rooftop");
}

/*
	Name: function_9ea6f403
	Namespace: namespace_45690bb8
	Checksum: 0x43201BC
	Offset: 0x3F48
	Size: 0x220
	Parameters: 0
	Flags: Linked
*/
function function_9ea6f403()
{
	level endon(#"hash_59a98cc550dbc416");
	foreach(destination in level.var_7d45d0d4.destinations)
	{
		if(destination.targetname === #"hash_86dbad917999c92")
		{
			foreach(location in destination.locations)
			{
				var_30cea8e0 = location.instances[#"hash_b72834e821a0e34"];
				if(isdefined(var_30cea8e0))
				{
					namespace_8b6a9d79::function_20d7e9c7(var_30cea8e0);
					var_44292111 = array::random(var_30cea8e0.var_fe2612fe[#"hash_42043afbdf06011b"]);
					s_portal = var_44292111.var_fe2612fe[#"hash_6bbb00324d163e11"][0];
					var_60470a92 = namespace_8f74625a::function_9771c7db(s_portal.origin, #"hash_24c6cc74b974a7af");
					level.var_8290e497 = 0;
					var_60470a92 thread function_ed4fed04();
					level.var_e5a3bba0 = level.round_number;
				}
			}
		}
	}
}

/*
	Name: function_ed4fed04
	Namespace: namespace_45690bb8
	Checksum: 0x6DADC734
	Offset: 0x4170
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function function_ed4fed04()
{
	level endon(#"hash_59a98cc550dbc416");
	while(true)
	{
		if(!isdefined(self))
		{
			break;
		}
		wait(1);
	}
	level.var_8290e497 = 1;
}

/*
	Name: function_64ca4757
	Namespace: namespace_45690bb8
	Checksum: 0x202C861B
	Offset: 0x41C0
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_64ca4757(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_59a98cc550dbc416");
	}
}

/*
	Name: function_55b7455c
	Namespace: namespace_45690bb8
	Checksum: 0xB6C637D5
	Offset: 0x4210
	Size: 0x2F0
	Parameters: 1
	Flags: Linked
*/
function function_55b7455c(var_a276c861)
{
	level endon(#"hash_5bd6478fda3ecd66");
	level.var_3dbbe6fd = [];
	dish_top_0 = getent("dish_top_0", "targetname");
	dish_top_1 = getent("dish_top_1", "targetname");
	dish_top_2 = getent("dish_top_2", "targetname");
	if(!isdefined(level.var_3dbbe6fd))
	{
		level.var_3dbbe6fd = [];
	}
	else if(!isarray(level.var_3dbbe6fd))
	{
		level.var_3dbbe6fd = array(level.var_3dbbe6fd);
	}
	level.var_3dbbe6fd[level.var_3dbbe6fd.size] = dish_top_0;
	if(!isdefined(level.var_3dbbe6fd))
	{
		level.var_3dbbe6fd = [];
	}
	else if(!isarray(level.var_3dbbe6fd))
	{
		level.var_3dbbe6fd = array(level.var_3dbbe6fd);
	}
	level.var_3dbbe6fd[level.var_3dbbe6fd.size] = dish_top_1;
	if(!isdefined(level.var_3dbbe6fd))
	{
		level.var_3dbbe6fd = [];
	}
	else if(!isarray(level.var_3dbbe6fd))
	{
		level.var_3dbbe6fd = array(level.var_3dbbe6fd);
	}
	level.var_3dbbe6fd[level.var_3dbbe6fd.size] = dish_top_2;
	foreach(dish_top in level.var_3dbbe6fd)
	{
		dish_top setcandamage(1);
		dish_top.var_6bcfddd1 = 0;
		dish_top.allowdeath = 0;
		dish_top.var_473cfebb = 0;
		dish_top thread function_b0f7f657();
	}
}

/*
	Name: function_b0f7f657
	Namespace: namespace_45690bb8
	Checksum: 0xB57CBF1E
	Offset: 0x4508
	Size: 0x224
	Parameters: 0
	Flags: Linked
*/
function function_b0f7f657()
{
	level endon(#"game_ended", #"hash_5bd6478fda3ecd66", #"hash_2daea69c236b4e94");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		str_name = waitresult.attacker.aat[aat::function_702fb333(waitresult.weapon)];
		if(!isdefined(str_name))
		{
			continue;
		}
		var_5980e1ed = namespace_3e3637fc::function_296cde87(str_name);
		if(isdefined(waitresult) && isplayer(waitresult.attacker) && var_5980e1ed === "ammomod_deadwire")
		{
			self thread function_8e6fde15();
			self waittill(#"rotatedone");
			self.var_6bcfddd1++;
			if((self.var_6bcfddd1 % 4) == self.script_noteworthy)
			{
				self.var_473cfebb = 1;
				playfx(#"hash_fccf37871307651", self.origin);
				if(level.var_3dbbe6fd[0].var_473cfebb && level.var_3dbbe6fd[1].var_473cfebb && level.var_3dbbe6fd[2].var_473cfebb)
				{
					break;
				}
			}
			else
			{
				self.var_473cfebb = 0;
			}
		}
	}
	wait(3);
	level thread function_58fea01e();
	level flag::set(#"hash_2daea69c236b4e94");
}

/*
	Name: function_8e6fde15
	Namespace: namespace_45690bb8
	Checksum: 0x12F4CB81
	Offset: 0x4738
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_8e6fde15()
{
	level endon(#"game_ended");
	self rotateto(self.angles - vectorscale((0, 1, 0), 90), 0.5);
}

/*
	Name: function_58fea01e
	Namespace: namespace_45690bb8
	Checksum: 0xD2115F24
	Offset: 0x4790
	Size: 0x404
	Parameters: 0
	Flags: Linked
*/
function function_58fea01e()
{
	level endon(#"game_ended", #"hash_5bd6478fda3ecd66");
	var_410d99d0 = struct::get_array("sq_dish_reception_lightning_fx_loc", "targetname");
	var_64ca6c80 = struct::get("sq_dish_reception_lightning_fx_dest_loc", "targetname");
	level clientfield::set("" + #"hash_58dd30074d399de5", 1);
	for(i = 0; i < 20; i++)
	{
		foreach(fx_loc in var_410d99d0)
		{
			fx_loc thread function_c31b11f1(var_64ca6c80);
			waitframe(1);
		}
		wait(0.02);
	}
	wait(0.3);
	level clientfield::set("" + #"hash_58dd30074d399de5", 0);
	if(isdefined(level.var_a6ee81c4))
	{
		level.var_a6ee81c4 delete();
		level.var_a6ee81c4 = undefined;
	}
	var_46358077 = getent("dc_b_box", "targetname");
	var_46358077 clientfield::set("" + #"hash_615d25f799b80ed7", 1);
	var_46358077 playsound(#"hash_70fcac9ab6cf447c");
	var_22481c68 = struct::get_array("essence_pickup_spawner", "targetname");
	foreach(var_2db4f648 in var_22481c68)
	{
		point = function_4ba8fde(#"hash_69a628368f8263f");
		item_drop::drop_item(0, undefined, 1, 0, point.id, var_2db4f648.origin, var_2db4f648.angles, 2);
		waitframe(1);
	}
	var_46358077 zm_vo::function_d6f8bbd9(#"hash_520e4b95ed5c69f6");
	wait(0.5);
	var_46358077 zm_vo::function_d6f8bbd9(#"hash_520e4b95ed5c69f6");
	wait(0.5);
	var_46358077 zm_vo::function_d6f8bbd9(#"hash_520e4b95ed5c69f6");
	wait(2);
	if(isdefined(var_46358077))
	{
		var_46358077 clientfield::set("" + #"hash_615d25f799b80ed7", 0);
	}
}

/*
	Name: function_c31b11f1
	Namespace: namespace_45690bb8
	Checksum: 0x55D07128
	Offset: 0x4BA0
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function function_c31b11f1(var_10fb1677)
{
	level endon(#"game_ended");
	fx_loc = self;
	move_time = 0.3;
	/#
		if(getdvarint(#"hash_5dfa519a8cb95559", 0) > 0.1)
		{
			move_time = getdvarint(#"hash_5dfa519a8cb95559", 0);
		}
	#/
	var_d4a2b1bb = util::spawn_model("tag_origin", fx_loc.origin, fx_loc.angles);
	var_d4a2b1bb clientfield::set("" + #"hash_1df73c94e87e145c", 1);
	var_d4a2b1bb moveto(var_10fb1677.origin, move_time);
	var_d4a2b1bb waittill(#"movedone");
	wait(0.1);
	var_d4a2b1bb clientfield::set("" + #"hash_1df73c94e87e145c", 0);
	if(!isdefined(level.var_a6ee81c4))
	{
		level.var_a6ee81c4 = playfx(#"hash_728be3505f244bcb", var_10fb1677.origin);
		level.var_a6ee81c4.angles = vectorscale((0, -1, 0), 45);
	}
	waitframe(1);
	if(isdefined(var_d4a2b1bb))
	{
		var_d4a2b1bb delete();
	}
}

/*
	Name: function_8d254596
	Namespace: namespace_45690bb8
	Checksum: 0x8A12A722
	Offset: 0x4DA8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_8d254596(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_5bd6478fda3ecd66");
	}
}

/*
	Name: function_21c1b671
	Namespace: namespace_45690bb8
	Checksum: 0x54E5183D
	Offset: 0x4DF8
	Size: 0x2CC
	Parameters: 1
	Flags: Linked
*/
function function_21c1b671(var_a276c861)
{
	level endon(#"hash_266ca46aafb25ae4");
	level thread function_80c186cb();
	var_17c3271a = [];
	var_17c3271a = struct::get_array("dp_light_loc", "targetname");
	level.var_1aa09a0 = var_17c3271a.size;
	level flag::wait_till(#"pap_quest_completed");
	level flag::wait_till_clear(#"dark_aether_active");
	var_ae85d54b = [];
	var_a75f9486 = 0;
	foreach(var_a75f9486, var_764631a2 in var_17c3271a)
	{
		var_ae85d54b[var_a75f9486] = util::spawn_model("tag_origin", var_764631a2.origin, var_764631a2.angles);
		var_ae85d54b[var_a75f9486] clientfield::set("" + #"hash_18735ccb22cdefb5", 1);
		t_damage = getent(var_764631a2.target, "targetname");
		var_7b423d38 = spawncollision(#"hash_54b848a634771748", "collider", var_ae85d54b[var_a75f9486].origin, var_ae85d54b[var_a75f9486].angles);
		var_ae85d54b[var_a75f9486].t_damage = t_damage;
		var_ae85d54b[var_a75f9486].var_7b423d38 = var_7b423d38;
		var_ae85d54b[var_a75f9486] thread function_d54434e2();
		var_ae85d54b[var_a75f9486] thread function_31fabc7c();
		/#
			var_ae85d54b[var_a75f9486] thread function_e2d49973();
		#/
	}
	level.var_ae85d54b = var_ae85d54b;
	level flag::wait_till(#"hash_76b83a765dea94a5");
}

/*
	Name: function_e2d49973
	Namespace: namespace_45690bb8
	Checksum: 0xB26745D5
	Offset: 0x50D0
	Size: 0x4E
	Parameters: 0
	Flags: Private
*/
function private function_e2d49973()
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
	Name: function_80c186cb
	Namespace: namespace_45690bb8
	Checksum: 0x897533C9
	Offset: 0x5128
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_80c186cb()
{
	level endon(#"hash_76b83a765dea94a5", #"hash_266ca46aafb25ae4");
	level flag::wait_till(#"hash_3e332b6888c86102");
	if(isdefined(level.var_ae85d54b))
	{
		foreach(var_33aa4c59 in level.var_ae85d54b)
		{
			if(isdefined(var_33aa4c59.t_damage))
			{
				var_33aa4c59.t_damage delete();
			}
			if(isdefined(var_33aa4c59.var_7b423d38))
			{
				var_33aa4c59.var_7b423d38 delete();
			}
			if(isdefined(var_33aa4c59))
			{
				var_33aa4c59 delete();
			}
		}
	}
	level flag::set("dance_party_disabled");
}

/*
	Name: function_d54434e2
	Namespace: namespace_45690bb8
	Checksum: 0xE1747621
	Offset: 0x5290
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function function_d54434e2()
{
	level endon(#"hash_266ca46aafb25ae4");
	self endon(#"death");
	t_damage = self.t_damage;
	while(true)
	{
		s_result = undefined;
		s_result = t_damage waittill(#"damage");
		mod = s_result.mod;
		if(level flag::get("in_dark_side"))
		{
			continue;
		}
		if(mod === "MOD_EXPLOSIVE" || mod === "MOD_GRENADE" || mod === "MOD_GRENADE_SPLASH")
		{
			continue;
		}
		if(isdefined(t_damage) && isdefined(level.var_1aa09a0) && isdefined(self) && isplayer(s_result.attacker))
		{
			level.var_1aa09a0--;
			if(level.var_1aa09a0 == 0)
			{
				level flag::set(#"hash_76b83a765dea94a5");
			}
			t_damage.in_use = 0;
			waitframe(1);
			if(isdefined(t_damage))
			{
				t_damage delete();
			}
			if(isdefined(self.var_7b423d38))
			{
				self.var_7b423d38 delete();
			}
			if(isdefined(self))
			{
				self delete();
			}
		}
		break;
	}
}

/*
	Name: function_31fabc7c
	Namespace: namespace_45690bb8
	Checksum: 0xF489B5F7
	Offset: 0x5478
	Size: 0x208
	Parameters: 0
	Flags: Linked
*/
function function_31fabc7c()
{
	level endon(#"hash_76b83a765dea94a5", #"hash_266ca46aafb25ae4");
	self endon(#"death");
	t_damage = self.t_damage;
	var_7b423d38 = self.var_7b423d38;
	var_7b423d38 setscale(0.5);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"into_the_dark_side", #"rbz_exfil_beacon_active");
		if(!isdefined(t_damage) || !isdefined(var_7b423d38))
		{
			break;
		}
		if(waitresult._notify === #"into_the_dark_side")
		{
			self function_22198558(t_damage, var_7b423d38, 1);
			level waittill(#"dark_aether_active");
		}
		else if(waitresult._notify === "rbz_exfil_beacon_active")
		{
			if(!level flag::get("rbz_exfil_beacon_active"))
			{
				continue;
			}
			self function_22198558(t_damage, var_7b423d38, 1);
		}
		level flag::wait_till_clear_all([1:"rbz_exfil_beacon_active", 0:#"in_dark_side"]);
		if(!isdefined(t_damage) || !isdefined(var_7b423d38))
		{
			break;
		}
		self function_22198558(t_damage, var_7b423d38, 0);
	}
}

/*
	Name: function_22198558
	Namespace: namespace_45690bb8
	Checksum: 0x1C2382CC
	Offset: 0x5688
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_22198558(t_damage, var_7b423d38, b_hide)
{
	if(b_hide)
	{
		t_damage setinvisibletoall();
		var_7b423d38 notsolid();
		self clientfield::set("" + #"hash_18735ccb22cdefb5", 0);
	}
	else
	{
		var_7b423d38 solid();
		t_damage setvisibletoall();
		self clientfield::set("" + #"hash_18735ccb22cdefb5", 1);
	}
}

/*
	Name: function_51bd2bd5
	Namespace: namespace_45690bb8
	Checksum: 0x1F25C4A7
	Offset: 0x5770
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_51bd2bd5(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_76b83a765dea94a5");
	}
}

/*
	Name: function_8d749d26
	Namespace: namespace_45690bb8
	Checksum: 0xF0E52B27
	Offset: 0x57C0
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function function_8d749d26(var_a276c861)
{
	level endon(#"hash_6f9137e153db482");
	if(level flag::get("dance_party_disabled"))
	{
		return;
	}
	var_10fb1677 = struct::get("dp_dest_loc", "targetname");
	level notify(#"into_the_dark_side", {#hash_cbc8cfb4:var_10fb1677});
	if(!level flag::get("pap_quest_completed"))
	{
		level flag::set(#"hash_447ca5049bb26ab6");
		if(isdefined(level.var_f2484ed9))
		{
			level.var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
		}
	}
	level flag::clear("spawn_zombies");
	wait(7);
	level thread function_23faa111();
	level notify(#"hash_6990bc8ecd1b7d78");
	level clientfield::set("" + #"hash_195f6fa038980aca", 1);
	wait(1);
	level thread function_2f2e92a7();
	level thread function_88917c8f();
	scene::add_scene_func(#"aib_t9_cust_zm_silver_easter_egg_4_zombies", &function_ee30d42e, "Dance");
	level thread scene::play(#"aib_t9_cust_zm_silver_easter_egg_4_zombies", "Dance");
}

/*
	Name: function_ee30d42e
	Namespace: namespace_45690bb8
	Checksum: 0xDEC6A843
	Offset: 0x5A00
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_ee30d42e(a_ents)
{
	foreach(ent in a_ents)
	{
		if(isactor(ent))
		{
			ent clientfield::set("" + #"hash_3d14472eb7838c71", 1);
		}
	}
	var_99afb2eb = a_ents[#"hash_2895a9245fa19e4a"];
	if(isdefined(var_99afb2eb))
	{
		origin = var_99afb2eb gettagorigin("tag_weapon_right");
		level.var_bf71a40b = util::spawn_model(#"p9_sur_crate_chest_world_01_med_green", origin, vectorscale((0, 1, 0), 90));
		level.var_bf71a40b linkto(var_99afb2eb, "tag_weapon_right");
	}
	self thread function_1c448218(a_ents);
}

/*
	Name: function_1c448218
	Namespace: namespace_45690bb8
	Checksum: 0x8D39051F
	Offset: 0x5B90
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_1c448218(a_ents)
{
	level endon(#"hash_30ec56bfd9c6963c");
	while(true)
	{
		level waittill(#"hash_6e5b817445ec5478");
		if(self.script_noteworthy === "move_forward")
		{
			if(isdefined(a_ents[#"hash_a324132b6899fbe"]))
			{
				ent = a_ents[#"hash_a324132b6899fbe"];
				self.origin = ent.origin;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_56bfaadc
	Namespace: namespace_45690bb8
	Checksum: 0xC29C53C2
	Offset: 0x5C40
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_56bfaadc()
{
	wait(7);
	level notify(#"hash_30ec56bfd9c6963c");
	if(isdefined(level.var_bf71a40b))
	{
		level.var_bf71a40b delete();
	}
}

/*
	Name: function_23faa111
	Namespace: namespace_45690bb8
	Checksum: 0x8F786895
	Offset: 0x5C98
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function function_23faa111()
{
	var_357736ee = level.zones;
	var_2b198109 = getaiteamarray(level.zombie_team);
	if(isdefined(level.var_24de243e))
	{
		foreach(steiner in level.var_24de243e)
		{
			arrayremovevalue(var_2b198109, steiner);
		}
	}
	foreach(zone in var_357736ee)
	{
		foreach(e_zombie in var_2b198109)
		{
			str_zone = zm_zonemgr::get_zone_from_position(e_zombie.origin);
			if(isalive(e_zombie) && (isdefined(e_zombie.zone_name) && e_zombie.zone_name == zone.name || str_zone === zone.name))
			{
				e_zombie hide();
				e_zombie.marked_for_death = 1;
				e_zombie.allowdeath = 1;
				e_zombie kill();
			}
		}
	}
}

/*
	Name: function_88917c8f
	Namespace: namespace_45690bb8
	Checksum: 0x7211E7DC
	Offset: 0x5F18
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function function_88917c8f()
{
	var_90b526f0 = [];
	var_90b526f0 = struct::get_array("dance_party_single_zombie_loc", "targetname");
	foreach(var_ee3c4cd2 in var_90b526f0)
	{
		if(var_ee3c4cd2.script_noteworthy === "move_forward")
		{
			var_ee3c4cd2 thread function_3aa5d141();
			continue;
		}
		var_ee3c4cd2 thread function_8ea73713();
	}
}

/*
	Name: function_3aa5d141
	Namespace: namespace_45690bb8
	Checksum: 0xEFB25FC6
	Offset: 0x6008
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_3aa5d141()
{
	level endon(#"hash_30ec56bfd9c6963c");
	var_6d620aac = 1;
	str_state = "Dance_Forward_" + var_6d620aac;
	scene::add_scene_func(#"aib_t9_cust_zm_silver_easter_egg_single_zombie_1", &function_ee30d42e, str_state);
	for(var_9f1ef22d = 3; var_9f1ef22d > 0; var_9f1ef22d--)
	{
		self thread scene::play("aib_t9_cust_zm_silver_easter_egg_single_zombie_1", str_state);
		level waittill(#"hash_6e5b817445ec5478");
		waitframe(1);
	}
	self thread function_8ea73713();
}

/*
	Name: function_8ea73713
	Namespace: namespace_45690bb8
	Checksum: 0x33E3B28E
	Offset: 0x60F8
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_8ea73713()
{
	level endon(#"hash_30ec56bfd9c6963c");
	var_d148739 = function_21a3a673(1, 4);
	str_state = "Dance_Idle_" + var_d148739;
	scene::add_scene_func(#"aib_t9_cust_zm_silver_easter_egg_single_zombie_1", &function_ee30d42e, str_state);
	self scene::play("aib_t9_cust_zm_silver_easter_egg_single_zombie_1", str_state);
}

/*
	Name: function_2f2e92a7
	Namespace: namespace_45690bb8
	Checksum: 0x3E5F926D
	Offset: 0x61B0
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_2f2e92a7()
{
	level endon(#"hash_6f9137e153db482");
	waitresult = undefined;
	waitresult = level waittill(#"dark_side_timeout", #"dance_party_ready_to_clean_up");
	level thread function_56bfaadc();
	if(waitresult._notify == "dance_party_ready_to_clean_up")
	{
		var_10fb1677 = struct::get("dp_dest_loc", "targetname");
		level notify(#"hash_61e8a39b3a4bee6a", {#hash_cbc8cfb4:var_10fb1677});
	}
	wait(7);
	level notify(#"hash_7c5254a6859e80b2");
	level clientfield::set("" + #"hash_195f6fa038980aca", 0);
	level flag::set("spawn_zombies");
	level scene::delete_scene_spawned_ents("aib_t9_cust_zm_silver_easter_egg_4_zombies");
	level scene::delete_scene_spawned_ents("aib_t9_cust_zm_silver_easter_egg_single_zombie_1");
	level function_8e8d08cd();
}

/*
	Name: function_dd843411
	Namespace: namespace_45690bb8
	Checksum: 0x848BBF30
	Offset: 0x6350
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_dd843411(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_6f9137e153db482");
	}
}

/*
	Name: function_8e8d08cd
	Namespace: namespace_45690bb8
	Checksum: 0x29C7E2FA
	Offset: 0x63A0
	Size: 0x2D4
	Parameters: 0
	Flags: Linked
*/
function function_8e8d08cd()
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
			level.var_a04cebc2 = chest;
			level.var_a04cebc2.var_f3a3c164 = 1;
		}
	}
	/#
		assert(isdefined(level.var_a04cebc2));
	#/
	level.var_a04cebc2.scriptmodel solid();
	level.var_a04cebc2.trigger.var_cc1fb2d0 = #"hash_24c6cc74b974a7af";
	level.var_a04cebc2 thread function_4dad3cb6();
	level.var_a04cebc2 util::delay(300, "chest_opened", &function_3076a002);
}

/*
	Name: function_4dad3cb6
	Namespace: namespace_45690bb8
	Checksum: 0x624672D6
	Offset: 0x6680
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_4dad3cb6()
{
	level endon(#"hash_6f9137e153db482");
	self endon(#"death");
	self.trigger endon(#"death");
	self.trigger waittill(#"chest_opened");
	self notify(#"chest_opened");
	self util::delay(5, undefined, &function_3076a002);
}

/*
	Name: function_3076a002
	Namespace: namespace_45690bb8
	Checksum: 0x2A4D96E8
	Offset: 0x6728
	Size: 0x19C
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
		playsoundatposition(#"hash_2f1ae087d02ed33f", chest.origin);
		chest radiusdamage(chest.origin, 128, 50, 10, undefined, "MOD_EXPLOSIVE", getweapon(#"supplydrop"));
		chest delete();
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
}

/*
	Name: function_79f95e6e
	Namespace: namespace_45690bb8
	Checksum: 0xDE2F1E13
	Offset: 0x68D0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_79f95e6e(var_a276c861)
{
	level thread function_526cdf65();
	level flag::wait_till(#"hash_2911197b2e79b446");
}

/*
	Name: function_526cdf65
	Namespace: namespace_45690bb8
	Checksum: 0x98B7343D
	Offset: 0x6920
	Size: 0x2F8
	Parameters: 0
	Flags: Linked
*/
function function_526cdf65()
{
	level endon(#"hash_2911197b2e79b446");
	var_538ce99a = [];
	var_538ce99a = struct::get_array("eye_in_dark_loc", "targetname");
	foreach(var_a778542f in var_538ce99a)
	{
		var_a778542f.killed = 0;
		var_a778542f.location_name = var_a778542f.script_string;
	}
	level.var_5120faba = var_538ce99a.size;
	var_a75f9486 = 0;
	var_152de0b1 = struct::get("eye_in_dark_hide_loc", "targetname");
	var_d7b6dd6d = util::spawn_model(#"c_t9_zmb_posed_quest_zombie", var_152de0b1.origin, var_152de0b1.angles);
	var_d7b6dd6d hide();
	while(true)
	{
		level waittill(#"dark_aether_active", #"hash_f288a78914e3fac");
		waitframe(1);
		if(!level flag::get(#"dark_aether_active"))
		{
			continue;
		}
		if(level.var_5120faba <= 0)
		{
			level flag::set(#"hash_2911197b2e79b446");
			break;
		}
		while(true)
		{
			var_fa613cb5 = array::random(var_538ce99a);
			var_d7b6dd6d.origin = var_fa613cb5.origin;
			var_d7b6dd6d.location_name = var_fa613cb5.location_name;
			if(!is_true(var_fa613cb5.killed))
			{
				var_d7b6dd6d thread function_fd27a338(var_fa613cb5);
				var_218c22c5 = var_fa613cb5.script_noteworthy;
				namespace_812a8849::function_32ba2029(("eye_" + var_218c22c5) + "_light_on");
				/#
					iprintln("" + var_fa613cb5.location_name);
				#/
				break;
			}
		}
	}
}

/*
	Name: function_fd27a338
	Namespace: namespace_45690bb8
	Checksum: 0x7E952E64
	Offset: 0x6C20
	Size: 0x214
	Parameters: 1
	Flags: Linked
*/
function function_fd27a338(var_15d95704)
{
	level endon(#"hash_2911197b2e79b446", #"dark_side_timeout", #"hash_7e1e35ba97e10de9");
	self thread function_eb80562f(var_15d95704);
	self show();
	self clientfield::set("" + #"hash_acf98ff6d976e10", 1);
	self setcandamage(1);
	self bobbing((0, 0, 1), randomfloatrange(2, 10), randomfloatrange(5, 7));
	if(math::cointoss())
	{
		self rotate((randomintrange(20 * -1, 20), randomintrange(20 * -1, 20), randomintrange(20 * -1, 20)));
	}
	/#
		if(getdvarint(#"hash_195b99ea080e0f20", 0) != 0)
		{
			namespace_ee206246::objective_set(#"hash_9096d6ed99664a0", var_15d95704, 1, undefined);
		}
	#/
	if(isdefined(self.location_name))
	{
		self thread function_bc356a4c(var_15d95704);
	}
}

/*
	Name: function_bc356a4c
	Namespace: namespace_45690bb8
	Checksum: 0x6CAC4B2
	Offset: 0x6E40
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_bc356a4c(var_15d95704)
{
	level endon(#"hash_2911197b2e79b446", #"dark_side_timeout");
	self endon(#"death", #"hash_2d8f3026ed597bb3");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isplayer(waitresult.attacker))
		{
			self setcandamage(0);
			var_15d95704.killed = 1;
			self clientfield::set("" + #"hash_7e481cd16f021d79", 1);
			playsoundatposition(#"hash_106388692221317d", self.origin);
			self hide();
			namespace_812a8849::function_32ba2029("eye_corpse_all_lights_off");
			level notify(#"hash_f288a78914e3fac");
			level.var_5120faba--;
			break;
		}
	}
}

/*
	Name: function_eb80562f
	Namespace: namespace_45690bb8
	Checksum: 0x6E16FC2E
	Offset: 0x6FB8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_eb80562f(var_15d95704)
{
	level endon(#"hash_2911197b2e79b446");
	level flag::wait_till_clear(#"dark_aether_active");
	self clientfield::set("" + #"hash_7e481cd16f021d79", 1);
	self hide();
	self clientfield::set("" + #"hash_acf98ff6d976e10", 0);
	self notify(#"hash_2d8f3026ed597bb3");
	namespace_812a8849::function_32ba2029("eye_corpse_all_lights_off");
	/#
		if(getdvarint(#"hash_195b99ea080e0f20", 0) != 0)
		{
			namespace_ee206246::function_3029d343(#"hash_9096d6ed99664a0");
		}
	#/
}

/*
	Name: function_6d60894b
	Namespace: namespace_45690bb8
	Checksum: 0xEA95339C
	Offset: 0x70F0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_6d60894b(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_2911197b2e79b446");
	}
}

/*
	Name: function_de12a4a9
	Namespace: namespace_45690bb8
	Checksum: 0x98517738
	Offset: 0x7140
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_de12a4a9(var_a276c861)
{
	level endon(#"hash_7e1e35ba97e10de9");
	var_30925401 = struct::get("eye_in_dark_final_loc", "targetname");
	var_adeed566 = util::spawn_model(#"c_t9_zmb_posed_quest_zombie", var_30925401.origin, var_30925401.angles);
	var_adeed566.script_noteworthy = var_30925401.script_noteworthy;
	var_adeed566 hide();
	var_adeed566.killed = 0;
	var_adeed566 thread function_58095ffb(var_30925401);
}

/*
	Name: function_58095ffb
	Namespace: namespace_45690bb8
	Checksum: 0x254CE5DC
	Offset: 0x7220
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_58095ffb(var_a676c9e4)
{
	level endon(#"hash_7e1e35ba97e10de9");
	while(true)
	{
		if(is_false(self.killed))
		{
			self thread function_fd27a338(var_a676c9e4);
			self thread function_f05d7d5b();
			self thread function_98908135();
			var_218c22c5 = self.script_noteworthy;
			namespace_812a8849::function_32ba2029("eye_corpse_final_light_on");
		}
		level waittill(#"into_the_dark_side");
		level flag::wait_till(#"dark_aether_active");
	}
}

/*
	Name: function_f05d7d5b
	Namespace: namespace_45690bb8
	Checksum: 0xE57FE757
	Offset: 0x7318
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_f05d7d5b()
{
	level endon(#"hash_7e1e35ba97e10de9", #"dark_side_timeout");
	self endon(#"hash_ded7646063b7a4d");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isplayer(waitresult.attacker))
		{
			self notify(#"hash_472280df4a5df5a9");
			self setcandamage(0);
			self.killed = 1;
			self hide();
			var_218c22c5 = self.script_noteworthy;
			namespace_812a8849::function_32ba2029("eye_corpse_all_lights_off");
			self clientfield::set("" + #"hash_7e481cd16f021d79", 1);
			playsoundatposition(#"hash_106388692221317d", self.origin);
			break;
		}
	}
	self thread function_ae4f7550();
}

/*
	Name: function_ae4f7550
	Namespace: namespace_45690bb8
	Checksum: 0xD2A5AD0A
	Offset: 0x7490
	Size: 0x140
	Parameters: 0
	Flags: Linked
*/
function function_ae4f7550()
{
	level endon(#"hash_7e1e35ba97e10de9");
	var_f4485dae = getplayers();
	foreach(player in var_f4485dae)
	{
		if(isalive(player))
		{
			var_f506d938 = zm_magicbox::function_38456836();
			point = function_4ba8fde(var_f506d938);
			item_drop::drop_item(0, undefined, 1, 0, point.id, self.origin - vectorscale((0, 0, 1), 80), self.angles, 4);
		}
	}
}

/*
	Name: function_98908135
	Namespace: namespace_45690bb8
	Checksum: 0x7EC3BB02
	Offset: 0x75D8
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_98908135()
{
	level endon(#"hash_7e1e35ba97e10de9", #"dark_side_timeout");
	self endon(#"hash_472280df4a5df5a9");
	trigger = getent("t_final_corpse", "targetname");
	waitresult = undefined;
	waitresult = trigger waittill(#"trigger");
	self notify(#"hash_ded7646063b7a4d");
	self setcandamage(0);
	self.killed = 1;
	self hide();
	namespace_812a8849::function_32ba2029("eye_corpse_all_lights_off");
	self clientfield::set("" + #"hash_7e481cd16f021d79", 1);
	playsoundatposition(#"hash_106388692221317d", self.origin);
	level thread function_955d66bb(waitresult);
}

/*
	Name: function_955d66bb
	Namespace: namespace_45690bb8
	Checksum: 0x71D77683
	Offset: 0x7748
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_955d66bb(waitresult)
{
	level endon(#"hash_7e1e35ba97e10de9");
	wait(2);
	/#
		assert(isdefined(waitresult.activator), "");
	#/
	player = waitresult.activator;
	if(isalive(player))
	{
		level function_1fcc39f1(player);
	}
}

/*
	Name: function_332fa187
	Namespace: namespace_45690bb8
	Checksum: 0x54805AA1
	Offset: 0x77E8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_332fa187(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_7e1e35ba97e10de9");
	}
}

/*
	Name: function_2d90874d
	Namespace: namespace_45690bb8
	Checksum: 0x3A811B60
	Offset: 0x7838
	Size: 0x2E8
	Parameters: 1
	Flags: Linked
*/
function function_2d90874d(var_a276c861)
{
	level endon(#"hash_3c62d3b6b67922c0");
	var_c64cebdb = 0;
	level.var_2aeeb358 = [];
	level.var_2aeeb358[0] = getweapon("ray_gun");
	while(!var_c64cebdb)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_39b0256c6c9885fc");
		if(isdefined(waitresult.e_player))
		{
			waitresult.e_player scene::function_27f5972e("p9_fxanim_zm_grab_attack");
		}
		var_89e3316b = waitresult.var_c192c739;
		magic_box = var_89e3316b.s_chest;
		magic_box.zbarrier waittill(#"randomization_done");
		weapon = magic_box.zbarrier.weapon;
		/#
			if(is_true(level.var_b6c03aaa))
			{
				break;
			}
		#/
		player = waitresult.e_player;
		if(!isdefined(player))
		{
			continue;
		}
		player scene::function_f81475ae("p9_fxanim_zm_grab_attack");
		dist = distance2d(magic_box.origin, player.origin);
		if(dist <= 36)
		{
			v_angles = player getplayerangles();
			if(util::within_fov(player getplayercamerapos(), v_angles, magic_box.origin, 0.55))
			{
				var_f2535f5c = player function_bdda420f(player.origin, 128);
				if(isdefined(var_f2535f5c))
				{
					var_80320e3c = math::cointoss(50);
					if(var_80320e3c && isdefined(weapon) && weapon != level.weaponnone && isinarray(level.var_2aeeb358, weapon.var_627c698b))
					{
						if(isdefined(player))
						{
							var_c64cebdb = 1;
							level function_1fcc39f1(player);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_8a4a003d
	Namespace: namespace_45690bb8
	Checksum: 0xCF76609C
	Offset: 0x7B28
	Size: 0xE
	Parameters: 1
	Flags: None
*/
function function_8a4a003d(player)
{
	return false;
}

/*
	Name: function_1fcc39f1
	Namespace: namespace_45690bb8
	Checksum: 0xE5C7320B
	Offset: 0x7B40
	Size: 0x4B4
	Parameters: 1
	Flags: Linked
*/
function function_1fcc39f1(player)
{
	level endon(#"hash_3c62d3b6b67922c0");
	level notify(#"player_grabbed");
	var_6a798feb = player.origin + (anglestoforward(player.angles) * 45);
	v_to_player = player.origin - var_6a798feb;
	v_angles = vectortoangles(v_to_player);
	var_b7c784c2 = util::spawn_model("tag_origin", var_6a798feb, v_angles);
	var_b7c784c2 enablelinkto();
	var_b7c784c2 linkto(player);
	player setstance("stand");
	player val::set(#"hash_740a4b953289badd", "ignoreme", 1);
	v_player_angles = player getplayerangles();
	if(v_player_angles[0] > 10)
	{
		v_player_angles = (10, v_player_angles[1], v_player_angles[2]);
	}
	else if(v_player_angles[0] < 10)
	{
		v_player_angles = (-10, v_player_angles[1], v_player_angles[2]);
	}
	player setplayerangles(v_player_angles);
	player capturnrate(1, 0);
	player thread function_93a73f43();
	player playsound(#"hash_212f200772bcb450");
	scene::add_scene_func("p9_fxanim_zm_grab_attack", &function_bea256c, "bite");
	var_b7c784c2 thread scene::play("p9_fxanim_zm_grab_attack", "bite");
	var_56009dae = getanimlength("ai_t9_zm_ghoul_box_scare");
	if(animhasnotetrack("ai_t9_zm_ghoul_box_scare", "start_scale"))
	{
		time = getnotetracktimes("ai_t9_zm_ghoul_box_scare", "start_scale")[0];
		wait_time = var_56009dae * time;
		n_time = var_56009dae - wait_time;
		wait(wait_time);
	}
	if(isdefined(player))
	{
		player flag::set("grab_done");
		player capturnrate(0, 0);
		player clientfield::set_to_player("" + #"hash_802934d416ac981", 0);
	}
	n_scale = 1;
	var_ee107645 = 1 / (n_time / (float(function_60d95f53()) / 1000));
	while(n_scale > 0)
	{
		if(isdefined(level.var_578f8cf3))
		{
			level.var_578f8cf3 setscale(n_scale);
		}
		wait(float(function_60d95f53()) / 1000);
		n_scale = n_scale - var_ee107645;
	}
	wait(0.1);
	var_b7c784c2 scene::delete_scene_spawned_ents("p9_fxanim_zm_grab_attack");
	if(isdefined(player))
	{
		player thread function_dd3f7bec();
	}
}

/*
	Name: function_bea256c
	Namespace: namespace_45690bb8
	Checksum: 0xE7D26F2A
	Offset: 0x8000
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_bea256c(a_ents)
{
	level.var_578f8cf3 = a_ents[#"hash_71ebc07fdbf9366a"];
}

/*
	Name: function_93a73f43
	Namespace: namespace_45690bb8
	Checksum: 0xC60823F
	Offset: 0x8030
	Size: 0x178
	Parameters: 0
	Flags: Linked
*/
function function_93a73f43()
{
	level endon(#"hash_3c62d3b6b67922c0");
	player = self;
	player endon(#"death", #"grab_done");
	player clientfield::set_to_player("" + #"hash_802934d416ac981", 1);
	wait(1);
	while(true)
	{
		player viewkick(10, player.origin + (anglestoforward(player.angles + (0, randomintrange(90, 270), 0))));
		screenshake(player.origin, 4, 0, 2, 0.66, 0, 0.66, 0, 10, 0, 20, 2);
		player playrumbleonentity("damage_heavy");
		wait(randomfloatrange(0.3, 0.5));
	}
}

/*
	Name: function_dd3f7bec
	Namespace: namespace_45690bb8
	Checksum: 0x7A436ACC
	Offset: 0x81B0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_dd3f7bec()
{
	level endon(#"hash_3c62d3b6b67922c0");
	player = self;
	player endon(#"disconnect");
	wait(15);
	player val::reset(#"hash_740a4b953289badd", "ignoreme");
}

/*
	Name: function_d12a9c3
	Namespace: namespace_45690bb8
	Checksum: 0x80D66E24
	Offset: 0x8228
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_d12a9c3()
{
	self endon(#"death");
	level endon(#"hash_3c62d3b6b67922c0");
	wait(0.3);
	self triggerenable(1);
	s_chest = self.s_chest;
	s_chest.weapon_out = 1;
	s_chest.var_7672d70d = 1;
	self notify(#"trigger", {#activator:level});
	level.var_2f57e2d2 = undefined;
}

/*
	Name: function_3822111d
	Namespace: namespace_45690bb8
	Checksum: 0x457494FD
	Offset: 0x82E0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_3822111d(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_3c62d3b6b67922c0");
	}
}

/*
	Name: function_4b06b46e
	Namespace: namespace_45690bb8
	Checksum: 0xC82D09EB
	Offset: 0x8330
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_4b06b46e()
{
	/#
		zm_devgui::add_custom_devgui_callback(&function_dfe8c2c1);
	#/
}

/*
	Name: function_dfe8c2c1
	Namespace: namespace_45690bb8
	Checksum: 0xA3E60700
	Offset: 0x8368
	Size: 0x20A
	Parameters: 1
	Flags: Private
*/
function private function_dfe8c2c1(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_73ad7937c802d48e":
			{
				setdvar(#"hash_186066f95083b691", 1);
				break;
			}
			case "hash_312a5d140fb23817":
			{
				array::thread_all(getplayers(), &function_4bb7eb36);
				level thread function_97d80e41();
				break;
			}
			case "hash_4e8ee4f2c08fdf6b":
			{
				level thread function_8d749d26(0);
				break;
			}
			case "hash_1f0b8dc93909a49a":
			{
				level flag::set(#"pap_quest_completed");
				break;
			}
			case "hash_195b99ea080e0f20":
			{
				setdvar(#"hash_195b99ea080e0f20", 1);
				break;
			}
			case "hash_24b5b1c043d9b141":
			{
				level thread function_e1e8a6d9();
				break;
			}
			case "hash_e72e898751a21e3":
			{
				level thread function_54c0bf00();
				break;
			}
			case "hash_500437a64a5f81ff":
			{
				level thread function_58fea01e();
				break;
			}
			case "hash_618a6bfc726419ff":
			{
				level thread function_735d02f6();
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_4bb7eb36
	Namespace: namespace_45690bb8
	Checksum: 0x19B13BD5
	Offset: 0x8580
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_4bb7eb36()
{
	/#
		zm_devgui::function_4bb7eb36();
	#/
}

/*
	Name: function_97d80e41
	Namespace: namespace_45690bb8
	Checksum: 0x26DF89D
	Offset: 0x85A8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_97d80e41()
{
	/#
		level.var_b6c03aaa = 1;
		while(true)
		{
			waitresult = undefined;
			waitresult = level waittill(#"hash_39b0256c6c9885fc");
			var_89e3316b = waitresult.var_c192c739;
			magic_box = var_89e3316b.s_chest;
			magic_box.zbarrier waittill(#"randomization_done");
			level.chest_accessed = 0;
			player = waitresult.e_player;
			level function_1fcc39f1(player);
		}
	#/
}

/*
	Name: function_e1e8a6d9
	Namespace: namespace_45690bb8
	Checksum: 0xD765AD
	Offset: 0x8678
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_e1e8a6d9()
{
	/#
		setdvar(#"hash_5a8a4ab51def32b1", 1);
		level notify(#"into_the_dark_side");
		player = util::gethostplayer();
		player waittill(#"fasttravel_over");
		level thread function_b3dff8ff();
	#/
}

/*
	Name: function_54c0bf00
	Namespace: namespace_45690bb8
	Checksum: 0x9067CB14
	Offset: 0x8710
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_54c0bf00()
{
	/#
		player = util::gethostplayer();
		player setorigin((39, 1880, -342));
	#/
}

/*
	Name: function_735d02f6
	Namespace: namespace_45690bb8
	Checksum: 0x102791D6
	Offset: 0x8768
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function function_735d02f6()
{
	/#
		level thread function_54c0bf00();
		level flag::set("");
		level flag::set(#"hash_46113ff0abdbbbb8");
		var_2c8ebaf = struct::get("", "");
		var_82a319ce = util::spawn_model(#"p8_zm_ori_button_alarm", var_2c8ebaf.origin, var_2c8ebaf.angles);
		var_82a319ce moveto(var_82a319ce.origin + vectorscale((1, 0, 0), 15), 2);
		var_82a319ce waittill(#"movedone");
	#/
}

