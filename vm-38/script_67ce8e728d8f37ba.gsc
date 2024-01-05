#using script_67c9a990c0db216c;
#using scripts\core_common\player\player_shared.gsc;
#using script_305d57cf0618009d;
#using scripts\core_common\player\player_insertion.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\map.gsc;

#namespace namespace_66d6aa44;

/*
	Name: function_a8032dd6
	Namespace: namespace_66d6aa44
	Checksum: 0x12585C82
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a8032dd6()
{
	level notify(-1451619062);
}

/*
	Name: function_9347830c
	Namespace: namespace_66d6aa44
	Checksum: 0xB56EBCAF
	Offset: 0x268
	Size: 0x144
	Parameters: 1
	Flags: Event
*/
event function_9347830c(eventstruct)
{
	lui::add_luimenu("full_screen_movie", &full_screen_movie::register);
	clientfield::register("world", "hide_intro_models", 1, 1, "int");
	clientfield::register_clientuimodel("closeLoadingMovie", 1, 1, "int", 1);
	callback::add_callback(#"on_game_playing", &function_fcfa3b98);
	level.var_2efdea7 = function_f6fd2b4a();
	level.var_6e9fbf44 = [];
	function_e526b83(level.var_2efdea7);
	level.var_23e297bc = 1;
	if(function_14956b80())
	{
		level thread function_fa3eed17(level.var_2efdea7);
	}
}

/*
	Name: function_fa3eed17
	Namespace: namespace_66d6aa44
	Checksum: 0x23B19724
	Offset: 0x3B8
	Size: 0x4C8
	Parameters: 1
	Flags: Linked
*/
function function_fa3eed17(var_43a36c6f)
{
	level callback::callback(#"hash_4428d68b23082312");
	level.var_b82a5c35 = 1;
	if(!isdefined(var_43a36c6f))
	{
		return;
	}
	callback::on_joined_team(&function_d15f17fe);
	callback::on_joined_spectate(&function_b499bfc7);
	if(function_4898fc47())
	{
		level.var_b38d8c70[var_43a36c6f.var_d74b6b9c] = scene::function_12479eba(var_43a36c6f.var_d74b6b9c);
	}
	else
	{
		level flag::wait_till_timeout(0.5, #"hash_22ca95de91eb92b");
		thread scene::add_scene_func(var_43a36c6f.var_30a9de1, &function_a10bb198, "init", "sidea");
		thread scene::add_scene_func(var_43a36c6f.var_704cf864, &function_a10bb198, "init", "sideb");
		thread scene::add_scene_func(var_43a36c6f.var_30a9de1, &function_aad02bd0, "play", "sidea", var_43a36c6f.var_70e6c400);
		thread scene::add_scene_func(var_43a36c6f.var_704cf864, &function_aad02bd0, "play", "sideb", var_43a36c6f.var_a3282882);
		thread scene::add_scene_func(var_43a36c6f.var_30a9de1, &function_46c380f6, "done", "sidea");
		thread scene::add_scene_func(var_43a36c6f.var_704cf864, &function_46c380f6, "done", "sideb");
		thread scene::add_scene_func(var_43a36c6f.var_30a9de1, &function_46c380f6, "stop", "sidea");
		thread scene::add_scene_func(var_43a36c6f.var_704cf864, &function_46c380f6, "stop", "sideb");
		if(isdefined(var_43a36c6f.var_30a9de1))
		{
			level.var_b38d8c70[var_43a36c6f.var_30a9de1] = scene::function_12479eba(var_43a36c6f.var_30a9de1);
		}
		if(isdefined(var_43a36c6f.var_704cf864))
		{
			level.var_b38d8c70[var_43a36c6f.var_704cf864] = scene::function_12479eba(var_43a36c6f.var_704cf864);
		}
		foreach(str_team in level.teams)
		{
			if(str_team == "allies" || str_team == "axis")
			{
				continue;
			}
			str_scene = function_cf2c009a(str_team);
			if(isdefined(str_scene))
			{
				level.var_b38d8c70[str_scene] = scene::function_12479eba(str_scene);
				thread scene::add_scene_func(str_scene, &function_a10bb198, "init", str_team);
				thread scene::add_scene_func(str_scene, &function_aad02bd0, "play", str_team, var_43a36c6f.var_70e6c400);
				thread scene::add_scene_func(str_scene, &function_46c380f6, "done", str_team);
				thread scene::add_scene_func(str_scene, &function_46c380f6, "stop", str_team);
			}
		}
	}
}

/*
	Name: function_3f3466c9
	Namespace: namespace_66d6aa44
	Checksum: 0x80F724D1
	Offset: 0x888
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_3f3466c9()
{
}

/*
	Name: function_148b501d
	Namespace: namespace_66d6aa44
	Checksum: 0xA752BF96
	Offset: 0x898
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_148b501d()
{
	if(!isdefined(level.var_2e8c3a11))
	{
		return 0;
	}
	return gettime() - level.var_2e8c3a11;
}

/*
	Name: function_a10bb198
	Namespace: namespace_66d6aa44
	Checksum: 0x369ECAB
	Offset: 0x8C8
	Size: 0x36
	Parameters: 2
	Flags: Linked
*/
function function_a10bb198(a_ents, str_side)
{
	str_team = util::get_team_mapping(str_side);
}

/*
	Name: function_aad02bd0
	Namespace: namespace_66d6aa44
	Checksum: 0x7C078054
	Offset: 0x908
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function function_aad02bd0(a_ents, str_side, var_9c1ed9ea)
{
	str_team = util::get_team_mapping(var_9c1ed9ea);
	function_75125d25();
	function_f5692e0c("intro_cinematic", str_team);
	function_bb17da18();
}

/*
	Name: function_46c380f6
	Namespace: namespace_66d6aa44
	Checksum: 0x2F3FA0CE
	Offset: 0x990
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_46c380f6(a_ents, str_side)
{
	str_team = util::get_team_mapping(str_side);
	music::setmusicstatebyteam("none", str_team);
	function_db62d086();
	function_266bf421(str_team);
}

/*
	Name: function_db62d086
	Namespace: namespace_66d6aa44
	Checksum: 0xF4AC999
	Offset: 0xA18
	Size: 0x156
	Parameters: 0
	Flags: Linked
*/
function function_db62d086()
{
	level clientfield::set("hide_intro_models", 0);
	script_models = getentarray("intro_scene_models", "targetname");
	var_4e756c46 = getentarray("intro_scene_models", "script_noteworthy");
	script_models = arraycombine(script_models, var_4e756c46);
	foreach(models in script_models)
	{
		models show();
		if(models.targetname === "destructible" && isdefined(models.var_93f58b6d))
		{
			models.takedamage = models.var_93f58b6d;
			models.var_93f58b6d = undefined;
		}
	}
}

/*
	Name: function_bb17da18
	Namespace: namespace_66d6aa44
	Checksum: 0x227096A7
	Offset: 0xB78
	Size: 0x158
	Parameters: 0
	Flags: Linked
*/
function function_bb17da18()
{
	level clientfield::set("hide_intro_models", 1);
	script_models = getentarray("intro_scene_models", "targetname");
	var_4e756c46 = getentarray("intro_scene_models", "script_noteworthy");
	script_models = arraycombine(script_models, var_4e756c46);
	foreach(models in script_models)
	{
		if(models.targetname === "destructible" && !isdefined(models.var_93f58b6d))
		{
			models.var_93f58b6d = models.takedamage;
			models.takedamage = 0;
		}
		models hide();
	}
}

/*
	Name: function_75125d25
	Namespace: namespace_66d6aa44
	Checksum: 0x612443C4
	Offset: 0xCD8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_75125d25(b_state)
{
	if(!isdefined(b_state))
	{
		b_state = 1;
	}
	level.var_3a701785 = b_state;
}

/*
	Name: function_f5692e0c
	Namespace: namespace_66d6aa44
	Checksum: 0x921FB9D5
	Offset: 0xD10
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function function_f5692e0c(var_9c1ed9ea, str_team, player)
{
	if(isdefined(game.musicset))
	{
		var_9c1ed9ea = var_9c1ed9ea + game.musicset;
	}
	else
	{
		var_9c1ed9ea = var_9c1ed9ea + "_default";
	}
	if(isdefined(str_team))
	{
		music::setmusicstatebyteam(var_9c1ed9ea, str_team);
	}
	else
	{
		if(isdefined(player))
		{
			music::setmusicstate(var_9c1ed9ea, player);
		}
		else
		{
			music::setmusicstate(var_9c1ed9ea);
		}
	}
}

/*
	Name: function_14956b80
	Namespace: namespace_66d6aa44
	Checksum: 0xB03DDA2F
	Offset: 0xDD0
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_14956b80()
{
	if(is_true(level.var_633063a5))
	{
		return false;
	}
	if(!util::isfirstround())
	{
		return false;
	}
	if(currentsessionmode() == 4 || (isdefined(getgametypesetting(#"prematchperiod")) ? getgametypesetting(#"prematchperiod") : 0) <= 0)
	{
		return false;
	}
	if(!is_true(getgametypesetting(#"hash_16ec132a4fe8eba9")))
	{
		return false;
	}
	if(!getdvarint(#"hash_3c02566432466eb2", 0))
	{
		return false;
	}
	if(!getdvarint(#"hash_2e7f94473567b19a", 0))
	{
		return false;
	}
	if(!isdefined(level.var_2efdea7))
	{
		return false;
	}
	return true;
}

/*
	Name: isplaying
	Namespace: namespace_66d6aa44
	Checksum: 0x30A3D730
	Offset: 0xF28
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function isplaying()
{
	return is_true(level.var_ae517a5);
}

/*
	Name: function_f6fd2b4a
	Namespace: namespace_66d6aa44
	Checksum: 0xDACBEBB3
	Offset: 0xF50
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_f6fd2b4a()
{
	var_65792f8b = map::get_script_bundle();
	if(!isdefined(var_65792f8b) || !isdefined(var_65792f8b.var_f9631c9d))
	{
		return undefined;
	}
	return getscriptbundle(var_65792f8b.var_f9631c9d);
}

/*
	Name: function_4898fc47
	Namespace: namespace_66d6aa44
	Checksum: 0xEF135B2A
	Offset: 0xFB8
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_4898fc47()
{
	if(isdefined(level.var_2efdea7))
	{
		return function_fd63b4bf(level.var_2efdea7);
	}
	return 0;
}

/*
	Name: function_fd63b4bf
	Namespace: namespace_66d6aa44
	Checksum: 0x800876E9
	Offset: 0xFF0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fd63b4bf(var_52b46a06)
{
	if(level.var_d1455682.var_3316a534 !== 1)
	{
		return false;
	}
	if(!isdefined(var_52b46a06.var_d74b6b9c))
	{
		return false;
	}
	return true;
}

/*
	Name: function_b69a4f47
	Namespace: namespace_66d6aa44
	Checksum: 0xD393A2C
	Offset: 0x1040
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_b69a4f47(var_2f252ea4)
{
	clientfield::register("toplayer", var_2f252ea4.uniqueid, 1, 1, "int");
	if(is_true(var_2f252ea4.var_51388671))
	{
		level.var_6e9fbf44[level.var_6e9fbf44.size] = var_2f252ea4;
	}
}

/*
	Name: function_e526b83
	Namespace: namespace_66d6aa44
	Checksum: 0xF535AE00
	Offset: 0x10B8
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_e526b83(var_43a36c6f)
{
	if(!isdefined(var_43a36c6f.var_96c3f045))
	{
		return;
	}
	var_20314119 = getscriptbundlelist(var_43a36c6f.var_96c3f045);
	if(!isdefined(var_20314119))
	{
		return;
	}
	foreach(var_39796f0f in var_20314119)
	{
		var_c5470032 = getscriptbundle(var_39796f0f);
		function_b69a4f47(var_c5470032);
	}
}

/*
	Name: function_d15f17fe
	Namespace: namespace_66d6aa44
	Checksum: 0xDCAD8372
	Offset: 0x11B0
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_d15f17fe(params)
{
	if(isbot(self))
	{
		return;
	}
	if(function_fd63b4bf(level.var_2efdea7) && isdefined(level.var_2efdea7.var_d74b6b9c))
	{
		thread scene::init_streamer(level.var_2efdea7.var_d74b6b9c, array(self));
	}
	else
	{
		str_scene = function_cf2c009a(self.team);
		if(isdefined(str_scene))
		{
			thread scene::init_streamer(str_scene, array(self), 0, 0);
		}
	}
}

/*
	Name: function_b499bfc7
	Namespace: namespace_66d6aa44
	Checksum: 0xA6B94357
	Offset: 0x12B0
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_b499bfc7(params)
{
	if(isbot(self))
	{
		return;
	}
	if(function_fd63b4bf(level.var_2efdea7) && isdefined(level.var_2efdea7.var_d74b6b9c))
	{
		thread scene::init_streamer(level.var_2efdea7.var_d74b6b9c, array(self));
	}
	else
	{
		foreach(team in level.teams)
		{
			str_scene = function_cf2c009a(team);
			if(isdefined(str_scene))
			{
				thread scene::init_streamer(str_scene, array(self));
				break;
			}
		}
	}
}

/*
	Name: function_24d0c33d
	Namespace: namespace_66d6aa44
	Checksum: 0x342C90E9
	Offset: 0x1418
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_24d0c33d()
{
	setdvar(#"hash_6ae50e8489bccba9", 10000);
}

/*
	Name: function_fcfa3b98
	Namespace: namespace_66d6aa44
	Checksum: 0xED505811
	Offset: 0x1450
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_fcfa3b98()
{
	function_e3dbd71b();
}

/*
	Name: function_266bf421
	Namespace: namespace_66d6aa44
	Checksum: 0xC81205F5
	Offset: 0x1470
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_266bf421(team)
{
	foreach(player in getplayers(team))
	{
		player val::reset_all(#"scene_system");
		player setvisibletoall();
		spawn = player spawning::function_f53e594f();
		if(isdefined(spawn) && !spawning::function_daa5852f())
		{
			player dontinterpolate();
			player setorigin(spawn.origin);
			player setplayerangles(spawn.angles);
		}
	}
}

/*
	Name: function_27c20de5
	Namespace: namespace_66d6aa44
	Checksum: 0x8408F8E4
	Offset: 0x15D0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_27c20de5()
{
	util::function_21678f2c(getplayers());
}

/*
	Name: function_5a8e7587
	Namespace: namespace_66d6aa44
	Checksum: 0x54A92665
	Offset: 0x1608
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function function_5a8e7587()
{
	function_27c20de5();
	level.var_ae517a5 = 1;
	level callback::callback(#"hash_4b4c187e584b34ac");
	level.var_2e8c3a11 = gettime();
	level.var_c1c633b5 = gettime();
	foreach(team in level.teams)
	{
		var_e70596ed = function_cf2c009a(team);
		if(!isdefined(var_e70596ed))
		{
			continue;
		}
		if(getplayers(team).size)
		{
			self thread scene::init(var_e70596ed);
		}
	}
	setslowmotion(1, 0.2, 0);
	flag::set("intro_mp_cin_end");
}

/*
	Name: function_2259ff3c
	Namespace: namespace_66d6aa44
	Checksum: 0xB0688DC3
	Offset: 0x1768
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_2259ff3c(callback, waittime, countdowntime)
{
	level endon(#"game_ended");
	waittime = max(0, waittime);
	[[callback]](countdowntime, #"hash_15a3c76e013b75c1");
	wait(waittime);
	level flag::set(#"hash_15a3c76e013b75c1");
}

/*
	Name: function_d24cf075
	Namespace: namespace_66d6aa44
	Checksum: 0x6AE60398
	Offset: 0x1800
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_d24cf075()
{
	self endon(#"disconnect");
	wait(0.2);
	self lui::function_a6eb5334(0);
}

/*
	Name: function_b906539e
	Namespace: namespace_66d6aa44
	Checksum: 0xC0697A9
	Offset: 0x1840
	Size: 0x178
	Parameters: 0
	Flags: Linked
*/
function function_b906539e()
{
	if(!isdefined(level.teammenu))
	{
		return;
	}
	level.var_fb99ff98 = 0;
	level.disableclassselection = 1;
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_77d6602a))
		{
			continue;
		}
		switch(player.var_77d6602a)
		{
			case "autoassign":
			{
				player [[level.autoassign]](1, undefined);
				break;
			}
			case "spectator":
			{
				player [[level.spectator]]();
				break;
			}
			default:
			{
				player [[level.teammenu]](player.var_77d6602a);
				break;
			}
		}
		player.var_77d6602a = undefined;
	}
	level.disableclassselection = 0;
}

