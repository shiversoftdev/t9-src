#using script_1292451e284848cc;
#using script_263b7f2982258785;
#using script_31e9b35aaacbbd93;
#using script_37f9ff47f340fbe8;
#using script_3dc93ca9902a9cda;
#using script_4a73380997c0854e;
#using script_54412fb3a6fab34c;
#using script_5552bd756afee443;
#using script_6b47294865dc34b5;
#using script_6eea75edd4d830a;
#using script_85cd2e9a28ea8a1;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicleriders_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\skipto.gsc;

#namespace namespace_6486858a;

/*
	Name: function_c7a2852f
	Namespace: namespace_6486858a
	Checksum: 0x591721C4
	Offset: 0x7A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c7a2852f()
{
	level notify(840572657);
}

#namespace namespace_e66dabaf;

/*
	Name: starting
	Namespace: namespace_e66dabaf
	Checksum: 0xA5CE39E3
	Offset: 0x7C0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function starting(str_skipto)
{
}

/*
	Name: main
	Namespace: namespace_e66dabaf
	Checksum: 0x68914B2D
	Offset: 0x7D8
	Size: 0x1EC
	Parameters: 2
	Flags: None
*/
function main(str_skipto, b_starting)
{
	level thread globallogic_ui::do_chyron_text();
	level.var_aece851d = [];
	level.var_fc514951 = 0;
	player = getplayers()[0];
	player val::set("takedown_hit1_intro", "show_weapon_hud", 0);
	if(is_true(level.var_fc514951))
	{
		wait(0.1);
		snd::function_7db65a93("intro_mockup");
		thread function_c6662dbb("intro_enemy_trucks", 1);
		scene::play("scene_tkd_hit1_intro_pre_fly_in");
		level lui::screen_fade_out(0, "black");
		level util::delay(0.4, undefined, &lui::screen_fade_in, 0.5);
	}
	else
	{
		wait(3.5);
		thread function_c6662dbb("intro_enemy_trucks", 1);
		wait(0.5);
	}
	snd::function_7db65a93("intro_trans_out");
	thread flyin();
	level flag::wait_till("heli_intro_complete");
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: function_77438329
	Namespace: namespace_e66dabaf
	Checksum: 0x39749AC0
	Offset: 0x9D0
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function function_77438329()
{
	player = getplayers()[0];
	while(!player isstreamerready())
	{
		waitframe(1);
	}
}

/*
	Name: cleanup
	Namespace: namespace_e66dabaf
	Checksum: 0x692597E8
	Offset: 0xA20
	Size: 0x24
	Parameters: 4
	Flags: None
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: namespace_e66dabaf
	Checksum: 0x80F724D1
	Offset: 0xA50
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
}

/*
	Name: init_clientfields
	Namespace: namespace_e66dabaf
	Checksum: 0xDB6FF145
	Offset: 0xA60
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("vehicle", "hit1_helispotlight", 1, 1, "int");
	clientfield::register("vehicle", "hit1_track_vehicle", 1, 1, "int");
	clientfield::register("scriptmover", "hit1_track_ent", 1, 1, "int");
	clientfield::register("scriptmover", "hit1_tracking", 1, 1, "int");
	clientfield::register("scriptmover", "hit1_light", 1, 1, "int");
}

/*
	Name: init_scenes
	Namespace: namespace_e66dabaf
	Checksum: 0x80F724D1
	Offset: 0xB60
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

/*
	Name: function_fbb0d73f
	Namespace: namespace_e66dabaf
	Checksum: 0x1255402C
	Offset: 0xB70
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_fbb0d73f()
{
	self endon(#"death");
	self setrotorspeed(1);
	self.soundmod = "heli";
	self vehicle::toggle_tread_fx(1);
	self vehicle::toggle_exhaust_fx(1);
	self vehicle::toggle_sounds(1);
	self setrotorspeed(1);
	self vehicle::lights_on();
	params = spawnstruct();
	params.no_clear_movement = 1;
	params.var_a22ee662 = 1;
	self vehicle_ai::set_state("scripted", params);
}

/*
	Name: function_bff76496
	Namespace: namespace_e66dabaf
	Checksum: 0x9091C9CF
	Offset: 0xC88
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_bff76496(f)
{
	level flag::wait_till(f);
	/#
		debug2dtext((1500, 700, 0), f, (1, 1, 1), 1, (0, 0, 0), 0, 1, 40);
	#/
}

/*
	Name: function_50c1c92b
	Namespace: namespace_e66dabaf
	Checksum: 0xC4FB2CB2
	Offset: 0xCF8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_50c1c92b()
{
	player = getplayers()[0];
	level.fake_player = util::spawn_player_clone(player);
	level.fake_player.targetname = "FakePlayer";
	thread function_3b697267();
}

/*
	Name: function_3b697267
	Namespace: namespace_e66dabaf
	Checksum: 0xEB45F8EA
	Offset: 0xD70
	Size: 0x298
	Parameters: 0
	Flags: Linked
*/
function function_3b697267()
{
	player = getplayers()[0];
	player allowcrouch(0);
	waitframe(3);
	player takeallweapons();
	player playerlinktodelta(level.fake_player, "tag_player", 1, 30, 15, 15, 30, 1, 1);
	wait(0.1);
	player setlowready(1);
	level flag::wait_till("heli_player_gets_weapon");
	w_smg = getweapon(#"smg_standard_t9", array("reflex", "fastreload"));
	var_2105d8b1 = getweapon(#"sniper_quickscope_t9");
	player giveweapon(w_smg);
	player giveweapon(var_2105d8b1);
	player switchtoweapon(w_smg);
	level flag::wait_till("heli_intro_complete");
	player playerlinktodelta(level.fake_player, "tag_player", 1, 0, 0, 0, 0, 1);
	player val::set("takedown_hit1_intro", "show_weapon_hud", 1);
	wait(0.5);
	player setlowready(0);
	level.fake_player hide();
	player unlink();
	player allowcrouch(1);
	level notify(#"hash_2769bf067f3ba0cb");
}

/*
	Name: function_3d66ebcc
	Namespace: namespace_e66dabaf
	Checksum: 0x88203E90
	Offset: 0x1010
	Size: 0x7E4
	Parameters: 3
	Flags: Linked
*/
function function_3d66ebcc(tname, var_5283a254, skipto_end)
{
	if(!isdefined(skipto_end))
	{
		skipto_end = 0;
	}
	if(is_true(var_5283a254))
	{
		level.var_40b02b72 = vehicle::simple_spawn(tname);
		level.var_40b02b72[level.var_40b02b72.size] = vehicle::simple_spawn_single("intro_heli_ally");
	}
	else
	{
		level.var_40b02b72 = vehicle::simple_spawn_and_drive(tname);
	}
	player_heli = level.var_40b02b72[0];
	level.var_9a3944f4 = level.var_40b02b72[1];
	if(isdefined(level.var_40b02b72[1].script_noteworthy))
	{
		player_heli = level.var_40b02b72[1];
		level.var_9a3944f4 = level.var_40b02b72[0];
	}
	player_heli flag::init("player_heli_landing");
	foreach(chopper in level.var_40b02b72)
	{
		chopper thread function_fbb0d73f();
	}
	player_heli setmodel("veh_t8_mil_helicopter_uh1d_cp_takedown");
	level.var_9a3944f4 setmodel("veh_t8_mil_helicopter_uh1d_cp_takedown");
	player_heli hidepart("tag_gunner_barrel1", "veh_t8_mil_helicopter_uh1d_left_gun_mount_attach_grn", 1);
	thread heli_light(level.var_9a3944f4, "ally_heli_spot_light_bustout", "tag_glass_front_left_lower_d0", (-20, 12, 0), level.var_9a3944f4, 0, 1);
	level.var_9a3944f4 thread function_3cebcd1b();
	player_heli.probe = getent("heli_probe", "targetname");
	if(isdefined(player_heli.probe))
	{
		player_heli.probe linkto(player_heli, "tag_fire_extinguisher_attach", (-4, 0, 12), (0, 0, 0));
	}
	player_heli.var_6098f318 = getent("heli_cab_probe", "targetname");
	if(isdefined(player_heli.var_6098f318))
	{
		player_heli.var_6098f318 linkto(player_heli, "tag_fire_extinguisher_attach", (38, 0, 16), (0, 0, 0));
	}
	player = getplayers()[0];
	tag = "tag_origin";
	if(!is_true(level.var_fc514951))
	{
		wait(1);
	}
	mover = getent("intro_heli_assault_linked", "targetname");
	mover linkto(player_heli, tag, (0, 0, 0), (0, 0, 0));
	if(is_true(var_5283a254))
	{
		var_afb6d099 = 15;
		var_92d3857f = 23;
		if(skipto_end)
		{
			var_afb6d099 = 0.05;
			var_92d3857f = 0.05;
			player_heli util::delay_notify(0.2, "lights_on");
			level.var_9a3944f4 util::delay_notify(0.2, "lights_on");
		}
		level flag::delay_set(var_afb6d099, "spawn_enemy_trucks");
		level flag::delay_set(var_92d3857f, "intro_heli_lights_on");
		thread function_e826dfbb();
		player thread function_8227f24e();
		level.fake_player = player;
		function_50c1c92b();
		actors = [];
		actors[player_heli.targetname] = player_heli;
		actors[level.var_9a3944f4.targetname] = level.var_9a3944f4;
		actors[#"fakeplayer"] = level.fake_player;
		if(!skipto_end)
		{
			thread function_a01817ae();
			level thread scene::play("scene_tkd_hit1_intro_fly_in_trucks", level.var_abaa6487);
			level scene::play("scene_tkd_hit1_intro_fly_in", actors);
		}
		else
		{
			level flag::set("heli_player_gets_weapon");
			level flag::set("heli_intro_complete");
			level thread scene::play_from_time("scene_tkd_hit1_intro_fly_in_trucks", level.var_abaa6487, undefined, 0.85, 1);
			level scene::play_from_time("scene_tkd_hit1_intro_fly_in", actors, undefined, 0.85, 1);
		}
		if(isdefined(player_heli.light))
		{
			player_heli notify(#"hash_48aad0ddc0d9bf5d");
			player_heli.light unlink();
			player_heli.light delete();
		}
		level flag::set("heli_intro_complete");
		level flag::set("player_heli_landing");
		level flag::set("fly_in_scene_finished");
		level flag::set("intro_takeout_driver");
		level flag::set("truck_front");
		level flag::delay_set(0.1, "heli_intro_path_ally");
		wait(0.2);
		level.var_9a3944f4 thread vehicle::get_on_and_go_path("intro_ally_heli_post_scene");
	}
}

/*
	Name: function_e826dfbb
	Namespace: namespace_e66dabaf
	Checksum: 0x5649713A
	Offset: 0x1800
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function function_e826dfbb()
{
	self endon(#"death");
	level endon(#"hash_3d5f84b922ee90fd");
	wait(1);
	woods = undefined;
	while(!isdefined(woods))
	{
		woods = getent("woods_chopper_from_scene", "script_noteworthy", 1);
		waitframe(2);
	}
	wait(0.5);
	woods util::magic_bullet_shield();
	guys = [];
	guys[0] = getent("driver_woods_kills", "targetname", 1);
	guys[1] = getent("passenger_woods_kills", "targetname", 1);
	for(i = 0; i < 2; i++)
	{
		woods waittill(#"fire_gun");
		level flag::delay_set(0.05, "truck_front");
		level flag::delay_set(0.05, "heli_intro_complete");
		startpos = woods gettagorigin("tag_flash");
		endpos = startpos + vectorscale(woods getweaponforwarddir(), 100);
		color = (1, 0, 0);
		if(isdefined(guys[i]))
		{
			endpos = guys[i] geteye();
			color = (1, 1, 0);
			level.var_9a3944f4 thread function_cbe25a41(guys[i], "tag_glass_front_left_lower_d0", 1);
		}
		magicbullet(woods.weapon, startpos, endpos, woods);
	}
	wait(1.5);
	level flag::set("heli_intro_path_ally");
}

/*
	Name: function_72dfda8f
	Namespace: namespace_e66dabaf
	Checksum: 0xB9C19543
	Offset: 0x1A90
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_72dfda8f()
{
	self endon(#"death");
	level endon(#"hash_2bffd29cf00c7bf2");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_7454dc94e59f5a04", #"hash_7b4ae294e914fd60", #"hash_7fbec71ff58f17be");
		level.var_8f8dc88e = waitresult._notify;
	}
}

/*
	Name: function_8227f24e
	Namespace: namespace_e66dabaf
	Checksum: 0xE0A1C201
	Offset: 0x1B28
	Size: 0x216
	Parameters: 0
	Flags: Linked
*/
function function_8227f24e()
{
	self endon(#"death");
	level endon(#"hash_2bffd29cf00c7bf2");
	level.var_8f8dc88e = "shake_low";
	thread function_72dfda8f();
	while(true)
	{
		source = self.origin;
		pitch = randomfloatrange(0, 0.15);
		yaw = randomfloatrange(0, 0.15);
		roll = 0;
		duration = randomfloatrange(0.25, 1);
		var_2038a0d5 = randomfloatrange(2.5, 3.5);
		var_f6383e50 = randomfloatrange(2.5, 3.5);
		if(level.var_8f8dc88e == "shake_med")
		{
			pitch = randomfloatrange(0.02, 0.35);
			yaw = randomfloatrange(0.02, 0.25);
			roll = randomfloatrange(0.02, 0.1);
			duration = 1;
			var_2038a0d5 = 10;
			var_f6383e50 = 7;
		}
		if(pitch + yaw > 0.025)
		{
			screenshake(source, pitch, yaw, roll, duration, 0, 0, 0, var_2038a0d5, var_f6383e50);
		}
		wait(duration);
	}
}

/*
	Name: flyin
	Namespace: namespace_e66dabaf
	Checksum: 0xC500CA42
	Offset: 0x1D48
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function flyin()
{
	function_3d66ebcc("intro_heli_player", 1);
}

/*
	Name: function_3cebcd1b
	Namespace: namespace_e66dabaf
	Checksum: 0x979C33D5
	Offset: 0x1D78
	Size: 0x2D0
	Parameters: 0
	Flags: Linked
*/
function function_3cebcd1b()
{
	self endon(#"death");
	level endon(#"hash_3a19b093e6195475");
	var_979d3fe0 = [5:#"hash_40ac8a16505b8836", 4:#"hash_29314522aa49bd8", 3:#"hash_3e702e48bab5c519", 2:#"hash_745ff54e7aa6a91c", 1:#"hash_149087af12a0702e", 0:#"hash_37668f2af06099dc"];
	var_f01b798 = [5:"heli_focus_rear_house", 4:"heli_focus_mid_house", 3:"hit1_truck_front", 2:"hit1_truck_mid", 1:"hit1_truck_house", 0:"hit1_truck_rear"];
	while(true)
	{
		ret = undefined;
		ret = level waittill(#"hash_37668f2af06099dc", #"hash_149087af12a0702e", #"hash_745ff54e7aa6a91c", #"hash_3e702e48bab5c519", #"hash_29314522aa49bd8", #"hash_40ac8a16505b8836");
		var_87c48267 = "GetEntDislikesHashStrings";
		for(i = 0; i < var_979d3fe0.size; i++)
		{
			if(var_979d3fe0[i] == ret._notify)
			{
				var_87c48267 = var_f01b798[i];
				break;
			}
		}
		var_4cd99adc = getent(var_87c48267, "script_noteworthy", 1);
		if(!isdefined(var_4cd99adc))
		{
			var_4cd99adc = struct::get(var_87c48267, "targetname");
		}
		if(isdefined(var_4cd99adc))
		{
			self thread function_cbe25a41(var_4cd99adc, "tag_glass_front_left_lower_d0", 1);
			level.var_7c11765c = gettime() + 2000;
		}
		else
		{
			/#
				iprintlnbold("" + var_87c48267);
			#/
		}
	}
}

/*
	Name: function_f97ce389
	Namespace: namespace_e66dabaf
	Checksum: 0xC78B0EFC
	Offset: 0x2050
	Size: 0x144
	Parameters: 4
	Flags: Linked
*/
function function_f97ce389(heli, tag, var_2d65f507, var_5525c0b0)
{
	heli.light = util::spawn_model("tag_origin", heli gettagorigin(tag) + (vectorscale((0, 0, -1), 84)), heli gettagangles(tag) + var_2d65f507);
	if(var_5525c0b0)
	{
		util::delay(0.3, undefined, &playfxontag, #"hash_f80473c70ea6ee3", heli.light, "tag_origin");
	}
	else
	{
		playfxontag(#"hash_7d057d370983507f", heli.light, "tag_origin");
	}
	heli.light linkto(heli, "tag_searchlight_fx", (0, 0, 0), (0, 0, 0));
}

/*
	Name: heli_light
	Namespace: namespace_e66dabaf
	Checksum: 0xCD7DB166
	Offset: 0x21A0
	Size: 0x1F4
	Parameters: 8
	Flags: Linked
*/
function heli_light(heli, tname, tag, var_2d65f507, track_ent, var_fa2357fe, var_1a67724f, var_5525c0b0)
{
	if(!isdefined(var_fa2357fe))
	{
		var_fa2357fe = 0;
	}
	if(!isdefined(var_1a67724f))
	{
		var_1a67724f = 0;
	}
	if(!isdefined(var_5525c0b0))
	{
		var_5525c0b0 = 0;
	}
	fx_light = 1;
	heli endon(#"death");
	heli waittill(#"lights_on");
	heli.var_4b2b3e51 = (1, 0, 0);
	if(!isdefined(level.var_eaf95d92))
	{
		level.var_eaf95d92 = [];
	}
	if(!isdefined(level.var_eaf95d92[tname]))
	{
		if(fx_light)
		{
			if(!var_1a67724f)
			{
				function_f97ce389(heli, tag, var_2d65f507, var_5525c0b0);
			}
		}
		else
		{
			heli.light = getent(tname, "targetname");
			if(!isdefined(heli.light))
			{
				heli.light = getent(tname + "_temp", "targetname");
			}
		}
		if(isdefined(heli.light))
		{
			heli.light linkto(heli, tag, vectorscale((0, 0, -1), 64), var_2d65f507);
			level.var_eaf95d92[tname] = heli.light;
		}
	}
	if(isdefined(track_ent))
	{
		heli thread function_cbe25a41(track_ent, tag, var_fa2357fe, var_1a67724f, var_5525c0b0);
	}
}

/*
	Name: function_336e9e88
	Namespace: namespace_e66dabaf
	Checksum: 0xA467F014
	Offset: 0x23A0
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_336e9e88()
{
	self endon(#"death");
	while(true)
	{
		/#
			sphere(self.origin + vectorscale((0, 0, 1), 12), 4, (1, 1, 0), 1, 0, 10, 1);
			sphere(self.origin, 8, (1, 1, 0), 1, 0, 10, 1);
		#/
		waitframe(1);
	}
}

/*
	Name: function_833e9642
	Namespace: namespace_e66dabaf
	Checksum: 0xFD65EAF1
	Offset: 0x2448
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function function_833e9642(tag)
{
	self endon(#"death");
	tag = "tag_missle_target";
	while(true)
	{
		/#
			sphere(self gettagorigin(tag), 16, self.var_4b2b3e51, 1, 0, 10, 1);
		#/
		waitframe(1);
	}
}

/*
	Name: function_cbe25a41
	Namespace: namespace_e66dabaf
	Checksum: 0x77A6282E
	Offset: 0x24D8
	Size: 0x9EA
	Parameters: 6
	Flags: Linked
*/
function function_cbe25a41(var_4cd99adc, tag, var_fa2357fe, var_1a67724f, var_5525c0b0, var_2526f86c)
{
	if(!isdefined(var_fa2357fe))
	{
		var_fa2357fe = 0;
	}
	if(!isdefined(var_1a67724f))
	{
		var_1a67724f = 0;
	}
	if(!isdefined(var_5525c0b0))
	{
		var_5525c0b0 = 0;
	}
	if(!isdefined(var_2526f86c))
	{
		var_2526f86c = 0;
	}
	self endon(#"death");
	self endon(#"hash_48aad0ddc0d9bf5d");
	var_869cc293 = "tag_missle_target";
	if(isdefined(self.track_ent))
	{
		self.track_ent.tracking = var_4cd99adc;
		self.var_9fa13062 = 0;
		self.var_c7d51a18 = 0;
		if(self.var_1a67724f || is_true(self.var_2526f86c))
		{
			self.track_ent unlink();
		}
		self.var_1a67724f = var_1a67724f;
		self.var_2526f86c = var_2526f86c;
		if(self.var_1a67724f)
		{
			self.track_ent linkto(self, var_869cc293, (0, 0, 0), (0, 0, 0));
		}
		else if(self.var_2526f86c)
		{
			self.track_ent linkto(var_4cd99adc, tag, (0, 0, 0), (0, 0, 0));
		}
		self sethoverparams(75, 100, 50);
		return;
	}
	if(!isdefined(tag))
	{
		tag = "tag_origin";
	}
	self.var_9fa13062 = 0;
	self.var_c7d51a18 = 0;
	self.var_19a7fb91 = 32 + randomfloat(64);
	self.var_19a7fb91 = 96;
	self.track_ent = util::spawn_model("tag_origin", var_4cd99adc.origin, var_4cd99adc.angles);
	self.var_113b6995 = 2;
	self.var_35f26704 = 0;
	self.var_43643137 = vectorscale((0, 0, 1), 36);
	self.var_71664ae5 = 128;
	self.var_1a67724f = var_1a67724f;
	self.track_ent endon(#"death");
	if(self.var_1a67724f || !isdefined(self.light))
	{
		self.track_ent linkto(self, var_869cc293, (0, 0, 0), (0, 0, 0));
		function_f97ce389(self, tag, (0, 0, 0), var_5525c0b0);
	}
	self.light endon(#"death");
	var_61bc4e7 = 0;
	if(var_fa2357fe)
	{
		var_8c29c159 = getent("light_ally_helispot_bnc", "targetname");
		if(isdefined(var_8c29c159))
		{
			var_8c29c159.var_6da8d78a = 1;
			var_8c29c159 linkto(self.track_ent, "tag_origin", vectorscale((0, 0, -1), 200), (0, 0, 0));
			if(var_61bc4e7)
			{
				var_8c29c159 thread function_336e9e88();
			}
		}
	}
	self.track_ent.tracking = var_4cd99adc;
	self clientfield::set("hit1_helispotlight", 1);
	waitframe(1);
	self.light clientfield::set("hit1_light", 1);
	waitframe(1);
	self.track_ent clientfield::set("hit1_track_ent", 1);
	waitframe(1);
	if(isvehicle(self.track_ent.tracking))
	{
		self.track_ent.tracking clientfield::set("hit1_track_vehicle", 1);
	}
	else
	{
		self.track_ent.tracking clientfield::set("hit1_tracking", 1);
	}
	time_inc = 0.05;
	self sethoverparams(75, 100, 50);
	self.var_2791e894 = 0;
	while(true)
	{
		if(!isdefined(self.track_ent.tracking) && self.var_1a67724f == 0)
		{
			waitframe(1);
			continue;
		}
		/#
			if(is_true(var_61bc4e7))
			{
				sphere(self.track_ent.origin, 8, (1, 0, 0), 1, 0, 10, 1);
				sphere(self.track_ent.tracking.origin, 4, (0, 0, 1), 1, 0, 10, 1);
			}
		#/
		if(!(self.var_1a67724f || self.var_2526f86c))
		{
			end_point = (self.track_ent.tracking.origin + self.var_43643137) + (anglestoforward(self.track_ent.tracking.angles) * self.var_71664ae5);
			dist = distance(self.track_ent.origin, end_point);
			if(!self.var_9fa13062 && !self.var_c7d51a18)
			{
				if(dist > self.var_19a7fb91)
				{
					self.var_9fa13062 = 1;
					self.var_c1cda03b = 0.025;
					self.var_ab0fdcd8 = self.var_c1cda03b;
					self.var_7c772b29 = self.track_ent.origin;
					/#
						if(is_true(var_61bc4e7))
						{
							sphere(end_point, 4, (0, 0, 1), 1, 0, 10, 40);
						}
					#/
					self.track_ent thread easing::ease_origin(end_point, self.var_113b6995, #"back", undefined, 0, 1, 1, [1:3.5, 0:0.35]);
					self.var_35f26704 = gettime() + (self.var_113b6995 * 1000);
					self sethoverparams(75, 100, 50);
				}
			}
			else
			{
				if(self.var_9fa13062 && self.var_35f26704 < gettime())
				{
					self.var_9fa13062 = 0;
					if(dist < self.var_19a7fb91)
					{
						self.var_35f26704 = gettime() + ((self.var_113b6995 * 1000) / 3);
						self.var_c7d51a18 = 1;
						end_point = (self.track_ent.tracking.origin + self.var_43643137) + (anglestoforward(self.track_ent.tracking.angles) * self.var_71664ae5);
						/#
							if(is_true(var_61bc4e7))
							{
								sphere(end_point, 4, (1, 0, 0), 1, 0, 10, 20);
							}
						#/
						self.track_ent thread easing::ease_origin(end_point, self.var_113b6995 / 3, #"sine", undefined, 0, 1, 1);
					}
				}
				else if(self.var_c7d51a18)
				{
					if(self.var_35f26704 < gettime())
					{
						self.var_c7d51a18 = 0;
					}
				}
			}
		}
		var_c6488229 = self gettagangles(tag);
		org = self gettagorigin(tag) + (vectorscale((0, 0, -1), 10));
		to = vectortoangles(self.track_ent.origin - org);
		new_ang = to - var_c6488229;
		waitframe(1);
	}
}

/*
	Name: function_bfad1e94
	Namespace: namespace_e66dabaf
	Checksum: 0xF3E750B0
	Offset: 0x2ED0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_bfad1e94()
{
	level flag::wait_till("spawn_enemy_trucks");
	function_c6662dbb("intro_enemy_trucks", 1);
}

/*
	Name: function_28090f23
	Namespace: namespace_e66dabaf
	Checksum: 0x804DC7FF
	Offset: 0x2F20
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_28090f23()
{
	tagnames = [1:"tag_headlight_right_d0", 0:"tag_headlight_left_d0"];
	tags = [];
	for(i = 0; i < 2; i++)
	{
		tags[i] = util::spawn_model("tag_origin", self.origin, self.angles);
		tags[i] linkto(self, tagnames[i], (0, 0, 0), (0, 0, 0));
		playfxontag(#"hash_45003fc29bb60a21", tags[i], "tag_origin");
	}
}

/*
	Name: function_c6662dbb
	Namespace: namespace_e66dabaf
	Checksum: 0x8B090B2F
	Offset: 0x3018
	Size: 0x1CC
	Parameters: 2
	Flags: Linked
*/
function function_c6662dbb(trucks, var_d9890e08)
{
	level.var_53bd60ae = 1;
	level.var_abaa6487 = [];
	if(is_true(var_d9890e08))
	{
		for(i = 1; i < 5; i++)
		{
			level.var_abaa6487[level.var_abaa6487.size] = vehicle::simple_spawn_single(trucks + i);
		}
	}
	else
	{
		level.var_abaa6487 = vehicle::simple_spawn_and_drive(trucks);
	}
	foreach(truck in level.var_abaa6487)
	{
		truck vehicle::toggle_force_driver_taillights(1);
		if(isdefined(truck.script_noteworthy2))
		{
			truck setmodel(truck.script_noteworthy2);
		}
		if(isdefined(truck.script_parameters) && truck.script_parameters == "truck_rear_unload")
		{
			level.var_aece851d[level.var_aece851d.size] = truck;
		}
	}
	thread namespace_cb0d537d::function_149bd557();
}

/*
	Name: function_a01817ae
	Namespace: namespace_e66dabaf
	Checksum: 0x40CF9929
	Offset: 0x31F0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_a01817ae()
{
	level endon(#"hash_3f82d0fb1f127922");
	woods = undefined;
	while(!isdefined(woods))
	{
		woods = getent("woods_chopper_from_scene", "script_noteworthy", 1);
		waitframe(1);
	}
	woods function_ccfab96();
}

/*
	Name: function_ccfab96
	Namespace: namespace_e66dabaf
	Checksum: 0x6C982DF1
	Offset: 0x3270
	Size: 0x2AE
	Parameters: 0
	Flags: Linked
*/
function function_ccfab96()
{
	level endon(#"hash_3f82d0fb1f127922");
	self endon(#"death");
	var_a77bd386 = "c_t8_bo_hero_woods_head1";
	var_1013bdb1 = "c_t9_usa_hero_woods_head1_igc_flag";
	var_7e34c54c = "c_t9_usa_hero_woods_head1_igc_no_bandana";
	curr = var_a77bd386;
	var_35d2e273 = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill([2:"head_swap_flappy", 1:"head_swap_normal", 0:"head_swap_none"]);
		switch(waitresult._notify)
		{
			case "hash_55e55ee0546633f2":
			{
				self detach(curr);
				curr = var_7e34c54c;
				self attach(curr);
				break;
			}
			case "hash_e26bb6dfa93ec03":
			{
				var_35d2e273++;
				if(var_35d2e273 == 1)
				{
					break;
				}
				if(curr != var_a77bd386)
				{
					self detach(curr);
					curr = var_a77bd386;
					self attach(curr);
				}
				if(isdefined(self.var_f0087d61))
				{
					self setmodel(self.var_f0087d61);
				}
				break;
			}
			case "hash_509a4cfed883f430":
			{
				if(curr != var_1013bdb1)
				{
					self detach(curr);
					curr = var_1013bdb1;
					self attach(curr);
				}
				level notify(#"hash_7fbec71ff58f17be");
				level flag::delay_set(4, "heli_player_gets_weapon");
				self.var_f0087d61 = self.model;
				self setmodel("c_t9_cp_usa_hero_woods_body_flag");
				level util::delay_notify(4, "shake_med");
				break;
			}
		}
	}
}

