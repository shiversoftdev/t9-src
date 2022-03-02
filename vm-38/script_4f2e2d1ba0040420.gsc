#using script_1029986e2bc8ca8e;
#using script_113dd7f0ea2a1d4f;
#using script_16b1b77a76492c6a;
#using script_176597095ddfaa17;
#using script_27347f09888ad15;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_35598499769dbb3d;
#using script_4163291d6e693552;
#using script_5bb072c3abf4652c;
#using script_6c5b51f98cd04fa3;
#using script_7b1cd3908a825fdd;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using script_b9d273dc917ee1f;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_f865255e;

/*
	Name: function_64b0535f
	Namespace: namespace_f865255e
	Checksum: 0x663E8D2F
	Offset: 0x290
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_64b0535f()
{
	level notify(732477596);
}

/*
	Name: function_42818ffd
	Namespace: namespace_f865255e
	Checksum: 0x141A8DCD
	Offset: 0x2B0
	Size: 0x6DC
	Parameters: 1
	Flags: None
*/
function function_42818ffd(instance)
{
	scene::add_scene_func(#"hash_337507057cf84321", &function_dd0d40c4, "play", 1);
	scene::add_scene_func(#"hash_337507057cf84321", &function_dd0d40c4, "done", 0);
	scene::add_scene_func(#"hash_337507057cf84321", &function_dd0d40c4, "stop", 0);
	scene::add_scene_func(#"hash_337507057cf84321", &function_29430f26, "Sh010", 0);
	scene::add_scene_func(#"hash_337507057cf84321", &function_29430f26, "Sh030", 1);
	scene::add_scene_func(#"hash_337507057cf84321", &function_f0e44578, "play");
	scene::add_scene_func(#"hash_337507057cf84321", &function_7b6f4f8b, "sh060");
	level flag::wait_till_all(array(#"gameplay_started", #"hash_1558183088c6ccff"));
	if(getdvarint(#"hash_292db25b2be947f", 0))
	{
		var_841d9acf = (isdefined(instance.var_fe2612fe[#"hash_748a25ac9b3e7766"]) ? instance.var_fe2612fe[#"hash_748a25ac9b3e7766"] : []);
		foreach(player in getplayers())
		{
			player setorigin(var_841d9acf[i].origin);
			player setplayerangles(var_841d9acf[i].angles);
			player clientfield::set_to_player("" + #"hash_34af381c063f6611", 1);
		}
	}
	namespace_d0ab5955::function_d4dec4e8(instance.location.destination, #"hash_77c04aaf41a18e41");
	namespace_d0ab5955::function_f1ad7968(instance.location.destination, #"hash_1d72c1d85b91814e");
	showmiscmodels("end_of_level_corpses");
	level clientfield::set("" + #"hash_4c8a7e79b5a2c61d", 1);
	exploder::exploder("fxexp_island_worklight");
	level.var_97e461d4 = "chopper_gunner_path_sanatorium_exfil_end_of_level";
	level flag::set(#"hash_3070ff342f14b371");
	var_1f6189f7 = instance.var_fe2612fe[#"hash_48ed0373db843512"][0];
	instance.var_675dd2c4 = namespace_8b6a9d79::spawn_script_model(var_1f6189f7, #"p9_zm_ndu_reel_to_reel_audio_recorder_01");
	var_655b61b6 = instance.var_fe2612fe[#"hash_75fdd79b72460b80"][0];
	point = function_4ba8fde(#"hash_3af5d193f6561a3c");
	if(isdefined(point))
	{
		item_drop::drop_item(0, undefined, 1, point.amount, point.id, var_655b61b6.origin, var_655b61b6.angles, 0);
		callback::function_10a4dd0a(&function_10a4dd0a);
	}
	instance.var_675dd2c4.n_obj_id = zm_utility::function_f5a222a8(#"hash_b418b036831ea2a", instance.var_675dd2c4);
	instance.var_675dd2c4 playloopsound(#"hash_2e77024e1f0a29f1");
	instance thread function_f1425083();
	instance function_5c3b5e05(var_1f6189f7.origin, instance.var_675dd2c4.n_obj_id);
	trigger = namespace_8b6a9d79::function_22e120bc(var_1f6189f7, &function_5ec737ca, #"hash_1114a7cc4d89285c");
	trigger.instance = instance;
	instance.var_675dd2c4 zm_utility::function_747180ea(instance.var_675dd2c4.n_obj_id, undefined, trigger);
	level flag::wait_till(#"hash_6d6ca756d43c84ac");
	level thread namespace_2c949ef8::do_ambush(var_1f6189f7.origin, undefined, 128, 1000, undefined, undefined, 1, undefined, 150);
	level thread function_1e6004ec(instance);
}

/*
	Name: function_5c3b5e05
	Namespace: namespace_f865255e
	Checksum: 0x668B4BD1
	Offset: 0x998
	Size: 0x15C
	Parameters: 2
	Flags: None
*/
function function_5c3b5e05(v_position, n_obj_id)
{
	while(true)
	{
		var_53aa8ab9 = 0;
		foreach(player in function_a1ef346b())
		{
			if(player util::is_player_looking_at(v_position, 0.9) && distancesquared(player.origin, v_position) <= 160000)
			{
				var_53aa8ab9 = 1;
				break;
			}
		}
		if(var_53aa8ab9)
		{
			break;
		}
		waitframe(1);
	}
	objective_setinvisibletoall(n_obj_id);
	level zm_vo::function_7622cb70(#"hash_13011aa8d9815b2b");
	objective_setvisibletoall(n_obj_id);
}

/*
	Name: function_1e6004ec
	Namespace: namespace_f865255e
	Checksum: 0xB087635D
	Offset: 0xB00
	Size: 0x578
	Parameters: 1
	Flags: None
*/
function function_1e6004ec(instance)
{
	level.var_8bb7479c = #"hash_337507057cf84321";
	level.var_aaf7505f = min(540, (270 + (10 * level.var_b48509f9)) + (10 * getplayers().size));
	level.var_d1572d48 = 0;
	level.var_6e297a0d = &function_6bae9c0a;
	level.var_c29bf3b6 = #"none";
	level.var_7c027cbe = #"none";
	level.var_139ceb46 = #"none";
	level.var_f1a8b5e6 = #"none";
	level.var_6ceeb30a = #"none";
	level.var_6363395e = #"none";
	level.var_7dfc84b7 = 1;
	var_e2062f3 = struct::get(#"hash_28db7b3821bf6879", "targetname");
	namespace_8b6a9d79::function_20d7e9c7(var_e2062f3);
	level notify(#"hash_3e765c26047c9f54");
	var_f6fe9c95 = level.var_fdcaf3a6.var_fe2612fe[#"hash_34875eecda90e973"][0];
	level thread function_fb4f1c11(instance);
	level thread function_31125f54();
	level flag::set(#"hash_178cddf0409be677");
	var_4dc5ed09 = 0;
	while(true)
	{
		foreach(player in function_a1ef346b())
		{
			if(player util::is_player_looking_at(var_f6fe9c95.origin, 0.6))
			{
				w_current = player getcurrentweapon();
				if(distancesquared(player.origin, var_f6fe9c95.origin) < 2250000 || (is_true(w_current.issniperweapon) && player playerads() === 1))
				{
					var_4dc5ed09 = 1;
					break;
				}
			}
			if(is_true(player.var_1bee6f4b))
			{
				var_4dc5ed09 = 1;
				break;
			}
		}
		if(var_4dc5ed09)
		{
			break;
		}
		waitframe(1);
	}
	while(true)
	{
		level.var_570f49c5 = namespace_85745671::function_9d3ad056(#"hash_21f3d5d40d72e08d", var_f6fe9c95.origin, var_f6fe9c95.angles, "exfil_ai", 0);
		if(isdefined(level.var_570f49c5))
		{
			break;
		}
		waitframe(1);
	}
	level.var_570f49c5.var_98f1f37c = 1;
	level thread scene::play(#"hash_27db4ac6990e4b2a", level.var_570f49c5);
	level flag::delay_set(5, #"hash_44733903bbd715c9");
	level util::delay(5, undefined, &flag::clear, #"hash_178cddf0409be677");
	s_result = undefined;
	s_result = level waittill(#"hash_69090774fec4a17b");
	if(is_true(s_result.completed))
	{
		str_reason = #"hash_6ebafb1370ab6c93";
		level.winningteam = #"allies";
	}
	else
	{
		str_reason = #"hash_22a0611dcd352614";
		level.winningteam = #"axis";
	}
	level notify(#"end_game", {#reason:str_reason});
}

/*
	Name: function_fb4f1c11
	Namespace: namespace_f865255e
	Checksum: 0x4CAB875B
	Offset: 0x1080
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_fb4f1c11(instance)
{
	level zm_vo::function_7622cb70(#"hash_5415ca3151de21b3");
	level thread function_382aed42(instance);
	level zm_vo::function_7622cb70(#"hash_5c7d1b0a063faa5f", 0.5);
	level zm_vo::function_7622cb70(#"hash_6c381c1bdf96d01b", 1);
	level flag::wait_till(#"hash_44733903bbd715c9");
	level zm_vo::function_7622cb70(#"hash_7df08a932922311a");
	level flag::set(#"hash_3bf08d8f0adeb2b5");
	level flag::wait_till(#"hash_2c83e17b76817284");
	level zm_vo::function_7622cb70(#"hash_4fd478e75857bfac");
}

/*
	Name: function_382aed42
	Namespace: namespace_f865255e
	Checksum: 0x26D188DE
	Offset: 0x11C0
	Size: 0x1A4
	Parameters: 1
	Flags: None
*/
function function_382aed42(instance)
{
	level.var_117d5f10 endon(#"death");
	var_51c3b2a8 = instance.var_fe2612fe[#"spotlight_target"][0];
	level.var_117d5f10 thread function_6ebbb35b(var_51c3b2a8.origin);
	level flag::wait_till(#"hash_62c5f0040163a03b");
	var_f6fe9c95 = level.var_fdcaf3a6.var_fe2612fe[#"hash_34875eecda90e973"][0];
	level.var_117d5f10 thread function_6ebbb35b(var_f6fe9c95.origin);
	level flag::wait_till(#"hash_3bf08d8f0adeb2b5");
	level.var_117d5f10 thread function_6ebbb35b(level.var_570f49c5);
	level.var_570f49c5 waittill(#"death");
	wait(5);
	if(isdefined(level.var_117d5f10))
	{
		level.var_117d5f10 notify(#"hash_2500f18971d5cb87");
		level.var_117d5f10 turretcleartarget(0);
		level.var_117d5f10 turretsettargetangles(0, (0, 0, 0));
	}
}

/*
	Name: function_6ebbb35b
	Namespace: namespace_f865255e
	Checksum: 0x1B778481
	Offset: 0x1370
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_6ebbb35b(target)
{
	self notify("3d3a8482ca13244b");
	self endon("3d3a8482ca13244b");
	self endon(#"hash_2500f18971d5cb87");
	self vehicle::lights_on();
	/#
		self thread function_9190b7da(target);
	#/
	while(isalive(self) && isdefined(target))
	{
		if(isai(target) || isplayer(target))
		{
			if(target.var_6f84b820 === #"boss")
			{
				self turretsettarget(0, target.origin + vectorscale((0, 0, 1), 165));
			}
			else
			{
				self turretsettarget(0, target);
			}
		}
		else
		{
			self turretsettarget(0, target);
		}
		waitframe(1);
	}
	if(isalive(self))
	{
		self turretsettargetangles(0, (0, 0, 0));
	}
}

/*
	Name: function_9190b7da
	Namespace: namespace_f865255e
	Checksum: 0xB3C78321
	Offset: 0x1500
	Size: 0x736
	Parameters: 1
	Flags: Private
*/
function private function_9190b7da(target)
{
	/#
		self notify("");
		self endon("");
		self endon(#"death");
		while(getdvarint(#"hash_10baecdec59866ec", 0))
		{
			var_4d0fb5dd = self gettagorigin("");
			var_cc6e0b9f = self gettagangles("");
			var_1b2ce154 = self gettagorigin("");
			var_b247979 = self gettagangles("");
			v_flash_pos = self gettagorigin("");
			var_4624d0b5 = self gettagangles("");
			var_e5c76dd2 = self gettagorigin("");
			var_5d58f4a5 = self gettagangles("");
			print3d(var_4d0fb5dd, toupper(""), (0, 1, 0), undefined, 0.1);
			print3d(var_1b2ce154, toupper(""), (0, 1, 0), undefined, 0.1);
			print3d(v_flash_pos, toupper(""), (0, 1, 0), undefined, 0.1);
			print3d(var_e5c76dd2, toupper(""), (0, 1, 0), undefined, 0.1);
			originendpoint = var_e5c76dd2 + vectorscale(anglestoforward(var_5d58f4a5), 6);
			originrightpoint = var_e5c76dd2 + (vectorscale(anglestoright(var_5d58f4a5), -1 * 6));
			originuppoint = var_e5c76dd2 + vectorscale(anglestoup(var_5d58f4a5), 6);
			line(var_e5c76dd2, originendpoint, (1, 0, 0));
			line(var_e5c76dd2, originrightpoint, (0, 1, 0));
			line(var_e5c76dd2, originuppoint, (0, 0, 1));
			originendpoint = var_4d0fb5dd + vectorscale(anglestoforward(var_cc6e0b9f), 6);
			originrightpoint = var_4d0fb5dd + (vectorscale(anglestoright(var_cc6e0b9f), -1 * 6));
			originuppoint = var_4d0fb5dd + vectorscale(anglestoup(var_cc6e0b9f), 6);
			line(var_4d0fb5dd, originendpoint, (1, 0, 0));
			line(var_4d0fb5dd, originrightpoint, (0, 1, 0));
			line(var_4d0fb5dd, originuppoint, (0, 0, 1));
			originendpoint = var_1b2ce154 + vectorscale(anglestoforward(var_b247979), 6);
			originrightpoint = var_1b2ce154 + (vectorscale(anglestoright(var_b247979), -1 * 6));
			originuppoint = var_1b2ce154 + vectorscale(anglestoup(var_b247979), 6);
			line(var_1b2ce154, originendpoint, (1, 0, 0));
			line(var_1b2ce154, originrightpoint, (0, 1, 0));
			line(var_1b2ce154, originuppoint, (0, 0, 1));
			originendpoint = v_flash_pos + vectorscale(anglestoforward(var_4624d0b5), 6);
			originrightpoint = v_flash_pos + (vectorscale(anglestoright(var_4624d0b5), -1 * 6));
			originuppoint = v_flash_pos + vectorscale(anglestoup(var_4624d0b5), 6);
			line(v_flash_pos, originendpoint, (1, 0, 0));
			line(v_flash_pos, originrightpoint, (0, 1, 0));
			line(v_flash_pos, originuppoint, (0, 0, 1));
			target = self turretgettarget(0);
			if(isentity(target))
			{
				line(var_1b2ce154, target.origin, (1, 0.5, 0));
				line(var_4d0fb5dd, target.origin, (1, 0.5, 0));
				line(v_flash_pos, target.origin, (1, 0.5, 0));
				line(var_e5c76dd2, target.origin, (1, 0.5, 0));
			}
			else if(isvec(target))
			{
				line(var_1b2ce154, target, (1, 0.5, 0));
				line(var_4d0fb5dd, target, (1, 0.5, 0));
				line(v_flash_pos, target, (1, 0.5, 0));
				line(var_e5c76dd2, target, (1, 0.5, 0));
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_31125f54
	Namespace: namespace_f865255e
	Checksum: 0x1D2253BA
	Offset: 0x1C40
	Size: 0x21C
	Parameters: 0
	Flags: Private
*/
function private function_31125f54()
{
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"hash_4fbe4720f6f13107", #"hash_2c83e17b76817284");
		if(level flag::get(#"hash_2c83e17b76817284") && level flag::get(#"hash_fdc24944f59c262") || is_true(var_be17187b.b_success))
		{
			level.var_9f6064a4 = #"hash_6893db9b6c7b5a58";
			level.var_73677dfc = 3;
			if(isdefined(level.var_8bb7479c))
			{
				level thread scene::init_streamer(level.var_8bb7479c, getplayers(), 0, 0);
			}
			foreach(player in getplayers())
			{
				player zm_stats::increment_challenge_stat(#"hash_774b3a384fb5ad");
			}
			level notify(#"hash_383cbd169f8d0938", {#b_success:1});
			break;
		}
		else
		{
			if(isdefined(level.var_72a3d8bc))
			{
				level thread scene::init_streamer(level.var_72a3d8bc, getplayers(), 0, 0);
			}
			break;
		}
	}
}

/*
	Name: function_6bae9c0a
	Namespace: namespace_f865255e
	Checksum: 0xF4E18D5E
	Offset: 0x1E68
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_6bae9c0a()
{
	wait(5);
}

/*
	Name: function_f1425083
	Namespace: namespace_f865255e
	Checksum: 0x1A99ED7
	Offset: 0x1E80
	Size: 0x170
	Parameters: 0
	Flags: None
*/
function function_f1425083()
{
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_5d493ad17e0173ea");
		level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
	}
	level flag::wait_till(#"hash_6d6ca756d43c84ac");
	foreach(player in getplayers())
	{
		level.var_31028c5d thread prototype_hud::function_817e4d10(player, 0);
	}
}

/*
	Name: function_5ec737ca
	Namespace: namespace_f865255e
	Checksum: 0xF7CE608C
	Offset: 0x1FF8
	Size: 0x304
	Parameters: 1
	Flags: None
*/
function function_5ec737ca(params)
{
	var_675dd2c4 = self.instance.var_675dd2c4;
	var_675dd2c4 thread scene::play(#"hash_1b79053f7d2b9dd1", var_675dd2c4);
	var_675dd2c4 stoploopsound();
	var_675dd2c4 playsound(#"hash_ea30fff000de600");
	foreach(player in getplayers())
	{
		player thread namespace_4abf1500::collect_intel(#"hash_5b87039ce0ec3c82", undefined, undefined, 1);
	}
	zm_utility::function_bc5a54a8(self.instance.var_675dd2c4.n_obj_id);
	self.instance.var_675dd2c4.n_obj_id = undefined;
	self deletedelay();
	/#
		iprintlnbold("");
	#/
	if(!getdvarint(#"hash_4992654f2fe8eb24", 0))
	{
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56ca9f18d08d5880");
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56caa018d08d5a33");
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56caa118d08d5be6");
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56caa218d08d5d99");
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56caa318d08d5f4c");
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56caa418d08d60ff");
		var_675dd2c4 zm_vo::function_d6f8bbd9(#"hash_56caa518d08d62b2");
	}
	wait(1);
	var_675dd2c4 playsound(#"hash_4d16320cccbd00fc");
	var_675dd2c4 playloopsound(#"hash_3b453b7c6a3141d4");
	wait(2.5);
	level flag::set(#"hash_6d6ca756d43c84ac");
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_f865255e
	Checksum: 0x89D1F450
	Offset: 0x2308
	Size: 0x104
	Parameters: 1
	Flags: Private
*/
function private function_10a4dd0a(params)
{
	if(params.item.var_a6762160.name === #"hash_3af5d193f6561a3c")
	{
		foreach(player in getplayers())
		{
			player thread namespace_4abf1500::collect_intel(#"hash_4d8f86e486057da");
		}
		callback::remove_callback(#"hash_56d1805bfff3e65b", &function_10a4dd0a);
	}
}

/*
	Name: function_29430f26
	Namespace: namespace_f865255e
	Checksum: 0x35214C8D
	Offset: 0x2418
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function function_29430f26(a_ents, b_enable)
{
	if(is_true(b_enable))
	{
		showmiscmodels("end_of_level_exfil_outro_igc_props");
		level clientfield::set("" + #"hash_2c5407e7aece0a93", 1);
	}
	else
	{
		hidemiscmodels("end_of_level_exfil_outro_igc_props");
		level clientfield::set("" + #"hash_2c5407e7aece0a93", 0);
	}
}

/*
	Name: function_dd0d40c4
	Namespace: namespace_f865255e
	Checksum: 0xB337F36F
	Offset: 0x24F0
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_dd0d40c4(a_ents, b_enable)
{
	if(b_enable)
	{
		level clientfield::set("" + #"hash_46265c2ce587e427", 1);
	}
	else
	{
		level clientfield::set("" + #"hash_46265c2ce587e427", 0);
	}
}

/*
	Name: function_f0e44578
	Namespace: namespace_f865255e
	Checksum: 0xB21AE82D
	Offset: 0x2588
	Size: 0x110
	Parameters: 1
	Flags: None
*/
function function_f0e44578(a_ents)
{
	vh_heli = a_ents[#"helicopter"];
	if(!isdefined(vh_heli))
	{
		return;
	}
	self notify("2d4c88d5101002a4");
	self endon("2d4c88d5101002a4");
	vh_heli endon(#"death");
	level endon(#"end_game");
	vh_heli waittill(#"hash_719b11d1aede6899");
	while(true)
	{
		vh_heli vehicle::lights_off();
		wait(randomfloatrange(0.25, 1));
		vh_heli vehicle::lights_on();
		wait(randomfloatrange(0.25, 1));
	}
}

/*
	Name: function_7b6f4f8b
	Namespace: namespace_f865255e
	Checksum: 0xE4419C89
	Offset: 0x26A0
	Size: 0xCC
	Parameters: 1
	Flags: Private
*/
function private function_7b6f4f8b(a_ents)
{
	self notify("35aaabb02f4fd0fd");
	self endon("35aaabb02f4fd0fd");
	level waittill(#"start_blackscreen");
	level lui::screen_fade_out(1, (0, 0, 0));
	level flag::wait_till(#"hash_337507057cf84321" + "_scene_done");
	waitframe(1);
	if(!is_true(level.gameended))
	{
		level lui::screen_fade_in(1, (0, 0, 0));
	}
}

