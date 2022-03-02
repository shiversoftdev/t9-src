#using script_11cc3a9267cf7ac7;
#using script_136606144df0f9f1;
#using script_1611421ee9b880d3;
#using script_17179876e0e27f8c;
#using script_17a9d06bf819b2d3;
#using script_2bdd098a8215ac9f;
#using script_2c8fd33ddb45e78b;
#using script_311c446e3df6c3fa;
#using script_31816d064a53f516;
#using script_3762ce8163e304e6;
#using script_3d35e2ff167b3a82;
#using script_3d5887fc414a86fb;
#using script_460d54ff48daf1f7;
#using script_4c3385b0ecce078c;
#using script_4e53735256f112ac;
#using script_4ed01237ecbd380f;
#using script_538e87197f25d67;
#using script_5569f8636cebd8f3;
#using script_5665e7d917abc3fc;
#using script_57f0934f7e3e3b54;
#using script_5ee86fb478309acf;
#using script_618d6f5ff5d18933;
#using script_62c40d9a3acec9b1;
#using script_6d85b093d74cdfdd;
#using script_6ffa998405e2f041;
#using script_7520bf82a814057c;
#using script_76b36ed1b7a51ed2;
#using script_7f9d1ec3c0aa68b8;
#using script_eff00f787d80cdf;
#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\zm_common\gametypes\globallogic.csc;
#using scripts\zm_common\load.csc;
#using scripts\zm_common\zm_audio.csc;
#using scripts\zm_common\zm_bgb.csc;
#using scripts\zm_common\zm_blockers.csc;
#using scripts\zm_common\zm_equipment.csc;
#using scripts\zm_common\zm_ffotd.csc;
#using scripts\zm_common\zm_laststand.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_powerups.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_zdraw.csc;

#namespace zm;

