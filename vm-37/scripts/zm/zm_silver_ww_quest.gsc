#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_silver_util.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using script_2f560596a9a134ab;
#using script_4ce5d94e8c797350;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using script_36f4be19da8eb6d0;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_c8c67699;

/*
	Name: init
	Namespace: namespace_c8c67699
	Checksum: 0x387F1FC1
	Offset: 0xA30
	Size: 0x9A4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!getdvarint(#"hash_83c887746f9dfd", 1))
	{
		var_8800c990 = getent("ieu_interact_volume", "script_noteworthy");
		var_8800c990 setinvisibletoall();
		var_d04aa7c3 = getent("zm_arm_dr_cp", "script_noteworthy");
		var_d04aa7c3 notsolid();
		var_7a77b166 = getent("zm_gs_cp", "targetname");
		var_7a77b166 notsolid();
		var_7a77b166 connectpaths();
		var_a9674486 = getent("zm_sw_gas_crash_clip", "targetname");
		var_a9674486 notsolid();
		var_a9674486 connectpaths();
		var_91654233 = getent("zm_cy_cp", "targetname");
		var_91654233 notsolid();
		var_91654233 connectpaths();
		var_647db42a = getent("zm_sw_nit_left_clip", "targetname");
		var_647db42a notsolid();
		var_647db42a connectpaths();
		var_6aef8ef1 = getent(getent("zm_sw_nit_left", "script_noteworthy").target, "targetname");
		var_6aef8ef1 setinvisibletoall();
		var_dfca5f6b = getent("zm_ele_cp", "targetname");
		var_dfca5f6b notsolid();
		var_dfca5f6b connectpaths();
		var_47f8e97e = getent("zm_sw_par_pa_clip", "targetname");
		var_47f8e97e notsolid();
		var_47f8e97e connectpaths();
		var_e9c12dbe = getent(getent("zm_sw_par_pa", "script_noteworthy").target, "targetname");
		var_e9c12dbe setinvisibletoall();
		var_1769d926 = getent("zm_sw_pla_tr_clip", "targetname");
		var_1769d926 notsolid();
		var_1769d926 connectpaths();
		var_64b5a257 = getent(getent("zm_sw_pla_tr", "script_noteworthy").target, "targetname");
		var_64b5a257 notsolid();
		var_64b5a257 connectpaths();
		var_dc323327 = getent("zm_sw_pla_right", "script_noteworthy");
		var_dc323327 hide();
		return;
	}
	/#
		execdevgui("");
		level thread function_233ed9b4();
	#/
	clientfield::register("scriptmover", "" + #"hash_7159facf785aad53", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_864ef374ea11ea7", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_18f64f139f905f76", 1, 1, "int");
	clientfield::register("scriptmover", "crystal_energy_fx", 1, 1, "int");
	clientfield::register("allplayers", "ww_vacuum_crystal_fx", 1, 1, "int");
	clientfield::register("allplayers", "hold_crystal_energy", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_21ba194bb9030d0c", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5e31ed9954a7a58a", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_5020565243fa510a", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_4119827af45a4ba7", 1, 1, "int");
	clientfield::register("toplayer", "" + #"interact_rumble", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_6a198759db0810a6", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7862b1e62306df36", 1, 1, "int");
	clientfield::register("allplayers", "" + #"hash_196eef041ba86f9a", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_5a932b901b9a5d0d", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_20066374c799cb61", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7aeee79e85f9273c", 1, 3, "int");
	clientfield::register("world", "" + #"hash_31ddead700f0e24c", 1, 1, "int");
	level thread function_7b4dc906();
	level thread function_c436fc75();
	level thread function_17329c15();
	level thread function_78d3b53b();
	level thread function_77fdf8f3();
	level thread function_a5ae82b0();
}

/*
	Name: function_7b4dc906
	Namespace: namespace_c8c67699
	Checksum: 0x82CBF23A
	Offset: 0x13E0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_7b4dc906()
{
	level endon(#"end_game");
	level.var_632fe5ca = 0;
	function_aee47035();
	callback::on_item_pickup(&on_item_pickup);
	callback::on_weapon_change(&function_b8a1fcc2);
}

/*
	Name: function_aee47035
	Namespace: namespace_c8c67699
	Checksum: 0x2C29EA1D
	Offset: 0x1468
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_aee47035()
{
	level thread function_284b43aa();
	level thread function_5adab0a2();
	level thread function_afba0d4c();
	level thread function_23ac3e06();
	level thread function_67144513();
}

/*
	Name: function_284b43aa
	Namespace: namespace_c8c67699
	Checksum: 0x82852E53
	Offset: 0x14F0
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_284b43aa()
{
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_7e3660d8d125a63a");
		if(zm_utility::check_point_in_playable_area(waitresult.position))
		{
			point = function_4ba8fde(#"hash_37f8e99ab49c109");
			var_82545918 = item_drop::drop_item(0, undefined, 1, 0, point.id, waitresult.position, undefined, 2);
			var_82545918.var_dd21aec2 = 1 | 16;
			level flag::wait_till_timeout(30, "player_got_card");
			if(level flag::get("player_got_card"))
			{
				break;
			}
			else if(isdefined(var_82545918))
			{
				var_82545918 delete();
			}
		}
	}
}

/*
	Name: function_5adab0a2
	Namespace: namespace_c8c67699
	Checksum: 0xA212B9E9
	Offset: 0x1648
	Size: 0x474
	Parameters: 0
	Flags: Linked
*/
function function_5adab0a2()
{
	reader = getent("zm_red_arm", "script_noteworthy");
	reader clientfield::set("" + #"hash_6a198759db0810a6", 1);
	level flag::wait_till("player_got_card");
	drawer = getent("zm_dra_arm", "script_noteworthy");
	var_bc4ce35d = getent(drawer.target, "targetname");
	var_bc4ce35d linkto(drawer);
	/#
		iprintlnbold("");
	#/
	e_activator = reader zm_unitrigger::function_fac87205(#"hash_4472d2ff9d015c5e", 48);
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	var_493bf9de = util::spawn_model(#"p9_zm_ndu_ieu_keycard", struct::get("zm_chip_ins").origin, struct::get("zm_chip_ins").angles);
	var_493bf9de moveto(var_493bf9de.origin + (vectorscale((0, -1, 0), 8)), 1, 0.25, 0.25);
	var_493bf9de playsound(#"hash_25944d8316921ce3");
	var_493bf9de waittill(#"movedone");
	var_4fe610e9 = struct::get("zm_dw_re");
	point = function_4ba8fde(#"hash_2f24375908d9f69c");
	var_c4667a11 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_4fe610e9.origin, var_4fe610e9.angles, 0);
	var_c4667a11.var_dd21aec2 = 1 | 16;
	var_c4667a11 linkto(drawer);
	drawer moveto(drawer.origin + vectorscale((0, 1, 0), 15), 2, 0.5, 0.5);
	foreach(player in getplayers())
	{
		if(isalive(player) && distancesquared(player.origin, drawer.origin) <= 16384)
		{
			player clientfield::set_to_player("" + #"interact_rumble", 1);
		}
	}
	drawer playsound(#"hash_2912845c6136a6b4");
}

/*
	Name: function_afba0d4c
	Namespace: namespace_c8c67699
	Checksum: 0x4F0FABCA
	Offset: 0x1AC8
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_afba0d4c()
{
	var_7b1f83bc = struct::get("zm_sw_wpn", "script_noteworthy");
	ww_quest_lookat_node = struct::get("zm_nd_wpn_lookat", "targetname");
	level flag::wait_till("player_got_remote");
	point = function_4ba8fde(#"hash_2f243a5908d9fbb5");
	var_87cced30 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_7b1f83bc.origin, var_7b1f83bc.angles, 0);
	var_87cced30.var_dd21aec2 = 1 | 16;
	/#
		iprintlnbold("");
	#/
	foreach(player in getplayers())
	{
		if(isalive(player))
		{
			player thread zm_vo::function_c4303dda(#"hash_1f1af84a7a06aacb");
			player thread function_34ba4d65(var_87cced30, 1000, ww_quest_lookat_node, 250);
		}
	}
	level thread function_eb0fb7fc(30, 30);
}

/*
	Name: function_34ba4d65
	Namespace: namespace_c8c67699
	Checksum: 0x78B2C837
	Offset: 0x1CC8
	Size: 0x332
	Parameters: 4
	Flags: Linked
*/
function function_34ba4d65(ent, max_distance, var_967955b1, var_3ef79add)
{
	level endon(#"hash_41f5f07f48f61c32");
	self endon(#"death");
	ent endon(#"death", #"delete");
	var_58507577 = 0;
	while(isdefined(ent))
	{
		var_310f9e44 = pathdistance(self.origin, ent.origin);
		if(isalive(self) && isdefined(var_310f9e44) && var_310f9e44 <= max_distance)
		{
			self playsoundtoplayer("zmb_quest_ww_remote_chirp_2d", self);
			if(!self flag::get("signal_detected"))
			{
				self flag::set("signal_detected");
				if(var_58507577 == 0)
				{
					self thread zm_vo::function_c4303dda(#"hash_400ee92852a265a6");
					var_58507577 = 10;
				}
			}
			if(!self flag::get("signal_locked") && var_310f9e44 <= var_3ef79add && self zm_utility::is_player_looking_at(var_967955b1.origin, 0.9975, 0, self))
			{
				self flag::set("signal_locked");
				self thread zm_vo::function_c4303dda(#"hash_21316bfb4ed0ab16");
			}
			n_waittime = math::clamp(var_310f9e44 / 500, 0.5, 10);
			wait(n_waittime);
			var_58507577 = math::clamp(var_58507577 - n_waittime, 0, 10);
		}
		else
		{
			if(self flag::get("signal_detected"))
			{
				self flag::clear("signal_detected");
				self flag::clear("signal_locked");
				if(var_58507577 == 0)
				{
					self thread zm_vo::function_c4303dda(#"hash_174e4ff4a83163b2");
					var_58507577 = 10;
				}
			}
			wait(1);
			var_58507577 = math::clamp(var_58507577 - 1, 0, 10);
		}
	}
}

/*
	Name: function_eb0fb7fc
	Namespace: namespace_c8c67699
	Checksum: 0x10FD9806
	Offset: 0x2008
	Size: 0x59C
	Parameters: 2
	Flags: Linked
*/
function function_eb0fb7fc(duration, cooldown)
{
	level endon(#"hash_688da970d6800901");
	var_f769654e = getent("ieu_interact_volume", "script_noteworthy");
	ww_room_door = getent("zm_start_door", "script_noteworthy");
	var_2f3cc38 = getent("zm_sw_gla", "script_noteworthy");
	var_7ee5c5e3 = 0;
	while(true)
	{
		var_f769654e setvisibletoall();
		var_f769654e sethintstring(#"hash_14c27f71630de2a6");
		waitresult = undefined;
		waitresult = var_f769654e waittill(#"trigger");
		if(isplayer(waitresult.activator))
		{
			waitresult.activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
		}
		var_7ee5c5e3 = var_7ee5c5e3 + 1;
		foreach(player in getplayers())
		{
			if(player.zone_name === "zone_proto_interior_lower")
			{
				player thread zm_vo::function_c4303dda(#"hash_723a00998b0a7c16");
			}
		}
		level notify(#"hash_41f5f07f48f61c32");
		var_f769654e setinvisibletoall();
		level notify(#"hash_3a8ba71d0dfe9582");
		level.fx_loc = util::spawn_model("tag_origin", ww_room_door.origin + (25, -33, 80), ww_room_door.angles + vectorscale((0, 1, 0), 90));
		level.fx_loc clientfield::set("" + #"hash_7159facf785aad53", 1);
		level clientfield::set("" + #"hash_31ddead700f0e24c", 1);
		if(var_7ee5c5e3 == 1)
		{
			var_2f3cc38 thread scene::play(#"hash_44c12ff8dba02b49", var_2f3cc38);
		}
		wait(duration);
		foreach(player in getplayers())
		{
			if(player.zone_name === "zone_proto_interior_lower")
			{
				player thread zm_vo::function_c4303dda(#"hash_1fc733b124e246eb");
			}
		}
		level notify(#"hash_38e1cbcaef1b44c9");
		level.fx_loc clientfield::set("" + #"hash_7159facf785aad53", 0);
		level clientfield::set("" + #"hash_31ddead700f0e24c", 0);
		waitframe(1);
		if(isdefined(level.fx_loc))
		{
			level.fx_loc delete();
		}
		var_f769654e setvisibletoall();
		var_f769654e sethintstring(#"hash_19d5279408f7213b");
		wait(cooldown);
		foreach(player in getplayers())
		{
			if(player.zone_name === "zone_proto_interior_lower")
			{
				player thread zm_vo::function_c4303dda(#"hash_7ff8f37e0b0b8efb");
			}
		}
	}
}

/*
	Name: function_23ac3e06
	Namespace: namespace_c8c67699
	Checksum: 0x7E1B8FE8
	Offset: 0x25B0
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_23ac3e06()
{
	vol_death_zone = getent("vol_death_zone", "script_noteworthy");
	level thread function_890f302c();
	while(true)
	{
		if(level.var_632fe5ca >= 20)
		{
			break;
		}
		level waittill(#"hash_3a8ba71d0dfe9582");
		vol_death_zone thread function_37ba0961();
		vol_death_zone function_67a6fd4();
	}
	foreach(player in getplayers())
	{
		if(player.zone_name === "zone_proto_interior_lower")
		{
			player thread zm_vo::function_c4303dda(#"hash_3f19f7ae3b1f9bf3");
		}
	}
	level notify(#"hash_688da970d6800901");
	level.fx_loc clientfield::set("" + #"hash_7159facf785aad53", 0);
	level clientfield::set("" + #"hash_31ddead700f0e24c", 0);
	waitframe(1);
	if(isdefined(level.fx_loc))
	{
		level.fx_loc delete();
	}
}

/*
	Name: function_37ba0961
	Namespace: namespace_c8c67699
	Checksum: 0xD41CB1DA
	Offset: 0x27C8
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function function_37ba0961()
{
	level endon(#"hash_38e1cbcaef1b44c9", #"hash_688da970d6800901");
	while(true)
	{
		all_players = getplayers();
		foreach(player in all_players)
		{
			if(player istouching(self))
			{
				player clientfield::set_to_player("" + #"hash_864ef374ea11ea7", 1);
				continue;
			}
			player clientfield::set_to_player("" + #"hash_864ef374ea11ea7", 0);
		}
		waitframe(1);
	}
}

/*
	Name: function_890f302c
	Namespace: namespace_c8c67699
	Checksum: 0xF4CCBE9A
	Offset: 0x2920
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_890f302c()
{
	level endon(#"game_ended", #"ww_quest_completed");
	while(true)
	{
		level waittill(#"hash_38e1cbcaef1b44c9", #"hash_688da970d6800901");
		all_players = getplayers();
		foreach(player in all_players)
		{
			player clientfield::set_to_player("" + #"hash_864ef374ea11ea7", 0);
		}
	}
}

/*
	Name: function_67a6fd4
	Namespace: namespace_c8c67699
	Checksum: 0x3E2B4878
	Offset: 0x2A48
	Size: 0x1BE
	Parameters: 0
	Flags: Linked
*/
function function_67a6fd4()
{
	level endon(#"hash_38e1cbcaef1b44c9");
	var_cb6783bb = getent("zm_door_vac", "targetname");
	if(!isdefined(var_cb6783bb))
	{
		return;
	}
	while(level.var_632fe5ca < 20)
	{
		ai_zombies = getactorarray();
		foreach(actor in ai_zombies)
		{
			if(isalive(actor) && actor istouching(self))
			{
				actor playsound(#"hash_140d306061d4e40c");
				actor.allowdeath = 1;
				actor dodamage(actor.health + 1, actor.origin, var_cb6783bb, undefined, "none", "MOD_DOT", 0, level.var_652bc5ed);
				level.var_632fe5ca = level.var_632fe5ca + 1;
			}
		}
		wait(1);
	}
}

/*
	Name: function_67144513
	Namespace: namespace_c8c67699
	Checksum: 0xD0EA2949
	Offset: 0x2C10
	Size: 0x4AC
	Parameters: 0
	Flags: Linked
*/
function function_67144513()
{
	var_ed63dcf1 = getent("ieu_interact_volume", "script_noteworthy");
	var_bf352650 = getent("vol_death_zone", "script_noteworthy");
	ww_room_door = getent("zm_start_door", "script_noteworthy");
	var_a0f325fa = getent(ww_room_door.target, "targetname");
	var_ed63dcf1 setinvisibletoall();
	var_bf352650 setinvisibletoall();
	var_7b1f83bc = struct::get("zm_sw_wpn", "script_noteworthy");
	var_c18965d8 = getent(var_7b1f83bc.target, "targetname");
	var_87cced30 = util::spawn_model("tag_origin", var_7b1f83bc.origin, var_7b1f83bc.angles);
	level waittill(#"hash_688da970d6800901");
	var_ed63dcf1 setvisibletoall();
	var_ed63dcf1 sethintstring(#"hash_7c3dc5c3150a3e79");
	var_ed63dcf1 waittill(#"trigger");
	level flag::set("open_wonder_weapon_room");
	var_87cced30 clientfield::set("" + #"hash_18f64f139f905f76", 1);
	var_ed63dcf1 delete();
	namespace_4abf1500::function_23255935("ww_quest_audiolog");
	ww_room_door thread scene::play(#"hash_65505ba29fee0a2f", ww_room_door);
	wait(1.2);
	foreach(player in getplayers())
	{
		if(player istouching(var_bf352650))
		{
			v_dir = player.origin - ww_room_door.origin;
			v_dir = (v_dir[0], v_dir[1], 0.1);
			v_dir = vectornormalize(v_dir);
			strength = 1200;
			v_player_velocity = player getvelocity();
			player setvelocity(v_player_velocity + (v_dir * strength));
		}
		if(distancesquared(ww_room_door.origin, player.origin) <= 262144)
		{
			player clientfield::set_to_player("" + #"hash_4119827af45a4ba7", 1);
		}
	}
	var_a0f325fa delete();
	/#
		iprintlnbold("");
	#/
	level flag::wait_till(#"hash_15f3e07d50195cb9");
	if(isdefined(var_87cced30))
	{
		var_87cced30 delete();
	}
	var_c18965d8 delete();
	level flag::set("ww_quest_completed");
}

/*
	Name: function_2f6cb9bc
	Namespace: namespace_c8c67699
	Checksum: 0x6C3946A8
	Offset: 0x30C8
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function function_2f6cb9bc(var_479e219c)
{
	level endon(var_479e219c + "_enable", var_479e219c + "_crate_hint");
	self thread function_2bb91770(var_479e219c);
	while(!level flag::get(var_479e219c + #"hash_b3e1b646a8ad825"))
	{
		level flag::wait_till(#"dark_aether_active");
		level notify(var_479e219c + #"hash_166bff2e664c55b5");
		zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
		level flag::wait_till_clear(#"dark_aether_active");
		self thread function_2bb91770(var_479e219c);
	}
}

/*
	Name: function_2bb91770
	Namespace: namespace_c8c67699
	Checksum: 0x8489BAA7
	Offset: 0x31C8
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_2bb91770(var_479e219c)
{
	level endon(var_479e219c + "_enable", var_479e219c + #"hash_166bff2e664c55b5");
	level flag::wait_till(#"hash_15f3e07d50195cb9");
	self zm_unitrigger::function_fac87205(#"hash_12843f9a6f78954f", vectorscale((1, 1, 1), 96));
	level notify(var_479e219c + "_crate_hint");
	level flag::set(var_479e219c + #"hash_b3e1b646a8ad825");
}

/*
	Name: function_c436fc75
	Namespace: namespace_c8c67699
	Checksum: 0xA6A18711
	Offset: 0x3298
	Size: 0x82C
	Parameters: 0
	Flags: Linked
*/
function function_c436fc75()
{
	level thread function_8fa801ac();
	scene::add_scene_func(#"hash_1ad915d17cdbbfd4", &function_ad61157, "init");
	level scene::init(#"hash_1ad915d17cdbbfd4");
	level.var_a1b709cb = getent("zm_sw_nit_left", "script_noteworthy");
	level.var_a1b709cb.var_14bfe1d6 = getent(level.var_a1b709cb.script_string, "targetname");
	level.var_a1b709cb.var_14bfe1d6 notsolid();
	level.var_a1b709cb.var_14bfe1d6 connectpaths();
	var_91654233 = getent("zm_cy_cp", "targetname");
	var_91654233 solid();
	var_91654233 disconnectpaths();
	level.var_a1b709cb thread function_2f6cb9bc("nitro");
	var_1a3ee7c1 = getent(level.var_a1b709cb.target, "targetname");
	var_1a3ee7c1 setinvisibletoall();
	var_127d143e = getent("zm_fun_po", "script_noteworthy");
	var_811ae6d7 = getent("zm_fun_dmg", "script_noteworthy");
	var_811ae6d7 enablegrenadetouchdamage();
	while(true)
	{
		waitresult = undefined;
		waitresult = var_811ae6d7 waittill(#"damage");
		if(isdefined(waitresult.attacker) && waitresult.attacker.archetype === #"hash_7c0d83ac1e845ac2")
		{
			var_127d143e clientfield::set("" + #"hash_21ba194bb9030d0c", 1);
			var_127d143e clientfield::set("" + #"hash_5e31ed9954a7a58a", 1);
			var_8ce27402 = util::spawn_model(#"p9_fxanim_zm_ndu_fungus_liquid", var_127d143e.origin, var_127d143e.angles);
			/#
				iprintlnbold("");
			#/
			break;
		}
	}
	level notify(#"hash_43f35dbac954ab43");
	level flag::wait_till(#"player_got_the_flask");
	e_activator = var_127d143e zm_unitrigger::function_fac87205(#"hash_305fa71dfcc314d1", 64);
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	var_ed7b24c9 = struct::get("drip_nitrogen_loc", "targetname");
	var_4db6fabc = util::spawn_model(#"p9_zm_ndu_conical_flask", var_ed7b24c9.origin);
	var_4db6fabc setscale(2);
	var_4db6fabc playsound(#"hash_38b73ff812bde7a2");
	var_127d143e clientfield::set("" + #"hash_5e31ed9954a7a58a", 2);
	wait(60);
	if(isdefined(var_8ce27402))
	{
		var_8ce27402 delete();
	}
	var_127d143e clientfield::set("" + #"hash_21ba194bb9030d0c", 0);
	var_127d143e clientfield::set("" + #"hash_5e31ed9954a7a58a", 0);
	var_127d143e setmodel(#"p9_fxanim_zm_ndu_fungus_death_mod");
	var_f98507ef = struct::get("zm_sce_fun");
	var_f98507ef thread scene::play(#"hash_5ba02ce8deeb2061", var_127d143e);
	var_4db6fabc delete();
	point = function_4ba8fde(#"hash_22d1a49f2c1d1c80");
	var_6222618f = item_drop::drop_item(0, undefined, 1, 0, point.id, var_ed7b24c9.origin, var_ed7b24c9.angles, 0);
	var_6222618f.var_dd21aec2 = 1 | 16;
	level flag::wait_till("player_got_the_filled_flask");
	level.var_a1b709cb zm_unitrigger::unregister_unitrigger(level.var_a1b709cb.s_unitrigger);
	level notify(#"hash_3395a609db7462e7");
	var_1a3ee7c1 setvisibletoall();
	var_1a3ee7c1 sethintstring(#"hash_235cdbad8044e4c2");
	waitresult = undefined;
	waitresult = var_1a3ee7c1 waittill(#"trigger");
	if(isplayer(waitresult.activator))
	{
		waitresult.activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	var_1a3ee7c1 setinvisibletoall();
	playsoundatposition(#"hash_7d25502411a9cd58", var_1a3ee7c1.origin);
	level notify(#"hash_1fd19e3d2e214e5");
	wait(3);
	level scene::play(#"hash_1ad915d17cdbbfd4", "chain");
	/#
		iprintlnbold("");
	#/
	level.var_a1b709cb thread function_8d9ddc22("NITROGEN");
}

/*
	Name: function_ad61157
	Namespace: namespace_c8c67699
	Checksum: 0x1139277D
	Offset: 0x3AD0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_ad61157(a_ents)
{
	var_bf71a40b = a_ents[#"weapon_crate"];
	level waittill(#"hash_1fd19e3d2e214e5");
	var_bf71a40b clientfield::set("" + #"hash_5020565243fa510a", 1);
}

/*
	Name: function_8fa801ac
	Namespace: namespace_c8c67699
	Checksum: 0x2AE15193
	Offset: 0x3B58
	Size: 0x31C
	Parameters: 0
	Flags: Linked
*/
function function_8fa801ac()
{
	var_6dad8de0 = getent("zm_nit_box_start", "script_noteworthy");
	var_6954c829 = spawn("trigger_damage", var_6dad8de0.origin, 0, 64, 64);
	var_b14c0d6c = struct::get("zm_nit_box_po");
	while(true)
	{
		waitresult = undefined;
		waitresult = var_6954c829 waittill(#"damage");
		if(isplayer(waitresult.attacker) && !is_true(waitresult.var_98e101b0))
		{
			if(isdefined(waitresult.weapon) && namespace_b376a999::function_7c292369(waitresult.weapon))
			{
				var_99bf2e73 = struct::get("zmintel_silver_maxis_audiolog_2", "scriptbundlename");
				var_99bf2e73 thread namespace_4abf1500::function_c1974629(undefined, 500);
				var_6dad8de0 thread scene::play(#"hash_151e965484d970e1", var_6dad8de0);
				wait(1);
				foreach(player in getplayers())
				{
					if(distancesquared(player.origin, var_b14c0d6c.origin) < 65536)
					{
						player clientfield::set_to_player("" + #"interact_rumble", 1);
					}
				}
				point = function_4ba8fde(#"hash_16ea992ec682d37");
				var_6222618f = item_drop::drop_item(0, undefined, 1, 0, point.id, var_b14c0d6c.origin, var_b14c0d6c.angles, 2);
				var_6222618f.var_dd21aec2 = 1 | 16;
				break;
			}
		}
	}
	var_6954c829 delete();
}

/*
	Name: function_c801979a
	Namespace: namespace_c8c67699
	Checksum: 0x7FCBD917
	Offset: 0x3E80
	Size: 0x16C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c801979a(s_params)
{
	/#
		assert(isdefined(level.var_3789aef6));
	#/
	if(self.var_9fde8624 === #"hash_2a5479b83161cb35" && !level flag::get("container_filled_with_gas"))
	{
		waittillframeend();
		if(!is_true(self.var_270befd2) && self istouching(level.var_3789aef6))
		{
			self.var_270befd2 = 1;
			container = getent("zm_con_arm", "script_noteworthy");
			container clientfield::set("" + #"hash_20066374c799cb61", 1);
			self thread function_beb0f79f();
			wait(3);
			level flag::set("container_filled_with_gas");
			/#
				iprintlnbold("");
			#/
		}
	}
}

/*
	Name: function_beb0f79f
	Namespace: namespace_c8c67699
	Checksum: 0xF9144032
	Offset: 0x3FF8
	Size: 0x34C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_beb0f79f()
{
	level endon(#"game_ended");
	node = struct::get("ww_gas_vacuum_loc", "targetname");
	if(!isdefined(node))
	{
		return;
	}
	wait(0.8);
	radius = 60;
	center = self.origin + vectorscale((0, 0, 1), 10);
	playfx(#"hash_5f0e97a0faf57056", self.origin + vectorscale((0, 0, 1), 18), anglestoup(self.angles));
	if(isdefined(self))
	{
		self delete();
	}
	target = util::spawn_model("tag_origin", node.origin, (300, 190, 0));
	playfxontag(#"hash_26bcb19edfb10d7c", target, "tag_origin");
	target playsound(#"hash_1cc97472d1a1ac95");
	waittime = 5;
	interval = 0.1;
	/#
		waittime = getdvarfloat(#"hash_290a38a40f8a01b2", 5);
		interval = getdvarfloat(#"hash_24a6ae1d9a8c605b", 0.1);
	#/
	while(waittime > 0)
	{
		if(!mayspawnentity())
		{
			break;
		}
		var_194983d0 = randomfloat(360);
		var_bbbdc8b2 = randomfloat(360);
		start_pos = center + (sin(var_194983d0) * cos(var_bbbdc8b2), cos(var_194983d0) * cos(var_bbbdc8b2), sin(var_bbbdc8b2)) * randomfloat(radius);
		level thread namespace_b376a999::function_6dbf1bb3(target, 5, start_pos);
		waittime = waittime - interval;
		radius = radius - (10 * interval);
		wait(interval);
	}
	wait(1);
	if(isdefined(target))
	{
		target delete();
	}
}

/*
	Name: function_17329c15
	Namespace: namespace_c8c67699
	Checksum: 0xAB41C28C
	Offset: 0x4350
	Size: 0x73C
	Parameters: 0
	Flags: Linked
*/
function function_17329c15()
{
	level thread function_dc2acb90();
	level scene::init(#"hash_52fd2682092127fc");
	level.var_74ec088f = getent("zm_sw_gas_crash", "script_noteworthy");
	level.var_74ec088f.var_14bfe1d6 = getent(level.var_74ec088f.script_string, "targetname");
	level.var_74ec088f.var_14bfe1d6 notsolid();
	level.var_74ec088f.var_14bfe1d6 connectpaths();
	var_7a77b166 = getent("zm_gs_cp", "targetname");
	var_7a77b166 solid();
	var_7a77b166 disconnectpaths();
	level.var_74ec088f thread function_2f6cb9bc("gas");
	container = getent("zm_con_arm", "script_noteworthy");
	level.var_3789aef6 = getent(container.target, "targetname");
	callback::on_ai_killed(&function_c801979a);
	level flag::wait_till("player_got_the_canister");
	e_activator = container zm_unitrigger::function_fac87205(#"hash_1b64b8622366a804", vectorscale((1, 1, 1), 64));
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	var_5ac7d534 = util::spawn_model(#"p9_zm_ndu_gas_canister", struct::get("zm_can_arm").origin);
	var_5ac7d534 playsound(#"");
	level flag::wait_till("container_filled_with_gas");
	callback::remove_on_ai_killed(&function_c801979a);
	var_504be1e4 = getent("zm_con_wrn", "targetname");
	var_504be1e4 rotateto(var_504be1e4.angles + (vectorscale((-1, 0, 0), 90)), 0.5, 0.25, 0.25);
	container clientfield::set("" + #"hash_20066374c799cb61", 0);
	var_5ac7d534 playsound(#"hash_4900d3acf7b69f98");
	/#
		iprintlnbold("");
	#/
	wait(3);
	level notify(#"hash_20690d1d96df7c03");
	var_5ac7d534 delete();
	point = function_4ba8fde(#"hash_5f8eec7ec430864");
	var_457b303e = item_drop::drop_item(0, undefined, 1, 0, point.id, struct::get("zm_can_arm").origin, undefined, 0);
	var_457b303e.var_dd21aec2 = 1 | 16;
	level flag::wait_till("full_canister_picked_up");
	level.var_74ec088f zm_unitrigger::unregister_unitrigger(level.var_74ec088f.s_unitrigger);
	level notify(#"hash_6570f3a0ec272ff0");
	e_activator = level.var_74ec088f zm_unitrigger::function_fac87205(#"hash_4e599abcf42324d0", vectorscale((1, 1, 1), 96));
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	var_b04e724c = util::spawn_model(#"p9_zm_ndu_gas_canister", struct::get("zm_can_box").origin);
	t_damage = spawn("trigger_damage", var_b04e724c.origin, 0, 32, 32);
	while(true)
	{
		waitresult = undefined;
		waitresult = t_damage waittill(#"damage");
		if(isdefined(waitresult) && isplayer(waitresult.attacker))
		{
			break;
		}
	}
	/#
		iprintlnbold("");
	#/
	if(isdefined(var_b04e724c))
	{
		var_b04e724c delete();
	}
	level.var_74ec088f clientfield::set("" + #"hash_7862b1e62306df36", 1);
	level scene::play(#"hash_52fd2682092127fc", "roots");
	level.var_74ec088f thread function_8d9ddc22("GAS");
	waittillframeend();
	if(isdefined(t_damage))
	{
		t_damage delete();
	}
}

/*
	Name: function_dc2acb90
	Namespace: namespace_c8c67699
	Checksum: 0x5F89B6A
	Offset: 0x4A98
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function function_dc2acb90()
{
	var_5434afc4 = struct::get("zm_can_start", "script_noteworthy");
	level flag::wait_till("start_zombie_round_logic");
	point = function_4ba8fde(#"hash_5d1c62463e73e906");
	canister = item_drop::drop_item(0, undefined, 1, 0, point.id, var_5434afc4.origin, var_5434afc4.angles, 0);
	canister.var_dd21aec2 = 1 | 16;
	var_56bd59dc = getent("zm_can_dmg", "script_noteworthy");
	var_56bd59dc.var_22cea3da = &function_72c756bc;
	waitresult = undefined;
	waitresult = var_56bd59dc waittill(#"hash_31c03401c377e12b");
	if(isdefined(waitresult.player) && isdefined(canister))
	{
		if(isdefined(var_56bd59dc))
		{
			var_56bd59dc delete();
		}
		canister zm_utility::fake_physicslaunch(waitresult.player.origin + vectorscale((0, 0, 1), 35), 400);
		canister playsound(#"hash_58520f136e1f89f9");
	}
	var_99bf2e73 = struct::get("zmintel_silver_maxis_audiolog_3", "scriptbundlename");
	var_99bf2e73 thread namespace_4abf1500::function_c1974629(undefined, 500);
}

/*
	Name: function_72c756bc
	Namespace: namespace_c8c67699
	Checksum: 0x16CDCA7F
	Offset: 0x4CA8
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function function_72c756bc(player, time)
{
	if(time >= 2000)
	{
		self notify(#"hash_31c03401c377e12b", {#player:player});
	}
}

/*
	Name: function_3ca2b2c1
	Namespace: namespace_c8c67699
	Checksum: 0xBAB7161C
	Offset: 0x4D00
	Size: 0x448
	Parameters: 3
	Flags: Linked
*/
function function_3ca2b2c1(var_fd6475b5, end_notify, var_93bdf906)
{
	level endon(end_notify);
	level flag::wait_till_all([1:"terminal_2_is_on", 0:"terminal_1_is_on"]);
	var_7f76a0b6 = struct::get(var_fd6475b5);
	var_f2484ed9 = util::spawn_model("tag_origin", var_7f76a0b6.origin);
	var_f2484ed9.end_notify = end_notify;
	if(!isdefined(level.var_8dc29179))
	{
		level.var_8dc29179 = [];
	}
	level.var_8dc29179[var_fd6475b5] = var_f2484ed9;
	while(true)
	{
		if(!isdefined(var_f2484ed9.mdl_gameobject))
		{
			var_f2484ed9.require_look_at = 1;
			var_f2484ed9 gameobjects::init_game_objects(#"hash_76653e6fda4bdfd1");
			var_f2484ed9.mdl_gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
			var_f2484ed9.mdl_gameobject gameobjects::set_onuse_event(&function_bd02699e);
			var_f2484ed9.mdl_gameobject gameobjects::set_onbeginuse_event(&namespace_2b924e50::function_e6830825);
			var_f2484ed9.mdl_gameobject gameobjects::set_onenduse_event(&namespace_2b924e50::function_834fd6bc);
			var_f2484ed9.mdl_gameobject.trigger thread function_79d5804a();
			var_f2484ed9.mdl_gameobject.dontlinkplayertotrigger = 1;
			var_f2484ed9.mdl_gameobject.keepweapon = 1;
			var_f2484ed9.mdl_gameobject thread function_f1ffb4dc();
			var_f2484ed9.mdl_gameobject thread function_9d7bc1dd(end_notify);
			var_f2484ed9.mdl_gameobject.canuseobject = &namespace_2b924e50::function_dd9482b7;
		}
		else
		{
			var_f2484ed9.mdl_gameobject thread gameobjects::enable_object(1, 1);
		}
		var_f2484ed9.mdl_gameobject waittill(#"hash_2330fdbe6e3eb567");
		var_f2484ed9.mdl_gameobject flag::set(#"hash_7a42d508140ae262");
		var_f2484ed9.mdl_gameobject flag::clear(#"hash_4d6700553ede7078");
		level notify(#"into_the_dark_side");
		level flag::set(var_93bdf906);
		level flag::wait_till(#"dark_aether_active");
		var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
		level flag::wait_till_clear(#"dark_aether_active");
		level flag::clear(var_93bdf906);
		var_172e078c = 25;
		while(var_172e078c > 0)
		{
			level waittill(#"hash_4f3dbc08fe003a1e");
			var_172e078c = var_172e078c - 1;
		}
		if(isdefined(var_f2484ed9.mdl_gameobject))
		{
			var_f2484ed9.mdl_gameobject flag::set(#"hash_4d6700553ede7078");
		}
	}
}

/*
	Name: function_bd02699e
	Namespace: namespace_c8c67699
	Checksum: 0xEA7881AC
	Offset: 0x5150
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_bd02699e(player)
{
	self notify(#"hash_2330fdbe6e3eb567");
	self thread gameobjects::disable_object(1, 1);
}

/*
	Name: function_9d7bc1dd
	Namespace: namespace_c8c67699
	Checksum: 0x4AC43F17
	Offset: 0x5198
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function function_9d7bc1dd(end_notify)
{
	self notify("6b4458279512291e");
	self endon("6b4458279512291e");
	self endon(#"death");
	while(true)
	{
		if(level flag::get(end_notify))
		{
			self thread gameobjects::destroy_object(1, 1);
			return;
		}
		if(is_true(level.var_e9f6c6da) && (self flag::get(#"hash_4d6700553ede7078") || !self flag::get(#"hash_7a42d508140ae262")) && !level flag::get("in_dark_side") && !level flag::get("on_mq_step_0_2"))
		{
			self thread gameobjects::enable_object(1, 1);
		}
		else
		{
			self thread gameobjects::disable_object(1, 1);
		}
		wait(1);
	}
}

/*
	Name: function_f1ffb4dc
	Namespace: namespace_c8c67699
	Checksum: 0x7B976DC0
	Offset: 0x5310
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_f1ffb4dc()
{
	self notify("340fc54f9191447a");
	self endon("340fc54f9191447a");
	self endon(#"death");
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		self thread gameobjects::disable_object(1, 1);
		level flag::wait_till_clear(#"dark_aether_active");
		self thread gameobjects::enable_object(1, 1);
	}
}

/*
	Name: function_79d5804a
	Namespace: namespace_c8c67699
	Checksum: 0x2457D460
	Offset: 0x53D8
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
			b_enabled = self function_ad3081a9(player);
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
	Name: function_a5ae82b0
	Namespace: namespace_c8c67699
	Checksum: 0x4DC7E36C
	Offset: 0x5530
	Size: 0x546
	Parameters: 0
	Flags: Linked
*/
function function_a5ae82b0()
{
	level endon(#"game_ended");
	level flag::wait_till_all([1:"terminal_2_is_on", 0:"terminal_1_is_on"]);
	if(!isdefined(level.var_8dc29179))
	{
		waitframe(1);
	}
	while(true)
	{
		var_23412a82 = 1;
		if(is_true(level.var_e9f6c6da) && !level flag::get("in_dark_side") && !level flag::get("on_mq_step_0_2"))
		{
			var_95138a52 = 0;
			foreach(var_f2484ed9 in level.var_8dc29179)
			{
				if(!isdefined(var_f2484ed9))
				{
					arrayremoveindex(level.var_8dc29179, var_fd6475b5);
					continue;
				}
				else if(level flag::get(var_f2484ed9.end_notify))
				{
					if(isdefined(var_f2484ed9.var_9463599a))
					{
						var_f2484ed9.var_9463599a delete();
					}
					var_f2484ed9 delete();
					arrayremoveindex(level.var_8dc29179, var_fd6475b5);
					continue;
				}
				var_23412a82 = 0;
				if(var_f2484ed9.mdl_gameobject flag::get(#"hash_4d6700553ede7078") || !var_f2484ed9.mdl_gameobject flag::get(#"hash_7a42d508140ae262"))
				{
					var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 1);
					if(!isdefined(var_f2484ed9.var_9463599a))
					{
						var_f2484ed9.var_9463599a = var_f2484ed9 namespace_2b924e50::function_3be9e71a();
					}
					var_95138a52 = 1;
				}
			}
			if(var_95138a52)
			{
				foreach(player in getplayers())
				{
					player clientfield::set_to_player("" + #"hash_1fa45e1c3652d753", 1);
				}
			}
		}
		else
		{
			foreach(var_f2484ed9 in level.var_8dc29179)
			{
				if(!isdefined(var_f2484ed9))
				{
					arrayremoveindex(level.var_8dc29179, var_fd6475b5);
					continue;
				}
				else if(level flag::get(var_f2484ed9.end_notify))
				{
					if(isdefined(var_f2484ed9.var_9463599a))
					{
						var_f2484ed9.var_9463599a delete();
					}
					var_f2484ed9 delete();
					arrayremoveindex(level.var_8dc29179, var_fd6475b5);
					continue;
				}
				var_23412a82 = 0;
				if(level flag::get("in_dark_side"))
				{
					level flag::wait_till(#"dark_aether_active");
				}
				var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
				if(isdefined(var_f2484ed9.var_9463599a))
				{
					var_f2484ed9.var_9463599a delete();
				}
			}
		}
		if(var_23412a82)
		{
			break;
		}
		wait(1);
	}
}

/*
	Name: function_ad3081a9
	Namespace: namespace_c8c67699
	Checksum: 0x84E77929
	Offset: 0x5A80
	Size: 0x1B6
	Parameters: 1
	Flags: Linked
*/
function function_ad3081a9(e_player)
{
	if(level flag::get(#"hash_3e765c26047c9f54") || level flag::get("in_exfil_event"))
	{
		self sethintstringforplayer(e_player, #"hash_4480b689c4039dac");
		return true;
	}
	if(is_true(level.var_e9f6c6da) && (self.mdl_gameobject flag::get(#"hash_4d6700553ede7078") || !self.mdl_gameobject flag::get(#"hash_7a42d508140ae262")) && !level flag::get("in_dark_side") && !level flag::get("on_mq_step_0_2") && !e_player usebuttonpressed())
	{
		self sethintstringforplayer(e_player, #"hash_622731cfc9a72bfa");
		return true;
	}
	self sethintstringforplayer(e_player, #"");
	return false;
}

/*
	Name: function_78d3b53b
	Namespace: namespace_c8c67699
	Checksum: 0x96B89642
	Offset: 0x5C40
	Size: 0x47C
	Parameters: 0
	Flags: Linked
*/
function function_78d3b53b()
{
	level endon(#"game_ended");
	level thread function_3ca2b2c1("zm_por_pla", "ww_plasma_dark_crate_unfolded", "ww_plasma_dark_aether_active");
	scene::add_scene_func(#"hash_6e29beca7d26695", &function_59642e27, "init");
	level thread function_f308268d();
	level scene::init(#"hash_6e29beca7d26695");
	level scene::init(#"hash_687f8b39643bcd0d");
	level.var_267fe17e = getent("zm_sw_pla_tr", "script_noteworthy");
	level.var_267fe17e.var_14bfe1d6 = getent(level.var_267fe17e.script_string, "targetname");
	level.var_267fe17e.var_14bfe1d6 notsolid();
	level.var_267fe17e.var_14bfe1d6 connectpaths();
	level.var_267fe17e thread function_d4647e9c();
	level.var_267fe17e thread function_2f6cb9bc("plasma");
	var_9c4b1962 = getent("zm_sw_pla_right", "script_noteworthy");
	var_a2f087af = getent("zm_sw_pla_right_clip", "targetname");
	var_d8e6cd43 = getent(var_9c4b1962.target, "targetname");
	var_d8e6cd43 hidepart("tag_fuse");
	var_ae13d215 = [1:var_d8e6cd43, 0:var_9c4b1962];
	array::run_all(var_ae13d215, &hide);
	var_a2f087af notsolid();
	var_a2f087af connectpaths();
	hidemiscmodels("plasma_cutter_frame");
	var_9c4b1962 thread function_ead1edac(var_d8e6cd43);
	while(!level flag::get("ww_plasma_dark_crate_unfolded"))
	{
		level flag::wait_till(#"dark_aether_active");
		if(level flag::get("ww_plasma_dark_aether_active"))
		{
			array::run_all(var_ae13d215, &show);
			var_a2f087af solid();
			var_a2f087af disconnectpaths();
			showmiscmodels("plasma_cutter_frame");
		}
		level flag::wait_till_clear(#"dark_aether_active");
		array::run_all(var_ae13d215, &hide);
		var_a2f087af notsolid();
		var_a2f087af connectpaths();
		hidemiscmodels("plasma_cutter_frame");
	}
	level flag::wait_till("ww_plasma_dark_crate_anim_done");
	array::run_all(var_ae13d215, &delete);
}

/*
	Name: function_ead1edac
	Namespace: namespace_c8c67699
	Checksum: 0xAC8A1FF0
	Offset: 0x60C8
	Size: 0x1C0
	Parameters: 1
	Flags: Linked
*/
function function_ead1edac(cutter)
{
	e_activator = self zm_unitrigger::function_fac87205(&function_95913408, vectorscale((1, 1, 1), 96));
	level flag::set("ww_plasma_dark_crate_unfolded");
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	level.var_ba3a0e1f = level.var_ba3a0e1f + 5;
	cutter showpart("tag_fuse");
	playsoundatposition(#"hash_25c3ad27e28609cf", cutter gettagorigin("tag_fuse"));
	wait(1);
	cutter scene::play(#"hash_20f1ec6b37e8973b", cutter);
	wait(1);
	cutter scene::play(#"hash_5bf979f09adfb93", cutter);
	/#
		iprintlnbold("");
	#/
	level flag::set("ww_plasma_dark_crate_anim_done");
	level.var_ba3a0e1f = 0;
}

/*
	Name: function_95913408
	Namespace: namespace_c8c67699
	Checksum: 0xD596C5B
	Offset: 0x6290
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_95913408(e_player)
{
	if(level flag::get(#"dark_aether_active") && level flag::get("player_got_the_fuse") && level flag::get("ww_plasma_dark_aether_active"))
	{
		self sethintstring(#"hash_f829dbd87edb790");
		return true;
	}
	return false;
}

/*
	Name: function_59642e27
	Namespace: namespace_c8c67699
	Checksum: 0x90C1A9D7
	Offset: 0x6338
	Size: 0x1E0
	Parameters: 1
	Flags: Linked
*/
function function_59642e27(a_ents)
{
	var_fcb6d06e = a_ents[#"fuse_box"];
	var_11a6696e = spawn("trigger_damage", var_fcb6d06e.origin, 0, 96, 96);
	while(true)
	{
		waitresult = undefined;
		waitresult = var_11a6696e waittill(#"damage");
		if(isplayer(waitresult.attacker) && isdefined(waitresult.weapon) && is_true(waitresult.weapon.isbulletweapon))
		{
			point = function_4ba8fde(#"hash_70dc74e571a35a75");
			var_ab549ef1 = item_drop::drop_item(0, undefined, 1, 0, point.id, struct::get("zm_ele_fs").origin, struct::get("zm_ele_fs").angles, 0);
			var_ab549ef1.var_dd21aec2 = 1 | 16;
			playfxontag(#"hash_602926e040b2cc81", var_fcb6d06e, "tag_door_fx");
			level notify(#"hash_5fc83b7ed5236a3d");
			break;
		}
	}
}

/*
	Name: function_f308268d
	Namespace: namespace_c8c67699
	Checksum: 0x92AA2EBC
	Offset: 0x6520
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_f308268d()
{
	level waittill(#"hash_5fc83b7ed5236a3d");
	scene::remove_scene_func(#"hash_6e29beca7d26695", &function_59642e27, "init");
	wait(0.2);
	level scene::play(#"hash_6e29beca7d26695", "play");
}

/*
	Name: function_d4647e9c
	Namespace: namespace_c8c67699
	Checksum: 0x9C9EC35C
	Offset: 0x65B0
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function function_d4647e9c()
{
	level endon(#"game_ended");
	var_64b5a257 = getent(self.target, "targetname");
	var_64b5a257 solid();
	var_64b5a257 disconnectpaths();
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		if(!level flag::get("ww_plasma_dark_crate_unfolded"))
		{
			self hide();
			level scene::delete_scene_spawned_ents(#"hash_687f8b39643bcd0d");
			var_64b5a257 notsolid();
			var_64b5a257 connectpaths();
		}
		level flag::wait_till_clear(#"dark_aether_active");
		self show();
		level scene::init(#"hash_687f8b39643bcd0d");
		var_64b5a257 solid();
		var_64b5a257 disconnectpaths();
		if(level flag::get("ww_plasma_dark_crate_unfolded"))
		{
			break;
		}
	}
	level.var_267fe17e zm_unitrigger::unregister_unitrigger(level.var_267fe17e.s_unitrigger);
	level notify(#"hash_357484a47ac6dc7f");
	self thread function_8d9ddc22("PLASMA");
}

/*
	Name: function_77fdf8f3
	Namespace: namespace_c8c67699
	Checksum: 0xFE5EDFAA
	Offset: 0x67F0
	Size: 0x41C
	Parameters: 0
	Flags: Linked
*/
function function_77fdf8f3()
{
	level thread function_3ca2b2c1("zm_por_par", "ww_beam_crate_unfolded", "ww_beam_dark_aether_active");
	callback::on_disconnect(&function_196740ae);
	scene::add_scene_func(#"hash_291cb9c9bbca6a36", &function_b39ee43f, "init");
	level scene::init(#"hash_291cb9c9bbca6a36");
	level.var_a6639798 = getent("zm_sw_par_pa", "script_noteworthy");
	level.var_a6639798.var_14bfe1d6 = getent(level.var_a6639798.script_string, "targetname");
	level.var_a6639798.var_14bfe1d6 notsolid();
	level.var_a6639798.var_14bfe1d6 connectpaths();
	var_dfca5f6b = getent("zm_ele_cp", "targetname");
	var_dfca5f6b solid();
	var_dfca5f6b disconnectpaths();
	level.var_a6639798 thread function_2f6cb9bc("beam");
	var_53ecb724 = getent(level.var_a6639798.target, "targetname");
	var_53ecb724 setinvisibletoall();
	for(n = 1; n <= 3; n++)
	{
		var_677810e4 = getentarray("zm_par_cry_" + n, "script_noteworthy");
		foreach(crystal in var_677810e4)
		{
			crystal hide();
		}
		var_9c7fd811 = var_677810e4[randomint(var_677810e4.size)];
		var_9c7fd811 flag::set("crystal_active");
		var_9c7fd811 thread function_d9046ad7(level.var_a6639798, n);
		var_9c7fd811 thread function_43073640(level.var_a6639798, n);
	}
	level flag::wait_till_all(array("receptacle_1_powered", "receptacle_2_powered", "receptacle_3_powered"));
	level flag::set("ww_beam_crate_unfolded");
	level.var_a6639798 zm_unitrigger::unregister_unitrigger(level.var_a6639798.s_unitrigger);
	level notify(#"hash_60469722da30dda8");
	level.var_a6639798 thread function_8d9ddc22("BEAM");
}

/*
	Name: function_196740ae
	Namespace: namespace_c8c67699
	Checksum: 0x18A15B3A
	Offset: 0x6C18
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_196740ae(b_delay)
{
	if(self flag::get("hold_crystal_energy"))
	{
		self notify(#"hash_4035b9734da08f79");
		self clientfield::set("hold_crystal_energy", 0);
		if(is_true(b_delay))
		{
			wait(1);
		}
		if(isdefined(self))
		{
			self flag::clear("hold_crystal_energy");
			if(isdefined(self.crystal))
			{
				self.crystal.player = undefined;
				self.crystal = undefined;
			}
		}
	}
}

/*
	Name: function_d9046ad7
	Namespace: namespace_c8c67699
	Checksum: 0x5E61CC5B
	Offset: 0x6CE8
	Size: 0x2B0
	Parameters: 2
	Flags: Linked
*/
function function_d9046ad7(crate, num)
{
	level endon(#"game_ended");
	var_db089991 = getent(self.target, "targetname");
	var_db089991.var_37d2c8f6 = &function_ba51c33f;
	var_db089991.var_4ffc53f = &function_e0e08fa2;
	while(true)
	{
		level flag::wait_till_all([1:"ww_beam_dark_aether_active", 0:#"dark_aether_active"]);
		self show();
		self function_619a5c20();
		do
		{
			if(!level flag::get(("receptacle_" + num) + "_powered"))
			{
				var_45f8349d = self function_fbce146e(var_db089991);
				var_db089991.var_22cea3da = undefined;
				if(is_true(var_45f8349d))
				{
					/#
						iprintlnbold(("" + num) + "");
					#/
					self flag::clear("crystal_active");
					self thread function_6c729e(num);
					self notify(#"hash_33fac1f6f3a6dcc");
					self playsound(#"hash_4d2f9a4138c1e002");
				}
				self clientfield::set("crystal_energy_fx", 0);
			}
			waitframe(1);
		}
		while(level.var_ba3a0e1f > 0);
		level flag::wait_till_clear(#"dark_aether_active");
		self hide();
		self function_23a29590();
		self clientfield::set("crystal_energy_fx", 0);
	}
}

/*
	Name: function_fbce146e
	Namespace: namespace_c8c67699
	Checksum: 0x5EC4A4FE
	Offset: 0x6FA0
	Size: 0x268
	Parameters: 1
	Flags: Linked
*/
function function_fbce146e(var_db089991)
{
	level endon(#"dark_aether_active");
	self flag::wait_till("crystal_active");
	self clientfield::set("crystal_energy_fx", 1);
	var_db089991.var_22cea3da = &function_971d0ec8;
	waitresult = undefined;
	waitresult = var_db089991 waittill(#"hash_33fac1f6f3a6dcc");
	self.player = waitresult.player;
	self.player.crystal = self;
	self.player flag::set("hold_crystal_energy");
	self.player clientfield::set("hold_crystal_energy", 1);
	self.player val::set(#"hash_1b614432d036c713", "allow_ads", 0);
	self.player val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
	self.player notify(#"hash_30694ebb96507aa4");
	self.player notify(#"hash_3271846e2b85db1c");
	self.player namespace_b376a999::function_a0a2d8ee(0);
	self.player namespace_b376a999::function_42402593(0);
	if(namespace_b376a999::function_5fef4201(self.player.currentweapon))
	{
		var_e69a8f49 = self.player getweaponammoclip(self.player.currentweapon);
		if(var_e69a8f49 < 15)
		{
			var_e69a8f49 = 15;
		}
		self.player setweaponammoclip(self.player.currentweapon, var_e69a8f49);
	}
	self.player thread function_f5eebd57();
	return true;
}

/*
	Name: function_f5eebd57
	Namespace: namespace_c8c67699
	Checksum: 0xACEFF714
	Offset: 0x7210
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_f5eebd57()
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	var_105682f = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_fired", #"weapon_change");
		if(waitresult._notify === "weapon_fired" && namespace_b376a999::function_5fef4201(waitresult.weapon))
		{
			var_105682f = 1;
			break;
		}
		else if(waitresult._notify === "weapon_change" && !namespace_b376a999::function_a93a6096(self))
		{
			break;
		}
	}
	self function_196740ae(var_105682f);
}

/*
	Name: function_6c729e
	Namespace: namespace_c8c67699
	Checksum: 0xEFA05E0C
	Offset: 0x7330
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_6c729e(num)
{
	level endon(#"game_ended", ("receptacle_" + num) + "_powered");
	self.player waittill(#"hash_4035b9734da08f79");
	wait(30);
	self flag::set("crystal_active");
}

/*
	Name: function_971d0ec8
	Namespace: namespace_c8c67699
	Checksum: 0x9B89785
	Offset: 0x73B0
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_971d0ec8(player, time)
{
	if(time >= 2000 && !player flag::get("hold_crystal_energy"))
	{
		self notify(#"hash_33fac1f6f3a6dcc", {#player:player});
		player clientfield::increment("" + #"hash_196eef041ba86f9a");
	}
	else
	{
		level thread namespace_b376a999::function_6dbf1bb3(player, 4, self.origin);
	}
}

/*
	Name: function_ba51c33f
	Namespace: namespace_c8c67699
	Checksum: 0x4757826D
	Offset: 0x7480
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_ba51c33f(e_player, n_start_time)
{
}

/*
	Name: function_e0e08fa2
	Namespace: namespace_c8c67699
	Checksum: 0xF89AE2EA
	Offset: 0x74A0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_e0e08fa2(e_player)
{
}

/*
	Name: function_43073640
	Namespace: namespace_c8c67699
	Checksum: 0x876477CE
	Offset: 0x74B8
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_43073640(crate, num)
{
	level endon(#"game_ended");
	var_15f88bee = getent(crate.target, "targetname");
	t_damage = spawn("trigger_damage", crate.origin + vectorscale((0, 0, 1), 12), 0, 64, 48);
	t_damage enablegrenadetouchdamage();
	flag = function_27f2ef17(t_damage);
	function_4e3bb793(t_damage, flag & (~512));
	self function_746a64df(var_15f88bee, t_damage, num);
	var_15f88bee setinvisibletoall();
	t_damage delete();
}

/*
	Name: function_746a64df
	Namespace: namespace_c8c67699
	Checksum: 0xD639E8B2
	Offset: 0x7600
	Size: 0x118
	Parameters: 3
	Flags: Linked
*/
function function_746a64df(var_15f88bee, t_damage, num)
{
	level endon(#"game_ended", ("receptacle_" + num) + "_powered");
	while(true)
	{
		self waittill(#"hash_33fac1f6f3a6dcc");
		/#
			assert(isdefined(self.player));
		#/
		var_15f88bee setvisibletoplayer(self.player);
		var_15f88bee sethintstringforplayer(self.player, #"hash_9a36cd75f8acaee");
		t_damage thread function_ef55bb22(self, num);
		self.player waittill(#"hash_4035b9734da08f79");
		var_15f88bee setinvisibletoall();
	}
}

/*
	Name: function_ef55bb22
	Namespace: namespace_c8c67699
	Checksum: 0xCBCFFB80
	Offset: 0x7720
	Size: 0x29C
	Parameters: 2
	Flags: Linked
*/
function function_ef55bb22(e_crystal, num)
{
	self notify("a4d99fda9cbb775");
	self endon("a4d99fda9cbb775");
	level endon(#"game_ended");
	/#
		println(("" + num) + "");
		iprintlnbold(("" + num) + "");
	#/
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(waitresult.attacker === e_crystal.player && waitresult.attacker flag::get("hold_crystal_energy"))
		{
			if(isdefined(waitresult.weapon) && namespace_b376a999::function_5fef4201(waitresult.weapon) && !is_true(waitresult.var_98e101b0))
			{
				break;
			}
			else
			{
				/#
					println(("" + num) + "");
					iprintlnbold(("" + num) + "");
				#/
			}
		}
		else
		{
			/#
				println(("" + num) + "");
				iprintlnbold(("" + num) + "");
			#/
		}
	}
	if(num == 1)
	{
		waitresult.attacker thread namespace_4abf1500::collect_intel(#"hash_45d2926504ac78a1");
	}
	level flag::set(("receptacle_" + num) + "_powered");
	/#
		iprintlnbold(("" + num) + "");
	#/
}

/*
	Name: function_b39ee43f
	Namespace: namespace_c8c67699
	Checksum: 0xDCD6982B
	Offset: 0x79C8
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_b39ee43f(a_ents)
{
	var_bf71a40b = a_ents[#"weapon_crate"];
	while(true)
	{
		flag_return = undefined;
		flag_return = level waittill(#"receptacle_1_powered", #"receptacle_2_powered", #"receptacle_3_powered");
		switch(flag_return._notify)
		{
			case "receptacle_1_powered":
			{
				var_bf71a40b clientfield::set("" + #"hash_5a932b901b9a5d0d", 1);
				break;
			}
			case "receptacle_2_powered":
			{
				var_bf71a40b clientfield::set("" + #"hash_5a932b901b9a5d0d", 2);
				break;
			}
			case "receptacle_3_powered":
			{
				var_bf71a40b clientfield::set("" + #"hash_5a932b901b9a5d0d", 3);
				break;
			}
		}
		if(level flag::get_all([2:"receptacle_3_powered", 1:"receptacle_2_powered", 0:"receptacle_1_powered"]))
		{
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_8d9ddc22
	Namespace: namespace_c8c67699
	Checksum: 0x23E3C96C
	Offset: 0x7B98
	Size: 0xBE8
	Parameters: 1
	Flags: Linked
*/
function function_8d9ddc22(var_e7772c37)
{
	level endon(#"end_game");
	switch(var_e7772c37)
	{
		case "nitrogen":
		{
			var_6bdde8a3 = getweapon(#"hash_655d944e437c3d5b");
			var_339168c3 = self zm_unitrigger::create(&function_91807eb1, vectorscale((1, 1, 1), 128));
			self.var_37023f0e = "cryo";
			break;
		}
		case "gas":
		{
			var_6bdde8a3 = getweapon(#"hash_6e0b27b854e591a3");
			var_339168c3 = self zm_unitrigger::create(&function_4d97eda3, vectorscale((1, 1, 1), 128));
			self.var_37023f0e = "gas";
			break;
		}
		case "plasma":
		{
			var_6bdde8a3 = getweapon(#"hash_72796957033e2e4a");
			var_339168c3 = self zm_unitrigger::create(&function_b75d50b5, vectorscale((1, 1, 1), 128));
			self.var_37023f0e = "rust";
			break;
		}
		case "beam":
		{
			var_6bdde8a3 = getweapon(#"hash_5dd5741f21fd680d");
			var_339168c3 = self zm_unitrigger::create(&function_8a172c28, vectorscale((1, 1, 1), 128));
			self.var_37023f0e = "electric";
			break;
		}
	}
	zm_unitrigger::unitrigger_force_per_player_triggers(var_339168c3, 1);
	scene::add_scene_func((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", &function_217a625a, "open");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger_activated");
		player = waitresult.e_who;
		if(isplayer(player))
		{
			player clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5");
		}
		player val::set(#"hash_504a7a98d585ba99", "disable_weapon_cycling", 1);
		player val::set(#"hash_504a7a98d585ba99", "disable_weapon_fire", 1);
		player val::set(#"hash_504a7a98d585ba99", "disable_offhand_weapons", 1);
		player val::set(#"hash_504a7a98d585ba99", "disable_offhand_special", 1);
		player thread function_172b3f96(10);
		if(player hasweapon(var_6bdde8a3, 1))
		{
			level flag::set("exchange_base_back");
		}
		level scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "open");
		self.var_14bfe1d6 solid();
		self.var_14bfe1d6 disconnectpaths();
		if(isalive(player) && !player inlaststand())
		{
			var_4e4f65c9 = player item_inventory::function_2e711614(17 + 1);
			primary_weapon = player namespace_a0d533d1::function_2b83d3ff(var_4e4f65c9);
			var_ec323ef9 = player item_inventory::function_2e711614(((17 + 1) + 8) + 1);
			secondary_weapon = player namespace_a0d533d1::function_2b83d3ff(var_ec323ef9);
			if(namespace_b376a999::function_5fef4201(primary_weapon))
			{
				var_981d2438 = var_4e4f65c9;
				var_d5c2e187 = primary_weapon;
			}
			else
			{
				if(namespace_b376a999::function_5fef4201(secondary_weapon))
				{
					var_981d2438 = var_ec323ef9;
					var_d5c2e187 = secondary_weapon;
				}
				else
				{
					player notify(#"hash_6a9e5d5a03df7e27");
					level scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "close");
					level notify(#"hash_142e9131e668557d");
					self.var_14bfe1d6 notsolid();
					self.var_14bfe1d6 disconnectpaths();
					continue;
				}
			}
			var_b0e35c50 = 0;
			if(zm_weapons::function_386dacbc(var_d5c2e187) != var_6bdde8a3)
			{
				var_963f7bc9 = var_6bdde8a3;
			}
			else
			{
				var_b0e35c50 = 1;
				var_963f7bc9 = getweapon(#"hash_3fa91d1674123e09");
			}
			var_963f7bc9 = function_eeddea9a(var_963f7bc9, function_9f1cc9a9(var_d5c2e187));
			if(player getcurrentweapon() != var_d5c2e187)
			{
				player switchtoweapon(var_d5c2e187);
				if(player getstance() === "prone")
				{
					player notify(#"hash_6a9e5d5a03df7e27");
					level scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "close");
					level notify(#"hash_142e9131e668557d");
					self.var_14bfe1d6 notsolid();
					self.var_14bfe1d6 disconnectpaths();
					continue;
				}
				result = undefined;
				result = player waittilltimeout(5, #"death", #"weapon_change_complete", #"entering_last_stand");
				if(result._notify == #"timeout" || player getcurrentweapon() != var_d5c2e187)
				{
					player notify(#"hash_6a9e5d5a03df7e27");
					level scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "close");
					level notify(#"hash_142e9131e668557d");
					self.var_14bfe1d6 notsolid();
					self.var_14bfe1d6 disconnectpaths();
					continue;
				}
			}
			if(isalive(player) && !player inlaststand())
			{
				if(!isdefined(player.var_1ad4cede))
				{
					player.var_1ad4cede = [];
				}
				var_e533256d = player.var_1ad4cede[var_963f7bc9.name];
				player giveweapon(var_963f7bc9);
				var_eba43593 = player function_b7f1fd2c(var_963f7bc9);
				player setweaponammoclip(var_963f7bc9, (isdefined(var_e533256d) ? var_e533256d : var_eba43593));
				player function_bee29f7b(1);
				player switchtoweapon(var_963f7bc9);
				player function_6edc650b(var_963f7bc9);
				player.var_1ad4cede[var_d5c2e187.name] = player getammocount(var_d5c2e187);
				player thread function_6d4e1f71(var_d5c2e187, var_e7772c37, var_b0e35c50);
				player thread function_469b0e5();
				var_981d2438.var_627c698b = var_963f7bc9;
				var_3383cd4e = function_4ba8fde(var_963f7bc9.name + "_item_sr");
				if(isdefined(var_3383cd4e))
				{
					var_981d2438.var_a6762160 = var_3383cd4e.var_a6762160;
					var_981d2438.id = var_3383cd4e.id;
				}
				else
				{
					/#
						assertmsg("" + var_963f7bc9.name);
					#/
					/#
					#/
				}
			}
			level notify(#"hash_685e9797cabb8ed");
		}
		level scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "close");
		level notify(#"silver_weapon_crate_closed");
		self.var_14bfe1d6 notsolid();
		self.var_14bfe1d6 disconnectpaths();
	}
}

/*
	Name: function_172b3f96
	Namespace: namespace_c8c67699
	Checksum: 0xEEF896E2
	Offset: 0x8788
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_172b3f96(timeout)
{
	level endon(#"end_game");
	self waittilltimeout(timeout, #"hash_6a9e5d5a03df7e27", #"death", #"entering_last_stand");
	if(isdefined(self))
	{
		self val::reset(#"hash_504a7a98d585ba99", "disable_weapon_cycling");
		self val::reset(#"hash_504a7a98d585ba99", "disable_weapon_fire");
		self val::reset(#"hash_504a7a98d585ba99", "disable_offhand_weapons");
		self val::reset(#"hash_504a7a98d585ba99", "disable_offhand_special");
	}
}

/*
	Name: function_469b0e5
	Namespace: namespace_c8c67699
	Checksum: 0x937BBD67
	Offset: 0x8898
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_469b0e5()
{
	level endon(#"end_game");
	self endon(#"death");
	wait(1);
	while(!self function_a39f313c())
	{
		waitframe(1);
	}
	self notify(#"hash_6a9e5d5a03df7e27");
}

/*
	Name: function_6d4e1f71
	Namespace: namespace_c8c67699
	Checksum: 0x7DDF987A
	Offset: 0x8910
	Size: 0x12A
	Parameters: 3
	Flags: Linked
*/
function function_6d4e1f71(var_d5c2e187, var_e7772c37, var_b0e35c50)
{
	level endon(#"end_game");
	if(isdefined(self))
	{
		wait(1);
		while(isdefined(self) && self isdroppingweapon())
		{
			waitframe(1);
		}
		if(!isdefined(self))
		{
			return;
		}
		self takeweapon(var_d5c2e187);
		if(var_b0e35c50)
		{
			switch(var_e7772c37)
			{
				case "nitrogen":
				{
					level.var_c3accf46 = undefined;
					break;
				}
				case "gas":
				{
					level.var_ae002b60 = undefined;
					break;
				}
				case "plasma":
				{
					level.var_42000fd0 = undefined;
					break;
				}
				case "beam":
				{
					level.var_c8a2dc28 = undefined;
					break;
				}
			}
		}
	}
}

/*
	Name: function_217a625a
	Namespace: namespace_c8c67699
	Checksum: 0x49D5417C
	Offset: 0x8A48
	Size: 0x634
	Parameters: 1
	Flags: Linked
*/
function function_217a625a(a_ents)
{
	var_bf71a40b = a_ents[#"weapon_crate"];
	switch(var_bf71a40b.model)
	{
		case "p9_fxanim_zm_contain_crate_cryo_mod":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_03_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
			}
			var_bf71a40b clientfield::set("" + #"hash_7aeee79e85f9273c", 1);
			break;
		}
		case "p9_fxanim_zm_contain_crate_gas_mod":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_05_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
			}
			var_bf71a40b clientfield::set("" + #"hash_7aeee79e85f9273c", 2);
			break;
		}
		case "p9_fxanim_zm_contain_crate_rust_mod":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
			}
			var_bf71a40b clientfield::set("" + #"hash_7aeee79e85f9273c", 3);
			break;
		}
		case "p9_fxanim_zm_contain_crate_electric_mod":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_02_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
			}
			var_bf71a40b clientfield::set("" + #"hash_7aeee79e85f9273c", 4);
			break;
		}
	}
	var_2faa8624 linkto(var_bf71a40b, "tag_tank", (0, 0, 0), vectorscale((-1, 0, 0), 28));
	waitresult = undefined;
	waitresult = level waittill(#"silver_weapon_crate_closed", #"hash_685e9797cabb8ed", #"hash_142e9131e668557d");
	var_2faa8624 unlink();
	if(isdefined(var_2faa8624))
	{
		var_2faa8624 delete();
	}
	if(waitresult._notify !== "silver_weapon_crate_closed")
	{
		level waittill(#"silver_weapon_crate_closed");
	}
	var_bf71a40b clientfield::set("" + #"hash_7aeee79e85f9273c", 0);
}

/*
	Name: function_b8a1fcc2
	Namespace: namespace_c8c67699
	Checksum: 0x1DB69CBD
	Offset: 0x9088
	Size: 0x3F4
	Parameters: 1
	Flags: Linked
*/
function function_b8a1fcc2(s_params)
{
	if(isdefined(level.var_bdd5969a) && isinarray(level.var_bdd5969a, self))
	{
		if(!self hasweapon(level.var_652bc5ed, 1))
		{
			arrayremovevalue(level.var_bdd5969a, self);
		}
	}
	else if(self hasweapon(level.var_652bc5ed, 1))
	{
		if(!isdefined(level.var_bdd5969a))
		{
			level.var_bdd5969a = [];
		}
		else if(!isarray(level.var_bdd5969a))
		{
			level.var_bdd5969a = array(level.var_bdd5969a);
		}
		level.var_bdd5969a[level.var_bdd5969a.size] = self;
	}
	if(level.var_c3accf46 === self)
	{
		if(!self hasweapon(level.var_810eda2b, 1))
		{
			level.var_c3accf46 = undefined;
		}
	}
	else if(self hasweapon(level.var_810eda2b, 1))
	{
		level.var_c3accf46 = self;
		level notify(#"hash_e1a9539b07e72be");
	}
	if(level.var_ae002b60 === self)
	{
		if(!self hasweapon(level.var_fb37bf51, 1))
		{
			level.var_ae002b60 = undefined;
		}
	}
	else if(self hasweapon(level.var_fb37bf51, 1))
	{
		level.var_ae002b60 = self;
		level notify(#"hash_6eada88f109e645");
	}
	if(level.var_42000fd0 === self)
	{
		if(!self hasweapon(level.var_12b450dc, 1))
		{
			level.var_42000fd0 = undefined;
		}
	}
	else if(self hasweapon(level.var_12b450dc, 1))
	{
		level.var_42000fd0 = self;
		level notify(#"hash_120dd64bcb70e566");
	}
	if(level.var_c8a2dc28 === self)
	{
		if(!self hasweapon(level.var_e0be56c0, 1))
		{
			level.var_c8a2dc28 = undefined;
		}
	}
	else if(self hasweapon(level.var_e0be56c0, 1))
	{
		level.var_c8a2dc28 = self;
		level notify(#"hash_5e2064095a103269");
	}
	if(isarray(level.var_bdd5969a) && level.var_bdd5969a.size || isdefined(level.var_c3accf46) || isdefined(level.var_ae002b60) || isdefined(level.var_42000fd0) || isdefined(level.var_c8a2dc28))
	{
		level.var_e9f6c6da = 1;
	}
	else
	{
		level.var_e9f6c6da = 0;
	}
}

/*
	Name: function_91807eb1
	Namespace: namespace_c8c67699
	Checksum: 0xB34F0CBD
	Offset: 0x9488
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_91807eb1(e_player)
{
	if(!isdefined(level.var_c3accf46) && (e_player hasweapon(level.var_652bc5ed, 1) || e_player hasweapon(level.var_fb37bf51, 1) || e_player hasweapon(level.var_12b450dc, 1) || e_player hasweapon(level.var_e0be56c0, 1)))
	{
		self sethintstringforplayer(e_player, #"hash_23ffe27517c6140c");
		return true;
	}
	if(isdefined(level.var_c3accf46) && e_player == level.var_c3accf46)
	{
		self sethintstringforplayer(e_player, #"hash_4425ec8a1a0dcd32");
		return true;
	}
	return false;
}

/*
	Name: function_4d97eda3
	Namespace: namespace_c8c67699
	Checksum: 0x6655528B
	Offset: 0x95E8
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_4d97eda3(e_player)
{
	if(!isdefined(level.var_ae002b60) && (e_player hasweapon(level.var_652bc5ed, 1) || e_player hasweapon(level.var_810eda2b, 1) || e_player hasweapon(level.var_12b450dc, 1) || e_player hasweapon(level.var_e0be56c0, 1)))
	{
		self sethintstringforplayer(e_player, #"hash_1f88bf6da4e314");
		return true;
	}
	if(isdefined(level.var_ae002b60) && e_player == level.var_ae002b60)
	{
		self sethintstringforplayer(e_player, #"hash_4425ec8a1a0dcd32");
		return true;
	}
	return false;
}

/*
	Name: function_b75d50b5
	Namespace: namespace_c8c67699
	Checksum: 0xBBD76FB9
	Offset: 0x9748
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_b75d50b5(e_player)
{
	if(!isdefined(level.var_42000fd0) && (e_player hasweapon(level.var_652bc5ed, 1) || e_player hasweapon(level.var_fb37bf51, 1) || e_player hasweapon(level.var_810eda2b, 1) || e_player hasweapon(level.var_e0be56c0, 1)))
	{
		self sethintstringforplayer(e_player, #"hash_3122d671887ef5a5");
		return true;
	}
	if(isdefined(level.var_42000fd0) && e_player == level.var_42000fd0)
	{
		self sethintstringforplayer(e_player, #"hash_4425ec8a1a0dcd32");
		return true;
	}
	return false;
}

/*
	Name: function_8a172c28
	Namespace: namespace_c8c67699
	Checksum: 0xB8D7758E
	Offset: 0x98A8
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_8a172c28(e_player)
{
	if(!isdefined(level.var_c8a2dc28) && (e_player hasweapon(level.var_652bc5ed, 1) || e_player hasweapon(level.var_fb37bf51, 1) || e_player hasweapon(level.var_12b450dc, 1) || e_player hasweapon(level.var_810eda2b, 1)))
	{
		self sethintstringforplayer(e_player, #"hash_448d0fa028c30675");
		return true;
	}
	if(isdefined(level.var_c8a2dc28) && e_player == level.var_c8a2dc28)
	{
		self sethintstringforplayer(e_player, #"hash_4425ec8a1a0dcd32");
		return true;
	}
	return false;
}

/*
	Name: on_item_pickup
	Namespace: namespace_c8c67699
	Checksum: 0xDF0EB2E4
	Offset: 0x9A08
	Size: 0x654
	Parameters: 1
	Flags: Linked
*/
function on_item_pickup(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160))
		{
			switch(item.var_a6762160.name)
			{
				case "hash_2f243a5908d9fbb5":
				{
					if(self hasweapon(level.var_652bc5ed, 1) || self hasweapon(level.var_fb37bf51, 1) || self hasweapon(level.var_12b450dc, 1) || self hasweapon(level.var_810eda2b, 1) || self hasweapon(level.var_e0be56c0, 1))
					{
						var_4e4f65c9 = self item_inventory::function_2e711614(17 + 1);
						primary_weapon = self namespace_a0d533d1::function_2b83d3ff(var_4e4f65c9);
						var_ec323ef9 = self item_inventory::function_2e711614(((17 + 1) + 8) + 1);
						secondary_weapon = self namespace_a0d533d1::function_2b83d3ff(var_ec323ef9);
						if(namespace_b376a999::function_5fef4201(primary_weapon))
						{
							var_3e749c73 = primary_weapon;
						}
						else
						{
							var_3e749c73 = secondary_weapon;
						}
						var_8a83ec7a = item_inventory::function_a33744de(var_3e749c73);
						if(isdefined(var_8a83ec7a))
						{
							if(var_8a83ec7a != 32767)
							{
								var_f9f12a82 = item_inventory::drop_inventory_item(var_8a83ec7a);
							}
						}
					}
					self zm_weapons::weapon_give(level.var_652bc5ed, 1);
					self thread namespace_4abf1500::collect_intel(#"hash_4a8a42661e63e2a3");
					level.var_516c02a2 = self;
					level flag::set(#"hash_15f3e07d50195cb9");
					break;
				}
				case "hash_37f8e99ab49c109":
				{
					level flag::set("player_got_card");
					level zm_ui_inventory::function_7df6bb60(#"hash_6de5cab1fba28d40", 1);
					break;
				}
				case "hash_2f24375908d9f69c":
				{
					level flag::set("player_got_remote");
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_4a8a43661e63e456");
					level zm_ui_inventory::function_7df6bb60(#"hash_1ec8e7f21f81afb0", 1);
					break;
				}
				case "hash_16ea992ec682d37":
				{
					level flag::set("player_got_the_flask");
					level zm_ui_inventory::function_7df6bb60(#"hash_2e341f321b2ab3da", 1);
					break;
				}
				case "hash_22d1a49f2c1d1c80":
				{
					level flag::set("player_got_the_filled_flask");
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_45d2906504ac753b");
					level zm_ui_inventory::function_7df6bb60(#"hash_2e341f321b2ab3da", 2);
					break;
				}
				case "hash_70dc74e571a35a75":
				{
					level flag::set("player_got_the_fuse");
					level zm_ui_inventory::function_7df6bb60(#"hash_7b8f7131712d7564", 1);
					break;
				}
				case "hash_5d1c62463e73e906":
				{
					level flag::set("player_got_the_canister");
					level zm_ui_inventory::function_7df6bb60(#"hash_240dcac486ef946a", 1);
					break;
				}
				case "hash_5f8eec7ec430864":
				{
					level flag::set("full_canister_picked_up");
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_45d2916504ac76ee");
					level zm_ui_inventory::function_7df6bb60(#"hash_240dcac486ef946a", 2);
					break;
				}
				default:
				{
					return;
				}
			}
			level thread popups::function_87604884(#"hash_4cacf78219f8fca", self, self.team, item.var_a6762160.displayname);
		}
	}
}

/*
	Name: function_233ed9b4
	Namespace: namespace_c8c67699
	Checksum: 0x1E2D561D
	Offset: 0xA068
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_233ed9b4()
{
	/#
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_98af2074);
	#/
}

/*
	Name: function_98af2074
	Namespace: namespace_c8c67699
	Checksum: 0xECF6A156
	Offset: 0xA0B8
	Size: 0x1CA
	Parameters: 1
	Flags: Private
*/
function private function_98af2074(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_58dc6f7eb86ecf83":
			{
				level.var_a1b709cb thread function_8d9ddc22("");
				break;
			}
			case "hash_45e13a127a63e1f5":
			{
				level.var_74ec088f thread function_8d9ddc22("");
				break;
			}
			case "hash_42477421da15ff00":
			{
				level.var_267fe17e thread function_8d9ddc22("");
				break;
			}
			case "hash_1c88a4f3e72d4479":
			{
				level.var_a6639798 thread function_8d9ddc22("");
				namespace_4abf1500::function_23255935("");
				ww_room_door = getent("", "");
				var_a0f325fa = getent(ww_room_door.target, "");
				if(isdefined(ww_room_door))
				{
					ww_room_door scene::play(#"hash_65505ba29fee0a2f", ww_room_door);
				}
				if(isdefined(var_a0f325fa))
				{
					var_a0f325fa delete();
				}
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

