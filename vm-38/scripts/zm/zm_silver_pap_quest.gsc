#using script_3cebb48c37fc271;
#using script_432a18be09b697bd;
#using script_52c6c2d1a2ef1b46;
#using script_5bb072c3abf4652c;
#using script_613bf3e46dacdcfc;
#using script_669400ff5aadcc83;
#using script_6c5b51f98cd04fa3;
#using script_8988fdbc78d6c53;
#using script_db06eb511bd9b36;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_silver.gsc;
#using scripts\zm\zm_silver_sound.gsc;
#using scripts\zm\zm_silver_util.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_9f845210;

/*
	Name: function_8a8fb58b
	Namespace: namespace_9f845210
	Checksum: 0x8BB7B34D
	Offset: 0xA78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8a8fb58b()
{
	level notify(1373476424);
}

/*
	Name: init
	Namespace: namespace_9f845210
	Checksum: 0x6DC704A9
	Offset: 0xA98
	Size: 0x8D4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_7bfbe1fc = getent("zm_pla_mac_clip", "script_noteworthy");
	level.var_7bfbe1fc notsolid();
	level.var_7bfbe1fc connectpaths();
	var_7692d390 = getentarray("script_plane_collision", "targetname");
	array::run_all(var_7692d390, &disconnectpaths);
	truckcollision = getent("script_truck_collision", "targetname");
	truckcollision disconnectpaths();
	hidemiscmodels("sky_jellyfish");
	hidemiscmodels("zm_txt_eng");
	hidemiscmodels("zm_txt_ven");
	hidemiscmodels("zm_txt_sta");
	hidemiscmodels("zm_txt_pass");
	hidemiscmodels("zm_txt_ass");
	hidemiscmodels("zm_silver_normal_computers");
	hidemiscmodels("zm_tm_blue_at");
	hidemiscmodels("zm_tm_red_at");
	hidemiscmodels("zm_tm_blue_in");
	hidemiscmodels("zm_tm_red_in");
	hidemiscmodels("txt_clu_fml");
	hidemiscmodels("text_clue_stolen");
	clientfield::register("world", "" + #"hash_27895772c4825a7a", 1, 1, "int");
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_14ba797c22b75dda", 1, 1, "counter");
	function_e21028db("init");
	level thread scene::init(#"hash_2f425040d5e62683");
	level thread scene::init(#"hash_3b239490a05b582e");
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_death);
	level.var_b80c4ecc = [18:"zone_trans_north_pap_room", 17:"zone_trans_south_pap_room", 16:"zone_trans_south_tunnel", 15:"zone_power_tunnel", 14:"zone_center_lower", 13:"zone_center_upper", 12:"zone_center_upper_north", 11:"zone_center_upper_west", 10:"zone_trans_south", 9:"zone_trans_north", 8:"zone_power_trans_south", 7:"zone_power_trans_north", 6:"zone_power_room_outside", 5:"zone_power_room", 4:"zone_tunnel_interior", 3:"zone_proto_upstairs_2", 2:"zone_proto_interior_lower", 1:"zone_proto_interior_cave", 0:"zone_proto_upstairs"];
	level thread function_cd3e7a69();
	if(getgametypesetting(#"hash_19d48a0d4490b0a2") != 1)
	{
		return;
	}
	/#
		execdevgui("");
		level thread function_1579f31();
	#/
	clientfield::register("world", "" + #"hash_5cf186464ce9cdd6", 1, 1, "counter");
	clientfield::register("world", "" + #"hash_7b3ada6e5b1cf81e", 1, 1, "int");
	clientfield::register("world", "" + #"hash_53c6d001e2faecab", 1, 1, "counter");
	clientfield::register("world", "" + #"hash_266f6fe481bab1bc", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_1fa45e1c3652d753", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_c34d1c4bd1aa84a", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"particle_accelerator_rumble", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_7ec80a02e9bb051a", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5a293ad1c677dc7e", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7919b736a767a0f5", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_54d221181b1a11f", 1, 2, "int");
	clientfield::register("world", "" + #"hash_51ed1d1064cfb0e", 1, 1, "int");
	level thread pap_quest_init();
	level thread function_52d97f7e();
	level thread function_4b593f32();
	level.var_67e9e1a7 = 0;
	callback::on_actor_killed(&function_3629d229);
	callback::add_callback(#"hash_137b937fd26992be", &function_9c8b7bf2);
}

/*
	Name: function_3629d229
	Namespace: namespace_9f845210
	Checksum: 0x15DF8FB5
	Offset: 0x1378
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_3629d229(params)
{
	if(!level flag::get(#"in_dark_side") && isplayer(params.eattacker))
	{
		level notify(#"hash_4f3dbc08fe003a1e");
		level.var_67e9e1a7 = level.var_67e9e1a7 + 1;
		if(level.var_67e9e1a7 >= 25 && !level flag::get(#"hash_4d6700553ede7078"))
		{
			level flag::set(#"hash_4d6700553ede7078");
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_9f845210
	Checksum: 0xA2B3CC2D
	Offset: 0x1468
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self thread function_23c31b4e();
}

/*
	Name: on_death
	Namespace: namespace_9f845210
	Checksum: 0x94933D9A
	Offset: 0x1490
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_death()
{
	self clientfield::set("" + #"hash_63af42145e260fb5", 0);
}

/*
	Name: function_31b6f21e
	Namespace: namespace_9f845210
	Checksum: 0x39F0D212
	Offset: 0x14C8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_31b6f21e(str_notify)
{
	self clientfield::set("" + #"hash_63af42145e260fb5", 0);
}

/*
	Name: function_23c31b4e
	Namespace: namespace_9f845210
	Checksum: 0x91C95C3E
	Offset: 0x1508
	Size: 0x17E
	Parameters: 0
	Flags: Linked
*/
function function_23c31b4e()
{
	if(is_true(self.is_hotjoining) || self util::is_spectating())
	{
		return;
	}
	self endoncallback(&function_31b6f21e, #"death");
	while(true)
	{
		if(level flag::get(#"dark_aether_active"))
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 2);
		}
		else
		{
			if(level flag::get("power_on"))
			{
				self clientfield::set("" + #"hash_63af42145e260fb5", 0);
			}
			else
			{
				self thread function_3ba2978d();
			}
		}
		waitresult = undefined;
		waitresult = level waittill(#"dark_aether_active", #"power_on");
		if(waitresult._notify == "power_on")
		{
			wait(5);
		}
	}
}

/*
	Name: function_3ba2978d
	Namespace: namespace_9f845210
	Checksum: 0xD6FFAC55
	Offset: 0x1690
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_3ba2978d()
{
	level endon(#"dark_aether_active", #"power_on");
	while(true)
	{
		if(self zm_zonemgr::is_player_in_zone(level.var_b80c4ecc))
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 1);
		}
		else
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 0);
		}
		self waittill(#"hash_2d4daa9e80b86b60");
	}
}

/*
	Name: pap_quest_init
	Namespace: namespace_9f845210
	Checksum: 0xAF8FB0F9
	Offset: 0x1768
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function pap_quest_init()
{
	level endon(#"end_game");
	level.var_ce45839f = #"pap_quest_completed";
	level.var_ba3a0e1f = 0;
	level flag::wait_till("all_players_spawned");
	function_ce84849b();
}

/*
	Name: function_25074bb7
	Namespace: namespace_9f845210
	Checksum: 0x72E29446
	Offset: 0x17E0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_25074bb7()
{
	level endon(#"end_game");
	if(level.var_f0a7e859 === 0)
	{
		self thread zm_vo::function_d6f8bbd9(#"hash_6d907d6921a5eb66");
		level.var_f0a7e859 = 1;
	}
	else
	{
		self zm_vo::function_d6f8bbd9(#"hash_63ceaa51f8489a50");
		level zm_vo::function_d6f8bbd9(#"hash_44d46856fc9834ef", 0.5, function_a1ef346b());
	}
}

/*
	Name: function_af722d1c
	Namespace: namespace_9f845210
	Checksum: 0x2FFDC3E5
	Offset: 0x18B0
	Size: 0xE34
	Parameters: 0
	Flags: Linked
*/
function function_af722d1c()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	wait(2);
	var_77a62dfb = struct::get("zm_atuo_door", "targetname");
	namespace_ee206246::objective_set(#"hash_502a7a67764fd94e", var_77a62dfb, undefined, #"hash_6edeea551fa2827c");
	level.var_ed556cb6 waittill(#"trigger");
	level flag::set(#"hash_61c2fed7a1f6d570");
	namespace_ee206246::objective_complete(#"hash_502a7a67764fd94e", var_77a62dfb);
	wait(3);
	var_816be16e = struct::get_array("pap_extra_objective_marker", "targetname");
	namespace_ee206246::objective_set(#"hash_1c145a15f9ddd06d", var_816be16e, undefined, #"hash_77e138106f2c72b7");
	zm_zonemgr::function_8caa21df(array("zone_center_upper_west", "zone_center_upper_north"));
	wait(1);
	namespace_ee206246::objective_complete(#"hash_1c145a15f9ddd06d", var_816be16e);
	var_7b6eae07 = getent("elec_switch", "script_noteworthy");
	namespace_ee206246::objective_set(#"hash_502a7967764fd79b", var_7b6eae07, undefined, #"hash_77e138106f2c72b7", undefined, 96);
	level flag::wait_till("power_on");
	namespace_ee206246::objective_complete(#"hash_502a7967764fd79b", var_7b6eae07);
	var_7b6eae07 function_23a29590();
	wait(2);
	var_763f6aa3 = getent("zm_tm_blue", "targetname");
	var_84288675 = getent("zm_tm_red", "targetname");
	var_1e94a095 = array(var_763f6aa3, var_84288675);
	level.var_f0a7e859 = 0;
	namespace_ee206246::objective_set(#"hash_51a6aa8cdd8606d6", var_1e94a095, undefined, #"hash_2c04785633aa43c5", undefined, 100);
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"terminal_1_is_on", #"terminal_2_is_on");
		if(var_be17187b._notify == "terminal_1_is_on")
		{
			namespace_ee206246::objective_complete(#"hash_51a6aa8cdd8606d6", var_763f6aa3);
			var_763f6aa3 thread function_25074bb7();
			var_763f6aa3 function_23a29590();
			arrayremovevalue(var_1e94a095, var_763f6aa3);
		}
		else
		{
			namespace_ee206246::objective_complete(#"hash_51a6aa8cdd8606d6", var_84288675);
			var_84288675 thread function_25074bb7();
			var_84288675 function_23a29590();
			arrayremovevalue(var_1e94a095, var_84288675);
		}
		if(var_1e94a095.size == 0)
		{
			break;
		}
	}
	wait(12);
	namespace_ee206246::objective_set(#"hash_52a7a8068eacfe", level.var_f2484ed9, undefined, #"hash_2f6ada38af7b4a6a", undefined, 96);
	namespace_ee206246::function_3029d343(#"hash_52a7a8068eacfe", level.var_f2484ed9);
	while(true)
	{
		waitresult = level flag::wait_till_any(array(#"dark_aether_active", #"hash_447ca5049bb26ab6"));
		if(waitresult._notify == #"dark_aether_active")
		{
			level.var_f2484ed9 thread namespace_2b924e50::function_cc15b58a();
			namespace_ee206246::function_3029d343(#"hash_52a7a8068eacfe", level.var_f2484ed9);
			level flag::wait_till_clear(#"dark_aether_active");
			level.var_f2484ed9 thread namespace_2b924e50::function_ac49076a();
			namespace_ee206246::objective_set(#"hash_52a7a8068eacfe", level.var_f2484ed9, undefined, #"hash_570634faa6508f0d", undefined, 96);
		}
		else
		{
			break;
		}
	}
	level.var_f2484ed9 thread namespace_2b924e50::function_cc15b58a();
	namespace_ee206246::function_3029d343(#"hash_52a7a8068eacfe", level.var_f2484ed9);
	if(!isdefined(level.var_f070b39a))
	{
		level waittill(#"hash_61531cd15f11f543");
	}
	var_4bcd7eea = struct::get(level.var_f070b39a.objective_string, "script_string");
	var_85ef1ebd = 0;
	namespace_ee206246::objective_set(#"hash_75e465cf3c494bdd", var_4bcd7eea, undefined, #"hash_570634faa6508f0d", undefined, 64);
	namespace_ee206246::objective_set(#"hash_48b81559139c7c6f", level.var_f070b39a, undefined, #"hash_570634faa6508f0d", undefined, 64);
	namespace_ee206246::function_3029d343(#"hash_48b81559139c7c6f", level.var_f070b39a);
	while(!level flag::get(#"piece_is_found"))
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"piece_is_found", #"dark_aether_active", level.var_f070b39a.var_2490cffb, level.var_f070b39a.var_b8b53a8f);
		switch(var_be17187b._notify)
		{
			case "piece_is_found":
			{
				namespace_ee206246::objective_complete(#"hash_48b81559139c7c6f", level.var_f070b39a);
				namespace_ee206246::objective_complete(#"hash_75e465cf3c494bdd", var_4bcd7eea);
				break;
			}
			case "dark_aether_active":
			{
				if(level flag::get(#"dark_aether_active"))
				{
					if(var_85ef1ebd)
					{
						namespace_ee206246::function_aee0b4b4(#"hash_48b81559139c7c6f", level.var_f070b39a);
					}
					else
					{
						namespace_ee206246::function_aee0b4b4(#"hash_75e465cf3c494bdd", var_4bcd7eea);
					}
					level.var_f2484ed9 thread namespace_2b924e50::function_cc15b58a();
					namespace_ee206246::objective_complete(#"hash_52a7a8068eacfe", level.var_f2484ed9);
				}
				else
				{
					namespace_ee206246::function_3029d343(#"hash_48b81559139c7c6f", level.var_f070b39a);
					namespace_ee206246::function_3029d343(#"hash_75e465cf3c494bdd", var_4bcd7eea);
					namespace_ee206246::objective_set(#"hash_30b3a017b4e8ca1a", undefined, undefined, #"hash_28d0c9d847577004");
					if(level flag::get(#"hash_447ca5049bb26ab6"))
					{
						level.var_f2484ed9 flag::wait_till(#"hash_4d6700553ede7078");
					}
					namespace_ee206246::objective_complete(#"hash_30b3a017b4e8ca1a");
					level.var_f2484ed9 thread namespace_2b924e50::function_ac49076a();
					namespace_ee206246::objective_set(#"hash_52a7a8068eacfe", level.var_f2484ed9, undefined, #"hash_570634faa6508f0d", undefined, 96);
				}
				break;
			}
			default:
			{
				if(var_be17187b._notify === level.var_f070b39a.var_2490cffb)
				{
					namespace_ee206246::function_3029d343(#"hash_75e465cf3c494bdd", var_4bcd7eea);
				}
				else
				{
					var_85ef1ebd = 1;
					namespace_ee206246::function_aee0b4b4(#"hash_48b81559139c7c6f", level.var_f070b39a);
				}
				break;
			}
		}
	}
	waitframe(1);
	namespace_ee206246::objective_set(#"hash_502a7e67764fe01a", level.var_241be029, undefined, #"hash_74ad706cf06d3af0", undefined, 64);
	while(!level flag::get(#"pap_quest_completed"))
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"pap_quest_completed", #"in_dark_side", #"hash_4adb3a0e79514d43");
		if(var_be17187b._notify === #"hash_4adb3a0e79514d43")
		{
			level waittill(#"pap_quest_completed");
		}
		else if(var_be17187b._notify === #"in_dark_side")
		{
			if(level flag::get(#"in_dark_side"))
			{
				namespace_ee206246::function_aee0b4b4(#"hash_502a7e67764fe01a", level.var_241be029);
				level.var_f2484ed9 thread namespace_2b924e50::function_cc15b58a();
				namespace_ee206246::objective_complete(#"hash_52a7a8068eacfe", level.var_f2484ed9);
			}
			else
			{
				namespace_ee206246::function_3029d343(#"hash_502a7e67764fe01a", level.var_241be029);
				namespace_ee206246::objective_set(#"hash_30b3a017b4e8ca1a", undefined, undefined, #"hash_28d0c9d847577004");
				level.var_f2484ed9 flag::wait_till(#"hash_4d6700553ede7078");
				namespace_ee206246::objective_complete(#"hash_30b3a017b4e8ca1a");
				level.var_f2484ed9 thread namespace_2b924e50::function_ac49076a();
				namespace_ee206246::objective_set(#"hash_52a7a8068eacfe", level.var_f2484ed9, undefined, #"hash_74ad706cf06d3af0", undefined, 96);
			}
		}
	}
	if(isdefined(level.var_f2484ed9.mdl_gameobject))
	{
		level.var_f2484ed9.mdl_gameobject thread gameobjects::destroy_object(1, 1);
	}
	namespace_ee206246::objective_complete(#"hash_52a7a8068eacfe", level.var_f2484ed9);
	namespace_ee206246::objective_complete(#"hash_30b3a017b4e8ca1a");
	namespace_ee206246::objective_complete(#"hash_502a7e67764fe01a", level.var_241be029);
}

/*
	Name: function_ce84849b
	Namespace: namespace_9f845210
	Checksum: 0xD6F3E4FB
	Offset: 0x26F0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_ce84849b()
{
	level thread function_af722d1c();
	level thread function_da48420c();
	level thread function_3c6501c9();
	level thread function_6c1800f0();
}

/*
	Name: function_cd3e7a69
	Namespace: namespace_9f845210
	Checksum: 0xA60783F7
	Offset: 0x2760
	Size: 0x3A4
	Parameters: 0
	Flags: Linked
*/
function function_cd3e7a69()
{
	level.var_ed556cb6 = getent("tunnel_door_trigger", "script_noteworthy");
	level.var_ed556cb6 waittill(#"trigger");
	var_77a62dfb = struct::get("zm_atuo_door");
	playsoundatposition(#"hash_32409776325fec85", var_77a62dfb.origin);
	foreach(player in function_a1ef346b())
	{
		if(distancesquared(player.origin, var_77a62dfb.origin) < 262144)
		{
			player clientfield::increment_to_player("" + #"hash_14ba797c22b75dda");
		}
	}
	var_1c023374 = getentarray(var_77a62dfb.target, "targetname");
	foreach(door in var_1c023374)
	{
		if(isdefined(door.script_vector))
		{
			var_cf64509e = getent(door.target, "targetname");
			var_cf64509e linkto(door);
			door moveto(door.origin + door.script_vector, 5);
			playsoundatposition(#"hash_775189191a369280", door.origin);
			playsoundatposition(#"hash_7f0f2f84745c1013", (0, 0, 0));
			children = var_cf64509e getlinkedchildren();
			foreach(child in children)
			{
				if(isdefined(child.classname) && child.classname == "grenade")
				{
					weaponobjects::waitandfizzleout(child, 0);
				}
			}
		}
	}
}

/*
	Name: function_da48420c
	Namespace: namespace_9f845210
	Checksum: 0xF0DA20D9
	Offset: 0x2B10
	Size: 0x2FC
	Parameters: 0
	Flags: Linked
*/
function function_da48420c()
{
	level.var_59b6e9a5 = getent("zm_re_com_s", "targetname");
	level flag::wait_till("power_on");
	foreach(player in function_a1ef346b())
	{
		player clientfield::increment_to_player("" + #"hash_c34d1c4bd1aa84a");
	}
	playsoundatposition(#"hash_105825c91942325c", (0, 0, 0));
	hidemiscmodels("power_arrow");
	level.var_b2371398 = getent("zm_re_com", "script_noteworthy");
	level.var_59b6e9a5 setmodel(#"hash_6966be6d33d1985b");
	level.var_6c682532 = util::spawn_model(#"hash_2a7c96f5ca0f16a4", level.var_b2371398.origin, level.var_b2371398.angles);
	level.var_59b6e9a5 thread function_c0a7e4cc();
	level.var_6c682532 thread function_c0a7e4cc();
	level.var_b2371398 playloopsound(#"hash_1849514e59b9f8f5");
	level.var_59b6e9a5 playloopsound(#"hash_6d260f1782892e0f");
	showmiscmodels("zm_tm_blue_in");
	showmiscmodels("zm_tm_red_in");
	exploder::exploder("lgt_1_terminal_default");
	exploder::exploder("lgt_2_terminal_default");
	namespace_f172695e::function_44cea26f(#"hash_5bad1025f0cf747e");
	showmiscmodels("zm_silver_normal_computers");
	level util::clientnotify("pacc_unstable");
}

/*
	Name: function_c0a7e4cc
	Namespace: namespace_9f845210
	Checksum: 0xB0347270
	Offset: 0x2E18
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_c0a7e4cc()
{
	level endon(#"end_game");
	self endon(#"death");
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		self hide();
		level flag::wait_till_clear(#"dark_aether_active");
		self show();
	}
}

/*
	Name: function_c1bd7e55
	Namespace: namespace_9f845210
	Checksum: 0x821AAAE3
	Offset: 0x2ED0
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_c1bd7e55()
{
	self notify("645cc33c74982a20");
	self endon("645cc33c74982a20");
	level endon(#"end_game");
	while(true)
	{
		if(level flag::get_all(array("connect_plane_exterior", "connect_medical_bay")))
		{
			if(level flag::get_any(array(#"hash_268c943ffdd74fa", "in_dark_side")))
			{
				break;
			}
		}
		wait(1);
	}
	var_7692d390 = getent("script_plane_collision", "targetname");
	var_7692d390 connectpaths();
	var_7692d390 notsolid();
	level thread function_d1377146(var_7692d390);
	level scene::play(#"hash_2f425040d5e62683", "rise");
}

/*
	Name: function_d1377146
	Namespace: namespace_9f845210
	Checksum: 0xE3A680D5
	Offset: 0x3030
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function function_d1377146(var_7692d390)
{
	waitresult = undefined;
	waitresult = level waittill(#"dark_side_timeout", #"hash_61e8a39b3a4bee6a", #"hash_322c7f92525e008e", #"hash_3881f540920df071");
	if(waitresult._notify == "bomber_nose_rise_done")
	{
		level thread scene::play(#"hash_2f425040d5e62683", "loop");
		level.var_1cffd28c = 1;
		level waittill(#"dark_side_timeout", #"hash_61e8a39b3a4bee6a", #"hash_322c7f92525e008e");
	}
	if(!level flag::get(#"hash_268c943ffdd74fa") || level flag::get(#"hash_322c7f92525e008e"))
	{
		var_7692d390 disconnectpaths();
		var_7692d390 solid();
		level scene::play(#"hash_2f425040d5e62683", "drop");
		level.var_1cffd28c = 0;
	}
}

/*
	Name: function_40102053
	Namespace: namespace_9f845210
	Checksum: 0xE6905A9C
	Offset: 0x31D0
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_40102053()
{
	self notify("6913893dd9d953ed");
	self endon("6913893dd9d953ed");
	level endon(#"end_game");
	while(true)
	{
		if(level flag::get_all(array("connect_plane_exterior", "connect_weapon_lab")))
		{
			if(level flag::get_any(array(#"hash_268c943ffdd74fa", "in_dark_side")))
			{
				break;
			}
		}
		wait(1);
	}
	truckcollision = getent("script_truck_collision", "targetname");
	truckcollision connectpaths();
	truckcollision notsolid();
	level thread function_d9e95e32(truckcollision);
	level scene::play(#"hash_3b239490a05b582e", "rise");
}

/*
	Name: function_d9e95e32
	Namespace: namespace_9f845210
	Checksum: 0xCC699510
	Offset: 0x3330
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function function_d9e95e32(truckcollision)
{
	waitresult = undefined;
	waitresult = level waittill(#"dark_side_timeout", #"hash_61e8a39b3a4bee6a", #"hash_322c7f92525e008e", #"hash_281356125ca76d49");
	if(waitresult._notify == "truck_rise_done")
	{
		level thread scene::play(#"hash_3b239490a05b582e", "loop");
		level.var_5a953d3d = 1;
		level waittill(#"dark_side_timeout", #"hash_61e8a39b3a4bee6a", #"hash_322c7f92525e008e");
	}
	if(!level flag::get(#"hash_268c943ffdd74fa") || level flag::get(#"hash_322c7f92525e008e"))
	{
		truckcollision disconnectpaths();
		truckcollision solid();
		level scene::play(#"hash_3b239490a05b582e", "drop");
		level.var_5a953d3d = 0;
	}
}

/*
	Name: function_3c6501c9
	Namespace: namespace_9f845210
	Checksum: 0xEF345251
	Offset: 0x34D0
	Size: 0x954
	Parameters: 0
	Flags: Linked
*/
function function_3c6501c9()
{
	level endon(#"end_game");
	level flag::wait_till("power_on");
	wait(2);
	var_763f6aa3 = getent("zm_tm_blue", "targetname");
	var_84288675 = getent("zm_tm_red", "targetname");
	var_763f6aa3 thread function_61b74ad2(1);
	var_84288675 thread function_61b74ad2(2);
	level flag::wait_till_all([1:"terminal_2_is_on", 0:"terminal_1_is_on"]);
	wait(3);
	playsoundatposition(#"hash_7f68d52a43e2fbe2", (0, 0, 0));
	foreach(player in function_a1ef346b())
	{
		player clientfield::increment_to_player("" + #"particle_accelerator_rumble");
	}
	level util::clientnotify("pacc_unstable");
	level util::clientnotify("pacc_stable");
	playsoundatposition(#"hash_38a788aaa24a4abf", (554, -133, -355));
	exploder::kill_exploder("lgt_1_central_ring_on");
	exploder::kill_exploder("lgt_2_central_ring_on");
	exploder::exploder("lgt_central_ring_powered_on");
	level.var_7f76a0b6 = struct::get("zm_por_mac", "script_noteworthy");
	level.var_f2484ed9 = util::spawn_model("tag_origin", level.var_7f76a0b6.origin);
	level.var_f2484ed9 flag::set(#"hash_4d6700553ede7078");
	level thread function_2efdaf37();
	level thread function_c95d2c8();
	level thread function_716add58();
	var_9463599a = undefined;
	wait(8.5);
	while(!level flag::get_any(array("pap_quest_completed", #"hash_4adb3a0e79514d43")))
	{
		if(level flag::get(#"hash_447ca5049bb26ab6"))
		{
			level.var_f2484ed9 flag::wait_till(#"hash_4d6700553ede7078");
		}
		level.var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 1);
		if(!isdefined(var_9463599a))
		{
			var_9463599a = level.var_f2484ed9 namespace_2b924e50::function_3be9e71a();
			foreach(player in function_a1ef346b())
			{
				if(distancesquared(player.origin, var_9463599a.origin) < 16384)
				{
					var_911a25ea = struct::get("zm_por_mac", "script_noteworthy");
					n_index = zm_fasttravel::get_player_index(player);
					var_33b97794 = struct::get_array(var_911a25ea.target)[n_index];
					player setorigin(var_33b97794.origin);
					player setplayerangles(var_33b97794.angles);
				}
			}
		}
		if(!level flag::get(#"hash_447ca5049bb26ab6"))
		{
			foreach(player in getplayers())
			{
				player clientfield::set_to_player("" + #"hash_1fa45e1c3652d753", 1);
			}
		}
		if(!isdefined(level.var_f2484ed9.mdl_gameobject))
		{
			level.var_f2484ed9.require_look_at = 1;
			level.var_f2484ed9 gameobjects::init_game_objects(#"hash_60c51425efd699b9");
			level.var_f2484ed9.mdl_gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
			level.var_f2484ed9.mdl_gameobject gameobjects::set_onuse_event(&function_bd02699e);
			level.var_f2484ed9.mdl_gameobject gameobjects::set_onbeginuse_event(&namespace_2b924e50::function_e6830825);
			level.var_f2484ed9.mdl_gameobject gameobjects::set_onenduse_event(&namespace_2b924e50::function_834fd6bc);
			level.var_f2484ed9.mdl_gameobject function_619a5c20();
			level.var_f2484ed9.mdl_gameobject.trigger thread function_79d5804a();
			level.var_f2484ed9.mdl_gameobject.dontlinkplayertotrigger = 1;
			level.var_f2484ed9.mdl_gameobject.keepweapon = 1;
			level.var_f2484ed9.mdl_gameobject.canuseobject = &namespace_2b924e50::function_dd9482b7;
		}
		level flag::wait_till(#"dark_aether_active");
		if(isdefined(var_9463599a))
		{
			var_9463599a delete();
		}
		level.var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
		if(isdefined(level.var_f2484ed9.mdl_gameobject))
		{
			level.var_f2484ed9.mdl_gameobject function_23a29590();
		}
		level flag::wait_till_clear(#"dark_aether_active");
	}
	level.var_7bfbe1fc solid();
	level.var_7bfbe1fc disconnectpaths();
	if(isdefined(level.var_f2484ed9.mdl_gameobject))
	{
		level.var_f2484ed9.mdl_gameobject thread gameobjects::destroy_object(1, 1);
	}
}

/*
	Name: function_47733654
	Namespace: namespace_9f845210
	Checksum: 0xE5EE3E02
	Offset: 0x3E30
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function function_47733654(e_player)
{
	if(level flag::get(#"hash_3e765c26047c9f54") || level flag::get("in_exfil_event"))
	{
		self sethintstringforplayer(e_player, #"hash_4480b689c4039dac");
		return true;
	}
	if(!level flag::get("in_dark_side") && !level flag::get("pap_quest_completed") && level.var_f2484ed9 flag::get(#"hash_4d6700553ede7078") && !e_player usebuttonpressed())
	{
		self sethintstringforplayer(e_player, #"hash_622731cfc9a72bfa");
		return true;
	}
	self sethintstringforplayer(e_player, #"");
	return false;
}

/*
	Name: function_bd02699e
	Namespace: namespace_9f845210
	Checksum: 0xEA66F8FF
	Offset: 0x3FA8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_bd02699e(player)
{
	if(!level flag::get(#"hash_3e765c26047c9f54"))
	{
		function_15704ade();
		self thread namespace_2b924e50::function_cc15b58a();
	}
}

/*
	Name: function_15704ade
	Namespace: namespace_9f845210
	Checksum: 0x2D17E3A2
	Offset: 0x4010
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_15704ade()
{
	level notify(#"into_the_dark_side");
	level flag::set(#"hash_447ca5049bb26ab6");
	level flag::wait_till(#"dark_aether_active");
	level.var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
	level thread function_672727de();
}

/*
	Name: function_672727de
	Namespace: namespace_9f845210
	Checksum: 0xAB8E292B
	Offset: 0x40C0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_672727de()
{
	level.var_f2484ed9 flag::clear(#"hash_4d6700553ede7078");
	var_172e078c = 25;
	while(var_172e078c > 0)
	{
		level waittill(#"hash_4f3dbc08fe003a1e");
		var_172e078c = var_172e078c - 1;
	}
	level.var_f2484ed9 flag::set(#"hash_4d6700553ede7078");
}

/*
	Name: function_79d5804a
	Namespace: namespace_9f845210
	Checksum: 0x1BC714BD
	Offset: 0x4160
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function function_79d5804a()
{
	self endon(#"death");
	while(true)
	{
		foreach(player in function_a1ef346b())
		{
			self setcursorhint("HINT_NOICON");
			self usetriggerignoreuseholdtime();
			self function_268e4500();
			b_enabled = self function_47733654(player);
			if(b_enabled)
			{
				self setvisibletoplayer(player);
				continue;
			}
			self setinvisibletoplayer(player);
		}
		wait(1);
	}
}

/*
	Name: function_61b74ad2
	Namespace: namespace_9f845210
	Checksum: 0xA463C70
	Offset: 0x42B8
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function function_61b74ad2(num)
{
	if(num == 1)
	{
		var_64c09f7f = self zm_unitrigger::function_fac87205(&function_67c20e9d, vectorscale((1, 1, 1), 128));
	}
	else
	{
		var_64c09f7f = self zm_unitrigger::function_fac87205(&function_600a5109, vectorscale((1, 1, 1), 128));
	}
	if(isplayer(var_64c09f7f))
	{
		var_64c09f7f clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5");
	}
	exploder::kill_exploder(("lgt_" + num) + "_terminal_default");
	exploder::exploder(("lgt_" + num) + "_terminal_powered_on");
	exploder::exploder(("lgt_" + num) + "_central_ring_on");
	level flag::set(("terminal_" + num) + "_is_on");
	playsoundatposition(#"hash_6c88f3463b82c932", self.origin + vectorscale((0, 0, 1), 60));
	var_30873e2 = getent(self.target, "targetname");
	var_30873e2 setforcenocull();
	if(num == 1)
	{
		namespace_f172695e::function_44cea26f(#"hash_7dbdd94b1b1e6829");
		hidemiscmodels("zm_tm_blue_in");
		showmiscmodels("zm_tm_blue_at");
		var_30873e2 thread scene::play(#"hash_5907836ecd97d65b", var_30873e2);
	}
	else
	{
		namespace_f172695e::function_44cea26f(#"hash_7dbdd64b1b1e6310");
		hidemiscmodels("zm_tm_red_in");
		showmiscmodels("zm_tm_red_at");
		var_30873e2 scene::play(#"hash_7e0c2c7083a69618", var_30873e2);
		var_30873e2 thread scene::play(#"hash_9bd0219148fe33d", var_30873e2);
	}
}

/*
	Name: function_67c20e9d
	Namespace: namespace_9f845210
	Checksum: 0xC80B7E00
	Offset: 0x45C0
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_67c20e9d(e_player)
{
	str_prompt = e_player zm_utility::function_d6046228(#"hash_7e6b90e7622dbbbc", #"hash_24497a2c0afb8b38");
	self sethintstringforplayer(e_player, str_prompt);
	return true;
}

/*
	Name: function_600a5109
	Namespace: namespace_9f845210
	Checksum: 0xC0449D39
	Offset: 0x4630
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_600a5109(e_player)
{
	str_prompt = e_player zm_utility::function_d6046228(#"hash_1cb24b9dbc2bff18", #"hash_268d58c0ce46e5e4");
	self sethintstringforplayer(e_player, str_prompt);
	return true;
}

/*
	Name: function_52d97f7e
	Namespace: namespace_9f845210
	Checksum: 0x95D18DD1
	Offset: 0x46A0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_52d97f7e()
{
	level waittill(#"hash_3e765c26047c9f54");
	level flag::set("in_exfil_event");
	level thread namespace_ee206246::function_97aa577f();
}

/*
	Name: function_2efdaf37
	Namespace: namespace_9f845210
	Checksum: 0x59F844BA
	Offset: 0x4700
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_2efdaf37()
{
	level flag::wait_till(#"dark_aether_active");
	var_abdb229d = struct::get("jellyfish_node", "targetname");
	var_d46652ea = util::spawn_model(#"p9_fxanim_zm_silver_jellyfish_small_01_mod", var_abdb229d.origin, undefined, undefined, 1);
	var_d46652ea thread scene::play(#"hash_29ee180eb3edbbb2", var_d46652ea);
	var_d46652ea thread function_e42aed4c();
}

/*
	Name: function_e42aed4c
	Namespace: namespace_9f845210
	Checksum: 0xE03D6E5B
	Offset: 0x47D8
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_e42aed4c()
{
	level endon(#"end_game");
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		self show();
		showmiscmodels("sky_jellyfish");
		level flag::wait_till_clear(#"dark_aether_active");
		self hide();
		hidemiscmodels("sky_jellyfish");
	}
}

/*
	Name: function_c95d2c8
	Namespace: namespace_9f845210
	Checksum: 0xC2AFA114
	Offset: 0x48A8
	Size: 0x420
	Parameters: 0
	Flags: Linked
*/
function function_c95d2c8()
{
	level flag::wait_till_all([1:#"dark_aether_active", 0:#"hash_447ca5049bb26ab6"]);
	level.var_7bfbe1fc solid();
	level.var_7bfbe1fc disconnectpaths();
	level.var_5a7fab04 = util::spawn_model(#"p9_fxanim_zm_sur_machine_weapon_mod", struct::get("zm_go_mac", "script_noteworthy").origin, struct::get("zm_go_mac", "script_noteworthy").angles);
	level.var_5a7fab04 scene::play(#"hash_1154016a5d6867c2", level.var_5a7fab04);
	level.var_5a7fab04 thread scene::play(#"hash_66eb708f8a118bbc", level.var_5a7fab04);
	level.var_5a7fab04 clientfield::set("" + #"hash_54d221181b1a11f", 1);
	if(math::cointoss())
	{
		level.var_6cddddd9 = util::spawn_model(#"p9_fxanim_zm_sur_machine_weapon_mid_mod", struct::get("piece_midway_mid", "script_noteworthy").origin, struct::get("piece_midway_mid", "script_noteworthy").angles);
		level.var_f070b39a = level.var_6cddddd9;
		level.var_f070b39a.objective_string = "fasttravel_loc_pond_down";
		level.var_f070b39a.var_b8b53a8f = #"hash_426979dda15dd76f";
		level.var_f070b39a.var_2490cffb = #"hash_4682886f7b5b58fa";
	}
	else
	{
		level.var_6cddddd9 = util::spawn_model(#"p9_fxanim_zm_sur_machine_weapon_mid_mod", struct::get("piece_midway_btm", "script_noteworthy").origin, struct::get("piece_midway_btm", "script_noteworthy").angles);
		level.var_f070b39a = level.var_6cddddd9;
		level.var_f070b39a.objective_string = "fasttravel_loc_crash_site_down";
		level.var_f070b39a.var_b8b53a8f = #"hash_5674ed1aa008ba97";
		level.var_f070b39a.var_2490cffb = #"hash_1e341fd8a260be32";
	}
	level.var_6cddddd9 clientfield::set("" + #"hash_54d221181b1a11f", 2);
	level.var_5a7fab04 hidepart("tag_mid");
	level.var_f070b39a thread function_530c2230();
	level.var_f070b39a function_619a5c20();
	level.var_5a7fab04 thread function_931d1962(1);
	level notify(#"hash_61531cd15f11f543");
}

/*
	Name: function_530c2230
	Namespace: namespace_9f845210
	Checksum: 0x743CAC92
	Offset: 0x4CD0
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function function_530c2230()
{
	self thread function_931d1962(2);
	self playloopsound(#"hash_224c4ffb3e869259");
	var_64c09f7f = self zm_unitrigger::function_fac87205(&function_557b8c82, vectorscale((1, 1, 1), 128));
	if(isplayer(var_64c09f7f))
	{
		var_64c09f7f clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	playsoundatposition(#"hash_7d9f66386174bd52", self.origin);
	self stoploopsound();
	self hide();
	level.var_5a7fab04 showpart("tag_mid");
	level flag::set("piece_is_found");
	level namespace_6747c550::function_7df6bb60(#"hash_77bc2e157f9d438e", 1);
	wait(1);
	if(!level flag::get(#"dark_aether_active"))
	{
		level notify(#"dark_aether_active");
	}
}

/*
	Name: function_557b8c82
	Namespace: namespace_9f845210
	Checksum: 0x991460EC
	Offset: 0x4E90
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_557b8c82(e_player)
{
	if(level flag::get(#"dark_aether_active"))
	{
		self sethintstring(#"hash_53a4565555d8b22c");
		return true;
	}
	return false;
}

/*
	Name: function_931d1962
	Namespace: namespace_9f845210
	Checksum: 0xCB5FF6D1
	Offset: 0x4EF0
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function function_931d1962(var_cfa99f0e)
{
	level endon(#"end_game", #"pap_quest_completed", #"hash_4adb3a0e79514d43");
	self endon(#"death", #"trigger_activated");
	while(true)
	{
		level flag::wait_till_clear(#"dark_aether_active");
		self hide();
		level.var_7bfbe1fc notsolid();
		level.var_7bfbe1fc connectpaths();
		self clientfield::set("" + #"hash_54d221181b1a11f", 0);
		level flag::wait_till(#"dark_aether_active");
		self show();
		level.var_7bfbe1fc solid();
		level.var_7bfbe1fc disconnectpaths();
		self clientfield::set("" + #"hash_54d221181b1a11f", var_cfa99f0e);
	}
}

/*
	Name: function_e21028db
	Namespace: namespace_9f845210
	Checksum: 0x86468838
	Offset: 0x5090
	Size: 0x4E4
	Parameters: 1
	Flags: Linked
*/
function function_e21028db(state)
{
	if(state == "init")
	{
		level clientfield::set("" + #"hash_27895772c4825a7a", 1);
		level.var_73aae81b = getdynentarray("dark_aehter_loot_crystal");
		foreach(crystal in level.var_73aae81b)
		{
			function_e2a06860(crystal, 2);
		}
		hidemiscmodels("dark_aether_crystal");
		hidemiscmodels("pond_crystal");
		array::run_all(getentarray("pond_crystal_clip", "targetname"), &notsolid);
		array::run_all(getentarray("pond_crystal_clip", "targetname"), &connectpaths);
	}
	else
	{
		if(state == "on")
		{
			level clientfield::set("" + #"hash_27895772c4825a7a", 0);
			foreach(crystal in level.var_73aae81b)
			{
				function_e2a06860(crystal, 0);
			}
			hidemiscmodels("pond_rock");
			showmiscmodels("dark_aether_crystal");
			showmiscmodels("pond_crystal");
			array::run_all(getentarray("pond_crystal_clip", "targetname"), &solid);
			array::run_all(getentarray("pond_crystal_clip", "targetname"), &disconnectpaths);
		}
		else if(state == "off")
		{
			level clientfield::set("" + #"hash_27895772c4825a7a", 1);
			foreach(crystal in level.var_73aae81b)
			{
				function_e2a06860(crystal, 2);
			}
			hidemiscmodels("dark_aether_crystal");
			hidemiscmodels("pond_crystal");
			array::run_all(getentarray("pond_crystal_clip", "targetname"), &notsolid);
			array::run_all(getentarray("pond_crystal_clip", "targetname"), &connectpaths);
			showmiscmodels("pond_rock");
		}
	}
}

/*
	Name: function_5ea16763
	Namespace: namespace_9f845210
	Checksum: 0x5D7D04A5
	Offset: 0x5580
	Size: 0xAD0
	Parameters: 2
	Flags: Linked
*/
function function_5ea16763(state, var_cbc8cfb4)
{
	all_players = getplayers();
	var_aacbd881 = 0;
	foreach(player in all_players)
	{
		if(isdefined(player.var_2790fd8b))
		{
			player.var_91e83c57 = player zm_fasttravel::function_c78572ab(player.var_388ee880);
			player.var_2790fd8b notify(#"hash_7c36ba955d05ca78");
			var_aacbd881 = 1;
		}
	}
	if(var_aacbd881)
	{
		level.var_2053e15f = 1;
		util::wait_network_frame(2);
		level.var_2053e15f = 0;
	}
	var_74bea1e = zm_fasttravel::function_b6e62bc1();
	var_a54b4082 = ((float(gettime()) / 1000) + var_74bea1e) + 0.5;
	zm_cleanup::function_949dc047(var_a54b4082);
	if(state == "on")
	{
		level clientfield::set("" + #"hash_51ed1d1064cfb0e", 1);
		foreach(player in all_players)
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
		}
		level clientfield::set("newtonian_negation", 1);
		function_e21028db("on");
		level clientfield::set("" + #"hash_266f6fe481bab1bc", 1);
		level util::set_lighting_state(1);
		if(isdefined(var_cbc8cfb4))
		{
			var_4eed9ccb = struct::get_array(var_cbc8cfb4.target, "targetname");
			foreach(player in all_players)
			{
				n_index = zm_fasttravel::get_player_index(player);
				var_10fb1677 = var_4eed9ccb[n_index];
				if(isalive(player))
				{
					player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_10fb1677, undefined, "dark_aether_fasttravel", 0, 0, 0);
				}
			}
		}
		else
		{
			foreach(player in all_players)
			{
				if(isalive(player))
				{
					if(isdefined(player.var_91e83c57))
					{
						var_33b97794 = player.var_91e83c57;
						player.var_91e83c57 = undefined;
					}
					else
					{
						var_33b97794 = struct::spawn(player.origin, player.angles);
						if(player istouching(level.var_7bfbe1fc))
						{
							n_index = zm_fasttravel::get_player_index(player);
							var_33b97794 = struct::get_array(level.var_7f76a0b6.target)[n_index];
						}
					}
					player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_33b97794, undefined, "dark_aether_fasttravel", 0, 0, 0);
				}
			}
		}
		hidemiscmodels("zm_silver_normal_computers");
		level flag::set(#"dark_aether_active");
		level.var_ba3a0e1f = 120;
		while(level.var_ba3a0e1f > 0)
		{
			wait(1);
			level.var_ba3a0e1f = level.var_ba3a0e1f - 1;
		}
		level notify(#"dark_side_timeout");
	}
	else
	{
		level clientfield::set("" + #"hash_51ed1d1064cfb0e", 0);
		level clientfield::set("" + #"hash_266f6fe481bab1bc", 0);
		foreach(player in all_players)
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
		}
		level clientfield::set("newtonian_negation", 0);
		function_e21028db("off");
		if(isdefined(var_cbc8cfb4))
		{
			var_4eed9ccb = struct::get_array(var_cbc8cfb4.target, "targetname");
			foreach(player in all_players)
			{
				n_index = zm_fasttravel::get_player_index(player);
				var_10fb1677 = var_4eed9ccb[n_index];
				if(isalive(player))
				{
					player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_10fb1677, undefined, "dark_aether_fasttravel", 0, 0, 0);
				}
			}
		}
		else
		{
			foreach(player in all_players)
			{
				if(isalive(player))
				{
					if(isdefined(player.var_91e83c57))
					{
						var_33b97794 = player.var_91e83c57;
						player.var_91e83c57 = undefined;
					}
					else
					{
						var_33b97794 = struct::spawn(player.origin, player.angles);
						if(player istouching(level.var_7bfbe1fc))
						{
							n_index = zm_fasttravel::get_player_index(player);
							var_33b97794 = struct::get_array(level.var_7f76a0b6.target)[n_index];
						}
					}
					player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_33b97794, undefined, "dark_aether_fasttravel", 0, 0, 0);
				}
			}
		}
		level thread function_79ef019();
		level util::set_lighting_state(0);
		showmiscmodels("zm_silver_normal_computers");
		level flag::clear(#"dark_aether_active");
		var_73a23c23 = getcorpsearray();
		foreach(corpse in var_73a23c23)
		{
			if(isdefined(corpse))
			{
				corpse delete();
			}
		}
	}
}

/*
	Name: function_79ef019
	Namespace: namespace_9f845210
	Checksum: 0xAE3491FF
	Offset: 0x6058
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_79ef019()
{
	wait(2.875);
	level clientfield::increment("" + #"hash_53c6d001e2faecab");
}

/*
	Name: function_9c8b7bf2
	Namespace: namespace_9f845210
	Checksum: 0xD5C013DF
	Offset: 0x60A0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_9c8b7bf2()
{
	if(!isdefined(level.var_73aae81b))
	{
		level.var_73aae81b = [];
	}
	foreach(crystal in level.var_73aae81b)
	{
		function_23c694e8(crystal);
	}
	callback::remove_callback(#"hash_137b937fd26992be", &function_9c8b7bf2);
}

/*
	Name: function_716add58
	Namespace: namespace_9f845210
	Checksum: 0x511F5371
	Offset: 0x6188
	Size: 0x838
	Parameters: 0
	Flags: Linked
*/
function function_716add58()
{
	level endon(#"end_game");
	level endon(#"hash_3e765c26047c9f54");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"into_the_dark_side");
		level flag::clear(#"hash_4d6700553ede7078");
		level.var_67e9e1a7 = 0;
		level flag::set("in_dark_side");
		level flag::clear("rbz_exfil_allowed");
		if(level flag::get("rbz_exfil_beacon_active"))
		{
			if(isdefined(level.var_c5beea37) && isdefined(level.var_c5beea37.var_2d1ee75a))
			{
				level.var_c5beea37.var_2d1ee75a namespace_af5c1c0c::function_3728d19b();
			}
			level flag::clear("rbz_exfil_beacon_active");
		}
		foreach(player in getplayers())
		{
			if(isalive(player))
			{
				player chopper_gunner::function_24fbd61e();
			}
		}
		level thread namespace_2b924e50::function_4cc5fca6();
		level clientfield::increment("" + #"hash_5cf186464ce9cdd6");
		level.var_fe6ca5e8 = 1;
		wait(7);
		level.var_fe6ca5e8 = undefined;
		level flag::set(#"hash_23d445a634bedeae");
		level notify(#"hash_1ca30bf3bc01d214");
		level thread function_5ea16763("on", waitresult.var_cbc8cfb4);
		if(level flag::get(#"hash_76b83a765dea94a5"))
		{
			level flag::clear(#"hash_76b83a765dea94a5");
		}
		else if(level flag::get(#"hash_2aecb7319e5a0d11"))
		{
			level thread function_eafe9d9f();
		}
		if(!level flag::get(#"hash_268c943ffdd74fa"))
		{
			level thread function_c1bd7e55();
			level thread function_40102053();
		}
		turrets = getaiarchetypearray(#"turret");
		if(isdefined(turrets))
		{
			array::run_all(turrets, &kill);
		}
		level thread function_48213c59();
		level thread function_b1b484d();
		waitresult = undefined;
		waitresult = level waittill(#"dark_side_timeout", #"pap_quest_completed", #"hash_61e8a39b3a4bee6a");
		level flag::set("start_back_to_normal");
		if(waitresult._notify != "dark_side_timeout")
		{
			level.var_ba3a0e1f = 0;
		}
		foreach(player in getplayers())
		{
			if(isalive(player))
			{
				player chopper_gunner::function_24fbd61e();
			}
		}
		level thread namespace_2b924e50::function_4cc5fca6();
		level clientfield::increment("" + #"hash_5cf186464ce9cdd6");
		level.var_fe6ca5e8 = 1;
		wait(7);
		level.var_fe6ca5e8 = undefined;
		level flag::clear("in_dark_side");
		level thread function_5ea16763("off", waitresult.var_cbc8cfb4);
		level notify(#"hash_40cd2e6f2c496d75");
		turrets = getaiarchetypearray(#"turret");
		if(isdefined(turrets))
		{
			array::run_all(turrets, &kill);
		}
		if(level flag::get("disable_weapon_machine"))
		{
			level flag::clear("disable_weapon_machine");
		}
		level flag::clear("start_back_to_normal");
		wait(4);
		level flag::clear(#"hash_23d445a634bedeae");
		level flag::set("rbz_exfil_allowed");
		foreach(player in getplayers())
		{
			player val::reset(#"hash_6316e79204ae05eb", "ignoreme");
			var_743a066e = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
			if(isdefined(var_743a066e))
			{
				foreach(steiner in var_743a066e)
				{
					steiner val::reset(#"hash_1fa97fcb67f9befc", "ignoreall");
				}
			}
		}
	}
}

/*
	Name: function_48213c59
	Namespace: namespace_9f845210
	Checksum: 0x79FB3C10
	Offset: 0x69C8
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_48213c59()
{
	level endon(#"end_game", #"dark_side_timeout", #"pap_quest_completed", #"hash_61e8a39b3a4bee6a");
	var_5e93c025 = struct::get_array("placement_monkey", "targetname");
	foreach(monkey in var_5e93c025)
	{
		waitframe(1);
		monkey thread function_647c7f();
	}
}

/*
	Name: function_647c7f
	Namespace: namespace_9f845210
	Checksum: 0x9B288986
	Offset: 0x6AD0
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_647c7f()
{
	var_b6a08ca5 = randomint(3);
	var_bdd70f6a = util::spawn_model(#"c_t9_zmb_cottontop_monkey_echo_fb1", self.origin, self.angles);
	switch(var_b6a08ca5)
	{
		case 0:
		{
			var_bdd70f6a thread scene::play(#"hash_2dc577a7afb42228", "idle_01", var_bdd70f6a);
			break;
		}
		case 1:
		{
			var_bdd70f6a thread scene::play(#"hash_2dc577a7afb42228", "idle_02", var_bdd70f6a);
			break;
		}
		case 2:
		{
			var_bdd70f6a thread scene::play(#"hash_2dc577a7afb42228", "idle_03", var_bdd70f6a);
			break;
		}
		default:
		{
			break;
		}
	}
	level waittill(#"dark_side_timeout", #"pap_quest_completed", #"hash_61e8a39b3a4bee6a");
	var_bdd70f6a delete();
}

/*
	Name: function_6c1800f0
	Namespace: namespace_9f845210
	Checksum: 0xF0911604
	Offset: 0x6C70
	Size: 0x2CC
	Parameters: 0
	Flags: Linked
*/
function function_6c1800f0()
{
	level endon(#"end_game", #"pap_quest_completed");
	level waittill(#"piece_is_found");
	level.var_241be029 = util::spawn_model("tag_origin", struct::get("zm_go_mac", "script_noteworthy").origin);
	level.var_241be029 playloopsound(#"hash_4d743fb901081e97");
	var_64c09f7f = level.var_241be029 zm_unitrigger::function_fac87205(&function_2ad61161, vectorscale((1, 1, 1), 64));
	if(isplayer(var_64c09f7f))
	{
		var_64c09f7f clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5");
	}
	level flag::set(#"hash_4adb3a0e79514d43");
	level.var_241be029 stoploopsound();
	if(isdefined(level.var_6cddddd9))
	{
		level.var_6cddddd9 delete();
	}
	level.var_5a7fab04 show();
	level.var_5a7fab04 scene::play(#"hash_6f09914beb313c", level.var_5a7fab04);
	level.var_5a7fab04 delete();
	level.var_241be029 playsound(#"hash_7a3209563667ad5e");
	level.var_34cbb2a4 = level.round_number;
	level.var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
	if(level flag::get(#"dark_aether_active"))
	{
		level flag::set("disable_weapon_machine");
	}
	level flag::set("pap_quest_completed");
}

/*
	Name: function_2ad61161
	Namespace: namespace_9f845210
	Checksum: 0xDF3DFFC2
	Offset: 0x6F48
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_2ad61161(e_player)
{
	if(level flag::get(#"dark_aether_active"))
	{
		self sethintstring(#"hash_22453a3bdc9b43d8");
		return true;
	}
	return false;
}

/*
	Name: function_b1b484d
	Namespace: namespace_9f845210
	Checksum: 0x22666353
	Offset: 0x6FA8
	Size: 0x218
	Parameters: 0
	Flags: Linked
*/
function function_b1b484d()
{
	level endon(#"hash_40cd2e6f2c496d75", #"end_game");
	self endon(#"disconnect");
	var_f3b29ae8 = 0;
	while(true)
	{
		wait(randomfloatrange(1, 20));
		for(i = 0; i < 2; i++)
		{
			self.var_3643da89 = 1;
			level util::set_lighting_state(2);
			var_cd6bd640 = randomintrange(1, 6);
			if(var_cd6bd640 === var_f3b29ae8)
			{
				var_cd6bd640 = math::clamp(var_cd6bd640 + 1, 1, 6);
			}
			var_f3b29ae8 = var_cd6bd640;
			exploder::exploder("fxexp_script_lightning_0" + var_cd6bd640);
			if(i == 0)
			{
				wait(randomfloatrange(0.3, 0.8));
			}
			else
			{
				wait(randomfloatrange(0.2, 0.5));
			}
			if(is_true(self.var_3643da89))
			{
				level util::set_lighting_state(1);
			}
			exploder::stop_exploder("fxexp_script_lightning_0" + var_cd6bd640);
			if(i == 0)
			{
				wait(randomfloatrange(0.3, 0.5));
			}
		}
	}
}

/*
	Name: function_4b593f32
	Namespace: namespace_9f845210
	Checksum: 0x299001BC
	Offset: 0x71C8
	Size: 0x1A0
	Parameters: 0
	Flags: Linked
*/
function function_4b593f32()
{
	level endoncallback(&function_958b2b63, #"hash_268c943ffdd74fa", #"end_game");
	var_9606f341 = undefined;
	while(!isdefined(var_9606f341))
	{
		var_9606f341 = getent("wonderfizz", "targetname");
		waitframe(1);
	}
	level thread zm_utility::function_60daf5f7("wonderfizz", "targetname", 1);
	while(true)
	{
		if(level flag::get("dark_aether_active"))
		{
			level thread zm_utility::function_60daf5f7("wonderfizz", "targetname", 0);
			hidemiscmodels("replace_wunderfizz_thing");
			level flag::wait_till_clear("dark_aether_active");
		}
		else
		{
			level thread zm_utility::function_60daf5f7("wonderfizz", "targetname", 1);
			showmiscmodels("replace_wunderfizz_thing");
			level flag::wait_till("dark_aether_active");
		}
	}
}

/*
	Name: function_958b2b63
	Namespace: namespace_9f845210
	Checksum: 0x6CDF01BE
	Offset: 0x7370
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_958b2b63(notify_name)
{
	if(notify_name == #"hash_268c943ffdd74fa")
	{
		level thread zm_utility::function_60daf5f7("wonderfizz", "targetname", 0);
		hidemiscmodels("replace_wunderfizz_thing");
	}
}

/*
	Name: function_eafe9d9f
	Namespace: namespace_9f845210
	Checksum: 0x51C2A153
	Offset: 0x73D8
	Size: 0x35C
	Parameters: 0
	Flags: Linked
*/
function function_eafe9d9f()
{
	wait(randomintrange(10, 20));
	active_zones = zm_zonemgr::get_active_zone_names();
	var_a96b643a = [];
	var_bca19f66 = struct::get_array("steiner_location", "script_noteworthy");
	foreach(spawner in var_bca19f66)
	{
		if(isinarray(active_zones, hash(spawner.zone_name)))
		{
			if(!isdefined(var_a96b643a))
			{
				var_a96b643a = [];
			}
			else if(!isarray(var_a96b643a))
			{
				var_a96b643a = array(var_a96b643a);
			}
			var_a96b643a[var_a96b643a.size] = spawner;
		}
	}
	var_39c83b76 = array::random(var_a96b643a);
	if(level flag::get(#"dark_aether_active"))
	{
		level flag::clear("spawn_zombies");
		if(getfreeactorcount() < 1)
		{
			var_2c1b14ae = getactorarray();
			if(isdefined(var_2c1b14ae))
			{
				var_2c1b14ae[0].allowdeath = 1;
				var_2c1b14ae[0] kill();
			}
			else
			{
				/#
					iprintlnbold("");
				#/
			}
		}
		if(isdefined(var_39c83b76))
		{
			var_704c79ef = spawnactor(#"hash_53f4e0daa341a161", var_39c83b76.origin, var_39c83b76.angles);
		}
		else
		{
			/#
				iprintlnbold("");
			#/
			var_704c79ef = spawnactor(#"hash_53f4e0daa341a161", var_bca19f66[0].origin, var_bca19f66[0].angles);
		}
		if(isdefined(var_704c79ef))
		{
			var_704c79ef.ai.var_4beb90f3 = 0;
			var_704c79ef.ignore_enemy_count = 1;
		}
		level flag::set("spawn_zombies");
		level flag::wait_till_clear(#"dark_aether_active");
		if(isdefined(var_704c79ef))
		{
			var_704c79ef delete();
		}
	}
}

/*
	Name: function_1579f31
	Namespace: namespace_9f845210
	Checksum: 0x9A66E51C
	Offset: 0x7740
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private function_1579f31()
{
	/#
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_bde52114);
		level waittill(#"open_sesame");
		level.var_ed556cb6 notify(#"trigger");
	#/
}

/*
	Name: function_bde52114
	Namespace: namespace_9f845210
	Checksum: 0x1CACEB7A
	Offset: 0x77C0
	Size: 0x7A2
	Parameters: 1
	Flags: Private
*/
function private function_bde52114(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_1e2814b98de6d98d":
			{
				if(level flag::get(""))
				{
					level flag::set("");
					level flag::set("");
					wait(3);
					if(!level flag::get(""))
					{
						level flag::set(#"hash_447ca5049bb26ab6");
					}
					level notify(#"into_the_dark_side");
				}
				break;
			}
			case "hash_2bceb571f82616ef":
			{
				if(isdefined(level.var_f070b39a))
				{
					level.var_f070b39a notify(#"trigger_activated");
				}
				break;
			}
			case "hash_3eaff69edfc6cd75":
			{
				if(level flag::get("") && level flag::get(#"dark_aether_active"))
				{
					level notify(#"hash_61e8a39b3a4bee6a");
				}
				if(isdefined(level.var_241be029))
				{
					level.var_241be029 notify(#"trigger_activated");
				}
				break;
			}
			case "hash_50d92ca3c6c7c2a8":
			{
				zm_devgui::zombie_devgui_open_sesame();
				wait(6);
				level flag::set("");
				level flag::set("");
				wait(3);
				if(!level flag::get(""))
				{
					level flag::set(#"hash_447ca5049bb26ab6");
					level notify(#"into_the_dark_side");
					level flag::wait_till(#"dark_aether_active");
					level.var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
				}
				else
				{
					level notify(#"into_the_dark_side");
				}
				wait(10);
				if(isdefined(level.var_f070b39a))
				{
					level.var_f070b39a notify(#"trigger_activated");
				}
				wait(2);
				if(isdefined(level.var_241be029))
				{
					level.var_241be029 notify(#"trigger_activated");
				}
				break;
			}
			case "hash_d005bc857be0586":
			{
				if(isdefined(level.var_ba3a0e1f) && level flag::get(#"dark_aether_active"))
				{
					level.var_ba3a0e1f = level.var_ba3a0e1f + 3600;
				}
				break;
			}
			case "hash_4d0546ccefa40f38":
			{
				level flag::set(#"hash_4d6700553ede7078");
				if(isdefined(level.var_8dc29179))
				{
					foreach(var_f2484ed9 in level.var_8dc29179)
					{
						var_f2484ed9 flag::set(#"hash_4d6700553ede7078");
					}
				}
				if(isdefined(level.var_f2484ed9))
				{
					level.var_f2484ed9 flag::wait_till(#"hash_4d6700553ede7078");
				}
				break;
			}
			case "hash_4ddc655ce16a22ae":
			{
				foreach(player in getplayers())
				{
					player clientfield::set("" + #"hash_63af42145e260fb5", 0);
					player clientfield::set("" + #"hash_63af42145e260fb5", 1);
				}
				break;
			}
			case "hash_6e3bbba4f0ed5552":
			{
				foreach(player in getplayers())
				{
					player clientfield::set("" + #"hash_63af42145e260fb5", 0);
				}
				break;
			}
			case "hash_651a8146d52739a":
			{
				foreach(player in getplayers())
				{
					player clientfield::set("" + #"hash_63af42145e260fb5", 0);
					player clientfield::set("" + #"hash_63af42145e260fb5", 2);
				}
				break;
			}
			case "hash_407a1d2b33b93f95":
			{
				level thread function_feecd74();
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
	Name: function_feecd74
	Namespace: namespace_9f845210
	Checksum: 0xCDE0DEBD
	Offset: 0x7F70
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_feecd74()
{
	/#
		if(!isdefined(level.var_ba3a0e1f))
		{
			return;
		}
		if(is_true(level.var_13c380ca))
		{
			level.var_13c380ca = 0;
			return;
		}
		if(!level flag::get(#"dark_aether_active"))
		{
			iprintln("");
		}
		else
		{
			level.var_13c380ca = 1;
			while(level.var_ba3a0e1f > 0 && level.var_13c380ca === 1)
			{
				iprintln("" + level.var_ba3a0e1f);
				wait(1);
			}
			iprintln("");
		}
	#/
}