/*
	Name: function_59fe0fc1
	Namespace: namespace_66d6aa44
	Checksum: 0xEAD86577
	Offset: 0x19C0
	Size: 0xC0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_59fe0fc1()
{
	foreach(team in level.teams)
	{
		var_e70596ed = function_cf2c009a(team);
		if(!isdefined(var_e70596ed))
		{
			continue;
		}
		level scene::stop(var_e70596ed, 1);
	}
}

/*
	Name: function_e94b8e1a
	Namespace: namespace_66d6aa44
	Checksum: 0x413C0784
	Offset: 0x1A88
	Size: 0xAD4
	Parameters: 2
	Flags: None
*/
function function_e94b8e1a(var_66cbfaf2, var_2a832857)
{
	level endoncallback(&function_59fe0fc1, #"postgame");
	/#
		if(getdvarint(#"hash_2abea44713c5fded", 0))
		{
			while(true)
			{
				debug2dtext((150, 225, 0), "", undefined, undefined, undefined, undefined, 1);
				var_a0579d1a = 1;
				foreach(str_team in level.teams)
				{
					if(getplayers(str_team).size < 1)
					{
						var_a0579d1a = 0;
						break;
					}
				}
				if(var_a0579d1a)
				{
					break;
				}
				waitframe(1);
			}
			wait(4);
		}
	#/
	players = getplayers();
	util::function_21678f2c(players);
	pixbeginevent();
	level util::delay((float(function_60d95f53()) / 1000) * 4, undefined, &function_c403d032, players);
	scenes = [];
	var_5a990409 = 0;
	level.var_ae517a5 = 1;
	callback::remove_callback(#"joined_team", &function_d15f17fe);
	callback::remove_callback(#"on_joined_spectator", &function_b499bfc7);
	if(isdefined(level.var_2efdea7.var_c4ec5a3c))
	{
		if(!isdefined(scenes))
		{
			scenes = [];
		}
		else if(!isarray(scenes))
		{
			scenes = array(scenes);
		}
		if(!isinarray(scenes, level.var_2efdea7.var_c4ec5a3c))
		{
			scenes[scenes.size] = level.var_2efdea7.var_c4ec5a3c;
		}
	}
	foreach(team in level.teams)
	{
		var_e70596ed = function_cf2c009a(team);
		if(!isdefined(var_e70596ed))
		{
			continue;
		}
		if(getplayers(team).size)
		{
			if(!isdefined(scenes))
			{
				scenes = [];
			}
			else if(!isarray(scenes))
			{
				scenes = array(scenes);
			}
			if(!isinarray(scenes, var_e70596ed))
			{
				scenes[scenes.size] = var_e70596ed;
			}
		}
		if(isdefined(level.var_b38d8c70[var_e70596ed]))
		{
			var_31688e84 = level.var_b38d8c70[var_e70596ed];
		}
		else
		{
			var_31688e84 = scene::function_12479eba(var_e70596ed);
		}
		if(var_31688e84 > var_5a990409)
		{
			var_5a990409 = var_31688e84;
		}
	}
	pixendevent();
	delaytime = (var_5a990409 - 5) + 0.8;
	thread function_2259ff3c(var_2a832857, delaytime, 5);
	if(level.var_6e9fbf44.size > 0)
	{
		foreach(player in getplayers())
		{
			foreach(postfxbundle in level.var_6e9fbf44)
			{
				player clientfield::set_to_player(postfxbundle.uniqueid, 1);
			}
		}
	}
	foreach(player in getplayers())
	{
		player function_8ec328e1(0);
		if(!spawning::function_daa5852f())
		{
			player predictspawnpoint(player getplayercamerapos(), player getplayerangles());
		}
	}
	if(spawning::function_daa5852f())
	{
		player_insertion::function_63977a98(0);
		player_insertion::function_d28162a2((isdefined(level.var_2efdea7.var_3545b69a) ? level.var_2efdea7.var_3545b69a : 0));
		player_insertion::function_1a50e8a5((isdefined(level.var_2efdea7.var_73a4076) ? level.var_2efdea7.var_73a4076 : 0));
	}
	level.var_fb99ff98 = 1;
	scene::function_1e327c20(scenes, 0, 0, 1);
	player::function_80e763a4();
	foreach(player in getplayers())
	{
		player function_8ec328e1(1);
		player setvisibletoall();
		if(!spawning::function_daa5852f())
		{
			player function_b3086fd0();
		}
	}
	/#
		if(getdvarint(#"hash_6a54249f0cc48945", 0))
		{
			adddebugcommand("");
		}
	#/
	level callback::callback(#"hash_255b4626805810f5");
	if(level.var_6e9fbf44.size > 0)
	{
		foreach(player in getplayers())
		{
			foreach(postfxbundle in level.var_6e9fbf44)
			{
				player clientfield::set_to_player(postfxbundle.uniqueid, 0);
			}
		}
	}
	level.var_ae517a5 = 0;
	music::setmusicstate("none");
	level thread util::delay(1, "game_ended", &function_75125d25, 0);
	thread function_bb23918f();
	if(isdefined(level.var_fd167bf6) && !spawning::function_daa5852f())
	{
		var_526ef4a1 = level.var_fd167bf6 - gettime();
		if(var_526ef4a1 > 0)
		{
			wait(float(var_526ef4a1) / 1000);
		}
	}
	/#
		println("" + gettime());
	#/
}

/*
	Name: function_bb23918f
	Namespace: namespace_66d6aa44
	Checksum: 0x63005B7E
	Offset: 0x2568
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_bb23918f()
{
	wait(0.4);
	function_b906539e();
}

/*
	Name: function_cf2c009a
	Namespace: namespace_66d6aa44
	Checksum: 0xFC571266
	Offset: 0x2590
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_cf2c009a(team)
{
	if(!isdefined(level.var_2efdea7))
	{
		return undefined;
	}
	if(team == util::get_team_mapping("sidea"))
	{
		return level.var_2efdea7.var_30a9de1;
	}
	if(team == util::get_team_mapping("sideb"))
	{
		return level.var_2efdea7.var_704cf864;
	}
	switch(team)
	{
		case "team3":
		{
			return level.var_2efdea7.var_5f68ebf7;
		}
		case "team4":
		{
			return level.var_2efdea7.var_78449dae;
		}
		case "team5":
		{
			return level.var_2efdea7.var_79fda120;
		}
		case "team6":
		{
			return level.var_2efdea7.var_93e854f5;
		}
		case "team7":
		{
			return level.var_2efdea7.var_a5aa7879;
		}
		case "team8":
		{
			return level.var_2efdea7.var_de866a34;
		}
		case "team9":
		{
			return level.var_2efdea7.var_b1448fb1;
		}
		case "team10":
		{
			return level.var_2efdea7.var_e39afb68;
		}
	}
	return undefined;
}

/*
	Name: function_2aaeab97
	Namespace: namespace_66d6aa44
	Checksum: 0xF6CD194B
	Offset: 0x2760
	Size: 0x324
	Parameters: 1
	Flags: None
*/
function function_2aaeab97(var_66cbfaf2)
{
	if(!function_14956b80())
	{
		return;
	}
	player_insertion::function_63977a98(0);
	if(!isdefined(level.var_2efdea7.var_d74b6b9c))
	{
		return;
	}
	player_insertion::function_d28162a2((isdefined(level.var_2efdea7.var_3545b69a) ? level.var_2efdea7.var_3545b69a : 0));
	player_insertion::function_1a50e8a5((isdefined(level.var_2efdea7.var_73a4076) ? level.var_2efdea7.var_73a4076 : 0));
	players = getplayers();
	util::function_21678f2c(players);
	level util::delay((float(function_60d95f53()) / 1000) * 4, undefined, &function_c403d032, players);
	if(isdefined(var_66cbfaf2))
	{
		if(isdefined(level.var_b38d8c70[level.var_2efdea7.var_d74b6b9c]))
		{
			var_9d90ef8b = level.var_b38d8c70[level.var_2efdea7.var_d74b6b9c];
		}
		else
		{
			var_9d90ef8b = scene::function_12479eba(level.var_2efdea7.var_d74b6b9c);
		}
		delaytime = (var_9d90ef8b - 5) + 0.8;
		level thread function_2259ff3c(var_66cbfaf2, delaytime, 5);
	}
	callback::remove_callback(#"joined_team", &function_d15f17fe);
	function_75125d25();
	function_f5692e0c("intro_cinematic");
	scene::function_1e327c20(level.var_2efdea7.var_d74b6b9c);
	level thread util::delay(6, "game_ended", &function_75125d25, 0);
	array::thread_all(getplayers(), &function_8ec328e1, 1);
	array::run_all(getplayers(), &setvisibletoall);
}

/*
	Name: function_a03c3a00
	Namespace: namespace_66d6aa44
	Checksum: 0x959A04D1
	Offset: 0x2A90
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_a03c3a00(time, timeout)
{
	if(self player::function_114b77dd(time, timeout))
	{
		return;
	}
	self clientfield::set_player_uimodel("closeLoadingMovie", 1);
}

/*
	Name: function_8ec328e1
	Namespace: namespace_66d6aa44
	Checksum: 0x58C84ECA
	Offset: 0x2AF0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_8ec328e1(enable)
{
	if(enable)
	{
		self val::reset(#"hash_549cbea73f5b2a54", "show_hud");
		self val::reset(#"hash_549cbea73f5b2a54", "show_weapon_hud");
	}
	else
	{
		self val::set(#"hash_549cbea73f5b2a54", "show_hud", 0);
		self val::set(#"hash_549cbea73f5b2a54", "show_weapon_hud", 0);
	}
}

/*
	Name: function_c1ec451
	Namespace: namespace_66d6aa44
	Checksum: 0xC1C20E24
	Offset: 0x2BB8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c1ec451()
{
	return true;
}

/*
	Name: function_684bad0f
	Namespace: namespace_66d6aa44
	Checksum: 0xDE8081
	Offset: 0x2BF8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_684bad0f()
{
	self clientfield::set_player_uimodel("closeLoadingMovie", 1);
}

/*
	Name: function_e3dbd71b
	Namespace: namespace_66d6aa44
	Checksum: 0x5089BAE2
	Offset: 0x2C28
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_e3dbd71b()
{
	var_94fab29 = player::function_51b57f72();
	time = gettime();
	foreach(player in getplayers())
	{
		player function_a03c3a00(time, var_94fab29);
	}
}

/*
	Name: function_a8f822ee
	Namespace: namespace_66d6aa44
	Checksum: 0xB30B48A9
	Offset: 0x2CE8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_a8f822ee()
{
	self endon(#"disconnect");
	while(!self player::function_114b77dd() && self function_c1ec451())
	{
		self resetinactivitytimer();
		waitframe(1);
	}
	if(level flag::get(#"hash_263f55e6bcaa1891") && self function_c1ec451())
	{
		self function_684bad0f();
		self function_8ec328e1(1);
	}
}

/*
	Name: function_c403d032
	Namespace: namespace_66d6aa44
	Checksum: 0x74B10EEC
	Offset: 0x2DC0
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_c403d032(players)
{
	arrayremovevalue(players, undefined);
	foreach(player in players)
	{
		player function_684bad0f();
	}
}

/*
	Name: function_c0622ccd
	Namespace: namespace_66d6aa44
	Checksum: 0xF2DCD7CE
	Offset: 0x2E70
	Size: 0xAC
	Parameters: 2
	Flags: None
*/
function function_c0622ccd(players, force)
{
	level flag::set(#"hash_263f55e6bcaa1891");
	if(force)
	{
		array::run_all(players, &function_684bad0f);
		array::thread_all(players, &function_8ec328e1, 1);
	}
	else
	{
		array::thread_all(players, &function_a8f822ee);
	}
}