/*
	Name: function_d5085fea
	Namespace: zm
	Checksum: 0x938B4541
	Offset: 0x5C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d5085fea()
{
	level notify(431913676);
}

/*
	Name: ignore_systems
	Namespace: zm
	Checksum: 0x3703882A
	Offset: 0x5E0
	Size: 0x28C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec ignore_systems()
{
	system::ignore(#"gadget_clone");
	system::ignore(#"gadget_armor");
	system::ignore(#"gadget_cleanse");
	system::ignore(#"gadget_heat_wave");
	system::ignore(#"gadget_resurrect");
	system::ignore(#"hash_52aca7c35be649b8");
	system::ignore(#"gadget_shock_field");
	system::ignore(#"gadget_other");
	system::ignore(#"gadget_camo");
	system::ignore(#"gadget_vision_pulse");
	system::ignore(#"gadget_speed_burst");
	system::ignore(#"gadget_overdrive");
	system::ignore(#"gadget_security_breach");
	system::ignore(#"gadget_combat_efficiency");
	system::ignore(#"gadget_sprint_boost");
	system::ignore(#"spike_charge_siegebot");
	system::ignore(#"gadget_camo_render");
	if(getdvarint(#"splitscreen_playercount", 0) > 2)
	{
		system::ignore(#"footsteps");
		system::ignore(#"ambient");
	}
}

/*
	Name: function_89f2df9
	Namespace: zm
	Checksum: 0xBEFC5816
	Offset: 0x878
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm", &function_70a657d8, undefined, undefined, "renderoverridebundle");
}

/*
	Name: function_70a657d8
	Namespace: zm
	Checksum: 0x49A71A45
	Offset: 0x8C8
	Size: 0x2B0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.zombie_vars))
	{
		level.zombie_vars = [];
	}
	level.bgb_in_use = 0;
	level.scr_zm_ui_gametype = util::function_5df4294();
	level.scr_zm_ui_gametype_group = "";
	level.scr_zm_map_start_location = "";
	level.gamedifficulty = getgametypesetting(#"zmdifficulty");
	level.var_75f7e612 = &function_218c0417;
	level.var_977ee0c2 = &function_f21f0f11;
	level.var_8c46cf7a = 1;
	callback::on_localplayer_spawned(&function_c127395a);
	callback::on_end_game(&function_7b19219a);
	if(issplitscreen())
	{
		setdvar(#"hash_10167c816f46929", 1);
	}
	callback::on_laststand(&on_player_laststand);
	renderoverridebundle::function_f72f089c(#"hash_60913f86a5a5a3f1", "rob_sonar_set_friendly_zm", &function_b9c917cc);
	renderoverridebundle::function_f72f089c(#"hash_6844a09875672719", "rob_sonar_set_friendly_zm_ls", &function_a1ab192);
	clientfield::function_a8bbc967("hudItems.srOverlayOpen", #"hud_items", #"hash_28c98765f5bcc9e8", 1, 1, "int", &function_dfbfa0f4, 0, 0);
	level.var_37076fe8 = &function_a2a8f79e;
	level.var_38c7030b = &function_424dc557;
	function_3385d776(#"hash_46067e7dfe6ba0dd");
	ai::add_ai_spawn_function(&function_6ee4a2c);
	level.var_be4c025a = [];
}

/*
	Name: function_c127395a
	Namespace: zm
	Checksum: 0xDBE3019
	Offset: 0xB80
	Size: 0x110
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c127395a(localclientnum)
{
	var_f11fc620 = getentarray(localclientnum, "district_toggle_volumes", "script_noteworthy");
	level.var_f11fc620 = arraycombine(var_f11fc620, getentarray(localclientnum, "info_volume_zm_districts_toggle", "variantName"), 0, 0);
	foreach(var_967cb52c in level.var_f11fc620)
	{
		var_967cb52c thread function_21a32a4d(localclientnum, self);
	}
}

/*
	Name: function_21a32a4d
	Namespace: zm
	Checksum: 0x1AA7B494
	Offset: 0xC98
	Size: 0x394
	Parameters: 2
	Flags: Linked, Private
*/
function private function_21a32a4d(localclientnum, player)
{
	if(!player isplayer() || is_true(level.b_game_ended) || issplitscreen() || player !== function_5c10bd79(localclientnum))
	{
		return;
	}
	level endon(#"end_game");
	player endoncallback(&function_713608ba, #"death");
	self notify("4f4501dc0a203da");
	self endon("4f4501dc0a203da");
	if(isdefined(self.var_23e48c77) && !isdefined(self.var_378658bb))
	{
		self.var_378658bb = strtok(self.var_23e48c77, ",");
	}
	if(isdefined(self.var_4685950c) && !isdefined(self.var_8c564d0c))
	{
		self.var_8c564d0c = strtok(self.var_4685950c, ",");
	}
	function_865bd624(self.var_378658bb);
	function_865bd624(self.var_8c564d0c);
	/#
		assert(isarray(self.var_378658bb) || isarray(self.var_8c564d0c), "");
	#/
	var_5571852a = 0;
	while(true)
	{
		if(player === level.var_bb4264e3 && is_true(self.var_7187b1f))
		{
			function_96330020(self.var_8c564d0c);
			while(player === level.var_bb4264e3)
			{
				waitframe(1);
			}
			if(player istouching(self))
			{
				function_96330020(undefined, self.var_8c564d0c);
			}
		}
		else
		{
			if(!var_5571852a && player istouching(self))
			{
				function_96330020(self.var_378658bb);
				function_96330020(undefined, self.var_8c564d0c);
				var_5571852a = 1;
			}
			else if(var_5571852a && !player istouching(self))
			{
				function_96330020(self.var_8c564d0c);
				function_96330020(undefined, self.var_378658bb);
				var_5571852a = 0;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_96330020
	Namespace: zm
	Checksum: 0xA5D252B5
	Offset: 0x1038
	Size: 0x1D0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_96330020(var_23e48c77, var_4685950c)
{
	if(!isdefined(var_23e48c77))
	{
		var_23e48c77 = [];
	}
	else if(!isarray(var_23e48c77))
	{
		var_23e48c77 = array(var_23e48c77);
	}
	if(!isdefined(var_4685950c))
	{
		var_4685950c = [];
	}
	else if(!isarray(var_4685950c))
	{
		var_4685950c = array(var_4685950c);
	}
	foreach(district in var_23e48c77)
	{
		function_e8f072a1(district, 1);
		function_3cfb0b1d(district, 1);
	}
	foreach(district in var_4685950c)
	{
		function_e8f072a1(district, 0);
		function_3cfb0b1d(district, 0);
	}
}

/*
	Name: function_865bd624
	Namespace: zm
	Checksum: 0x4EF67C13
	Offset: 0x1210
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_865bd624(districts)
{
	if(!isdefined(districts))
	{
		districts = [];
	}
	else if(!isarray(districts))
	{
		districts = array(districts);
	}
	foreach(district in districts)
	{
		function_5873c54a(district);
		function_1c8e9f18(district);
	}
}

/*
	Name: function_713608ba
	Namespace: zm
	Checksum: 0x884CA662
	Offset: 0x1300
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_713608ba(str_notify)
{
	localclientnum = self getlocalclientnumber();
	function_7b19219a(localclientnum);
}

/*
	Name: function_7b19219a
	Namespace: zm
	Checksum: 0x8C9B47CD
	Offset: 0x1350
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_7b19219a(localclientnum)
{
	if(isarray(level.var_f11fc620))
	{
		foreach(var_967cb52c in level.var_f11fc620)
		{
			if(isdefined(var_967cb52c.var_378658bb))
			{
				function_865bd624(var_967cb52c.var_378658bb);
			}
			if(isdefined(var_967cb52c.var_8c564d0c))
			{
				function_865bd624(var_967cb52c.var_8c564d0c);
			}
		}
	}
}

/*
	Name: function_f21f0f11
	Namespace: zm
	Checksum: 0xF986559
	Offset: 0x1440
	Size: 0x1BE
	Parameters: 2
	Flags: Linked
*/
function function_f21f0f11(localclientnum, var_a6762160)
{
	if(var_a6762160.itemtype === #"equipment" || var_a6762160.itemtype === #"tactical")
	{
		var_8040e225 = item_world::function_a7e98a1a(localclientnum);
		var_935a2023 = self.var_9b882d22;
		if(var_a6762160.itemtype === #"equipment")
		{
			var_7d722a81 = var_8040e225.inventory.items[7];
		}
		else if(var_a6762160.itemtype === #"tactical")
		{
			var_7d722a81 = var_8040e225.inventory.items[13];
		}
		if(isdefined(var_7d722a81) && var_7d722a81.id != 32767)
		{
			if(namespace_a0d533d1::function_819781bf() && (isdefined(var_7d722a81.var_a6762160) && isdefined(var_935a2023)))
			{
				if(var_a6762160.name == var_7d722a81.var_a6762160.name && (isdefined(var_935a2023.count) ? var_935a2023.count : 1) < (isdefined(var_7d722a81.count) ? var_7d722a81.count : 1))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_218c0417
	Namespace: zm
	Checksum: 0xD4E0138F
	Offset: 0x1608
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function function_218c0417(localclientnum, var_a6762160)
{
	if(var_a6762160.itemtype == #"quest")
	{
		return 1;
	}
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return 1;
	}
	return namespace_b376ff3f::function_ad4c6116(localclientnum, var_a6762160);
}

/*
	Name: init
	Namespace: zm
	Checksum: 0xACFE7080
	Offset: 0x1680
	Size: 0x42C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		println("");
	#/
	level thread zm_ffotd::main_start();
	level.onlinegame = sessionmodeisonlinegame();
	level.swimmingfeature = 0;
	level.enable_magic = getgametypesetting(#"magic");
	level.headshots_only = getgametypesetting(#"headshotsonly");
	level.disable_equipment_team_object = 1;
	level.clientvoicesetup = &zm_audio::clientvoicesetup;
	level.playerfalldamagesound = &zm_audio::playerfalldamagesound;
	zm_game_over::register();
	/#
		println("");
	#/
	init_clientfields();
	zm_perks::init();
	zm_powerups::init();
	namespace_af5c1c0c::init();
	init_blocker_fx();
	init_riser_fx();
	init_zombie_explode_fx();
	level.var_2f78f66c = 1;
	level.gibresettime = 0.5;
	level.gibmaxcount = 3;
	level.gibtimer = 0;
	level.gibcount = 0;
	level._gibeventcbfunc = &on_gib_event;
	level thread resetgibcounter();
	level thread zpo_listener();
	level thread zpoff_listener();
	level._box_indicator_no_lights = -1;
	level._box_indicator_flash_lights_moving = 99;
	level._box_indicator = level._box_indicator_no_lights;
	util::register_system(#"box_indicator", &box_monitor);
	level._zombie_gib_piece_index_all = 0;
	level._zombie_gib_piece_index_right_arm = 1;
	level._zombie_gib_piece_index_left_arm = 2;
	level._zombie_gib_piece_index_right_leg = 3;
	level._zombie_gib_piece_index_left_leg = 4;
	level._zombie_gib_piece_index_head = 5;
	level._zombie_gib_piece_index_guts = 6;
	level._zombie_gib_piece_index_hat = 7;
	setdvar(#"hash_442d42efc73d739a", 50);
	callback::add_callback(#"on_localclient_connect", &basic_player_connect);
	callback::on_spawned(&function_92f0c63);
	scene::function_2e58158b(&function_bbea98ae);
	level.update_aat_hud = &update_aat_hud;
	if(isdefined(level.setupcustomcharacterexerts))
	{
		[[level.setupcustomcharacterexerts]]();
	}
	level thread zm_ffotd::main_end();
	level thread function_7e3a43c3();
	function_f73c3352();
}

/*
	Name: function_7e3a43c3
	Namespace: zm
	Checksum: 0xE9470C4E
	Offset: 0x1AB8
	Size: 0x140
	Parameters: 0
	Flags: Linked
*/
function function_7e3a43c3()
{
	level.var_bcb2da96 = 0;
	util::waitforallclients();
	while(true)
	{
		for(localclientnum = 0; localclientnum < level.localplayers.size; localclientnum++)
		{
			player = function_5c10bd79(localclientnum);
			if(isdefined(player))
			{
				if(!isdefined(player.last_state))
				{
					player.last_state = 0;
				}
				player.new_state = util::function_cd6c95db(localclientnum);
				if(player.new_state != player.last_state)
				{
					if(player.new_state == 1)
					{
						player postfx::playpostfxbundle(#"hash_6f0522f3d84f18df");
					}
					else
					{
						player postfx::stoppostfxbundle(#"hash_6f0522f3d84f18df");
					}
				}
				player.last_state = player.new_state;
			}
		}
		waitframe(1);
	}
}

/*
	Name: delay_for_clients_then_execute
	Namespace: zm
	Checksum: 0xB02FD55B
	Offset: 0x1C00
	Size: 0x88
	Parameters: 1
	Flags: None
*/
function delay_for_clients_then_execute(func)
{
	wait(0.1);
	players = getlocalplayers();
	for(x = 0; x < players.size; x++)
	{
		while(!clienthassnapshot(x))
		{
			waitframe(1);
		}
	}
	wait(0.1);
	level thread [[func]]();
}

/*
	Name: basic_player_connect
	Namespace: zm
	Checksum: 0x391AD8D
	Offset: 0x1C90
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function basic_player_connect(localclientnum)
{
	if(!isdefined(level._laststand))
	{
		level._laststand = [];
	}
	level._laststand[localclientnum] = 0;
}

/*
	Name: force_update_player_clientfields
	Namespace: zm
	Checksum: 0x84E234E9
	Offset: 0x1CD0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function force_update_player_clientfields(localclientnum)
{
	self endon(#"death");
	while(!clienthassnapshot(localclientnum))
	{
		wait(0.25);
	}
	wait(0.25);
	self processclientfieldsasifnew();
}

/*
	Name: init_blocker_fx
	Namespace: zm
	Checksum: 0x80F724D1
	Offset: 0x1D40
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_blocker_fx()
{
}

/*
	Name: init_riser_fx
	Namespace: zm
	Checksum: 0xB773F787
	Offset: 0x1D50
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init_riser_fx()
{
	level._effect[#"rise_burst"] = #"hash_355ef8d541b9f5c4";
	level._effect[#"rise_dust"] = #"zombie/fx_spawn_dirt_body_dustfalling_zmb";
	if(isdefined(level.riser_type) && level.riser_type == "snow")
	{
		level._effect[#"rise_billow_snow"] = #"hash_793798659a4b9560";
	}
}

/*
	Name: init_clientfields
	Namespace: zm
	Checksum: 0xB7DD6A1C
	Offset: 0x1E20
	Size: 0x59C
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	/#
		println("");
	#/
	clientfield::register("actor", "zombie_riser_fx", 1, 1, "int", &handle_zombie_risers, 1, 1);
	if(is_true(level.use_water_risers))
	{
		clientfield::register("actor", "zombie_riser_fx_water", 1, 1, "int", &handle_zombie_risers_water, 1, 1);
	}
	if(is_true(level.use_foliage_risers))
	{
		clientfield::register("actor", "zombie_riser_fx_foliage", 1, 1, "int", &handle_zombie_risers_foliage, 1, 1);
	}
	if(is_true(level.use_low_gravity_risers))
	{
		clientfield::register("actor", "zombie_riser_fx_lowg", 1, 1, "int", &handle_zombie_risers_lowg, 1, 1);
	}
	clientfield::register("actor", "zombie_ragdoll_explode", 1, 1, "int", &zombie_ragdoll_explode_cb, 0, 1);
	clientfield::register("actor", "zombie_gut_explosion", 1, 1, "int", &zombie_gut_explosion_cb, 0, 1);
	clientfield::register("actor", "zombie_keyline_render", 1, 1, "int", &zombie_zombie_keyline_render_clientfield_cb, 0, 1);
	bits = 4;
	power = struct::get_array("elec_switch_fx", "script_noteworthy");
	if(isdefined(power))
	{
		bits = getminbitcountfornum(power.size + 1);
	}
	clientfield::register("world", "zombie_power_on", 1, bits, "int", &zombie_power_clientfield_on, 1, 1);
	clientfield::register("world", "zombie_power_off", 1, bits, "int", &zombie_power_clientfield_off, 1, 1);
	clientfield::register("world", "zesn", 1, 1, "int", &zesn, 1, 1);
	clientfield::register("world", "round_complete_time", 1, 20, "int", &round_complete_time, 0, 1);
	clientfield::register("world", "round_complete_num", 1, 8, "int", &round_complete_num, 0, 1);
	clientfield::register("world", "game_end_time", 1, 20, "int", &game_end_time, 0, 1);
	clientfield::register("world", "quest_complete_time", 1, 20, "int", &quest_complete_time, 0, 1);
	clientfield::register("world", "game_start_time", 1, 20, "int", &game_start_time, 0, 1);
	clientfield::register("scriptmover", "rob_zm_prop_fade", 1, 1, "int", &rob_zm_prop_fade, 0, 0);
	clientfield::function_a8bbc967("hudItems.hasBackpack", #"hud_items", #"hash_3d621af88b5e463d", 1, 1, "int", undefined, 0, 0);
}

/*
	Name: box_monitor
	Namespace: zm
	Checksum: 0xF4B1A6E2
	Offset: 0x23C8
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function box_monitor(clientnum, state, oldstate)
{
	if(isdefined(level._custom_box_monitor))
	{
		[[level._custom_box_monitor]](clientnum, state, oldstate);
	}
}

/*
	Name: zpo_listener
	Namespace: zm
	Checksum: 0x750671BA
	Offset: 0x2418
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function zpo_listener()
{
	while(true)
	{
		int = undefined;
		level waittill(#"zpo", int);
		if(isdefined(int))
		{
			level notify(#"power_on", {#is_on:int});
		}
		else
		{
			level notify(#"power_on");
		}
	}
}

/*
	Name: zpoff_listener
	Namespace: zm
	Checksum: 0xD5E67906
	Offset: 0x24A8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function zpoff_listener()
{
	while(true)
	{
		int = undefined;
		level waittill(#"zpoff", int);
		if(isdefined(int))
		{
			level notify(#"power_off", int);
		}
		else
		{
			level notify(#"power_off");
		}
	}
}

/*
	Name: zesn
	Namespace: zm
	Checksum: 0xF6AB5ECB
	Offset: 0x2520
	Size: 0x58
	Parameters: 7
	Flags: Linked
*/
function zesn(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"zesn");
	}
}

/*
	Name: zombie_power_clientfield_on
	Namespace: zm
	Checksum: 0xFE4B1B4D
	Offset: 0x2580
	Size: 0x58
	Parameters: 7
	Flags: Linked
*/
function zombie_power_clientfield_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"zpo", bwastimejump);
	}
}

/*
	Name: zombie_power_clientfield_off
	Namespace: zm
	Checksum: 0x2DEC0B9E
	Offset: 0x25E0
	Size: 0x58
	Parameters: 7
	Flags: Linked
*/
function zombie_power_clientfield_off(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"zpoff", bwastimejump);
	}
}

/*
	Name: round_complete_time
	Namespace: zm
	Checksum: 0xA0BC99DF
	Offset: 0x2640
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function round_complete_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	model = createuimodel(function_1df4c3b0(fieldname, #"hash_392aa27a3227c89f"), "round_complete_time");
	setuimodelvalue(model, bwastimejump);
}

/*
	Name: round_complete_num
	Namespace: zm
	Checksum: 0x6C6C7DE7
	Offset: 0x26E0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function round_complete_num(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	model = createuimodel(function_1df4c3b0(fieldname, #"hash_392aa27a3227c89f"), "round_complete_num");
	setuimodelvalue(model, bwastimejump);
}

/*
	Name: game_end_time
	Namespace: zm
	Checksum: 0x7ED9614F
	Offset: 0x2780
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function game_end_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		level notify(#"end_game");
		level.b_game_ended = 1;
		callback::callback(#"on_end_game", binitialsnap);
	}
	model = createuimodel(function_1df4c3b0(binitialsnap, #"hash_392aa27a3227c89f"), "game_end_time");
	setuimodelvalue(model, fieldname);
}

/*
	Name: quest_complete_time
	Namespace: zm
	Checksum: 0x721C8ECB
	Offset: 0x2870
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function quest_complete_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	model = createuimodel(function_1df4c3b0(fieldname, #"hash_392aa27a3227c89f"), "quest_complete_time");
	setuimodelvalue(model, bwastimejump);
}

/*
	Name: game_start_time
	Namespace: zm
	Checksum: 0xFD6E1E2D
	Offset: 0x2910
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function game_start_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	model = createuimodel(function_1df4c3b0(fieldname, #"hash_392aa27a3227c89f"), "game_start_time");
	setuimodelvalue(model, bwastimejump);
}

/*
	Name: rob_zm_prop_fade
	Namespace: zm
	Checksum: 0xC214A6F1
	Offset: 0x29B0
	Size: 0xEE
	Parameters: 7
	Flags: Linked
*/
function rob_zm_prop_fade(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_bf9d3071(#"rob_zm_prop_fade");
		if(!isdefined(self.sndlooper))
		{
			self.sndlooper = self playloopsound(#"hash_66df9cab2c64f968");
		}
	}
	else
	{
		self function_5d482e78(#"rob_zm_prop_fade");
		if(isdefined(self.sndlooper))
		{
			self stoploopsound(self.sndlooper);
			self.sndlooper = undefined;
		}
	}
}

/*
	Name: createzombieeyesinternal
	Namespace: zm
	Checksum: 0x5E572BB6
	Offset: 0x2AA8
	Size: 0x110
	Parameters: 1
	Flags: Linked
*/
function createzombieeyesinternal(localclientnum)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self._eyearray))
	{
		self._eyearray = [];
	}
	if(!isdefined(self._eyearray[localclientnum]))
	{
		linktag = "j_eyeball_le";
		effect = level._effect[#"eye_glow"];
		if(isdefined(level._override_eye_fx))
		{
			effect = level._override_eye_fx;
		}
		if(isdefined(self._eyeglow_fx_override))
		{
			effect = self._eyeglow_fx_override;
		}
		if(isdefined(self._eyeglow_tag_override))
		{
			linktag = self._eyeglow_tag_override;
		}
		self._eyearray[localclientnum] = util::playfxontag(localclientnum, effect, self, linktag);
	}
}

/*
	Name: createzombieeyes
	Namespace: zm
	Checksum: 0x84115362
	Offset: 0x2BC0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function createzombieeyes(localclientnum)
{
	self thread createzombieeyesinternal(localclientnum);
}

/*
	Name: deletezombieeyes
	Namespace: zm
	Checksum: 0xBAA994C1
	Offset: 0x2BF0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function deletezombieeyes(localclientnum)
{
	if(isdefined(self._eyearray))
	{
		if(isdefined(self._eyearray[localclientnum]))
		{
			deletefx(localclientnum, self._eyearray[localclientnum], 1);
			self._eyearray[localclientnum] = undefined;
		}
	}
}

/*
	Name: zombie_zombie_keyline_render_clientfield_cb
	Namespace: zm
	Checksum: 0xC2877E27
	Offset: 0x2C60
	Size: 0x72
	Parameters: 7
	Flags: Linked
*/
function zombie_zombie_keyline_render_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(bwastimejump))
	{
		return;
	}
	if(is_true(level.debug_keyline_zombies))
	{
		if(bwastimejump)
		{
		}
	}
}

/*
	Name: get_eyeball_on_luminance
	Namespace: zm
	Checksum: 0x8D323C67
	Offset: 0x2CE0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function get_eyeball_on_luminance()
{
	if(isdefined(level.eyeball_on_luminance_override))
	{
		return level.eyeball_on_luminance_override;
	}
	return 1;
}

/*
	Name: get_eyeball_off_luminance
	Namespace: zm
	Checksum: 0x6FC6A484
	Offset: 0x2D10
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_eyeball_off_luminance()
{
	if(isdefined(level.eyeball_off_luminance_override))
	{
		return level.eyeball_off_luminance_override;
	}
	return 0;
}

/*
	Name: get_eyeball_color
	Namespace: zm
	Checksum: 0x343D6EFA
	Offset: 0x2D40
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function get_eyeball_color()
{
	val = 0;
	if(isdefined(level.zombie_eyeball_color_override))
	{
		val = level.zombie_eyeball_color_override;
	}
	if(isdefined(self.zombie_eyeball_color_override))
	{
		val = self.zombie_eyeball_color_override;
	}
	return val;
}

/*
	Name: zombie_ragdoll_explode_cb
	Namespace: zm
	Checksum: 0xB9B32A03
	Offset: 0x2D98
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function zombie_ragdoll_explode_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self zombie_wait_explode(fieldname);
	}
}

/*
	Name: zombie_gut_explosion_cb
	Namespace: zm
	Checksum: 0x9C99B2CE
	Offset: 0x2E00
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function zombie_gut_explosion_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdefined(level._effect[#"zombie_guts_explosion"]))
		{
			org = self gettagorigin("J_SpineLower");
			if(isdefined(org))
			{
				playfx(fieldname, level._effect[#"zombie_guts_explosion"], org);
			}
		}
	}
}

/*
	Name: init_zombie_explode_fx
	Namespace: zm
	Checksum: 0x214DF5A4
	Offset: 0x2ED0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function init_zombie_explode_fx()
{
	level._effect[#"zombie_guts_explosion"] = #"zombie/fx_blood_torso_explo_lg_zmb";
}

/*
	Name: zombie_wait_explode
	Namespace: zm
	Checksum: 0xFA618AD2
	Offset: 0x2F08
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function zombie_wait_explode(localclientnum)
{
	where = self gettagorigin("J_SpineLower");
	if(!isdefined(where))
	{
		where = self.origin;
	}
	start = gettime();
	while(gettime() - start < 2000)
	{
		if(isdefined(self))
		{
			where = self gettagorigin("J_SpineLower");
			if(!isdefined(where))
			{
				where = self.origin;
			}
		}
		waitframe(1);
	}
	if(isdefined(level._effect[#"zombie_guts_explosion"]) && util::is_mature())
	{
		playfx(localclientnum, level._effect[#"zombie_guts_explosion"], where);
	}
}

/*
	Name: mark_piece_gibbed
	Namespace: zm
	Checksum: 0x1F89052E
	Offset: 0x3028
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function mark_piece_gibbed(piece_index)
{
	if(!isdefined(self.gibbed_pieces))
	{
		self.gibbed_pieces = [];
	}
	self.gibbed_pieces[self.gibbed_pieces.size] = piece_index;
}

/*
	Name: has_gibbed_piece
	Namespace: zm
	Checksum: 0xE1681A9E
	Offset: 0x3070
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function has_gibbed_piece(piece_index)
{
	if(!isdefined(self.gibbed_pieces))
	{
		return false;
	}
	for(i = 0; i < self.gibbed_pieces.size; i++)
	{
		if(self.gibbed_pieces[i] == piece_index)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: do_headshot_gib_fx
	Namespace: zm
	Checksum: 0x7922198C
	Offset: 0x30E0
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function do_headshot_gib_fx()
{
	fxtag = "j_neck";
	fxorigin = self gettagorigin(fxtag);
	upvec = anglestoup(self gettagangles(fxtag));
	forwardvec = anglestoforward(self gettagangles(fxtag));
	players = level.localplayers;
	for(i = 0; i < players.size; i++)
	{
		playfx(i, level._effect[#"headshot"], fxorigin, forwardvec, upvec);
		playfx(i, level._effect[#"headshot_nochunks"], fxorigin, forwardvec, upvec);
	}
	playsound(0, #"zmb_zombie_head_gib", fxorigin);
	wait(0.3);
	if(isdefined(self))
	{
		players = level.localplayers;
		for(i = 0; i < players.size; i++)
		{
			util::playfxontag(i, level._effect[#"bloodspurt"], self, fxtag);
		}
	}
}

/*
	Name: do_gib_fx
	Namespace: zm
	Checksum: 0x11DD3511
	Offset: 0x32B0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function do_gib_fx(tag)
{
	players = level.localplayers;
	for(i = 0; i < players.size; i++)
	{
		util::playfxontag(i, level._effect[#"animscript_gib_fx"], self, tag);
	}
	playsound(0, #"zmb_death_gibs", self gettagorigin(tag));
}

/*
	Name: do_gib
	Namespace: zm
	Checksum: 0xC0C8D007
	Offset: 0x3368
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function do_gib(model, tag)
{
	start_pos = self gettagorigin(tag);
	start_angles = self gettagangles(tag);
	wait(0.016);
	end_pos = undefined;
	angles = undefined;
	if(!isdefined(self))
	{
		end_pos = start_pos + (anglestoforward(start_angles) * 10);
		angles = start_angles;
	}
	else
	{
		end_pos = self gettagorigin(tag);
		angles = self gettagangles(tag);
	}
	if(isdefined(self._gib_vel))
	{
		forward = self._gib_vel;
		self._gib_vel = undefined;
	}
	else
	{
		forward = vectornormalize(end_pos - start_pos);
		forward = forward * randomfloatrange(0.6, 1);
		forward = forward + (0, 0, randomfloatrange(0.4, 0.7));
	}
	createdynentandlaunch(0, model, end_pos, angles, start_pos, forward, level._effect[#"animscript_gibtrail_fx"], 1);
	if(isdefined(self))
	{
		self do_gib_fx(tag);
	}
	else
	{
		playsound(0, #"zmb_death_gibs", end_pos);
	}
}

/*
	Name: do_hat_gib
	Namespace: zm
	Checksum: 0x30C19FCB
	Offset: 0x3580
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function do_hat_gib(model, tag)
{
	start_pos = self gettagorigin(tag);
	start_angles = self gettagangles(tag);
	up_angles = (0, 0, 1);
	force = (0, 0, randomfloatrange(1.4, 1.7));
	createdynentandlaunch(0, model, start_pos, up_angles, start_pos, force);
}

/*
	Name: check_should_gib
	Namespace: zm
	Checksum: 0xBB4D84B3
	Offset: 0x3640
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function check_should_gib()
{
	if(level.gibcount <= level.gibmaxcount)
	{
		return true;
	}
	return false;
}

/*
	Name: resetgibcounter
	Namespace: zm
	Checksum: 0x41B8EBF6
	Offset: 0x3670
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function resetgibcounter()
{
	self endon(#"disconnect");
	while(true)
	{
		wait(level.gibresettime);
		level.gibtimer = 0;
		level.gibcount = 0;
	}
}

/*
	Name: on_gib_event
	Namespace: zm
	Checksum: 0xEBE661
	Offset: 0x36C0
	Size: 0x73E
	Parameters: 3
	Flags: Linked
*/
function on_gib_event(localclientnum, type, locations)
{
	if(localclientnum != 0)
	{
		return;
	}
	if(!util::is_mature())
	{
		return;
	}
	if(!isdefined(self._gib_def))
	{
		return;
	}
	if(isdefined(level._gib_overload_func))
	{
		if(self [[level._gib_overload_func]](type, locations))
		{
			return;
		}
	}
	if(!check_should_gib())
	{
		return;
	}
	level.gibcount++;
	for(i = 0; i < locations.size; i++)
	{
		if(isdefined(self.gibbed) && level._zombie_gib_piece_index_head != locations[i])
		{
			continue;
		}
		switch(locations[i])
		{
			case 0:
			{
				if(isdefined(self._gib_def.gibspawn1) && isdefined(self._gib_def.gibspawntag1))
				{
					self thread do_gib(self._gib_def.gibspawn1, self._gib_def.gibspawntag1);
				}
				if(isdefined(self._gib_def.gibspawn2) && isdefined(self._gib_def.gibspawntag2))
				{
					self thread do_gib(self._gib_def.gibspawn2, self._gib_def.gibspawntag2);
				}
				if(isdefined(self._gib_def.gibspawn3) && isdefined(self._gib_def.gibspawntag3))
				{
					self thread do_gib(self._gib_def.gibspawn3, self._gib_def.gibspawntag3);
				}
				if(isdefined(self._gib_def.gibspawn4) && isdefined(self._gib_def.gibspawntag4))
				{
					self thread do_gib(self._gib_def.gibspawn4, self._gib_def.gibspawntag4);
				}
				if(isdefined(self._gib_def.gibspawn5) && isdefined(self._gib_def.gibspawntag5))
				{
					self thread do_hat_gib(self._gib_def.gibspawn5, self._gib_def.gibspawntag5);
				}
				self thread do_headshot_gib_fx();
				self thread do_gib_fx("J_SpineLower");
				mark_piece_gibbed(level._zombie_gib_piece_index_right_arm);
				mark_piece_gibbed(level._zombie_gib_piece_index_left_arm);
				mark_piece_gibbed(level._zombie_gib_piece_index_right_leg);
				mark_piece_gibbed(level._zombie_gib_piece_index_left_leg);
				mark_piece_gibbed(level._zombie_gib_piece_index_head);
				mark_piece_gibbed(level._zombie_gib_piece_index_hat);
				break;
			}
			case 1:
			{
				if(isdefined(self._gib_def.gibspawn1) && isdefined(self._gib_def.gibspawntag1))
				{
					self thread do_gib(self._gib_def.gibspawn1, self._gib_def.gibspawntag1);
				}
				else
				{
				}
				mark_piece_gibbed(level._zombie_gib_piece_index_right_arm);
				break;
			}
			case 2:
			{
				if(isdefined(self._gib_def.gibspawn2) && isdefined(self._gib_def.gibspawntag2))
				{
					self thread do_gib(self._gib_def.gibspawn2, self._gib_def.gibspawntag2);
				}
				else
				{
				}
				mark_piece_gibbed(level._zombie_gib_piece_index_left_arm);
				break;
			}
			case 3:
			{
				if(isdefined(self._gib_def.gibspawn3) && isdefined(self._gib_def.gibspawntag3))
				{
					self thread do_gib(self._gib_def.gibspawn3, self._gib_def.gibspawntag3);
				}
				mark_piece_gibbed(level._zombie_gib_piece_index_right_leg);
				break;
			}
			case 4:
			{
				if(isdefined(self._gib_def.gibspawn4) && isdefined(self._gib_def.gibspawntag4))
				{
					self thread do_gib(self._gib_def.gibspawn4, self._gib_def.gibspawntag4);
				}
				mark_piece_gibbed(level._zombie_gib_piece_index_left_leg);
				break;
			}
			case 5:
			{
				self thread do_headshot_gib_fx();
				mark_piece_gibbed(level._zombie_gib_piece_index_head);
				break;
			}
			case 6:
			{
				self thread do_gib_fx("J_SpineLower");
				break;
			}
			case 7:
			{
				if(isdefined(self._gib_def.gibspawn5) && isdefined(self._gib_def.gibspawntag5))
				{
					self thread do_hat_gib(self._gib_def.gibspawn5, self._gib_def.gibspawntag5);
				}
				mark_piece_gibbed(level._zombie_gib_piece_index_hat);
				break;
			}
		}
	}
	self.gibbed = 1;
}

/*
	Name: zombie_vision_set_apply
	Namespace: zm
	Checksum: 0x861486
	Offset: 0x3E08
	Size: 0x244
	Parameters: 4
	Flags: None
*/
function zombie_vision_set_apply(str_visionset, int_priority, flt_transition_time, int_clientnum)
{
	self endon(#"death");
	self endon(#"disconnect");
	if(!isdefined(self._zombie_visionset_list))
	{
		self._zombie_visionset_list = [];
	}
	if(!isdefined(str_visionset) || !isdefined(int_priority))
	{
		return;
	}
	if(!isdefined(flt_transition_time))
	{
		flt_transition_time = 1;
	}
	if(!isdefined(int_clientnum))
	{
		if(self function_21c0fa55())
		{
			int_clientnum = self getlocalclientnumber();
		}
		if(!isdefined(int_clientnum))
		{
			return;
		}
	}
	already_in_array = 0;
	if(self._zombie_visionset_list.size != 0)
	{
		for(i = 0; i < self._zombie_visionset_list.size; i++)
		{
			if(isdefined(self._zombie_visionset_list[i].vision_set) && self._zombie_visionset_list[i].vision_set == str_visionset)
			{
				already_in_array = 1;
				if(self._zombie_visionset_list[i].priority != int_priority)
				{
					self._zombie_visionset_list[i].priority = int_priority;
				}
				break;
			}
		}
	}
	if(!already_in_array)
	{
		temp_struct = spawnstruct();
		temp_struct.vision_set = str_visionset;
		temp_struct.priority = int_priority;
		array::add(self._zombie_visionset_list, temp_struct, 0);
	}
	vision_to_set = self zombie_highest_vision_set_apply();
	if(isdefined(vision_to_set))
	{
		visionsetnaked(int_clientnum, vision_to_set, flt_transition_time);
	}
	else
	{
		visionsetnaked(int_clientnum, "undefined", flt_transition_time);
	}
}

/*
	Name: zombie_vision_set_remove
	Namespace: zm
	Checksum: 0x2EC97E9B
	Offset: 0x4058
	Size: 0x1AC
	Parameters: 3
	Flags: None
*/
function zombie_vision_set_remove(str_visionset, flt_transition_time, int_clientnum)
{
	self endon(#"death");
	self endon(#"disconnect");
	if(!isdefined(str_visionset))
	{
		return;
	}
	if(!isdefined(flt_transition_time))
	{
		flt_transition_time = 1;
	}
	if(!isdefined(self._zombie_visionset_list))
	{
		self._zombie_visionset_list = [];
	}
	if(!isdefined(int_clientnum))
	{
		if(self function_21c0fa55())
		{
			int_clientnum = self getlocalclientnumber();
		}
		if(!isdefined(int_clientnum))
		{
			return;
		}
	}
	temp_struct = undefined;
	for(i = 0; i < self._zombie_visionset_list.size; i++)
	{
		if(isdefined(self._zombie_visionset_list[i].vision_set) && self._zombie_visionset_list[i].vision_set == str_visionset)
		{
			temp_struct = self._zombie_visionset_list[i];
		}
	}
	if(isdefined(temp_struct))
	{
		arrayremovevalue(self._zombie_visionset_list, temp_struct);
	}
	vision_to_set = self zombie_highest_vision_set_apply();
	if(isdefined(vision_to_set))
	{
		visionsetnaked(int_clientnum, vision_to_set, flt_transition_time);
	}
	else
	{
		visionsetnaked(int_clientnum, "default", flt_transition_time);
	}
}

/*
	Name: zombie_highest_vision_set_apply
	Namespace: zm
	Checksum: 0x666B3FDA
	Offset: 0x4210
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function zombie_highest_vision_set_apply()
{
	if(!isdefined(self._zombie_visionset_list))
	{
		return;
	}
	highest_score = 0;
	highest_score_vision = undefined;
	for(i = 0; i < self._zombie_visionset_list.size; i++)
	{
		if(isdefined(self._zombie_visionset_list[i].priority) && self._zombie_visionset_list[i].priority > highest_score)
		{
			highest_score = self._zombie_visionset_list[i].priority;
			highest_score_vision = self._zombie_visionset_list[i].vision_set;
		}
	}
	return highest_score_vision;
}

/*
	Name: handle_zombie_risers_foliage
	Namespace: zm
	Checksum: 0x2B338E9F
	Offset: 0x42D8
	Size: 0x154
	Parameters: 7
	Flags: Linked
*/
function handle_zombie_risers_foliage(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"demo_jump");
	self endon(#"death");
	if(!fieldname && bwastimejump)
	{
		localplayers = level.localplayers;
		playsound(0, #"zmb_zombie_spawn", self.origin);
		burst_fx = level._effect[#"rise_burst_foliage"];
		billow_fx = level._effect[#"rise_billow_foliage"];
		type = "foliage";
		for(i = 0; i < localplayers.size; i++)
		{
			self thread rise_dust_fx(i, type, billow_fx, burst_fx);
		}
	}
}

/*
	Name: handle_zombie_risers_water
	Namespace: zm
	Checksum: 0x86A5D61
	Offset: 0x4438
	Size: 0x154
	Parameters: 7
	Flags: Linked
*/
function handle_zombie_risers_water(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"demo_jump");
	self endon(#"death");
	if(!fieldname && bwastimejump)
	{
		localplayers = level.localplayers;
		playsound(0, #"zmb_zombie_spawn_water", self.origin);
		burst_fx = level._effect[#"rise_burst_water"];
		billow_fx = level._effect[#"rise_billow_water"];
		type = "water";
		for(i = 0; i < localplayers.size; i++)
		{
			self thread rise_dust_fx(i, type, billow_fx, burst_fx);
		}
	}
}

/*
	Name: handle_zombie_risers
	Namespace: zm
	Checksum: 0x86F5FC11
	Offset: 0x4598
	Size: 0x1BC
	Parameters: 7
	Flags: Linked
*/
function handle_zombie_risers(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"demo_jump");
	self endon(#"death");
	if(!fieldname && bwastimejump)
	{
		localplayers = level.localplayers;
		sound = "zmb_zombie_spawn";
		burst_fx = level._effect[#"rise_burst"];
		billow_fx = undefined;
		type = "dirt";
		if(isdefined(level.riser_type) && level.riser_type == "snow")
		{
			sound = "zmb_zombie_spawn_snow";
			burst_fx = level._effect[#"rise_burst_snow"];
			billow_fx = level._effect[#"rise_billow_snow"];
			type = "snow";
		}
		playsound(0, sound, self.origin);
		for(i = 0; i < localplayers.size; i++)
		{
			self thread rise_dust_fx(i, type, billow_fx, burst_fx);
		}
	}
}

/*
	Name: handle_zombie_risers_lowg
	Namespace: zm
	Checksum: 0x9F77FAC6
	Offset: 0x4760
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function handle_zombie_risers_lowg(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"demo_jump");
	self endon(#"death");
	if(!fieldname && bwastimejump)
	{
		localplayers = level.localplayers;
		sound = "zmb_zombie_spawn";
		burst_fx = level._effect[#"rise_burst_lg"];
		billow_fx = level._effect[#"rise_billow_lg"];
		type = "dirt";
		if(isdefined(level.riser_type) && level.riser_type == "snow")
		{
			sound = "zmb_zombie_spawn_snow";
			burst_fx = level._effect[#"rise_burst_snow"];
			billow_fx = level._effect[#"rise_billow_snow"];
			type = "snow";
		}
		playsound(0, sound, self.origin);
		for(i = 0; i < localplayers.size; i++)
		{
			self thread rise_dust_fx(i, type, billow_fx, burst_fx);
		}
	}
}

/*
	Name: rise_dust_fx
	Namespace: zm
	Checksum: 0xF3481860
	Offset: 0x4938
	Size: 0x2E0
	Parameters: 4
	Flags: Linked
*/
function rise_dust_fx(clientnum, type, billow_fx, burst_fx)
{
	dust_tag = "J_SpineUpper";
	self endon(#"death");
	level endon(#"demo_jump");
	if(isdefined(level.zombie_custom_riser_fx_handler))
	{
		s_info = self [[level.zombie_custom_riser_fx_handler]]();
		if(isdefined(s_info))
		{
			if(isdefined(s_info.burst_fx))
			{
				burst_fx = s_info.burst_fx;
			}
			if(isdefined(s_info.billow_fx))
			{
				billow_fx = s_info.billow_fx;
			}
			if(isdefined(s_info.type))
			{
				type = s_info.type;
			}
		}
	}
	if(isdefined(burst_fx))
	{
		playfx(clientnum, burst_fx, self.origin);
	}
	wait(0.25);
	if(isdefined(billow_fx))
	{
		playfx(clientnum, billow_fx, self.origin + (randomintrange(-10, 10), randomintrange(-10, 10), randomintrange(5, 10)));
	}
	wait(2);
	dust_time = 5.5;
	dust_interval = 0.3;
	player = level.localplayers[clientnum];
	effect = level._effect[#"rise_dust"];
	if(type == "water")
	{
		effect = level._effect[#"rise_dust_water"];
	}
	else
	{
		if(type == "snow")
		{
			effect = level._effect[#"rise_dust_snow"];
		}
		else
		{
			if(type == "foliage")
			{
				effect = level._effect[#"rise_dust_foliage"];
			}
			else if(type == "none")
			{
				return;
			}
		}
	}
	t = 0;
	while(t < dust_time)
	{
		if(!isdefined(self))
		{
			return;
		}
		util::playfxontag(clientnum, effect, self, dust_tag);
		wait(dust_interval);
		t = t + dust_interval;
	}
}

/*
	Name: on_player_laststand
	Namespace: zm
	Checksum: 0xC9E2FF11
	Offset: 0x4C20
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function on_player_laststand(localclientnum)
{
	/#
		println("" + localclientnum);
	#/
}

/*
	Name: end_last_stand
	Namespace: zm
	Checksum: 0xD09E772A
	Offset: 0x4C60
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function end_last_stand(clientnum)
{
	self waittill(#"laststandend");
	/#
		println("" + clientnum);
	#/
	wait(0.7);
	/#
		println("");
	#/
	playsound(clientnum, #"revive_gasp");
}

/*
	Name: last_stand_thread
	Namespace: zm
	Checksum: 0xACF5EE4
	Offset: 0x4CF8
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function last_stand_thread(clientnum)
{
	self thread end_last_stand(clientnum);
	self endon(#"laststandend");
	/#
		println("" + clientnum);
	#/
	pause = 0.5;
	vol = 0.5;
	while(true)
	{
		id = playsound(clientnum, #"chr_heart_beat");
		setsoundvolume(id, vol);
		wait(pause);
		if(pause < 2)
		{
			pause = pause * 1.05;
			if(pause > 2)
			{
				pause = 2;
			}
		}
		if(vol < 1)
		{
			vol = vol * 1.05;
			if(vol > 1)
			{
				vol = 1;
			}
		}
	}
}

/*
	Name: last_stand_monitor
	Namespace: zm
	Checksum: 0x2E155EFA
	Offset: 0x4E70
	Size: 0x1C0
	Parameters: 3
	Flags: None
*/
function last_stand_monitor(clientnum, state, oldstate)
{
	player = level.localplayers[state];
	players = level.localplayers;
	if(!isdefined(player))
	{
		return;
	}
	if(oldstate == "1")
	{
		if(!level._laststand[state])
		{
			if(!isdefined(level.lslooper))
			{
				level.lslooper = spawn(0, player.origin, "script.origin");
			}
			player thread last_stand_thread(state);
			if(players.size <= 1)
			{
				level.lslooper playloopsound(#"evt_laststand_loop", 0.3);
			}
			level._laststand[state] = 1;
		}
	}
	else if(level._laststand[state])
	{
		if(isdefined(level.lslooper))
		{
			level.lslooper stopallloopsounds(0.7);
			playsound(0, #"evt_laststand_in", (0, 0, 0));
		}
		player notify(#"laststandend");
		level._laststand[state] = 0;
	}
}

/*
	Name: function_bbea98ae
	Namespace: zm
	Checksum: 0xBF68B691
	Offset: 0x5038
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_bbea98ae(localclientnum, b_igc_active)
{
	self function_92f0c63(b_igc_active);
}

/*
	Name: function_92f0c63
	Namespace: zm
	Checksum: 0x7AAF0D87
	Offset: 0x5070
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_92f0c63(localclientnum)
{
	/#
		if(getdvarint(#"hash_454c021f8acb091d", 0))
		{
			return;
		}
	#/
	self renderoverridebundle::function_c8d97b8e(localclientnum, #"hash_5d0631b016d4fe26", #"hash_60913f86a5a5a3f1");
	self renderoverridebundle::function_c8d97b8e(localclientnum, #"hash_7c0db17218fac872", #"hash_60913f86a5a5a3f1");
}

/*
	Name: laststand
	Namespace: zm
	Checksum: 0x3B3AFEB8
	Offset: 0x5128
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function laststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_92f0c63(fieldname);
	if(isplayer(self) && self function_21c0fa55())
	{
		laststand_model = createuimodel(function_1df4c3b0(fieldname, #"zm_hud"), "lastStand");
		setuimodelvalue(laststand_model, bwastimejump);
	}
}

/*
	Name: function_b9c917cc
	Namespace: zm
	Checksum: 0xFD40AE83
	Offset: 0x5218
	Size: 0xA6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b9c917cc(var_6142f944, str_bundle)
{
	if(self function_21c0fa55())
	{
		return false;
	}
	if(!self function_ca024039())
	{
		return false;
	}
	if(is_true(level.var_dc60105c))
	{
		return false;
	}
	if(isigcactive(str_bundle))
	{
		return false;
	}
	if(is_true(self.var_74b9b03b))
	{
		return false;
	}
	return true;
}

/*
	Name: function_a1ab192
	Namespace: zm
	Checksum: 0x9228E0C7
	Offset: 0x52C8
	Size: 0xB6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a1ab192(var_6142f944, str_bundle)
{
	if(!self function_b9c917cc(var_6142f944, str_bundle))
	{
		return false;
	}
	if(isplayer(self) || self function_21c0fa55() || isdemoplaying())
	{
		return false;
	}
	if(is_true(level.var_dc60105c))
	{
		return false;
	}
	if(isigcactive(var_6142f944))
	{
		return false;
	}
	return true;
}

/*
	Name: update_aat_hud
	Namespace: zm
	Checksum: 0xFFBFCE44
	Offset: 0x5388
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function update_aat_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_8aa9ab80 = aat::function_d1852e75(bwastimejump);
	str_localized = aat::get_string(bwastimejump);
	icon = aat::get_icon(bwastimejump);
	if(str_localized == "none")
	{
		str_localized = #"";
	}
	var_2961e149 = createuimodel(function_1df4c3b0(fieldname, #"zm_hud"), "aatNameHash");
	setuimodelvalue(var_2961e149, var_8aa9ab80);
	aatmodel = createuimodel(function_1df4c3b0(fieldname, #"zm_hud"), "aat");
	setuimodelvalue(aatmodel, str_localized);
	aaticonmodel = createuimodel(function_1df4c3b0(fieldname, #"zm_hud"), "aatIcon");
	setuimodelvalue(aaticonmodel, icon);
}

/*
	Name: function_dfbfa0f4
	Namespace: zm
	Checksum: 0x474CA10D
	Offset: 0x5558
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_dfbfa0f4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	var_cb481d18 = 1;
	if(wasdemojump)
	{
		var_cb481d18 = 0;
	}
	var_dcb56aa8 = function_1df4c3b0(fieldname, #"hash_159966ba825013a2");
	setuimodelvalue(createuimodel(var_dcb56aa8, "canUseQuickInventory"), var_cb481d18);
}

/*
	Name: function_a2a8f79e
	Namespace: zm
	Checksum: 0x24646D18
	Offset: 0x5618
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_a2a8f79e(player)
{
	return player clientfield::get_player_uimodel("hudItems.srOverlayOpen");
}

/*
	Name: function_424dc557
	Namespace: zm
	Checksum: 0xA2691A34
	Offset: 0x5650
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_424dc557(localclientnum)
{
	player = function_27673a7(localclientnum);
	return player clientfield::get_player_uimodel("hudItems.srOverlayOpen");
}

/*
	Name: function_6ee4a2c
	Namespace: zm
	Checksum: 0xA929C8A4
	Offset: 0x56A8
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_6ee4a2c(localclientnum)
{
	if(!isinarray(level.var_be4c025a, self.aitype))
	{
		for(lod = 4; lod > 1; lod--)
		{
			function_7eee6e63(self.aitype, lod, 1);
		}
		level.var_be4c025a[level.var_be4c025a.size] = self.aitype;
	}
}

/*
	Name: function_f73c3352
	Namespace: zm
	Checksum: 0x625FC21F
	Offset: 0x5740
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function function_f73c3352()
{
	var_65792f8b = function_2717b55f();
	if(!isdefined(var_65792f8b.var_c5d172c6))
	{
		return;
	}
	var_5caa3d5b = getscriptbundle(var_65792f8b.var_c5d172c6);
	if(!isdefined(var_5caa3d5b))
	{
		return;
	}
	foreach(struct in var_5caa3d5b.assets)
	{
		switch(struct.type)
		{
			case "character":
			{
				var_2d9402be = &function_47dd41e8;
				break;
			}
			case "xmodel":
			{
				var_2d9402be = &forcestreamxmodel;
				break;
			}
			default:
			{
				/#
					assert(0, ((("" + var_65792f8b.var_a4d41b30) + "") + struct.asset) + "");
				#/
				/#
				#/
				var_2d9402be = undefined;
				break;
			}
		}
		if(!isdefined(var_2d9402be))
		{
			continue;
		}
		for(lod = struct.lod; lod > 1; lod--)
		{
			[[var_2d9402be]](struct.asset, lod, struct.mip);
		}
	}
}

